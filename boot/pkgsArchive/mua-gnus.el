;;; mua-gnus.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-


(orgCmntBegin "
* Blee Messging Resource: Model And Terminology For Emacs-MUAs
** Emacs-MUAs lack formal model and terminology. This has resulted to chaos.
** b:mrm provides a model and terminoly for use of MUAs and Gnus in particular.
** Think of this as a Meta Emacs-MUA Configuration And Management package.
* Mapping Of Key Abstractions Of Blee-Gnus Model Onto Emacs-Gnus
** As Emacs-Gnus is a large and complex beast.
** Part of that complexity is due to its lack of clear model and terminology.
** This module creates a concise model and terminology on top of Emacs-Gnus.
** We then use this model and terminology of Blee-Gnus to configure Emacs-Gnus.
** We offer this Blee-Gnus Model to Emacs-Gnus developers with some encouragement.
" orgCmntEnd)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* Libre-Halaal Software --- Part Of Blee ---  COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Polymode COMEEGA (Colaborative Org-Mode Enhance Emacs Generalized Authorship)
" orgCmntEnd)
;;; DBLOCK_END

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)


(orgCmntBegin "
* Configure Gnus and message-mode based on the specified abstract MUA.
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
*** DONE [#B] Replace  b:gnus:source:manifest with  b:mrm:resource:manifest
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


(defun b:gnus:mrm:resource|activate ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (let*  (
          ($sourceType (get 'b:mrm:resource:manifest 'resource-type))
          )
    (cond
     ((string= $sourceType "mailService")
      (b:gnus:inMail|configure)
      (b:gnus:outMail|configure)
      (b:gnus:vault/credentials-add))
     ((string= $sourceType "usenetService")
      (b:gnus:usenet|configure))
    (t
     (message (s-lex-format "Unknown sourceType=${$sourceType}"))))
    ))


(defun b:gnus:inMail|configure ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
*** TODO The oppoist of configure is delist --- NOTYET.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (get 'b:mrm:resource:manifest 'name))
          ($imap-address (get 'b:mrm:inMail:manifest 'imap-address))
          ($imap-port (get 'b:mrm:inMail:manifest 'imap-port))
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
          ($mailService-name (get 'b:mrm:resource:manifest 'name))
          ($submit-from-addr (get 'b:mrm:outMail:manifest 'submit-from-addr))
          ($submit-from-name (get 'b:mrm:outMail:manifest 'submit-from-name))
          ($smtp-address (get 'b:mrm:outMail:manifest 'smtp-address))
          ($user-acct (get 'b:mrm:outMail:manifest 'user-acct))
          ($injection-resource (get 'b:mrm:outMail:manifest 'injection-resource))
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
          ($source:name (get 'b:mrm:resource:manifest 'name))
          ($nntp-address (get 'b:mrm:usenet:manifest 'nntp-address))
          )
    (setq gnus-select-method `(nntp ,$nntp-address))

    ;; Initially we may want the service to be offline
    ;;(gnus-server-add-server "nntp" $nntp-address)
    ;;(gnus-server-offline-server (s-lex-format "nntp:${$nntp-address}"))
    ))


(defun b:gnus:vault/credentials-add ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
#+end_org "
  (blee:ann|this-func (compile-time-function-name))
  (let*  (
          ($mailService-name (plist-get b:mrm:resource:manifest :name))
          ($vault-interface  (plist-get b:mrm:resource:manifest :vault-interface))
          )
    ;;
    ;;
    ;;
    "b:gnus:vault/credentials-add NOTYET"))


(provide 'mua-gnus)

;;; local variables:
;;; no-byte-compile: t
;;; end:

