;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS: %W% %G%
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Module Description:
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;

;; Example of how internal works
(defun bbdb-mb-add ()
"Add an entry in the directory for the originator of this message"
  (interactive)
  (bbdb-create-internal "name2" "company" "net2" nil (list 6448596) "notes")
  )


;;
;; Default is most general
(setq bbdb-completion-type nil)

(defun bbdb-complete-address ()
  (interactive)
  (let ((orig-type bbdb-completion-type))
    (setq bbdb-completion-type 'net)
    (bbdb-complete-name)
    (setq bbdb-completion-type orig-type)
    )
  )


(defun bbdb-complete-name-only ()
  (interactive)
  (let ((orig-type bbdb-completion-type))
    (setq bbdb-completion-type 'name)
    (bbdb-complete-name)
    (setq bbdb-completion-type orig-type)
    )
  )

(defun bbdb-complete-just-name-only ()
  (interactive)
  (let ((orig-type bbdb-completion-type))
    (setq bbdb-completion-type 'name)
    (bbdb-complete-just-name)
    (setq bbdb-completion-type orig-type)
    )
  )

(defun bbdb-complete-just-name (&optional start-pos)
  "Complete the user full-name or net-address before point (up to the 
preceeding newline, colon, or comma).  If what has been typed is unique,
insert an entry of the form \"User Name <net-addr>\".  If it is a valid
completion but not unique, a list of completions is displayed.  

Completion behaviour can be controlled with 'bbdb-completion-type'."
  (interactive)
  (let* ((end (point))
	 (beg (or start-pos
		  (save-excursion
		    (re-search-backward "\\(\\`\\|[\n:,]\\)[ \t]*")
		    (goto-char (match-end 0))
		    (point))))
	 (pattern (downcase (buffer-substring beg end)))
	 (ht (bbdb-hashtable))
	 ;; If we have two completions which expand to the same record, only
	 ;; treat one as a completion.  For example, if the user asked for
	 ;; completion on "foo" and there was a record of "Foo Bar <foo@baz>",
	 ;; pretend the first completion ("Foo Bar") is valid and the second
	 ;; ("foo@baz") is not, since they're actually the *same* completion
	 ;; even though they're textually different.
	 (yeah-yeah-this-one nil)
	 (only-one-p t)
	 (all-the-completions nil)
	 (pred (function (lambda (sym)
		 (and (bbdb-completion-predicate sym)
		      (let* ((rec (symbol-value sym))
			     (net (bbdb-record-net rec)))
			(if (and yeah-yeah-this-one
				 (not (eq rec yeah-yeah-this-one)))
			    (setq only-one-p nil))
			(setq all-the-completions
			      (cons sym all-the-completions))
			(if (eq rec yeah-yeah-this-one)
			    nil
			  (and net (setq yeah-yeah-this-one rec))
			  net))))))
	 (completion (try-completion pattern ht pred)))
    ;; If there were multiple completions for this record, the one that was
    ;; picked is random (hash order.)  So canonicalize that to be the one
    ;; closest to the front of the list.
    (if (and (stringp completion)
	     yeah-yeah-this-one
	     only-one-p)
	(let ((addrs (bbdb-record-net yeah-yeah-this-one))
	      (rest all-the-completions))
	  (while rest
	    (if (member (symbol-name (car rest)) addrs)
		(setq completion (symbol-name (car rest))
		      rest nil))
	    (setq rest (cdr rest)))))
    (setq yeah-yeah-this-one nil
	  all-the-completions nil)
    (cond ((eq completion t)
	   (let* ((sym (intern-soft pattern ht))
		  (val (symbol-value sym)))
	     (delete-region beg end)
	     (let*
		 ((name (bbdb-record-name (car val))))
	       
	       (insert (format "\"%s\"" name  primary-net)))
	     ;;
	     ;; if we're past fill-column, wrap at the previous comma.
	     (if (and
		  (if (boundp 'auto-fill-function) ; the emacs19 name.
		      auto-fill-function
		    auto-fill-hook)
		  (>= (current-column) fill-column))
		 (let ((p (point))
		       bol)
		   (save-excursion
		     (beginning-of-line)
		     (setq bol (point))
		     (goto-char p)
		     (if (search-backward "," bol t)
			 (progn
			   (forward-char 1)
			   (insert "\n   "))))))
	     ;;
	     ;; Update the *BBDB* buffer if desired.
	     (if bbdb-completion-display-record
		 (let ((bbdb-gag-messages t))
		   (bbdb-display-records-1 (list val) t)))
	     (bbdb-complete-name-cleanup)
	     ))
	  ((null completion)
	   (bbdb-complete-name-cleanup)
	   (message "completion for \"%s\" unfound." pattern)
	   (ding))
	  ((not (string= pattern completion))
	   (delete-region beg end)
	   (insert completion)
	   (setq end (point))
	   (let ((last ""))
	     (while (and (stringp completion)
			 (not (string= completion last))
			 (setq last completion
			       pattern (downcase (buffer-substring beg end))
			       completion (try-completion pattern ht pred)))
	       (if (stringp completion)
		   (progn (delete-region beg end)
			  (insert completion))))
	     (bbdb-complete-name beg)
	     ))
	  (t
	   (or (eq (selected-window) (minibuffer-window))
	       (message "Making completion list..."))
	   (let* ((list (all-completions pattern ht pred))
;;		  (recs (delq nil (mapcar (function (lambda (x)
;;					    (symbol-value (intern-soft x ht))))
;;					  list)))
		  )
	     (if (and (not (eq bbdb-completion-type 'net))
		      (= 2 (length list))
		      (eq (symbol-value (intern (car list) ht))
			  (symbol-value (intern (nth 1 list) ht)))
		      (not (string= completion (car list))))
		 (progn
		   (delete-region beg end)
		   (insert (car list))
		   (message " ")
		   (bbdb-complete-name beg))
	       (if (not (get-buffer-window "*Completions*"))
		   (setq bbdb-complete-name-saved-window-config
			 (current-window-configuration)))
	       (with-output-to-temp-buffer "*Completions*"
		 (display-completion-list list))
	       (or (eq (selected-window) (minibuffer-window))
		   (message "Making completion list...done"))))))))

(provide 'bbdb-mb)
