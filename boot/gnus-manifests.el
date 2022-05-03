;;; gnus-manifests.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Configure Gnus and message-mode based on the specified manifests.
** This should become an independent package, where the inputs are
abstract mail service descriptions.
** Relevant Panels:
*** [[file:/bisos/panels/blee-core/mail/model/_nodeBase_/fullUsagePanel-en.org]]
*** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
** Action Plan:
*** TODO Add a b:gnus:manifest|init -- does (setq gnutls-log-lyevel 1) and more.
*** TODO Implement b:gnus:vault/credentials-add
*** DONE Capture expiry and search engine
(nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target \"nnimap+work:[Gmail]/Trash\")
                (nnmail-expiry-wait 'immediate))))
*** TODO Add mbox format ans Gnus source --- test with large exisiting
*** TODO convert setq plists in manifest files to functions.
*** TODO Set gmail as a known resource.
*** TODO convert to a package.
*** DONE [#B] Replace  b:gnus:source:manifest with  b:gnus:resource:manifest
SCHEDULED: <2022-04-29 Fri>
*** DONE Add from Variable Compose Mail Template For F12 c-c
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


;;; (b:gnus:manifest/filesList-add)
(defun b:gnus:manifest/filesList-activate ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (loop-for-each each b:gnus:manifest:filesList
    (b:gnus:manifest/activate each)
    ))


;;; (call-interactively 'b:gnus:manifest/activate)
;;; (load "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/mailService-manifest.el")
;;; (b:gnus:manifest/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/mailService-manifest.el")
;;; (b:gnus:manifest/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/io.gmane.news/gnus-usenetService.el")
;;;
(defun b:gnus:manifest/activate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (load-file <fileName)
  (let*  (
          ($sourceType (plist-get b:gnus:resource:manifest :resource-type))
          ($processed nil)
          )
    (defun $processed () (setq $processed t))
    (when (string= $sourceType "mailService")
      (b:gnus:inMail|configure)
      (b:gnus:outMail|configure)
      (b:gnus:vault/credentials-add)
      ($processed))
    (when (string= $sourceType "usenetService")
      (b:gnus:usenet|configure)
      ($processed))
    (when (not $processed)
       (message (s-lex-format "Unknown sourceType=${$sourceType}")))
    ))

;;; (call-interactively 'b:gnus:manifest/deactivate)
;;; (b:gnus:manifest/deactivate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el")
;;;
(defun b:gnus:manifest/deactivate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (load-file <fileName)
  (let*  (
          ($sourceType (plist-get b:gnus:resource:manifest :resource-type))
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
          ($mailService-name (plist-get b:gnus:resource:manifest :name))
          ($imap-address (plist-get b:gnus:inMail:manifest :imap-address))
          ($imap-port (plist-get b:gnus:inMail:manifest :imap-port))
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
          ($mailService-name (plist-get b:gnus:resource:manifest :name))
          ($submit-from-addr (plist-get b:gnus:outMail:manifest :submit-from-addr))
          ($submit-from-name (plist-get b:gnus:outMail:manifest :submit-from-name))
          ($smtp-address (plist-get b:gnus:outMail:manifest :smtp-address))
          ($user-acct (plist-get b:gnus:outMail:manifest :user-acct))
          ($injection-resource (plist-get b:gnus:outMail:manifest :injection-resource))
          ($expiry-target "nnml:expired")
          ($expiry-wait 7)
          )
    (when (string= $injection-resource "gmail")
      (setq $expiry-target (s-lex-format "nnimap+${$mailService-name}:[Gmail]/Trash"))
      (setq $expiry-wait 'immediate)
      )

    ;;  Optional third arg t=append, puts $mailService-name at the end of the list.
    ;;  Not beginning of the gnus-posting-styles list
    (add-to-list 'gnus-posting-styles
                 (first
	          `(
                    (,$mailService-name   ; Matches Gnus group called $mailService-name
		     (address ,$submit-from-addr)
		     (name ,$submit-from-name)
                     (nnmail-expiry-target ,$expiry-target)
                     (nnmail-expiry-wait ,$expiry-wait)
		     ("X-Message-SMTP-Method"
                      ,(s-lex-format "smtp ${$smtp-address} 587 ${$user-acct}"))
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
          ($source:name (plist-get b:gnus:resource:manifest :name))
          ($nntp-address (plist-get b:gnus:usenet:manifest :nntp-address))
          )
    (setq gnus-select-method `(nntp ,$nntp-address))

    ;;(gnus-server-add-server "nntp" $nntp-address)
    ;;(gnus-server-offline-server (s-lex-format "nntp:${$nntp-address}"))
    ))


(defun b:gnus:vault/credentials-add ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (plist-get b:gnus:resource:manifest :name))
          ($vault-interface  (plist-get b:gnus:resource:manifest :vault-interface))
          )
    ;;
    ;;
    ;;
    "b:gnus:vault/credentials-add NOTYET"))


(provide 'gnus-manifests)

;;; local variables:
;;; no-byte-compile: t
;;; end:

