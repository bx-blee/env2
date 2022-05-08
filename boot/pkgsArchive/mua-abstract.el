;;; mua-abstract.el --- Map Abstract MUA To Concrete MUA  -*- lexical-binding: t; -*-


(orgCmntBegin "
* Main Package File
** But core documentation is in [[file:bmr-model.el]]
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
*      ================ Requires
" orgCmntEnd)

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

(require 'bmr-model)
(require 'bmr-prov-mail-com:gmail)
(require 'bmr-prov-usenet-io:gmane:news)
(require 'bmr-method-inject-qmail)
(require 'mua-gnus)


;;; (b:gnus:manifest/filesList-add)
(defun b:mrm:manifest/filesList-activate ()
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (loop-for-each each b:mrm:manifest:filesList
    (b:mrm:manifest/activate each)
    ))


;;; (call-interactively 'b:gnus:manifest/activate)
;;; (load "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/mailService-manifest.el")
;;; (b:gnus:manifest/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/mailService-manifest.el")
;;; (b:gnus:manifest/activate "/bxo/iso/piu_mbFullUsage/profiles/gnus/io.gmane.news/gnus-usenetService.el")
;;;
(defun b:mrm:manifest/activate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (load-file <fileName)
  (b:mrm:resource|map-to-mua))


;;; (call-interactively 'b:gnus:manifest/deactivate)
;;; (b:gnus:manifest/deactivate "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el")
;;;
(defun b:mrm:manifest/deactivate (<fileName)
  " #+begin_org
** Based on the specified profile setup Gnus variables.
** Incomplete Aspects:
*** Provide an argument and read if not provided.
#+end_org "
  (interactive (list (read-file-name "Gnus Profile File: ")))
  (blee:ann|this-func (compile-time-function-name))
  (message "NOTYET"))


(orgCmntBegin "
* /Concept:/ <<Abstract To Concrete MUA Mapping>>
** Based on the complete abstract specification, we choose appropriate MUA
** And then configure that MUA.
" orgCmntEnd)

(string= "gnus" (plist-get b:mrm::map-to-muas 'gnus))

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:resource|map-to-mua>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:resource|map-to-mua (
;;; DBLOCK_END
                                  )
    " #+begin_org
** DocStr: Dispatches based on the value of map-to-mua.
#+end_org "
    (let* (
           ($map-to-mua (get 'b:mrm:resource:manifest 'map-to-mua))
           )
      (cond
       ((string= $map-to-mua (plist-get b:mrm::map-to-muas 'gnus))
        (b:gnus:mrm:resource|activate))
       (t
        (message (s-lex-format "Unknown MUA=${$map-to-mua}")))
       )))



(defun imapGetPassword ()
  "Gets the passwd for imaps. For example it can prompt the end-user."
  "NOTYET"
  )

(defun smtpGetPassword ()
  "Gets the passwd for ssmtp. For example it can prompt the end-user."
  "NOTYET"
  )



(provide 'mua-abstract)

;;; local variables:
;;; no-byte-compile: t
;;; end:

