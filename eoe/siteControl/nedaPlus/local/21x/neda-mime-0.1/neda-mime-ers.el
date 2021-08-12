;;;
;;; neda-mime-ers.el
;;;
;;; Process MIME type/subtype: application/x-embedded-response-spec
;;;
;;; by Pean Lim <pean@neda.com>
;;;
;;; $Id: neda-mime-ers.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(defvar nm-xers-msg nil
  "Set to the last embedded response message processed.")

(defvar nm-xers-ers nil
  "Set to the embedded response specification.")

(defvar nm-xers-prompt nil
  "Set to the prompt for the last embedded response message.")

(defvar nm-xers-originator nil
  "Set to email address of the embedded response message originator.")

(defvar nm-xers-recipient nil
  "Set to email address of the embedded response message recipient.")

(defvar nm-xers-subject nil
  "Set to subject of the embedded response message.")

(defvar nm-xers-result nil
  "Set to the user selected string, or :abort")

(defconst nm-xers-abort-result ":abort"
  "Value of nm-xers-result if the user changes his mind about replying.")

;;; ---------------------------------------------------------------------==
;;; Embedded Response Message origination
;;; ---------------------------------------------------------------------==

;;; sticky variables...

(defvar nm-xers-last-to ""
  "last `to' specified on an LSM er message")

(defvar nm-xers-last-subject ""
  "last `subject' specified on an LSM er message")

(defvar nm-xers-last-msg ""
  "last message specified on an LSM er message")

(defvar nm-xers-last-choices "\"Yes\" \"No\""
  "last choices specified on an LSM er message")

;;;
;;;  er-choose-one
;;;

(defun nm-xers-send-er-choose-one (to subject out-message choices)
  "This function assumes that it is being invoked in a vm-mail composition
buffer."
  (interactive
   (list (setq nm-xers-last-to (or (nm-xers-field-value "To")
			       (read-string "To: " nm-xers-last-to)))
	 (setq nm-xers-last-subject (or (nm-xers-field-value "Subject")
				    (read-string "Subject: " nm-xers-last-subject)))
	 (setq nm-xers-last-msg (read-string "Outgoing Message (Optional): " nm-xers-last-msg))
	 (setq nm-xers-last-choices (read-string "Response Options List: " nm-xers-last-choices))))
  ;; maybe fill in `to:' field
  (if (nm-xers-field-value "To")
      nil
    (goto-char (point-min))
    (re-search-forward "^To: ")
    (insert to))
  ;; maybe fill in `subject:' field
  (if (nm-xers-field-value "Subject")
      nil
    (goto-char (point-min))
    (re-search-forward "^Subject: ")
    (insert subject))
  ;; 
  ;; fill in message body
  ;;
  (cond ((string= out-message "")
	 ;; send a TxtEmbRspMsg_1Part
	 (goto-char (point-max))
	 (insert (mime-create-tag "application/x-embedded-response-spec; charset=us-ascii" "7bit"))
	 (insert (format "\n(er-choose-one\n%s\n )\n\n" choices)))
	(t
	 ;; send a TxtEmbRspMsg_2Part
	 (goto-char (point-max))
	 (insert (mime-create-tag "text/plain; charset=us-ascii" "7bit"))
	 (insert (format "\n%s\n\n" out-message))
	 (insert (mime-create-tag "application/x-embedded-response-spec; charset=us-ascii" "7bit"))
	 (insert (format "\n(er-choose-one\n%s\n )\n\n" choices)))))

;;; ---------------------------------------------------------------------
;;; nm-xers-doit
;;; ---------------------------------------------------------------------

(defun nm-xers-doit (ers)
  "Handle embedded response spec."

  ;;
  ;; parse message for From:, To:, Subject: fields & nm-xers-prompt
  ;;

  ;; get nm-xers-subject
  (goto-char (point-min))
  (re-search-forward "^Subject: ")
  (setq nm-xers-subject (buffer-substring (point) (progn (end-of-line 1) (point))))    

  ;; get nm-xers-originator
  (goto-char (point-min))
  (setq nm-xers-originator (cond ((re-search-forward "^Reply-to: " nil t) 
				  (buffer-substring (point) (progn (end-of-line 1) (point))))
				 (t 
				  (goto-char (point-min))
				  (re-search-forward "^From: ")
				  (buffer-substring (point) (progn (end-of-line 1) (point))))))

  ;; get nm-xers-recipient
  (goto-char (point-min))
  (re-search-forward "^To: ")
  (setq nm-xers-recipient (buffer-substring (point) (progn (end-of-line 1) (point))))

  ;;
  ;; now process the embedded response spec
  ;;
  (save-window-excursion
    (let ((curr-buf (current-buffer))
	  (real-msg (vm-real-message-of (car vm-message-pointer))) ; as opposed to the Presentation message
	  (ers-buf (get-buffer-create " neda-mime-ers.el ers")))
      (switch-to-buffer (vm-buffer-of real-msg))
      (save-restriction
	(widen)
	(setq nm-xers-msg (buffer-substring (vm-start-of real-msg) (vm-end-of real-msg))))

      ;; get nm-xers-prompt 
      (let (prompt-beg
	    (curr-buf (current-buffer))
	    (work-buf (get-buffer-create " neda-mime-ers.el msg")))
	(unwind-protect 
	    (progn
	      (set-buffer work-buf)
	      (erase-buffer)
	      (insert nm-xers-msg)
	      (goto-char (point-min))	; begining of message
	      (setq nm-xers-prompt
		    (format "Message: %s%s"
			    nm-xers-subject
			    (cond ((search-forward "Content-Type: text/plain" nil t)
				   ;; TxtEmbRspMsg_2Part
				   (search-forward "\n\n")
				   (setq prompt-beg (point))
				   (search-forward "Content-Type: application/x-embedded-response-spec")
				   (search-backward "\n\n")
				   (concat "\n" (buffer-substring prompt-beg (point)))
				   )
				  (t
				   ;; TxtEmbRspMsg_1Part => to text body part
				   "")))))
	  (set-buffer curr-buf)))

      ;; now process the spec
      (setq nm-xers-result "")		; initialize global
      (set-buffer ers-buf)
      (erase-buffer)
      (insert ers)
      ;; should really do checking of the elisp-buf to make sure i'm only 
      ;; doing ers forms and not random dangerous elisp...
      (eval-buffer ers-buf)
      (save-excursion
	(cond ((string-equal nm-xers-result nm-xers-abort-result)
	       (message "Abort."))
	      (t
	       ;; 
	       ;; generate and send the response email
	       ;; 
	       (call-interactively 'vm-mail)
	       ;; fill in `To:' field
	       (goto-char (point-min))
	       (re-search-forward "^To: ") 
	       (insert nm-xers-originator)
	       ;; fill in `Subject:' field
	       (goto-char (point-min))
	       (re-search-forward "^Subject: ") 
	       (insert (format "ERS Response [%s] -- [Re: %s]"
			       (nm-xers-truncate-if-multi-line nm-xers-result)
			       (nm-xers-truncate-if-multi-line nm-xers-prompt)))
	       ;; response body
	       (goto-char (point-max))
	       (mime-editor/insert-tag "text" "plain")
	       (insert (format "Response to ERS message: [%s]\n\n" nm-xers-result))
	       (mime-editor/insert-tag "message" "rfc822")
	       (insert nm-xers-msg)
	       (vm-mail-send-and-exit t)
	       (message "Done.")
	       )))
      )))

;;; ---------------------------------------------------------------------
;;; ERS Handlers
;;; ---------------------------------------------------------------------

;;;
;;; er-choose-one
;;;

(defun er-choose-one (&rest choices)
  (cond ((and (string-match "XEmacs" emacs-version)
	      (eq window-system 'x))
	 (popup-dialog-box (cons nm-xers-prompt (nm-xers-extract-dialog-buttons-from-er-spec choices)))
	 (setq nm-xers-result (catch 'dialog-done
				(let (event)
				  (while t
				    (setq event (next-command-event event))
				    (cond
				     ((and (menu-event-p event) (stringp (car-safe (event-object event))))
				      (menu-event-p event)
				      (throw 'dialog-done (car-safe (event-object event))))
				     ((and (menu-event-p event)
					   (or (eq (event-object event) 'abort)
					       (eq (event-object event) 'menu-no-selection-hook)))
				      (signal 'quit nil))
				     ((button-release-event-p event) nil)
				     (t
				      (beep)
				      (message "Please make a choice from the dialog.")))))
				)))
	(t 
	 (let ((cic completion-ignore-case))
	   (unwind-protect 
	       (progn
		 (setq completion-ignore-case t)
		 (setq nm-xers-result (completing-read
				       (format "%s (press [Tab] for reply choices): "
					       nm-xers-prompt)
				       (mapcar '(lambda (choice)
						  (list choice choice))
					       choices) nil t)))
	     (setq completion-ignore-case cic))))))

;;; ---------------------------------------------------------------------
;;; Helper functions
;;; ---------------------------------------------------------------------

(defun nm-xers-field-value (field-name)
  "Assumes current buffer is a vm-mail composition buffer.
Get the value of the FIELD-NAME or nil currently empty.  e.g., for
the value of the `To:' field, specify \"To\"."
  (interactive "sField (e.g., `to': ")
  (let (p1 field-value)
    ;; remove excess whitespace from all headers
    ;; snarfed from nnmail-remove-leading-whitespace
    (goto-char (point-min))
    (while (re-search-forward "^\\([^ :]+: \\) +" nil t)
      (replace-match "\\1" t))
    ;; now get the value of the field
    (goto-char (point-min))
    (re-search-forward (format "^%s: " field-name))
    (setq p1 (point))
    (end-of-line 1)
    (setq field-value (buffer-substring p1 (point)))
    (if (string-equal field-value "")
	nil 
      field-value)))  

(defun nm-xers-truncate-if-multi-line (str)
  (let (pos)
    (if (setq pos (string-match "\n" str))
	(concat (substring str 0 pos) "...")
      str)))


;(nm-xers-extract-dialog-buttons-from-er-spec  '("Mon" "Thu" "Fri" "Sat"))
(defun nm-xers-extract-dialog-buttons-from-er-spec (responses)
  (cond ((null responses) (list nil (vector "Abort Response"
					    (list nm-xers-abort-result) t)))
	(t (cons (vector (car responses) (list (car responses)) t)
		 (nm-xers-extract-dialog-buttons-from-er-spec (cdr responses))))))

;;; ---------------------------------------------------------------------==
;;; MIME Composition: plug into MIME-Edit menu
;;; ---------------------------------------------------------------------==

(eval-after-load "tm-edit" 
		 '(progn

		    ;; add to MIME-Edit menu
		    (or (assoc 'nm-xers-choose-one mime-editor/menu-list) ; add item just once
			(setq mime-editor/menu-list (mime-editor/menu-list-insert
						     '(nm-xers-choose-one "ERS er-choose-one"
								      nm-xers-send-er-choose-one)
						     mime-editor/menu-list
						     'level)))
	     
		    ;; add to keymap
		    (define-key mime-editor/mime-map "\C-r" 'nm-xers-send-er-choose-one)
		    ))

;;; ---------------------------------------------------------------------
;;; MIME Viewing: tm-vm MIME viewer support
;;; ---------------------------------------------------------------------

(defun mime/decode-application/x-embedded-response-spec (beg end cal)
  ;;
  ;; get the ers body part
  ;; 
  (goto-char beg)
  (re-search-forward "^$")
  (setq nm-xers-ers (buffer-string (+ (match-end 0) 1) end))
  (nm-xers-doit nm-xers-ers))

(set-atype 'mime/content-decoding-condition
	   '((type . "application/x-embedded-response-spec")
	     (method . mime/decode-application/x-embedded-response-spec))
	   )

;;; ---------------------------------------------------------------------
;;; MIME Viewing: Native VM MIME viewer support
;;; ---------------------------------------------------------------------

(defun vm-mime-display-internal-application/x-embedded-response-spec (layout)
  (if (vectorp layout)
      (let ((buffer-read-only nil)
	    (description (vm-mm-layout-description layout)))
	(vm-mime-insert-button
	 (format "%-35.35s [%s to use embedded response]"
		 (vm-mime-layout-description layout)
		 (if (vm-mouse-support-possible-here-p)
		     "Click mouse-2"
		   "Press RETURN"))
	 (function
	  (lambda (layout)
	    (save-excursion
	      (vm-mime-display-internal-application/x-embedded-response-spec layout))))
	 layout nil))
    (goto-char (vm-extent-start-position layout))
    (setq layout (vm-extent-property layout 'vm-mime-layout))
    (nm-xers-doit (nm-xue-return-body-as-string layout)))
  t)

(fset 'vm-mime-display-button-application/x-embedded-response-spec
      'vm-mime-display-internal-application/x-embedded-response-spec)

;(if (null (member "application/x-embedded-response-spec" vm-mime-internal-content-types))
;    (setq vm-mime-internal-content-types (cons "application/x-embedded-response-spec"
;					       vm-mime-internal-content-types)))

;; add application/x-usafe-elisp to vm-mime-internal-content-types
(cond ((and (consp vm-mime-internal-content-types)
	    (null (member "application/x-embedded-response-spec" vm-mime-internal-content-types)))
       (setq vm-mime-internal-content-types (cons "application/x-embedded-response-spec" vm-mime-internal-content-types)))
      ((null vm-mime-internal-content-types)
       ;; not required because nil means never display internally
       ;; t => always display internally if possible
       t))

;;; ---------------------------------------------------------------------

(provide 'neda-mime-ers)
