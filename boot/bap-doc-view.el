;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: doc-view -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-doc-view.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Doc-View
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
See http://www.emacswiki.org/emacs/DocViewMode
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:doc-view:defaults-set -- Define 
")

(setq bap:doc-view:usage:enabled-p t)

(defun bap:doc-view:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:doc-view:usage:enabled-p
    (bap:doc-view:install/update)
    (bap:doc-view:config/main)
    )
  )

(defun bap:doc-view:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:doc-view:install/update")
  ;; (use-package doc-view
  ;;   :ensure t
  ;;   ;;; :pin melpa-stable
  ;;   )
  )

(defun bap:doc-view:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (setq doc-view-continuous t)
  )

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-doc-view)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

