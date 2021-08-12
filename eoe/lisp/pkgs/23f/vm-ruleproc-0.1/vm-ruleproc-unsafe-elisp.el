;;; vm-ruleproc-unsafe-elisp.el

(require 'vm-ruleproc)
(require 'vm-ruleproc-bbdb)
(require 'neda-mime-ue)

;;; This package allows for ruleproc processing of
;;; application/x-unsafe-elisp body part in email messages

(defconst vm-ruleproc-ruleset/vm-ruleproc-unsafe-elisp
  `((:R001
     ;; if message has unsafe-elisp & author has lispbot access & author authenticates...
     (and (vm-ruleproc-test/ue-unsafe-elisp-msg-p :curr-msg)
	  (member "has-lispbot-access" (vm-ruleproc-bbdb-test/bbdb-ruleproc-tags :curr-msg))
	  (vm-ruleproc-test/ue-signature-valid-p :curr-msg))
     ;; ...then run the unsafe-elisp.
     (vm-ruleproc-action/ue-eval-unsafe-elisp :curr-msg)))
  "Automatic processing of application/x-unsafe-elisp.")


;;; -----------------------------------------------------------------
;;; vm-ruleproc-unsafe-elisp tests
;;; -----------------------------------------------------------------

(defun vm-ruleproc-test/ue-signature-valid-p (msg)
  "Returns t if MSG is a signed message with a valid signature."
  (ding)
  (message "vm-ruleproc-test/ue-signature-valid-p not yet implemented--always returns true!")
  (sleep-for 1)
  t					; for now
  )


(defun vm-ruleproc-test/ue-unsafe-elisp-msg-p (&optional msg)
  "If current message is a mulitpart MIME message with an application/x-unsafe-elisp
body part, returns the layout for the application/x-unsafe-elisp part,
else nil."
  (interactive)
  (let (rmsg layout parts)
    (if vm-mail-buffer (set-buffer vm-mail-buffer))
    (setq rmsg (vm-real-message-of (or msg (car vm-message-pointer))))
    (setq layout (vm-mime-parse-entity rmsg))
    ;; check for a multipart message
    (cond ((and (arrayp layout)
		(string-match "multipart/" (car (vm-mm-layout-type layout))))
	   ;; check for an unsafe-elisp part
	   (setq parts (vm-mm-layout-parts layout))
	   (catch 'found
	     (progn
	       (mapcar '(lambda (subpart-layout)
			  (if (string-match "application/x-unsafe-elisp"
					    (car (vm-mm-layout-type subpart-layout)))
			      (throw 'found subpart-layout)))
		       parts)
	       nil)))
	  ;; not a multipart message
	  (t nil))))

;;; -----------------------------------------------------------------
;;; vm-ruleproc-unsafe-elisp actions
;;; -----------------------------------------------------------------

(defun vm-ruleproc-action/ue-eval-unsafe-elisp (&optional msg)
  "Evaluate the unsafe elisp."
  (interactive)
  (let (ue-layout ue-header-start ue-body-start ue-body-end ue-string)
    (setq ue-layout (vm-ruleproc-test/ue-unsafe-elisp-msg-p msg))
    (setq ue-header-start (vm-mm-layout-header-start ue-layout))
    (setq ue-body-start (vm-mm-layout-body-start ue-layout))
    (setq ue-body-end (vm-mm-layout-body-end ue-layout))
    (set-buffer (marker-buffer ue-header-start))
    (save-restriction
      (narrow-to-region ue-header-start ue-body-end)
      (setq ue-string (buffer-substring ue-body-start ue-body-end)))
    (nm-xue-doit ue-string t)))


;;; -----------------------------------------------------------------
(provide 'vm-ruleproc-unsafe-elisp)



; a layout looks like this:
; ------------------------
;
;   [("multipart/mixed" "boundary=Multipart_Tue_Sep_23_09:13:18_1997-1") ; type
;    ("multipart/mixed" "boundary=\"Multipart_Tue_Sep_23_09:13:18_1997-1\"") ; qtype
;    "7bit"					; encoding
;    nil					; id
;    nil					; description
;    nil					; disposition
;    nil					; qdisposition
;    #<marker at 1487667 in INBOX>		; header-start
;    #<marker at 1489161 in INBOX>		; body-start
;    #<marker at 1492154 in INBOX>		; body-end
;    ;; multiipart-list
;    (
;     [("text/plain" "charset=US-ASCII") ("text/plain" "charset=US-ASCII") "7bit" nil nil nil nil #<marker at 1489200 in INBOX> #<marker at 1489244 in INBOX> #<marker at 1489355 in INBOX> nil nil nil]
;     [("text/plain" "charset=US-ASCII") ("text/plain" "charset=US-ASCII") "7bit" nil nil nil nil #<marker at 1489395 in INBOX> #<marker at 1489439 in INBOX> #<marker at 1490217 in INBOX> nil nil nil]
;     [("text/plain" "charset=US-ASCII") ("text/plain" "charset=US-ASCII") "7bit" nil nil nil nil #<marker at 1490257 in INBOX> #<marker at 1490301 in INBOX> #<marker at 1490443 in INBOX> nil nil nil]
;     [("application/x-unsafe-elisp") ("application/x-unsafe-elisp") "7bit" nil nil nil nil #<marker at 1490483 in INBOX> #<marker at 1490557 in INBOX> #<marker at 1492112 in INBOX> nil nil nil]
;     )
;    nil					; ?
;    nil					; ?
;    ]


