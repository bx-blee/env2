;;; -----------------------------------------------------------------
;;; Patches to VM
;;; -----------------------------------------------------------------
(require 'vm-version)
(if (or (string-equal vm-version "6.33")
	(progn (ding)
	       (y-or-n-p "Warning! vm-ruleproc-vm-patches.el untested with VM %s.  Use it anyway? ")))
    (progn
      (eval-after-load "vm-folder"
		       '(progn

			  ;; ---------------------------------
			  ;; Patch vm-get-mail-itimer-function
			  ;; ---------------------------------

			  ;; support for numeric vm-auto-get-new-mail
			  ;; if timer argument is present, this means we're using the Emacs
			  ;; 'timer package rather than the 'itimer package.
			  (defun vm-get-mail-itimer-function (&optional timer)
			    ;; FSF Emacs sets this non-nil, which means the user can't
			    ;; interrupt mail retrieval.  Bogus.
			    (setq inhibit-quit nil)
			    (if (integerp vm-auto-get-new-mail)
				(if timer
				    (timer-set-time timer (current-time) vm-auto-get-new-mail)
				  (set-itimer-restart current-itimer vm-auto-get-new-mail))
			      ;; user has changed the variable value to something that
			      ;; isn't a number, make the timer go away.
			      (if timer
				  (cancel-timer timer)
				(set-itimer-restart current-itimer nil)))
			    (let ((b-list (buffer-list))
				  (found-one nil))
			      (while (and (not (input-pending-p)) b-list)
				(save-excursion
				  (cond ((not (buffer-live-p (car b-list))) ; <== patched here: buffer-live-p check
					 nil)
					(t
					 (set-buffer (car b-list))
					 (if (and (eq major-mode 'vm-mode)
						  (setq found-one t)
						  (not (and (not (buffer-modified-p))
							    buffer-file-name
							    (file-newer-than-file-p
							     (make-auto-save-file-name)
							     buffer-file-name)))
						  (not vm-block-new-mail)
						  (not vm-folder-read-only)
						  (vm-get-spooled-mail nil)
						  (vm-assimilate-new-messages t))
					     (progn
					       ;; don't move the message pointer unless the folder
					       ;; was empty.
					       (if (and (null vm-message-pointer)
							(vm-thoughtfully-select-message))
						   (vm-preview-current-message)
						 (vm-update-summary-and-mode-line)))))))
				(setq b-list (cdr b-list)))
			      ;; make the timer go away if we didn't encounter a vm-mode buffer.
			      (if (and (not found-one) (null b-list))
				  (if timer
				      (cancel-timer timer)
				    (set-itimer-restart current-itimer nil)))))
			  ))
      (provide 'vm-ruleproc-vm-patches)))
