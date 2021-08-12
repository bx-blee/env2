;;; vm-ruleproc-bbdb.el

;;; Author: Pean Lim

;;; A set of RuleProc Tests and Actions for use 
;;; with the vm-ruleproc library.  Plus some example rules.

(require 'vm-ruleproc)
(require 'bbdb-com)

;;; -----------------------------------------------------------------
;;; User Interface
;;; -----------------------------------------------------------------

(defvar vm-ruleproc-bbdb/tag-handlers '((lsm nil)
					(pager  nil)
					(fax nil)
					(emergency nil)
					(sms nil)
					(default nil))
  "An alist specifying the user's available access methods
with their corresponding addresses.  These are to be used by vm-ruleproc
for resending priority messages to the user.  e.g.;

 '((lsm (vm-ruleproc-action/forward-current-message \"Pean LSM Lim <166.056@lsm.neda.com>\"))
   (pager  nil)
   (fax (vm-ruleproc-action/resend-current-message \"Pean Fax Lim <pean/5629591@fax.neda.com>\"))
   (sms nil))
")

(defconst vm-ruleproc-ruleset/vm-ruleproc-bbdb-use-ruleproc-tags
  `((:R001
     (vm-ruleproc-bbdb-test/bbdb-ruleproc-tags :curr-msg)
     (vm-ruleproc-bbdb-action/handle-bbdb-ruleproc-tags :curr-msg :test-result)))
  "Check for existance of `ruleproc' field in the author's BBDB record.")


;;; -----------------------------------------------------------------
;;; vm-ruleproc-bbdb tests
;;; -----------------------------------------------------------------

(defun vm-ruleproc-bbdb-test/bbdb-ruleproc-tags (&optional msg)
  "Return list of priority access methods associated with the author of the
MSG as listed in the `ruleproc' field in the user's Big Brother Database.
e.g., '(\"lsm\" \"pager\")."
  (let (bbdb-records bbdb-record ruleproc ruleproc-list)
    (if vm-mail-buffer (set-buffer vm-mail-buffer))
    (setq bbdb-records (vm-ruleproc-test/author-in-bbdb-p (or msg (car vm-message-pointer))))
    (cond ((setq bbdb-record (car bbdb-records)) 
	   ;; warn if more than 1 matched record
	   (if (cdr bbdb-records)
	       (progn
		 (ding)
		 (warn "Multiple BBDB records matched %s--using first!"
		       (mapcar '(lambda (rec)
				  (format "[%s]" (bbdb-record-name rec)))
			       bbdb-records))))

	   ;; return ruleproc as a list of access-method
	   (cond ((and (setq ruleproc (cdr (assoc 'ruleproc (bbdb-record-raw-notes bbdb-record))))
		       (progn (setq ruleproc-list nil)
			      (mapcar (lambda (elt)
					(if (> (length elt) 0)
					    (setq ruleproc-list (cons elt ruleproc-list))))
				      (reverse (chop-string ruleproc "\\( \\|,\\)")))
			      ruleproc-list))
		  (message "BBDB ruleproc tag(s) found: %s" ruleproc-list)
		  ruleproc-list)
		 (t nil)))
	  (t nil))))



;;; -----------------------------------------------------------------
;;; vm-ruleproc-bbdb actions
;;; -----------------------------------------------------------------

(defun vm-ruleproc-bbdb-action/handle-bbdb-ruleproc-tags (msg bbdb-ruleproc-tags)
  "Handler for BBDB `ruleproc' field.  Returns the list containing 
the result of each tag handler's evaluation."
  (let ((rmsg (vm-real-message-of msg)))
    (mapcar '(lambda (bbdb-ruleproc-tag)
	       (let ((tag-handler (nth 1 (assoc (intern bbdb-ruleproc-tag) vm-ruleproc-bbdb/tag-handlers))))
		 (cond (tag-handler
			(eval (vm-ruleproc-expand tag-handler))
			t)
		       (t nil))))
	    bbdb-ruleproc-tags)))


;;; -----------------------------------------------------------------
(provide 'vm-ruleproc-bbdb)
