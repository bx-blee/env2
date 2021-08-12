;;;
;;; local extensions to vm
;;;


;;;
;;; redefine vm (make it a wrapper for the old vm)
;;; 

(require 'vm-startup)

(defconst vm-orig (symbol-function 'vm)
  "Original definition of `vm' function.")

(defvar vm-visit-folders-read-only-p 'ask
  "If value is 'ask, ask the user.  If t, start vm in read-only mode,
otherwise in read-write mode.")

;; redefine vm

(defun vm (&optional folder read-only)
  "Read mail under Emacs.
Optional first arg FOLDER specifies the folder to visit.  It defaults
to the value of vm-primary-inbox.  The folder buffer is put into VM
mode, a major mode for reading mail.

Prefix arg or optional second arg READ-ONLY non-nil indicates
that the folder should be considered read only.  No attribute
changes, message additions or deletions will be allowed in the
visited folder.

Visiting the primary inbox causes any contents of the system mailbox to
be moved and appended to the resulting buffer.

All the messages can be read by repeatedly pressing SPC.  Use `n'ext and
`p'revious to move about in the folder.  Messages are marked for
deletion with `d', and saved to another folder with `s'.  Quitting VM
with `q' expunges deleted messages and saves the buffered folder to
disk.

See the documentation for vm-mode for more information." 
  (interactive (list nil current-prefix-arg))

  ;; ask user once about vm-visit-folders-read-only-p
  (if (eq vm-visit-folders-read-only-p 'ask)
      (progn
	(ding)
	(setq vm-visit-folders-read-only-p
	      (y-or-n-p (format
			      "VM on [%s]. Visit folders in READ-ONLY mode? "
			      (system-name)
			      vm-primary-inbox)))))
  
  ;; access is at least as tight as vm-visit-folders-read-only-p
  (apply vm-orig (list folder (or vm-visit-folders-read-only-p read-only))))
  
  
;;;
;;; Enhancements to vm-pop.el
;;; 

(require 'vm-pop)

(defvar vm-pop-delete-on-retrieve-p (if (eq system-type 'windows-nt) 'ask t)
  "Controls whether or not to leave mail messages on POP server 
after they have been retrieved by the vm-pop client.
If value is 'ask then ask the user.
If value is t send a DELE after a RETR.")

(defun vm-pop-delete-on-retrieve-p ()
  (cond ((eq vm-pop-delete-on-retrieve-p 'ask)
	 (ding)
	 (setq vm-pop-delete-on-retrieve-p
	       (not (y-or-n-p "Leave messages on POP server(s) after retrieval? "))))
	(t vm-pop-delete-on-retrieve-p)))

;;; 
;;; vm-pop-move-mail modified
;;;

(defun vm-pop-move-mail (source destination)
  (let ((process nil)
	(folder-type vm-folder-type)
	(saved-password t)
	(m-per-session vm-pop-messages-per-session)
	(b-per-session vm-pop-bytes-per-session)
	(handler (and (fboundp 'find-file-name-handler)
		      (condition-case ()
			  (find-file-name-handler source 'vm-pop-move-mail)
			(wrong-number-of-arguments
			 (find-file-name-handler source)))))
	(popdrop (vm-safe-popdrop-string source))
	(statblob nil)
	mailbox-count mailbox-size message-size response
	n retrieved retrieved-bytes process-buffer)
    (vm-pop-delete-on-retrieve-p)	; <== MODIFICATION
    (unwind-protect
	(catch 'done
	  (if handler
	      (throw 'done
		     (funcall handler 'vm-pop-move-mail source destination)))
	  (setq process (vm-pop-make-session source))
	  (or process (throw 'done nil))
	  (setq process-buffer (process-buffer process))
	  (save-excursion
	    (set-buffer process-buffer)
	    (setq vm-folder-type (or folder-type vm-default-folder-type))
	    ;; find out how many messages are in the box.
	    (vm-pop-send-command process "STAT")
	    (setq response (vm-pop-read-stat-response process)
		  mailbox-count (nth 0 response)
		  mailbox-size (nth 1 response))
	    ;; forget it if the command fails
	    ;; or if there are no messages present.
	    (if (or (null mailbox-count)
		    (< mailbox-count 1))
		(throw 'done nil))
	    ;; loop through the maildrop retrieving and deleting
	    ;; messages as we go.
	    (setq n 1 retrieved 0 retrieved-bytes 0)
	    (setq statblob (vm-pop-start-status-timer))
	    (vm-set-pop-stat-x-box statblob popdrop)
	    (vm-set-pop-stat-x-maxmsg statblob mailbox-count)
	    (while (and (<= n mailbox-count)
			(or (not (natnump m-per-session))
			    (< retrieved m-per-session))
			(or (not (natnump b-per-session))
			    (< retrieved-bytes b-per-session)))
	      (vm-set-pop-stat-x-currmsg statblob n)
	      (vm-pop-send-command process (format "LIST %d" n))
	      (setq message-size (vm-pop-read-list-response process))
	      (vm-set-pop-stat-x-need statblob message-size)
	      (if (and (integerp vm-pop-max-message-size)
		       (> message-size vm-pop-max-message-size)
		       (progn
			 (setq response
			       (if vm-pop-ok-to-ask
				   (vm-pop-ask-about-large-message process
								   message-size
								   n)
				 'skip))
			 (not (eq response 'retrieve))))
		  (if (and (eq response 'delete)
			   (vm-pop-delete-on-retrieve-p)) ; <== MODIFICATION
		      (progn
			(message "Deleting message %d..." n)
			(vm-pop-send-command process (format "DELE %d" n))
			(and (null (vm-pop-read-response process))
			     (throw 'done (not (equal retrieved 0)))))
		    (if vm-pop-ok-to-ask
			(message "Skipping message %d..." n)
		      (message "Skipping message %d in %s, too large (%d > %d)..."
			       n popdrop message-size vm-pop-max-message-size)))
		(message "Retrieving message %d (of %d) from %s..."
			 n mailbox-count popdrop)
		(vm-pop-send-command process (format "RETR %d" n))
		(and (null (vm-pop-read-response process))
		     (throw 'done (not (equal retrieved 0))))
		(and (null (vm-pop-retrieve-to-crashbox process destination
							statblob))
		     (throw 'done (not (equal retrieved 0))))
		(vm-increment retrieved)
		(and b-per-session
		     (setq retrieved-bytes (+ retrieved-bytes message-size)))
		(if (vm-pop-delete-on-retrieve-p) ; <== MODIFICATION
		    (progn 
		      (vm-pop-send-command process (format "DELE %d" n))
		      ;; DELE can't fail but Emacs or this code might
		      ;; blow a gasket and spew filth down the
		      ;; connection, so...
		      (and (null (vm-pop-read-response process))
			   (throw 'done (not (equal retrieved 0))))
		      )))
	      (vm-increment n))
	    (not (equal retrieved 0)) ))
      (and statblob (vm-pop-stop-status-timer statblob))
      (if process
	  (vm-pop-end-session process)))))

;;; ---------------------------------------------------------------------
(provide 'vm-ext)
