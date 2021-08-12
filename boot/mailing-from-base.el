;;; See
;;; /libre/ByStar/InitialTemplates/activeDocs/blee/mailCompose/mailings/fullUsagePanel-en.org
;;; For Documentation
;;;
;;; message-send-actions
;;; message-send-mail-hook
;;;

(add-hook 'message-send-hook 'bxms-mailing-log-hook)

;;(autoload 'time-stamp "time-stamp" t)
(load "time-stamp")

(defun bxms-mailing-log-hook ()
  ""
   (let* (
	  (thisMailingName)
	  (address-parsed)
	  (headerline-from-name)
	  (headerline-from-addr)
	  (headerline-to-name)
	  (headerline-to-addr)
	  (headerline-mailingName)
	  (headerline-mailingDoc)	  
	  (headerline-mailingMethod)
	  )
     (setq bxms:mailing:log:dirName (expand-file-name "~/BUE/mailings/logs"))
     (setq bxms:mailing:log:fileName (concat bxms:mailing:log:dirName "/mailings.sent"))

     ;;(setq headerline-from (bx:mail:header:field:here-get 'from))
     ;;(setq parsedAddr (ietf-drums-parse-address "'foo' <foo@example.com>"))

     (setq address-parsed (ietf-drums-parse-address (bx:mail:header:field:here-get 'from)))
     (setq headerline-from-name (cdr address-parsed))
     (setq headerline-from-addr (car address-parsed))

     (setq address-parsed (ietf-drums-parse-address (bx:mail:header:field:here-get 'to)))
     (setq headerline-to-name (cdr address-parsed))
     (setq headerline-to-addr (car address-parsed))

     (setq headerline-mailingName (bx:mail:header:field:here-get 'x-mailingname)) 
     (setq headerline-mailingDoc (bx:mail:header:field:here-get 'x-mailingdoc))        
     (setq headerline-mailingMethod (bx:mail:header:field:here-get 'x-mailingmethod))    

     (save-excursion 
       (setq bxms:mailing:log:output-buffer (find-file bxms:mailing:log:fileName))
       (set-buffer bxms:mailing:log:output-buffer)
       (setq buffer-read-only nil)
       (goto-char (point-max))
       (setq time-stamp-format "%Y%02m%02d%02H%02M%02S")
       ;;;
       ;;;
       (insert 
	(format "%s:%s:%s:%s:%s:%s:%s:%s:%s\n" 
		(time-stamp-string) 
		headerline-mailingName      ;;; X-MailingName:
		headerline-mailingDoc       ;;; X-MailingDoc:		
		headerline-to-name
		headerline-to-addr
		headerline-from-name
		headerline-from-addr
		headerline-mailingMethod    ;;; X-MailingMethod
		(system-name)
		(user-login-name) 
		)
	)

       (save-buffer)
       )
     (save-buffer)
     (kill-buffer bxms:mailing:log:output-buffer)
     )
   )



(defun bxms-compose-from-base-to-blank (mailing-base-dir)
  ""
   (let* (
	  (thisMailingName)
	  )
 
     (save-excursion 
       (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
       (funcall (intern (concat "bxms-compose-" thisMailingName)) 1)
       (bxms-mailing-log mailing-base-dir)
       )
     ))

(defun bxms-batch-from-base-to-to (mailing-base-dir)
  ""
   (let* (
	  (thisMailingName)
	  )
 
     (save-excursion 
       (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
       (funcall (intern (concat "bxms-batch-" thisMailingName)) 1)
       )
     ))

;;; (message (bx:mail:header:field:here-get 'from))
(defun bx:mail:header:field:here-get (header-name)
  "RETURNS Specified Header as a string"
  (interactive)
  (let* (
      (this-string)
      (hdr-alist)
      )
    (save-excursion 
      (goto-char (point-min))
      (setq hdr-alist (mail-header-extract-no-properties))
      ;;(setq this-string (or (cdr (assq header-name hdr-alist)) ""))
      (setq this-string (mail-header header-name hdr-alist))
      )
      this-string
    )
  )


;;; (message (bx:mail:header:field:get-from-file 'x-envelope "/acct/employee/lsipusr/BUE/mailings/bystar/announce/generalColabInvitation/content.mail"))
;;; (message (bx:mail:header:field:get-from-file 'from "/acct/employee/lsipusr/BUE/mailings/bystar/announce/generalColabInvitation/content.mail"))
(defun bx:mail:header:field:get-from-file (header-name mail-file)
  "RETURNS Specified Header as a string"
  (interactive)
  (let* (
      (this-buffer)
      (this-string)
      (hdr-alist)
      )
    (save-excursion
      ;; NOTYET, if the buffer of file exists, we should not open and close it
      (setq this-buffer (find-file mail-file))
      (setq this-string (bx:mail:header:field:get-from-buffer header-name this-buffer))
      (kill-buffer this-buffer)
      )
    this-string
    ))
  

;;; (message (bx:mail:header:field:get-from-buffer 'x-mailingparams (find-file "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")))
(defun bx:mail:header:field:get-from-buffer (header-name mail-buffer)
  "RETURNS Specified Header as a string"
  (let* (
      (this-buffer)
      (this-string)
      (hdr-alist)
      )
    (save-excursion 
      (setq this-buffer mail-buffer)
      (goto-char (point-min))
      (setq hdr-alist (mail-header-extract-no-properties))
      ;;(setq this-string (or (cdr (assq header-name hdr-alist)) ""))
      (setq this-string (mail-header header-name hdr-alist))
      )
    this-string
    )
  )



;;; (message (bx:mail:body:get-from-file "/acct/employee/lsipusr/BUE/mailings/bystar/announce/generalColabInvitation/content.mail"))
(defun bx:mail:body:get-from-file (mail-file)
  "RETURNS Body as a string"
  (interactive)
  (let* (
      (this-buffer)
      (this-string)
      (start-point)
      )
    (save-excursion 
      (setq this-buffer (find-file mail-file))
      (goto-char (point-min))
      (re-search-forward "--text follows this line--" nil t)
      (forward-char)
      (setq start-point (point))
      (setq this-string (buffer-substring start-point (point-max)))
      (kill-buffer this-buffer)
      )
    this-string
    )
  )

(defun bx:mail:body:get-from-buffer-then-erase ()
  "RETURNS Body as a string -- then erases"
  (interactive)
  (let* (
      (this-buffer)
      (this-string)
      (start-point)
      )
    (save-excursion 
      (message-goto-body)
      (if 
	  (search-forward 
	   "http:" 
	   nil 
	   'NO-ERROR) ;; t)
	  (progn
	    (beginning-of-line 1)
	    (setq this-string (ksh-line-to-string))
	    (kill-entire-line)
	    )
	)
      )
    this-string
    )
  )

(defun bx:mail:body:process-body-string (body-string)
    (goto-char (point-min))
       
    (search-forward "<body" nil t)
    ;;(beginning-of-line 1)
    (forward-line 1)

    (insert (format 
"

<p>
This is in Reference-To: <a href=\"%s\">%s</a>
</p>

"
body-string
body-string
)
	    )
    )

(defun bx:mail:body:from-base:insert-body (mailing-base-dir)
  ""
    (message-goto-body)
    (insert
     (bx:mail:body:get-from-file
      (concat mailing-base-dir "/content.mail"))
     )
    )

(defun bx:mail:header:from-base:add-all-default (mailing-base-dir)
  ""
  (bx:mail:header:from-base:add-from mailing-base-dir)
  (bx:mail:header:from-base:add-envelope mailing-base-dir)
  (bx:mail:header:from-base:add-x-envelope mailing-base-dir)
  (bx:mail:header:from-base:add-x-mailingname mailing-base-dir)
  (bx:mail:header:from-base:add-x-mailingdoc mailing-base-dir)  
  (bx:mail:header:from-base:add-x-mailingparams mailing-base-dir)  
  )

(defun bx:mail:header:from-base:add-all-goto (mailing-base-dir)
  ""
  (bx:mail:header:from-base:add-subject mailing-base-dir)
  (bx:mail:header:from-base:add-to mailing-base-dir)
  (bx:mail:header:from-base:add-cc mailing-base-dir)
  (bx:mail:header:from-base:add-bcc mailing-base-dir)
  )


(defun bx:mail:header:from-base:add-from (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'from
	   (concat mailing-base-dir "/content.mail")))

    (msend-originator-from-line header-line)
    )
  )


(defun bx:mail:header:from-base:add-envelope (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'x-envelope
	   (concat mailing-base-dir "/content.mail")))

    (msend-originator-envelope-addr header-line)
    )
  )

(defun bx:mail:header:from-base:add-subject (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'subject
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (message-goto-subject)
	  (insert header-line)
	  ))
    )
  )


(defun bx:mail:header:from-base:add-to (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'to
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (message-goto-to)
	  (insert header-line)
	  ))
    )
  )


(defun bx:mail:header:from-base:add-cc (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'cc
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (message-goto-cc)
	  (insert header-line)
	  ))
    )
  )


(defun bx:mail:header:from-base:add-bcc (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'bcc
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (message-goto-bcc)
	  (insert header-line)
	  ))
    )
  )


(defun bx:mail:header:from-base:add-x-envelope (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'x-envelope
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (setq message-default-headers
		(concat message-default-headers
			(format "X-Envelope: %s\n" header-line)))
	  ))
    )
  )


(defun bx:mail:header:from-base:add-x-mailingname (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'x-mailingname
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (setq message-default-headers
		(concat message-default-headers
			(format "X-MailingName: %s\n" header-line)))
	  ))
    )
  )

(defun bx:mail:header:from-base:add-x-mailingdoc (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'x-mailingdoc
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (setq message-default-headers
		(concat message-default-headers
			(format "X-MailingDoc: %s\n" header-line)))
	  ))
    )
  )



(defun bx:mail:header:from-base:add-x-mailingparams (mailing-base-dir)
  ""
  (let* (
	 (header-line)
	 )

    (setq header-line 
	  (bx:mail:header:field:get-from-file 
	   'x-mailingparams
	   (concat mailing-base-dir "/content.mail")))
    (if header-line 
	(progn
	  (setq message-default-headers
		(concat message-default-headers
			(format "X-MailingParams: %s\n" header-line)))
	  ))
    )
  )



(defun bx:mail:header:add-x-mailingMethod (mailing-method)
  ""
  (setq message-default-headers
	(concat message-default-headers
		(format "X-MailingMethod: %s\n" mailing-method)))
  )


(defun bxms-compose-from-base (mailing-base-dir n)
  " "
  (interactive "p")
  (let* (
	 (initial-major-mode)
	 )

    (setq initial-major-mode major-mode)

    (setq message-default-headers "")
    
    (bx:mail:header:from-base:add-all-default mailing-base-dir)
    
    (bx:mail:header:add-x-mailingMethod "msend")

    (msend-compose-setup)

    (message (format "Arg=%d " n))
    
    ;;(progn (message (format "Arg=%d " n)) (sleep-for 3))

    ;; With arg 5, just setup the envelope and from permanently
    ;;
    (if (not (eq n 5))
	(msend-compose-mail))

    (cond 
     ((eq n 1)
      ;; With no args in interactive you get 1
      ;; Assume Blank Message
      ;; Appends to Subject
      ;; Appends to Body
      (if (eq initial-major-mode 'message-mode)
	  (progn
	    (message "In Message Mode -- Assuming blank message")
	    ;; (sleep-for 3)
	    ;; Redo Subject
	    ;; Redo-From
	    ;; Redo-Envelope
	    (message-goto-subject)
	    (insert " -- ")
	    ))

      (bx:mail:header:from-base:add-subject mailing-base-dir)
      (bx:mail:header:from-base:add-to mailing-base-dir)
      (bx:mail:header:from-base:add-cc mailing-base-dir)
      (bx:mail:header:from-base:add-bcc mailing-base-dir)

      (setq default-directory mailing-base-dir)
	    
      )
     ((eq n 4)
      ;; With Ctl-u arg in interactive you get 4
      ;; Assume unwanted Message
      ;; Clears Subject -- Appends to Subject
      ;; Clears Body -- Appends to Body 
      (if (eq initial-major-mode 'message-mode)
	  (progn
	    (message "In Message Mode -- Assuming message to overwrite")
	    ;;(sleep-for 3)
	    (msend-renew-subject "")
	    (save-excursion (kill-region (message-goto-body) (point-max)))
	    ))

      ;; NOTYET, Re-Doing The From: Line Is Not Working Right.
      ;;(bx:mail:header:from-base:add-all-default mailing-base-dir)

      (bx:mail:header:from-base:add-cc mailing-base-dir)
      (bx:mail:header:from-base:add-subject mailing-base-dir)
      (bx:mail:header:from-base:add-bcc mailing-base-dir)
      (bx:mail:header:from-base:add-to mailing-base-dir)

       )
     ((eq n 2)
      ;; With Ctl-u 2 arg in interactive you get 2
      ;; Assume unwanted Message
      ;; Appends to Subject
      ;; Clears Body -- Appends to Body 
      (if (eq initial-major-mode 'message-mode)
	  (progn
	    (message "In Message Mode -- Assuming message to append")
	    ;;(sleep-for 3)
	    (message-goto-subject)
	    (insert " -- ")
	    (save-excursion (kill-region (message-goto-body) (point-max)))
	    ))

      (bx:mail:header:from-base:add-subject mailing-base-dir)
      )
     )

    (if (not (eq n 5))
	(progn
	  (bx:mail:body:from-base:insert-body mailing-base-dir)
	  (message-goto-to)
	  )
      )

    ;; (if (not (eq n 5))
    ;; 	(progn
    ;; 	  (bx:mail:header:from-base:add-to mailing-base-dir)
    ;; 	  )
    ;;   )

    )
  )


(defun bxms-bbdb-compose-from-base (mailing-base-dir records) 
  ""
   (let* (
	  (name (bbdb-record-name (car records)))
	  (net (bbdb-record-net (car records)))
	  (primary-net (car net))
	  (thisMailingName)
	  )
 
     (if (null primary-net)
	 (message "Skipping name")
       (save-excursion 
	 (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (setq thisMailingSpecificName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (funcall (intern (concat "bxms-compose-" thisMailingName)) 1)
	 (message-goto-to)
	 (insert (format "\"%s\" <%s>" name  primary-net))	 
	 )
       ;; (bbdb-log-msend records 
       ;; 		       thisMailingName 
       ;; 		       thisMailingSpecificName 
       ;; 		       msend-this-from-line)
       )))


(defun bbdb-mall-from-base (mailing-base-dir records) 
  ""
   (let* (
	  (name (bbdb-record-name (car records)))
	  (net (bbdb-record-net (car records)))
	  (primary-net (car net))
	  (thisMailingName)
	  )
 
     (if (null primary-net)
	 (message "Skipping name")
       (save-excursion 
	 (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (setq thisMailingSpecificName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (funcall (intern (concat "bxms-compose-" thisMailingName)) 1)
	 (message-goto-to)
	 (bbdb-yank-addresses)
	 )
       ;; (bbdb-log-msend records
       ;; 		       thisMailingName
       ;; 		       thisMailingSpecificName
       ;; 		       msend-this-from-line)
       )))




(defun bxms-bbdb-batch-from-base (mailing-base-dir records) 
  ""
   (let* (
	  (name (bbdb-record-name (car records)))
	  (net (bbdb-record-net (car records)))
	  (primary-net (car net))
	  (thisMailingName)
	  )
 
     (if (null primary-net)
	 (message "Skipping name")
       (save-excursion 
	 (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (setq thisMailingSpecificName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
	 (funcall (intern (concat "bxms-compose-" thisMailingName)) 1)
	 (message-goto-to)
	 (insert (format "\"%s\" <%s>" name  primary-net))
	 
	 (msend-mail-and-exit)
	 
	 (message (format "Mail Sent To: \"%s\" <%s>" name  primary-net))
	 )
       ;; (bbdb-log-msend records
       ;; 		       thisMailingName
       ;; 		       thisMailingSpecificName
       ;; 		       msend-this-from-line)
       )))


(defun bx-murl-from-base-pre (mailing-base-dir)
  ""
  (let* (
	 (unused-var)
	 )
    (setq message-default-headers "")
    
    (bx:mail:header:from-base:add-all-default mailing-base-dir)
    
    (bx:mail:header:add-x-mailingMethod "mmailto")

    (msend-compose-setup)
    )
  )

(defun bx-murl-from-base-post (mailing-base-dir)
  ""
  (let* (
	 (body-string)
	 )
    ;;
    ;;(msend-compose-mail)  -- Happens in mozmail in between pre and post
    ;;

    ;;
    ;; Puts the template subject 
    ;;
    (message-goto-subject)
    (message-beginning-of-line)
    (insert " -- ")
    (message-beginning-of-line)
    (insert 
	    (bx:mail:header:field:get-from-file 
	     'subject
	     (concat mailing-base-dir "/content.mail")))

    (bx:mail:header:from-base:add-to mailing-base-dir)
    (bx:mail:header:from-base:add-cc mailing-base-dir)
    (bx:mail:header:from-base:add-bcc mailing-base-dir)

    (setq body-string (bx:mail:body:get-from-buffer-then-erase))

    (bx:mail:body:from-base:insert-body mailing-base-dir)

    (bx:mail:body:process-body-string body-string)

    (message-goto-to)
    )
  )

;;;
;;;
;;;

(defun bx-mmailto-from-base-pre (mailing-base-dir)
  ""
  (let* (
	 (unused-var)
	 )
    (setq message-default-headers "")
    
    (bx:mail:header:from-base:add-all-default mailing-base-dir)
    
    (bx:mail:header:add-x-mailingMethod "mmailto")

    (msend-compose-setup)
    )
  )

(defun bx-mmailto-from-base-post (mailing-base-dir)
  ""
  (let* (
	 (body-string)
	 )
    ;;
    (msend-compose-mail) ;; -- Happens in mozmail in between pre and post
    ;;

    (bx:mail:header:from-base:add-all-goto mailing-base-dir)

    (setq body-string (bx:mail:body:get-from-buffer-then-erase))

    (bx:mail:body:from-base:insert-body mailing-base-dir)

    (bx:mail:body:process-body-string body-string)

    (message-goto-to)
    )
  )


;;;
;;;

(defun  bx:mailing:mailingName (mailing-base-dir) 
  ""
  (eoe-read-from-file (concat mailing-base-dir "/mailingName"))
  )


(defun bx:mailing:bbdb:compose (mailing-base-dir n)
  ""
  (interactive "")
  (let* (
	 (this-bbdb-records)
	 (this-exec-for-each)
	 )

    (setq  this-exec-for-each 
	   (concat "bxms:bbdb:compose:" 
		   (bx:mailing:mailingName mailing-base-dir)))

    (save-excursion 
      (switch-to-buffer "*BBDB*")
    
      (cond 
       ((eq n 1)
	;; With no args in interactive you get 1
	 (funcall (intern this-exec-for-each) (list (bbdb-current-record)))
	)
       ((eq n 4)
	;; With Ctl-u arg in interactive you get 4
	(setq this-bbdb-records (mapcar 'car bbdb-records))

	(let (
	      (records this-bbdb-records)
	      )
	  (while records
	    (save-excursion
	      (funcall (intern this-exec-for-each) records)
	      )
	    
	    (setq records (cdr records))
	    )
	  )
	)
       ( t
	 (message "Unexpected Arg")
	 )
       )
      )
    )
  )


(defun bx:mailing:bbdb:batch (mailing-base-dir n)
  ""
  (interactive "")
  (let* (
	 (this-bbdb-records)
	 (this-exec-for-each)
	 )

    (setq  this-exec-for-each 
	   (concat "bxms:bbdb:batch:" 
		   (bx:mailing:mailingName mailing-base-dir)))

    (save-excursion 
      (switch-to-buffer "*BBDB*")
    
      (cond 
       ((eq n 1)
	;; With no args in interactive you get 1
	 (funcall (intern this-exec-for-each) (list (bbdb-current-record)))
	)
       ((eq n 4)
	;; With Ctl-u arg in interactive you get 4
	(setq this-bbdb-records (mapcar 'car bbdb-records))

	(let (
	      (records this-bbdb-records)
	      )
	  (while records
	    (save-excursion
	      (funcall (intern this-exec-for-each) records)
	      )
	    
	    (setq records (cdr records))
	    )
	  )
	)
       ( t
	 (message "Unexpected Arg")
	 )
       )
      )
    )
  )

(defun bx:mailing:bbdb:toall (mailing-base-dir n)
  ""
  (interactive "")
  (let* (
	 (this-bbdb-records)
	 (this-exec-for-each)
	 )

    (setq  this-exec-for-each 
	   (concat "bxms:bbdb:toall:" 
		   (bx:mailing:mailingName mailing-base-dir)))

    (save-excursion 
      (switch-to-buffer "*BBDB*")
    
      (cond 
       ((eq n 1)
	;; With no args in interactive you get 1
	 (funcall (intern this-exec-for-each) (list (bbdb-current-record)))
	)
       ( t
	 (message "Unexpected Arg")
	 )
       )
      )
    )
  )

 
(defun bx-bbdb-names-input-from-file (names-file)
  "Used by emacs-client -- Sets Up the BBDB buffer based on names-file"
  (interactive)
  (let* (
      (this-buffer)
      )
    (save-excursion 
      (setq this-buffer (find-file names-file))
      (goto-char (point-min))
      (bbdb-names-input)
      (switch-to-buffer "*BBDB*")
      (delete-other-windows)
      )
    )
  )

(defun bxms-mailing-log (mailing-base-dir &optional records)
  ""
  )



(defun bxms-mailing-logO2 (mailing-base-dir &optional records)
  ""
   (let* (
	  (thisMailingName)
	  )
     (setq bxms:mailing:log:dirName (expand-file-name "~/BUE/mailings/logs"))
     (setq bxms:mailing:log:fileName (concat bxms:mailing:log:dirName "/mailings.sent"))
     (setq bxms:mailing:log:output-buffer (find-file bxms:mailing:log:fileName))
     
     (save-excursion 
       (set-buffer bxms:mailing:log:output-buffer)
       (setq buffer-read-only nil)
       (goto-char (point-max))
       (setq time-stamp-format "%02y%02m%02d%02H%02M%02S")
       ;;(insert (format "%s:%s:%s\n" (time-stamp-string) (user-login-name) (system-name)))
       ;;(insert (format "%s:%s:%s:%s:%s:%s:%s:%s\n" content-name name primary-net (time-stamp-string) content-specific-name from-addr (user-login-name) (system-name)))
       )
     (save-buffer)
     (kill-buffer bxms:mailing:log:output-buffer)
     )
   )



(defun bxms-mailing-logObsolete (mailing-base-dir &optional records)
  ""
   (let* (
	  (thisMailingName)
	  )
     (setq bxms:mailing:log:dirName (expand-file-name "~/BUE/mailings/logs"))
     (setq bxms:mailing:log:fileName (concat bxms:mailing:log:dirName "/mailings.sent"))
     (setq bxms:mailing:log:output-buffer (find-file bxms:mailing:log:fileName))
     
     (save-excursion 
       (set-buffer bxms:mailing:log:output-buffer)
       (setq buffer-read-only nil)
       (goto-char (point-max))
       (setq time-stamp-format "%02y%02m%02d%02H%02M%02S")
       
       (if records
	   (let* (
		  (name (bbdb-record-name (car records)))
		  (net (bbdb-record-net (car records)))
		  (primary-net (car net))
		  )
	   
	     (if (null primary-net)
		 (progn
		   (insert (format "#"))
		   (message "Skiped name")))

	     (insert (format "%s:%s:%s:%s:%s:%s:%s:%s\n" content-name name primary-net (time-stamp-string) content-specific-name from-addr (user-login-name) (system-name))))
	 (progn
	   (insert (format "%s:%s:%s:%s:%s:%s:%s:%s\n" content-name name primary-net (time-stamp-string) content-specific-name from-addr (user-login-name) (system-name)))
	   )
	 )
       (save-buffer)
       (kill-buffer bxms:mailing:log:output-buffer)
       )
     ))


     ;; (save-excursion 
     ;;   (setq thisMailingName (eoe-read-from-file (concat mailing-base-dir "/mailingName")))
     ;;   (funcall (intern (concat "bxms-compose-" thisMailingName)) 1)
     ;;   )
     ;; ))



(provide 'mailing-from-base)
