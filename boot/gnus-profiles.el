;;; gnus-profile.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Configure Gnus and message-mode based on the specified profiles.
** This should become an independent package, where the inputs are
abstract mail service descriptions.
" orgCmntEnd)

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)

(orgCmntBegin "
*      ================ Requires
" orgCmntEnd)

;;(require 'gnus-cite)

;;(setq gnutls-log-level 1)
;; (setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. 	]+\\( \\|$\\)\\|^[\"][\"#'()]")

;;; (b:mail:profile/add)
(defun b:mail:profile/add ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (load-file "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el")
  (b:gnus:inMail|configure)
  (b:gnus:outMail|configure)
  )

(defun b:gnus:inMail|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService:name (plist-get b:gnus:mailService-plist :name))
          ($imap-address (plist-get b:gnus:inmail-plist :imap-address))
          ($imap-port (plist-get b:gnus:inmail-plist :imap-port))
          )
    ;;  Optional third arg t=append, puts $mailService:name at the end of the list.
    (add-to-list 'gnus-secondary-select-methods
		 `(nnimap ,$mailService:name
		          (nnimap-address ,$imap-address)
		          (nnimap-server-port ,$imap-port)
		          (nnimap-stream ssl))
                 t)))


(defun b:gnus:outMail|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService:name (plist-get b:gnus:mailService-plist :name))
          ($submit-from-addr (plist-get b:gnus:outmail-plist :submit-from-addr))
          ($submit-from-name (plist-get b:gnus:outmail-plist :submit-from-name))
          ($user-acct (plist-get b:gnus:outmail-plist :user-acct))
          )
    ;;  Optional third arg t=append, puts $mailService:name at the end of the list.
    ;;  Not beginning of the gnus-posting-styles list.
    (add-to-list 'gnus-posting-styles
                 (first
	          `(
                    (,$mailService:name
		     (address ,$submit-from-addr)
		     (name ,$submit-from-name)
		     ("X-Message-SMTP-Method"
                      ,(s-lex-format "smtp smtp.gmail.com 587 ${$user-acct}"))
                     )
                    ))
                 t)))

(provide 'gnus-profiles)

;;; local variables:
;;; no-byte-compile: t
;;; end:

