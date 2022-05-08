;;; gnus-profile.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Configure Gnus and message-mode based on the specified profiles.
** This should become an independent package, where the inputs are
abstract mail service descriptions.
** Action Plan:
*** TODO Add a b:gnus:profile|init -- does (setq gnutls-log-lyevel 1) and more.
*** TODO Capture expiry and search engine
(nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target \"nnimap+work:[Gmail]/Trash\")
                (nnmail-expiry-wait 'immediate))))
*** TODO Add mbox format ans Gnus source --- test with large exisiting
*** TODO [#B] Replace  b:gnus:source:plist with  b:gnus:source:manifest
SCHEDULED: <2022-04-29 Fri>
*** TODO Add from Variable Compose Mail Template For F12 c-c
" orgCmntEnd)

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)

(orgCmntBegin "
*      ================ Requires
" orgCmntEnd)

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

;;; (gnus-group-browse-foreign-server (quote (nntp "io.gmane.newsne.io")))
;;; (setq smtpmail-debug-info t)
;;; (gnus-server-offline-server "nntp:news.gmane.io")


;;; (b:gnus:profile/filesList-add)
(defun b:gnus:profile/filesList-activate ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (loop-for-each each b:gnus:profile:filesList
    (b:gnus:profile/activate each)
    ))


;;; (call-interactively 'b:gnus:profile/activate)
;;; (b:gnus:profile/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el")
;;; (b:gnus:profile/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/io.gmane.news/gnus-usenetService.el")
;;;
(defun b:gnus:profile/activate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (load-file <fileName)
  (let*  (
          ($sourceType (plist-get b:gnus:source:plist :source-type))
          ($processed nil)
          )
    (defun $processed () (setq $processed t))
    (when (string= $sourceType "mailService")
      (b:gnus:inMail|configure)
      (b:gnus:outMail|configure)
      ($processed))
    (when (string= $sourceType "usenetService")
      (b:gnus:usenet|configure)
      ($processed))
    (when (not $processed)
       (message (s-lex-format "Unknown sourceType=${$sourceType}")))
    ))

;;; (call-interactively 'b:gnus:profile/deactivate)
;;; (b:gnus:profile/deactivate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el")
;;;
(defun b:gnus:profile/deactivate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (load-file <fileName)
  (let*  (
          ($sourceType (plist-get b:gnus:source:plist :source-type))
          ($processed nil)
          )
    (defun $processed () (setq $processed t))
    (when (string= $sourceType "mailService")
      ;;; NOTYET
      ($processed))
    (when (string= $sourceType "usenetService")
      ;;; NOTYET
      ($processed))
    (when (not $processed)
       (message "Unknown sourceType"))
    ))



(defun b:gnus:inMail|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The oppoist of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (plist-get b:gnus:source:plist :name))
          ($imap-address (plist-get b:gnus:inMail:plist :imap-address))
          ($imap-port (plist-get b:gnus:inMail:plist :imap-port))
          )
    ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
    (add-to-list 'gnus-secondary-select-methods
		 `(nnimap ,$mailService-name
		          (nnimap-address ,$imap-address)
		          (nnimap-server-port ,$imap-port)
		          (nnimap-stream ssl))
                 t)))


(defun b:gnus:outMail|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The oppoist of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (plist-get b:gnus:source:plist :name))
          ($submit-from-addr (plist-get b:gnus:outMail:plist :submit-from-addr))
          ($submit-from-name (plist-get b:gnus:outMail:plist :submit-from-name))
          ($ssmtp-address (plist-get b:gnus:outMail:plist :ssmtp-address))
          ($user-acct (plist-get b:gnus:outMail:plist :user-acct))
          )
    ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
    ;;  Not beginning of the gnus-posting-styles list.
    (add-to-list 'gnus-posting-styles
                 (first
	          `(
                    (,$mailService-name
		     (address ,$submit-from-addr)
		     (name ,$submit-from-name)
		     ("X-Message-SMTP-Method"
                      ,(s-lex-format "smtp ${$ssmtp-address} 587 ${$user-acct}"))
                     )
                    ))
                 t)))


;;; (load-file "/bxo/iso/piu_mbFullUsage/profiles/gnus/io.gmane.news/gnus-usenetService.el")
;;; (b:gnus:usenet|configure)
;;;  (gnus-server-add-server "nntp" "news.gmane.io")
;;;
(defun b:gnus:usenet|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The oppoist of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($source:name (plist-get b:gnus:source:plist :name))
          ($nntp-address (plist-get b:gnus:usenet:manifest :nntp-address))
          )
    (setq gnus-select-method `(nntp ,$nntp-address))

    ;;(gnus-server-add-server "nntp" $nntp-address)
    ;;(gnus-server-offline-server (s-lex-format "nntp:${$nntp-address}"))
    ))



(provide 'gnus-profiles)

;;; local variables:
;;; no-byte-compile: t
;;; end:

