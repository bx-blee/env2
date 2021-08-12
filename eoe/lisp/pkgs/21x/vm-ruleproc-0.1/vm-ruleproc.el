;;; vm-ruleproc.el

;;; Author: Pean Lim

(require 'vm-virtual)
(require 'vm-vars)
(require 'vm-ruleproc-vm-patches)
(require 'bbdb-com)

(defvar vm-ruleproc-log-file (format "/tmp/vm-ruleproc.%s.log" (user-login-name))
  "If non-nil, rule firings are recorded in this file.")


(defconst vm-ruleproc-ruleset/vm-ruleproc-label-if-user-named-explicitly
  `((:R001
     (progn (vm-ruleproc-test/label-if-user-named-explicitly :curr-msg ,(user-login-name))
	    nil)
     (message "You are explicitly named in message %s." :message-id)))
  "Label message if user is explicitly named.")


(defconst vm-ruleproc-ruleset/vm-ruleproc-label-if-in-bbdb
  `((:R001
     (progn (vm-ruleproc-test/label-if-author-in-bbdb :curr-msg)
	    nil)
     (message "Author of message %s in your BBDB." :message-id)))
  "Label message if user in BBDB.")


(defconst vm-ruleproc-ruleset/vm-ruleproc-delete-ruleproc-labels
  `((:R001
     (progn (vm-ruleproc-test/delete-labels-matching "\\(^-\\|^=\\|^#\\)")
	    nil)
     (message "Deleted label(s) of message %s in your BBDB." :message-id)))
  "Label message if user in BBDB.")


;;; -----------------------------------------------------------------
;;; user entry points
;;; -----------------------------------------------------------------

(defun vm-ruleproc-current-message ()
  "Run each active ruleset given by (vm-ruleproc-active-rulesets) against
the current message."
  (interactive)
  (cond ((vm-ruleproc-active-rulesets)
	 ;; If vm-mail-buffer buffer local is non-nil (as with Summary
	 ;; buffers) then the current message is taken from it's associated
	 ;; vm-mail-buffer
	 (save-window-excursion
	   (if vm-mail-buffer (set-buffer vm-mail-buffer))
	   (vm-ruleproc-message-internal vm-message-pointer))
	 (message "Message processed."))
	(t
	 (ding)
	 (message "No rulesets active!  Select from menu or using `vm-ruleproc-activate-ruleset'."))))


(defun vm-ruleproc-folder ()
  "Run each ruleset given by (vm-ruleproc-active-rulesets) against
each message in the current folder."
  (interactive)
  (cond ((vm-ruleproc-active-rulesets)
	 (vm-ruleproc-folder-internal 'identity)
	 (message "Folder processed."))
	(t
	 (ding)
	 (message "No rulesets active!  Select from menu or using `vm-ruleproc-activate-ruleset'."))))


(defun vm-ruleproc-get-new-mail ()
  "Get new mail and apply each ruleset given by (vm-ruleproc-active-rulesets)
to newly arrived messages."
  (interactive)
  (cond ((vm-ruleproc-auto-p)
	 (vm-get-new-mail))
	(t
	 ;; temporarily turn on auto proc
	 (vm-ruleproc-auto-on t)
	 (vm-get-new-mail)
	 (vm-ruleproc-auto-off t))))


(defun vm-ruleproc-ruleset-active-p (ruleset-name)
  "Returns non-nil if this ruleset is used for rule processing."
  (get ruleset-name 'active-p))


(defun vm-ruleproc-activate-ruleset (ruleset-name t-or-nil)
  "If non-nil, use this ruleset in rule processing."
  (put ruleset-name 'active-p t-or-nil))

;;; -----------------------------------------------------------------
;;; More user entry points (Provide unattended rule processing)
;;; -----------------------------------------------------------------

(defvar vm-ruleproc-auto-interval (* 60 10)
  "How often (in seconds) to get new mail.")

; (setq vm-ruleproc-auto-interval (* 60 1))
; (setq vm-ruleproc-auto-interval (* 60 10))
; (vm-ruleproc-auto-on)
; (vm-ruleproc-auto-off)


(defun vm-ruleproc-auto-on (&optional silently-p)
  "Enable automatic processing of new messages, and set the value of
`vm-auto-get-new-mail' to `vm-ruleproc-auto-interval'.  If optional
argument SILENTLY-P is not null, outputs a text message to
minibuffer."
  (interactive)
  (add-hook 'vm-arrived-message-hook 'vm-ruleproc-arrived-message-hook-fn)
  (add-hook 'vm-arrived-messages-hook 'vm-ruleproc-arrived-messages-hook-fn)
  ;; squirrel away original vm-auto-get-new-mail value, once.
  (or (member 'vm-auto-get-new-mail-orig (symbol-plist 'vm-ruleproc-auto-interval))
      (put 'vm-ruleproc-auto-interval 'vm-auto-get-new-mail-orig vm-auto-get-new-mail))
  ;; set to vm-ruleproc-auto-interval
  (setq vm-auto-get-new-mail vm-ruleproc-auto-interval)
  (vm-start-itimers-if-needed)
  (if (not silently-p)
      (message "Enabled automatic checking/processing of new messages every %s minute(s)."
	       (/ vm-ruleproc-auto-interval 60))
    ))


(defun vm-ruleproc-auto-off (&optional silently-p)
  "Restore `vm-auto-get-new-mail' to original value and remove automatic rule
processing of new messages.  If optional argument SILENTLY-P is not null, outputs
a text message to minibuffer."
  (interactive)
  (remove-hook 'vm-arrived-message-hook 'vm-ruleproc-arrived-message-hook-fn)
  (remove-hook 'vm-arrived-messages-hook 'vm-ruleproc-arrived-messages-hook-fn)
  (setq vm-auto-get-new-mail (get 'vm-ruleproc-auto-interval 'vm-auto-get-new-mail-orig))
  (if (not silently-p)
      (message "Disabled automatic checking/processing of new messages."))
  )


(defun vm-ruleproc-toggle-auto ()
  "Toggles between `vm-ruleproc-auto-on' and `vm-ruleproc-auto-off'."
  (interactive)
  (cond ((vm-ruleproc-auto-p)
	 (vm-ruleproc-auto-off))
	(t
	 (vm-ruleproc-auto-on))))


;;; -----------------------------------------------------------------
;;; Rule Processing Engine
;;; -----------------------------------------------------------------

(defvar vm-ruleproc-scheme 'vm-ruleproc-scheme/match-first
  "Name of the function that applies each ruleset given
by (vm-ruleproc-active-rulesets) to a message.")


(defun vm-ruleproc-message-internal (mp)
  "Returns non-nil if message was acted upon."
  (funcall vm-ruleproc-scheme mp (vm-ruleproc-active-rulesets)))


(defun vm-ruleproc-folder-internal (message-qualifier)
  "Use MESSAGE-QUALIFIER predicate against each message in the
current mail folder.  For those messages return non-nil, run each ruleset
in (vm-ruleproc-active-rulesets) on it.
Returns the list '(<num msgs in folder> <num msgs qualified> <num msgs acted on>)."
  (let ((count-qualified 0)
	(count-acted-on 0)
	(count-total 0)
	mp-current
	mp-initial
	rmsg)
    (save-window-excursion
      (if vm-mail-buffer (set-buffer vm-mail-buffer))
      (setq mp-initial vm-message-pointer)
      (setq mp-current vm-message-list)

      (while mp-current
	(setq count-total (1+ count-total))
	(setq rmsg (vm-real-message-of (car mp-current)))
	(if (eval (list message-qualifier rmsg))
	    (progn
	      (setq count-qualified (1+ count-qualified))
	      (message "Processing message %d from [%s]" count-total
		       (vm-from-of rmsg))

	      ;; make mp-current the current message
	      (if (eq vm-message-pointer mp-current) nil
		(vm-record-and-change-message-pointer vm-message-pointer mp-current))

	      ;; apply rulesets using a match-first scheme
	      (if (vm-ruleproc-message-internal vm-message-pointer)
		  (setq count-acted-on (1+ count-acted-on)))

	      t)
	  nil)
	(setq mp-current (cdr mp-current)))

      ;; make mp-initial the current message
      (if (eq vm-message-pointer mp-initial) nil
	(vm-record-and-change-message-pointer vm-message-pointer mp-initial))

      (message "%d message(s) qualified out of %d, %d acted on."
	       count-qualified count-total count-acted-on)
      (list count-total count-qualified count-acted-on)
      )))



;;; -----------------------------------------------------------------
;;; Rule Processing Schemes
;;; -----------------------------------------------------------------

(defun vm-ruleproc-scheme/match-first (mp rulesets)
  "Returns t if a match occurred on MSG against some ruleset in RULESETS,
or nil if no match happened."
  ;; initialize the keyword expansion environment
  (let ((msg (car mp)))
    (setplist 'vm-ruleproc-expand nil)
    (put 'vm-ruleproc-expand :curr-msg msg)
    (put 'vm-ruleproc-expand :message-id (vm-su-message-id msg))
    (put 'vm-ruleproc-expand :from (vm-from-of msg))
    (vm-ruleproc-mark-tested)
    (member t (mapcar '(lambda (ruleset)
			 (put 'vm-ruleproc-expand :ruleset-name ruleset)
			 (catch :rule-matched
			   (mapcar '(lambda (rule)
				      ;; update keyword expansion environment
				      (put 'vm-ruleproc-expand :rule-id (vm-ruleproc-rule-id rule))
				      (put 'vm-ruleproc-expand :rule `',rule)
				      (save-window-excursion ; restore current buffer over the eval
					(setq test-result (eval (vm-ruleproc-expand (vm-ruleproc-rule-test rule)))))
				      (cond (test-result
					     ;; non-nil is success, update keyword expansion environment
					     (put 'vm-ruleproc-expand :test-result `',test-result)
					     ;; log the rule firing
					     (if vm-ruleproc-log-file
						 (vm-ruleproc-log-rule-invocation msg
										  (get 'vm-ruleproc-expand :rule-id)
										  (get 'vm-ruleproc-expand :ruleset-name)
										  vm-ruleproc-log-file))
					     ;; do the action
					     (save-window-excursion ; restore current buffer over the eval
					       (eval (vm-ruleproc-expand (vm-ruleproc-rule-action rule))))

					     ;; now ensure that the current message is still the same
					     ;; as action may have changed
					     (if (eq vm-message-pointer mp) nil
					       (vm-record-and-change-message-pointer vm-message-pointer mp))

					     ;; mark message as having been ruleproc-ed
					     (vm-ruleproc-mark-acted-on)

					     ;; let the user know
					     (message "Rule %s of ruleset %s fired on message [%s] from [%s]."
						      (get 'vm-ruleproc-expand :rule-id)
						      (get 'vm-ruleproc-expand :ruleset-name)
						      (get 'vm-ruleproc-expand :message-id)
						      (get 'vm-ruleproc-expand :from))
					       
					     ;; done with rules for this msg
					     (throw :rule-matched t))
					    (t
					     ;; rule failed
					     nil
					     )))
				   (symbol-value ruleset))
			   ;; done with current ruleset with no match
			   nil))
		      rulesets))))



;;; -----------------------------------------------------------------
;;; Rule Expansion
;;; -----------------------------------------------------------------

(defun vm-ruleproc-expand (form)
  "Use this to expand keyword-ed forms."
  (cond ((null form) nil)
	((consp form) (cons (vm-ruleproc-expand (car form))
			    (vm-ruleproc-expand (cdr form))))
	((keywordp form)
	 (cond ((and (member form (symbol-plist 'vm-ruleproc-expand))
		     (evenp (length (member form (symbol-plist 'vm-ruleproc-expand)))))
		;; keyword exists in plist
		(get 'vm-ruleproc-expand form))
	       (t
		(ding)
		(warn "vm-ruleproc-expand: ignoring unrecognized keyword <%s>." form))))
	(t form)))

;;; -----------------------------------------------------------------
;;; helper functions
;;; -----------------------------------------------------------------

(defun vm-ruleproc-log-rule-invocation (msg rule-id ruleset-name logfile)
  (save-window-excursion
    (let ((rmsg (vm-real-message-of msg))
	  (buf (get-buffer-create " vm-ruleproc-action/log-rule-invocation scratch")))
      (set-buffer buf)
      (erase-buffer)
      (insert (format "%s Rule %s of ruleset %s invoked on [%s] from [%s]\n"
		      (current-time-string)
		      rule-id
		      ruleset-name
		      (vm-su-message-id rmsg)
		      (vm-from-of rmsg)))
      (append-to-file (point-min) (point-max) logfile))))


(defun vm-ruleproc-rule-id (rule)
  (nth 0 rule))


(defun vm-ruleproc-rule-test (rule)
  (nth 1 rule))


(defun vm-ruleproc-rule-action (rule)
  (nth 2 rule))


(defun vm-ruleproc-mark-acted-on ()
  "Mark the current-message has having been ruleproc-ed
using the vm-ruleproc label."
  (vm-ruleproc-label-set 0 ?#))

(defun vm-ruleproc-mark-tested ()
  "Mark the current-message has having been ruleproc-ed
using the vm-ruleproc label."
  (vm-ruleproc-label-set 0 ?=))


;;; -----------------------------------------------------------------
;;; vm-ruleproc message label routines
;;; -----------------------------------------------------------------

;;; vm-ruleproc-label is a 4 char wide string with the following
;;; interpretation:
;;;
;;; "<charpos-0><charpos-1><charpos-2>"
;;;
;;; <charpos-0> ::= { '-' | '#' }   ; '-' msg untested, '=' msg tested, '#' msg acted on
;;; <charpos-1> ::= '-'             ; unused, '-' initially
;;; <charpos-2> ::= '-'             ; unused, '-' initially

(defun vm-ruleproc-label-set (pos char)
  ;; this assumes that the first label with a leading '#' or '-'
  ;; is the vm-ruleproc-label
  (let ((labels (vm-labels-of (car vm-message-pointer)))
	curr-len vm-ruleproc-label)
    (setq vm-ruleproc-label (catch :label-found
			      (mapcar '(lambda (label)
					 (if (string-match "\\(^-\\|^=\\|^#\\)" label)
					     (throw :label-found label)))
				      labels)
			      nil))
    ;; delete existing
    (if vm-ruleproc-label
	(vm-delete-message-labels vm-ruleproc-label 1)
      (setq vm-ruleproc-label "-"))

    ;; maybe extend the vm-ruleproc label string
    (setq curr-len (length vm-ruleproc-label))
    (if (>= pos curr-len)
	(setq vm-ruleproc-label (concat vm-ruleproc-label
					(make-string (- (1+ pos) curr-len) ?-))))

    ;; update label and add it back
    (aset vm-ruleproc-label pos char)
    (vm-add-message-labels vm-ruleproc-label 1)
    ))


;;; -----------------------------------------------------------------
;;; Plug into menus
;;; -----------------------------------------------------------------
(defun vm-ruleproc-update-menu ()
  "Function called to update VM's menus."
  (if (assoc "Folder" current-menubar)
      (progn
	(add-submenu  '("Folder") '("RuleProc Activate Rule Set(s)" ["VM RuleProc Rule Sets Found:" nil t] "-----") "Auto-Archive")
	(add-menu-button  '("Folder") ["RuleProc Get New Mail" vm-ruleproc-get-new-mail t] "Auto-Archive")
	(add-menu-button  '("Folder") ["RuleProc Get New Mail (Auto)" vm-ruleproc-toggle-auto
				       :style toggle :selected (vm-ruleproc-auto-p) :active (vm-ruleproc-active-rulesets)] "Auto-Archive")
	(add-menu-button  '("Folder") ["RuleProc Folder" vm-ruleproc-folder t] "Auto-Archive")
	(add-menu-button  '("Folder") ["-----" nil t] "Auto-Archive")
	(mapcar '(lambda (ruleset-name)
		   (add-menu-button '("Folder" "RuleProc Activate Rule Set(s)")
				     `[,(format "%s" ruleset-name)
				       (vm-ruleproc-activate-ruleset ',ruleset-name (not (vm-ruleproc-ruleset-active-p ',ruleset-name)))
				       :style toggle :selected (vm-ruleproc-ruleset-active-p ',ruleset-name)]))
		(vm-ruleproc-find-rulesets))
	(add-menu-button '("Dispose") ["RuleProc" vm-ruleproc-current-message t] "File")
	(add-menu-button '("Dispose") ["-----" nil t] "File"))))


(add-hook 'activate-menubar-hook 'vm-ruleproc-update-menu)

;;; -----------------------------------------------------------------
;;; Plug into keymap
;;; -----------------------------------------------------------------
(define-key vm-mode-map "\M-g" 'vm-ruleproc-get-new-mail)
(define-key vm-mode-map "XF" 'vm-ruleproc-folder)
(define-key vm-mode-map "XM" 'vm-ruleproc-current-message)
(define-key vm-mode-map "XU" 'vm-ruleproc-toggle-auto)

;;; -----------------------------------------------------------------
;;; hook functions
;;; -----------------------------------------------------------------


(defun vm-ruleproc-arrived-message-hook-fn ()
  "Called with current buffer restricted to the message."
  (let (p1 msg-id)
    (goto-char (point-min))
    (re-search-forward "^Message-Id:")
    (re-search-forward "\\S-")		; first non-whitespace
    (setq p1 (1- (point)))
    (end-of-line)
    (re-search-backward "\\S-")		; first non-whitespace
    (setq msg-id (buffer-substring p1 (1+ (point))))
    (cond (msg-id
	   (message "Message [%s] arrived." msg-id)
	   (setq vm-ruleproc-arrived-messages
		 (cons msg-id vm-ruleproc-arrived-messages)))
	  (t
	   (warn "message has no ID! [%s]"
		 (buffer-string (point-min) (point-max)))))))


(defun vm-ruleproc-arrived-messages-hook-fn ()
  "Process new messages as recorded in `vm-ruleproc-arrived-messages'."
  (if vm-ruleproc-arrived-messages
      (unwind-protect
	  (let ((num-arrived (length vm-ruleproc-arrived-messages))
		result num-total num-qualified num-acted-on)
	    (message "Processing %d newly arrived message(s)..." num-arrived)
	    (setq result (vm-ruleproc-folder-internal 'vm-ruleproc-arrived-message-p)
		  num-total (nth 0 result)
		  num-qualified (nth 1 result)
		  num-acted-on (nth 2 result))
	    num-total			; unused for now
	    (if (= num-qualified num-arrived)
		(message "[%s] Processed %d newly arrived message(s)...%d acted on."
			 (current-time-string)
			 num-arrived num-acted-on)
	      (ding)
	      (warn "%d messages newly arrived, but %d were processed!%s"
		    num-arrived num-qualified (if (> num-qualified num-arrived) " (duplicate `Message-Id:'?)" ""))))
	;; unwind forms
	(setq vm-ruleproc-arrived-messages nil))
    (message "No newly arrived messages to ruleproc.")))



;;; -----------------------------------------------------------------
;;; helper functions
;;; -----------------------------------------------------------------
(defvar vm-ruleproc-arrived-messages nil
  "Internal vm-ruleproc-auto.el global variable.  It's value is a list of message-ids.")

(defun vm-ruleproc-auto-p ()
  (member 'vm-ruleproc-arrived-message-hook-fn vm-arrived-message-hook))

(defun vm-ruleproc-arrived-message-p (msg)
  "Is msg message that just arrived?"
  (let ((rmsg (vm-real-message-of msg)))
    (member (or (vm-get-header-contents rmsg "Message-Id:")
		(vm-su-message-id rmsg))
	    vm-ruleproc-arrived-messages)))

(defun vm-ruleproc-header-of (header)
  "Called with current buffer restricted to the message."
  (let (msg p1)
    (if vm-mail-buffer (set-buffer vm-mail-buffer))
    (setq msg  (car vm-message-pointer))
    (save-restriction
      (narrow-to-region (vm-headers-of msg) (vm-text-of msg))
      (goto-char (point-min))
      (cond ((re-search-forward (format "^%s:" header) nil t)
	     (re-search-forward "\\S-")
	     (setq p1 (1- (point)))
	     (end-of-line)
	     (re-search-backward "\\S-")
	     (buffer-substring p1 (1+ (point))))
	    (t nil)))))


(defun vm-ruleproc-find-rulesets ()
  "Returns the list of bound symbols beginning with `vm-ruleproc-ruleset/'."
  (sort (mapcar 'intern
		(all-completions "vm-ruleproc-ruleset/" obarray 'boundp))
	'string-lessp))


(defun vm-ruleproc-active-rulesets ()
  "Returns list of rulesets used for processing messages.
The list is of the form:

    ( <ruleset-name 1> <ruleset-name 2> ... <ruleset-name N> )

where <ruleset-name> is the symbols whose value is of the form:

    ( <rule 1> <rule 2> ... <rule N> )

and <rule> is of the form:

    ( <rule-name-as-keyword> <rule-test> <rule-action> )
"  (let ((active-rulesets nil))
    (mapcar '(lambda (ruleset-name)
	       (if (get ruleset-name 'active-p)
		   (setq active-rulesets (cons ruleset-name active-rulesets))))
	    (vm-ruleproc-find-rulesets))
    active-rulesets))



;;; -----------------------------------------------------------------
;;; Some Basic RuleProc Tests
;;; -----------------------------------------------------------------

;;
;; Message Property Tests, some with side-effects on the message
;;

(defun vm-ruleproc-test/author (msg match)
  "Retruns non-nil if match occurs in the full name or net address
of the author of MSG."
  (let ((rmsg (vm-real-message-of msg)))
    (or (string-match match (vm-full-name-of rmsg))
	(string-match match (vm-from-of rmsg)))))


(defun vm-ruleproc-test/subject (msg match)
  "Returns non-nil if MATCH occurs in the subject field of MSG."
  (let ((rmsg (vm-real-message-of msg)))
    (string-match match (vm-subject-of msg))))


(defun vm-ruleproc-test/text (msg match)
  "Returns non-nil if regexp MATCH occurs in the text of MSG."
  (let ((rmsg (vm-real-message-of msg)))
    (string-match match (vm-text-of msg))))


(defun vm-ruleproc-test/author-in-bbdb-p (msg)
  "If author is in user's BBDB returns records, else nil."
  (let ((net (vm-from-of msg)))
    (bbdb-search (bbdb-records) nil nil net)))


(defun vm-ruleproc-test/label-if-author-in-bbdb (msg)
  "Returns nil or the BBDB record(s) matching the author.
As a side-effect, labels the message with \" !\"."
  (cond ((vm-ruleproc-test/author-in-bbdb-p msg)
	 (vm-ruleproc-label-set 2 ?!)
	 t)
	(t nil)))


(defun vm-ruleproc-test/user-named-explicitly-p (msg username-regexp)
  "Returns a ?t if the user is named in the To: field, ?c if named
in the Cc: field and ?r if in Resent-To: or Resent-Cc: field, or nil
otherwise."
  (let ((rmsg (vm-real-message-of msg)) char)
    (setq char (cond ((string-match username-regexp (or (vm-ruleproc-header-of "To") ""))
		      ?t)
		     ((string-match username-regexp (or (vm-ruleproc-header-of "Cc") ""))
		      ?c)
		     ((or (string-match username-regexp (or (vm-ruleproc-header-of "Resent-To") ""))
			  (string-match username-regexp (or (vm-ruleproc-header-of "Resent-Cc") "")))
		      ?r)
		     (t nil)))))


(defun vm-ruleproc-test/label-if-user-named-explicitly (msg username-regexp)
  "Returns non-nil if regexp USERNAME-REGEXP occurs in the `To:' or `Resent-To:' or
`Resent-Cc:', or `Cc:' fields of the message."
  (let ((rmsg (vm-real-message-of msg))
	msg-cc msg-resent-to msg-resent-cc char)
    (cond ((setq char (vm-ruleproc-test/user-named-explicitly-p msg username-regexp))
	   (vm-ruleproc-label-set 1 char)
	   t)
	  (t nil))))


(defun vm-ruleproc-test/delete-labels-matching (regexp)
  (let ((rmsg (vm-real-message-of (car vm-message-pointer))))
    (member t (mapcar '(lambda (label)
			 (cond ((string-match regexp label)
				(vm-delete-message-labels label 1)
				t)
			       (t nil)))
		      (vm-labels-of rmsg)))))


;;; -----------------------------------------------------------------
;;; Some Basic RuleProc Actions
;;; -----------------------------------------------------------------

;;
;; Message Filing Actions
;;


(defun vm-ruleproc-action/refile-current-message (folder)
  (let ((rmsg (vm-real-message-of (car vm-message-pointer))))
    (message "saving message [%s] from [%s] to folder %s."
	     (vm-su-message-id rmsg)
	     (vm-from-of rmsg)
	     folder)
    (vm-save-message folder)))


;;
;; Message Forwarding Actions
;;


(defun vm-ruleproc-action/resend-current-message (resend-to-addresses)
  "Resend MSG to email address(es) listed in RESEND-TO-ADDRESSES."
  (let ((rmsg (vm-real-message-of (car vm-message-pointer))))
    (message "Resending msg from [%s] to [%s]." (vm-from-of rmsg) resend-to-addresses)
    (call-interactively 'vm-resend-message)
    (goto-char (point-min))
    (re-search-forward "^Resent-To:")
    (end-of-line)
    (insert resend-to-addresses)
    (call-interactively 'vm-mail-send)))


(defun vm-ruleproc-action/forward-current-message (forward-to-addresses)
  "Forward MSG to email address(es) listed in FORWARD-TO-ADDRESSES."
  (let ((rmsg (vm-real-message-of (car vm-message-pointer))))
    (message "Forwarding msg from [%s] to [%s]." (vm-from-of rmsg) forward-to-addresses)
    (call-interactively 'vm-forward-message)
    (goto-char (point-min))
    (re-search-forward "^To:")
    (end-of-line)
    (insert forward-to-addresses)
    (goto-char (point-min))
    (re-search-forward "^Subject: ")
    (insert ">")
    (call-interactively 'vm-mail-send)))


;;
;; Miscellaneous Sample Actions (Used by Sample Rules)
;;

(defun vm-ruleproc-action/call-user-at (phone-num-string msg)
  (let ((rmsg (vm-real-message-of msg))
	(call-succeeds-p (zerop (random 2))))
    (message  "Calling you at %s re: mail from [%s] with subject [%s]...%s."
	      phone-num-string
	      (vm-from-of rmsg)
	      (vm-subject-of rmsg)
	      (if call-succeeds-p "succeeded" "failed")
	      )
    (sleep-for .25)
    call-succeeds-p))


(defun vm-ruleproc-action/call-911 (msg)
  (message "Call 911 stub: Help! Urgent message notification: %s"
	   (vm-subject-of (vm-real-message-of msg)))
  (sleep-for .5))


(defun vm-ruleproc-action/trace-rule-invocation (msg rule-id)
  (let ((rmsg (vm-real-message-of msg)))
    (message (format "Rule %s invoked on message [%s] from [%s] at %s\n"
		     rule-id
		     (vm-su-message-id rmsg)
		     (vm-from-of rmsg)
		     (current-time-string)))
    (sleep-for .5)
    ))

;;; -----------------------------------------------------------------
;;; Sample Rules with associated Tests and Actions
;;; -----------------------------------------------------------------

;   (defconst vm-ruleproc-ruleset/sample-rules
;     '((:R001
;        ;; if from pean re: vm-ruleproc...
;        (and (vm-ruleproc-test/author :curr-msg "pean")
;             (vm-ruleproc-test/subject :curr-msg "vm-ruleproc"))
;        (vm-ruleproc-action/trace-rule-invocation :curr-msg :rule-id))
;
;       (:ROO2
;        ;; if author in BBDB & subject is Phone Message, ERS Response or URGENT...
;        (and (vm-ruleproc-test/author-in-bbdb-p :curr-msg) ; if author in BBDB
;             (vm-ruleproc-test/subject :curr-msg "\\\(^Phone Message:\\|URGENT\\|^ERS Response\\\)"))
;        (progn
;          (vm-ruleproc-action/trace-rule-invocation :curr-msg :rule-id)
;          (if (or (vm-ruleproc-action/call-user-at "425-555-8026" :curr-msg) ; office
;       	   (vm-ruleproc-action/call-user-at "425-555-2627" :curr-msg)) ; home
;              ;; successfully notified
;              nil
;            (vm-ruleproc-action/call-911 :curr-msg))))
;
;       (:R003-refile-empire-email
;        ;; auto-refile mail from leaders of empires
;        (or (vm-ruleproc-test/author :curr-msg "Bill Gates")
;            (vm-ruleproc-test/author :curr-msg "Adolph Hitler"))
;        (progn
;          (vm-ruleproc-action/trace-rule-invocation :curr-msg :rule-id)
;          (vm-ruleproc-action/refile-current-message "~/VM/empire-email")))
;
;       (:ROO5-refile-unrecognized-authors
;        ;; if author not in BBDB
;        (not (vm-ruleproc-test/author-in-bbdb-p :curr-msg))
;        (vm-ruleproc-action/refile-current-message "~/INBOX.unrecognized")))
;     "Samples vm-ruleproc rules, to give an idea of the range of rules.")


;;; -----------------------------------------------------------------
(provide 'vm-ruleproc)
