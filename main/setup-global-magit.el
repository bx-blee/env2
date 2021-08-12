;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: magit -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-magit.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Magit
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")

(message "ByStar Magit LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")


(when (not (bx:emacs24.5p))
  (require 'magit)    
  )

(when (bx:emacs24.5p)
  (when (not (string-equal opRunDistGeneration "1404"))
    (require 'magit)  
    ))

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:magit:defaults-set -- Define 
")


;; (bx:setup:magit:defaults-set)
(defun bx:setup:magit:defaults-set ()
  ""
  (interactive)

  ;;;
  ;;;  This changed in Emacs25 -- NOTYET for sslVerify
  ;;;
  (when (bx:emacs24.5p)
    (setq magit-git-standard-options
	  (append magit-git-standard-options '("-c") '("http.sslVerify=false")))
    )

  (message "bystar:magit:all-defaults-set -- Done." )
  )

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:magit:defaults-set -- Invoke 
")

(when (not (bx:emacs24.5p))
  (bx:setup:magit:defaults-set)  
  )

(when (bx:emacs24.5p)
  (when (not (string-equal opRunDistGeneration "1404"))
    (bx:setup:magit:defaults-set)    
    ))

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'setup-global-magit)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

