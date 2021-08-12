;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: bbdb
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-bbdb.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][VC Panel Roadmap Documentation]]
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Bbdb
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")
;; (require 'bbdb-loaddefs)
;; (require 'bbdb)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:bbdb:defaults-set -- Define 
")

(setq bap:bbdb:usage:enabled-p t)

(defun bap:bbdb:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:bbdb:usage:enabled-p
    (bap:bbdb:install/update)
    (bap:bbdb:config/main)
    )
  )

(defun bap:bbdb:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))  

  (use-package bbdb
    :ensure t
    ;;; :pin melpa-stable
    )

  (use-package bbdb-ext
    :ensure t
    ;;; :pin melpa-stable
    )
  
  ;; (use-package bbdb-vcard
  ;;   :ensure t
  ;;   ;;; :pin melpa-stable
  ;;   )

  ;;(require 'bbdb-vcard-export)
  ;;(require 'bbdb-vcard)

  ;; BBDB Filters
  ;; NOTYET, can't figure this
  ;;(load-file "/opt/public/eoe/lisp/esfiles/bbdb-filters-site.el")
  ;;(eoe-require 'bbdb-filters-site)
  ;;(load "bbdb-filters-site")

  ;;(load-file "/usr/devenv/doc/nedaComRecs/Content/msend-contents-load.el")

  ;;(require 'bystar-bbdb-lib)
  
  )

(defun bap:bbdb:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq bbdb-file "~/.bbdbV9")   ;;; Is It Really V9
  
  ;;(add-hook 'bbdb-mode-hook 'bbdb-ext-hook)
  (bbdb-ext-hook)


  ;;(bbdb-insinuate-reportmail)
  (bbdb-insinuate-message)
  ;;(bbdb-insinuate-sc)   ;;; NOTYET has problems with 26f
  ;;(bbdb-insinuate-w3)
  (setq bbdb-north-american-phone-numbers nil)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (setq bbdb-check-zip-codes-p nil)
  (setq bbdb-default-area-code 425)   ;;; These should be done in the current BACS 
  (setq bbdb-default-country "USA")   ;;; These should be done in the current BACS
  ;;(setq bbdb-ignore-some-messages-alist (quote (("From" . "hotmail") ("To" . "handhelds") ("From" . "yahoo.com"))))
  (setq bbdb-notice-hook (quote (bbdb-auto-notes-hook)))
  (setq bbdb/mail-auto-create-p t)
  (setq bbdb/news-auto-create-p (quote bbdb-ignore-some-messages-hook))

  (setq bbdb-complete-name-allow-cycling t)
  ;;No popup-buffers
  (setq bbdb-use-pop-up nil)  

  ;;;(bbdb-initialize 'gnus 'message 'reportmail 'w3)
  (bbdb-initialize 'gnus
           ;;bbdb-insinuate-gnus adds bindings for the default
           ;;keys to Gnus and configures Gnus to notify the
           ;;BBDB when new messages are loaded. This
           ;;notification is required if the BBDB is to be
           ;;able to display BBDB entries for messages
           ;;displayed in Gnus.

           'message
           ;; bbdb-insinuate-message adds a binding for M-TAB
           ;; to Message mode. This will enable completion of
           ;; addressees based on BBDB records.
	   )

           ;;'mu4e
           ;;'anniv)

  (bbdb-mua-auto-update-init 'gnus 'message 'mu4e)

  ;; size of the bbdb popup
  (setq bbdb-mua-pop-up-window-size 1)

  ;; how to handle new entries
  ;; (setq bbdb-mua-update-interactive-p '(query . create))

  ;; look at every address; not only the first one
  (setq bbdb-message-all-addresses t)

  
  ;; use ; on a message to invoke bbdb interactively
  (add-hook
   'gnus-summary-mode-hook
   (lambda ()
     (define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)
     ))

  ;; ;; This is for non interactive bbdb invocation, but it was a bit
  ;; ;; too much
  ;; (setq bbdb-update-records-p 'query)  

  (setq bbdb-phone-style 'nil)

  
  )






;;; (require 'mozmail)
;;; Test It
;;; (progn (murl-pre-hook) (mozmail "mailto:one@example.com") (murl-post-hook))
;;; (setq debug-on-error t)


(defun murl-bbdbCapture-pre ()
  "Mail URL sendlink-toWeblogs"

  (msend-originator-from-line "")

  (msend-originator-envelope-addr "")

  (msend-compose-setup)
  )

(defun murl-bbdbCapture-post ()
  "Mail URL sendlink-toWeblogs"
  (bbdb-show-all-recipients)
  (bury-buffer nil)
   )


(defun murl-bbdbCapture ()
  "Mail URL sendlink-toWeblogs"
  (interactive)

  (setq  a-murl-pre-hook nil)
  (add-hook 'a-murl-pre-hook 'murl-bbdbCapture-pre)

  (setq  a-murl-post-hook nil)
  (add-hook 'a-murl-post-hook 'murl-bbdbCapture-post)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-bbdb)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

