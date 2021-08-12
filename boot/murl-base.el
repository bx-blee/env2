;;
;;
;; Invoked from /usr/local/bin/mozmail.sh as:
;;
;; gnuclient -eval "(progn (murl-pre-hook) (mozmail \"$1\") (murl-post-hook))" 
;; (progn (murl-pre-hook) (mozmail "mailto:mb@example.com") (murl-post-hook))
;;;
;;; See http://my.gnus.org/node/254 for details of how to setup 
;;;

(defun murl-pre-hook ()
  "Mail URL Pre Hook"

  (run-hook-with-args 'a-murl-pre-hook)  
  )

(defun murl-post-hook ()
  "Mail URL Post Hook"

  (run-hook-with-args 'a-murl-post-hook)  
  )

(defun murl-default-pre ()
  "Mail URL Default Pre"
  ;;(interactive)

  (msend-push-stack)
  (message "No action -- Default")
  )

(defun murl-default-post ()
  "Mail URL Default Post"
  ;;(interactive)
  (msend-pop-stack)
  (message "No action -- Default")
  )


(defun murl-default ()
  "Mail URL Default"
  (interactive)

  (setq  a-murl-pre-hook nil)
  (add-hook 'a-murl-pre-hook 'murl-default-pre)

  (setq  a-murl-post-hook nil)
  (add-hook 'a-murl-post-hook 'murl-default-post)

  (murl-default-pre)
  (murl-default-post)
  )

(defun msend-pop-stack ()
  "Pop Back the msend stack"

  (setq message-default-headers "")

  ;; NOTYET, this should be taken back 
  ;; from the msend-push-stack
  (msend-originator-from-line "\
Mohsen Banan-office <office@mohsen.banan.1.byname.net>\
")

  (msend-originator-envelope-addr "\
envelope@mohsen.banan.1.byname.net\
")

  (msend-compose-setup)
  )

(defun msend-push-stack ()
  " push the msend stack"

 (message "NOTYET")
  )

(defun msend-renew-to (addrStr)
  "Re-Write the To Address"
  (interactive "sTo Addr: ")
 (message-goto-to)
 (message-beginning-of-line)
 (kill-entire-line)
 (message-goto-to)
 (insert addrStr)
 )


(defun msend-renew-cc (addrStr)
  "Re-Write the Cc Address"
  (interactive "sCc Addr: ")
 (message-goto-cc)
 (message-beginning-of-line)
 (kill-entire-line)
 (message-goto-cc)
 (insert addrStr)
 )

(defun msend-renew-from (addrStr)
  "Re-Write the From Address"
  (interactive "sFrom Addr: ")
 (message-goto-from)
 (message-beginning-of-line)
 (kill-entire-line)
 (message-goto-from)
 (insert addrStr)
 )

(defun msend-renew-subject (str)
  "Re-Write the Subject"
  (interactive "sSubject: ")
 (message-goto-subject)
 (message-beginning-of-line)
 (kill-entire-line)
 (message-goto-subject)
 (insert str)
 )

(defun msend-compose-mail ()
  "Compose Mail but only if not already"
  (setq gnus-posting-styles nil)
  (if (equal major-mode 'message-mode)
      (message "In message-mode")
    (progn
      (compose-mail)
      (setq message-default-headers "")
      )
    )
  )

;;;
;;; NOTYET,
;;; 
;;;  Mailings Generator scripts should use 
;;;  msend-compose-mail instead of compose mail
;;;  msend-renew-subject and msend extend subject should also
;;;  be used.
;;;
;;;  msend-xxx should detect that it is being originated
;;;  from within message-mode and also check for argument.
;;;  If invokded from within, then build on the existing to: 
;;;  and subject fields.
;;;
;;;  murl-forward-url, uses wget
;;;  murl-iran-news-forward-url
;;;
