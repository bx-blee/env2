;;; bmr-model.el --- Blee Messging Resource Model (b:mrm)  --*- lexical-binding: t; -*-

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
* /Plugins:/ MUAs --- Providers Modules --- Method Modules --- Manifest Files
** Method File Names: bmr-method-inject-xxx.el --- [[bmr-method-inject-qmail.el]]
** Map-to-MUA File Names:  mua-xxx.el --- [[mua-gnus.el]]
** Provider File Names: bmr-prov-{mail,news}-xxx.el  --- [[bmr-prov-mail-gmail.el]]
** Manifest File Names: bmr-manifest-xxx.el  --- [[bmr-manifest-example.el]]
" orgCmntEnd)

(orgCmntBegin "
* Relevant Panels:
** [[file:/bisos/panels/blee-core/mail/model/_nodeBase_/fullUsagePanel-en.org]]
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
" orgCmntEnd)

(orgCmntBegin "
*   ~Requires~
" orgCmntEnd)

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

(orgCmntBegin "
*   ~Implementation Declarations~
" orgCmntEnd)

(defvar b:mrm:resource:manifest "SymbolPlistType"
  " #+begin_org
  ** =b:mrm:resource:manifest= is the top level symbol-plist used to capture the resource.
#+end_org "
  )

(defvar b:mrm:outMail:manifest "SymbolPlistType"
  " #+begin_org
  ** =b:mrm:outMail:manifest= is the symbol-plist used to capture outMail parameters.
#+end_org "
  )

(defvar b:mrm:inMail:manifest "SymbolPlistType"
  " #+begin_org
  ** =b:mrm:inMail:manifest= is the symbol-plist used to capture inMail paraemters.
#+end_org "
  )

;;;  (b:remprop-all 'b:mrm:resource:manifest)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* defun <<b:remprop-all>>  [[start-stop debugger menu]]
" orgCmntEnd)
(defun b:remprop-all (
;;; DBLOCK_END
                      <symbol
                      )
    " #+begin_org
** DocStr: Walk through ~<symbol~'s property list and remove them all. Returns nil.
#+end_org "
      (let*  (
              ($plist (symbol-plist <symbol))
              )
        (dolist ($each $plist)
          (cl-remprop <symbol $each)
          (pop $plist) ;;; ignoring the value
          )))

(orgCmntBegin "
* /Concept:/ <<b:mrm Messaging Resources>>
**  A =b:mrm Messaging Resource= consists of one of or both of:
**  - A Retrievables Messaging Resource  (Credentialed or Open)
**  - A Injection Messaging Resource  (Credentialed or Open)
** [[b:mrm:resource|define]] function is used to define a [[b:mrm:resource]]
" orgCmntEnd)

;;; (b:mrm:resource|define)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:resource|define>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:resource|define (
;;; DBLOCK_END
                                  &key
                                  (name "")
                                  (resource-type nil)
                                  (map-to-mua nil)
                                  (retrievablesResource-spec nil)
                                  (injectionResource-spec nil)
                                  (vault-interface nil)
                                  )
    " #+begin_org
** DocStr: Define a b:mrm:resource based on the specified keyword args.
~name~  is used to specify a unique resource name.
~map-to-mua~ specifies which MUA the MRM should map to. One of
~resource-type~ is one of [[b:mrm:resource::types]].
~retrievablesResource-spec~ is a function that uses [[funcName]] to specify retrievablesResource.
~injectionResource-spec~ is a function that uses [[funcName]] to specify retrievablesResource.
~vault-interface~ specifies which vault interface should be used.
** Implementation Status: *Needs Improvements*
*** TODO Validate input sources based on enumerations.
#+end_org "

   ;; Remove all existing properties --- Start with a fresh b:mrm:resource:manifest
   (b:remprop-all 'b:mrm:resource:manifest)

   (when name
     (put 'b:mrm:resource:manifest 'name name))
   (when resource-type
    (put 'b:mrm:resource:manifest 'resource-type resource-type))
   (when map-to-mua
     (put 'b:mrm:resource:manifest 'map-to-mua map-to-mua))
   (when retrievablesResource-spec
     (funcall retrievablesResource-spec))
   (when injectionResource-spec
     (funcall injectionResource-spec))
   (when vault-interface
     (put 'b:mrm:resource:manifest 'vault-interface vault-interface))

   ;;; Now with b:mrm:resource:manifest fully formed, call
   (b:mrm:resource|map-to-mua)
  )

(orgCmntBegin "
* defconst <<b:mrm::map-to-muas>>
" orgCmntEnd)
(defconst
  b:mrm::map-to-muas
  `(
    gnus "gnus"
    )
  " #+begin_org
  ** Enumeration of currently supported MUAs. More to come.
#+end_org "
)


(orgCmntBegin "
* defconst <<b:mrm:resource::types>>
" orgCmntEnd)
(defconst
  b:mrm:resource::types
  `(
    mailService "mailService"  ; both inMail and outMail
    mailRetrievalService "mailRetrievalService"  ; inMail
    mailInjectionService "mailInjectionService"  ; outMail
    usenetService "usenetService"
    mbox "mbox"
    )
  " #+begin_org
  ** Enumeration of b:mrm:resource types.
#+end_org "
)


(orgCmntBegin "
* defconst <<b:mrm::vaultInterfaces>>
" orgCmntEnd)
(defconst
  b:mrm::vaultInterfaces
  `(
    secretService "secretService"
    authinfo "authinfo"
    authinfo.pgp "authinfo.pgp"
    none "none"
    )
  " #+begin_org
  ** Enumeration of vault types.
#+end_org "
)


(orgCmntBegin "
* /Concept:/ <<b:mrm Messaging-Resource Providers>>
**  A =b:mrm Messaging-Resource Provider= is one of:
** 1) A Retrievables Messaging-Resource Provider --- Examples: imap.gmail.com, news.gmane.io, A mail folder, A mbox
** 2) A Injection Messaging-Resource Provider --- Examples: smpt.gmail.com
** A Messaging-Resource Provider specifies parameters for access to Messaging Services.
** Messaging-Resource Providers do not include credentials but include all other access parameters.
** There is a library of known Messaging-Resource Providers from which you can import.
** You should create your own for use in  [[b:mrm Retrievables Specifications]] and [[b:mrm Injection Specifications]]
** Resource provider files are typically like: [[file:gnus-resource-provider-gmail.el]]
" orgCmntEnd)

(orgCmntBegin "
* /Concept:/ <<b:mrm Messaging-Resource Methods>>
**  =b:mrm Messaging-Resource Methods= are the machinaries through which [[b:mrm Messaging-Resource Providers]] are accessed.
**  List of available Retrievables Methods are in:  [[b:mrm:retrievables::methods]].
**  List of available Injection Methods are in: [[b:mrm:injection::methods]].
" orgCmntEnd)


(orgCmntBegin "
* defconst <<b:mrm:retrievables:methods>>
" orgCmntEnd)
(defconst
  b:mrm:retrievables::methods
      `(
        :nnimap "nnimap"
        :nntp "nntp"
        )
  " #+begin_org
  ** Enumeration of retrievables methods.
#+end_org "
  )

(defconst
  b:mrm:injection::methods
  `(
    :smtpmail "smtpmail"  ; synchronous elisp lib
    :sendmail "sendmail"  ; common unix interface
    :qmail-inject "qmail-inject"
    :nntp "nntp"
    )
  " #+begin_org
  ** Enumeration of retrievables methods.
#+end_org "
  )


(orgCmntBegin "
* /Concept:/ <<b:mrm Retrievables Specifications>>
**  A b:mrm Retrievables Specifications augments [[b:mrm Messaging-Resource Providers]] with credentials.
** For Mail, [[b:mrm:retrievablesResource:mail|define]] can be used.
" orgCmntEnd)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:retrievablesResource:mail|define>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:retrievablesResource:mail|define (
;;; DBLOCK_END
                                                &key
                                                (user-acct nil)
                                                (acct-passwd nil)
                                                (retrievablesResource-method nil)
                                                (retrievablesResource-provider nil)
                                                )
  " #+begin_org
** DocStr: Define a b:mrm:resource based on the specified keyword args.
#+end_org "

  ;; Remove all existing properties --- Start with a fresh b:mrm:resource:manifest
  (b:remprop-all 'b:mrm:inMail:manifest)

  (when user-acct
    (put 'b:mrm:inMail:manifest 'user-acct user-acct))
  (when acct-passwd
    (put 'b:mrm:inMail:manifest 'acct-passwd acct-passwd))
  (when retrievablesResource-method
    (put 'b:mrm:inMail:manifest 'retrievablesResource-method retrievablesResource-method))
  (when retrievablesResource-provider
    (funcall retrievablesResource-provider))
  )



;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:retrievablesResource:usenet|define>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:retrievablesResource:usenet|define (
;;; DBLOCK_END
                                                &key
                                                (retrievablesResource-method nil)
                                                (retrievablesResource-provider nil)
                                                )
  " #+begin_org
** DocStr: Define a b:mrm:resource based on the specified keyword args.
#+end_org "

  ;; Remove all existing properties --- Start with a fresh b:mrm:resource:manifest
  (b:remprop-all 'b:mrm:usenet:manifest)

  (when retrievablesResource-method
    (put 'b:mrm:usenet:manifest 'retrievablesResource-method retrievablesResource-method))
  (when retrievablesResource-provider
    (funcall retrievablesResource-provider))
  )


(orgCmntBegin "
* /Concept:/ <<b:mrm Injection Specifications>>
**  A b:mrm Retrievables Specifications augments [[b:mrm Messaging-Resource Providers]] with credentials.
** For Mail, [[b:mrm:injectionResource:mail|define]] can be used.
" orgCmntEnd)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:injectionResource:mail|define>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:injectionResource:mail|define (
;;; DBLOCK_END
                                                &key
                                                (user-acct nil)
                                                (acct-passwd nil)
                                                (injectionResource-method nil)
                                                (injectionResource-provider nil)
                                                )
  " #+begin_org
** DocStr: Define a b:mrm:resource based on the specified keyword args.
#+end_org "

  ;; Remove all existing properties --- Start with a fresh b:mrm:resource:manifest
  (b:remprop-all ':mrm:outMail:manifest)

  (when user-acct
    (put 'b:mrm:outMail:manifest 'user-acct user-acct))
  (when acct-passwd
    (put 'b:mrm:outMail:manifest 'acct-passwd acct-passwd))
  (when injectionResource-method
    (put 'b:mrm:outMail:manifest 'injectionResource-method injectionResource-method))
  (when injectionResource-provider
    (funcall injectionResource-provider))
  )


(orgCmntBegin "
* /Concept:/ <<b:mrm Resource Manifests>>
** Messaging Resource Manifests are complete specifications of [[b:mrm Messaging Resources]].
** This is accomplished through conveyance of all parameters with invocation of [[b:mrm:resource|define]].
" orgCmntEnd)

(orgCmntBegin "
* /Examples:/ <<b:mrm Resource Manifest Examples>>
** Let's say that you have a gmail account called 'example.home' and you wanted to use Gnus to read your email.
#+BEGIN_SRC emacs-lisp

(b:gnus:resource|define
  :name 'com.gmail@example.home'
  :resource-type (plist-get b:mrm:resource::types 'mailService)
  :map-to-mua (plist-get b:mrm::map-to-muas 'gnus)
  :retrievablesResource-spec
   (lambda ()
     (b:gnus:retrievablesResource:mail|define
      :user-acct 'example.home'
      :acct-passwd (imapGetPassword)
      :retrievablesResource-method (plist-get b:mrm:retrievables::methods 'nnimap)
      :retrievablesResource-provider 'b:gnus:retrievablesResource:provider|gmail
      ))
 :injectionResource-spec
   (lambda ()
     (b:gnus:injectionResource:mail|define
      :user-acct 'example.home'
      :acct-passwd (smtpGetPassword)
      :injectionResource-method (plist-get b:gnus:injection::methods 'smtpmail)
      :injectionResource-provider 'b:gnus:injectionResource:provider|gmail
      ))
 :vault-interface (plist-get b:mrm::vaultInterfaces 'authinfo)
 )
#+END_SRC
" orgCmntEnd)

(provide 'bmr-model)

;;; local variables:
;;; no-byte-compile: t
;;; end:

