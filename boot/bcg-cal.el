;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Blee Components Grouping (bcg) -- Calendar
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

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:bbdb:defaults-set -- Define 
")

(setq bcg:cal:usage:enabled-p t)

(defun bcg:cal:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:cal:usage:enabled-p
    (bcg:cal:config/pre-install)
    (bcg:cal:install/update)
    (bcg:cal:config/main)
    )
  )

(defun bcg:cal:config/pre-install ()
  "Some calendar options should be set prior to the require"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq holiday-bahai-holidays nil)  
  
  )

(defun bcg:cal:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (require 'calendar)
  (require 'cal-persia)
  (require 'cal-islam)

  (load "cal-moslem")
  
  (use-package calfw
    :ensure t
    ;;; :pin melpa-stable
    )

  (use-package calfw-cal ;;; calendar view for emacs diary
    :ensure t
    ;;; :pin melpa-stable
    )

  (use-package calfw-org
    :ensure t
    ;;; :pin melpa-stable
    )

  (use-package calfw-ical  ;;; calendar view for ical format
    :ensure t
    ;;; :pin melpa-stable
    )

  ;;; git https://gist.github.com/kiwanami/d77d9669440f3336bb9d -- calfw-git.el
  (require 'calfw-git)
  
  )

(defun bcg:cal:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (bcg:cal:common|config)

  )


(defun bcg:cal:common|config ()
  ""
  (blee:ann|this-func (compile-time-function-name))
  )  



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-cal)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

