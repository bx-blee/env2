;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: Visibility Controls
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

(setq bcg:visibility:usage:enabled-p t)

(defun bcg:visibility:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:visibility:usage:enabled-p
    (bcg:visibility:install/update)
    (bcg:visibility:config/main)
    )
  )

(defun bcg:visibility:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; fill-column-idicator is part of emacs proper

  (require 'whitespace)
  )

(defun bcg:visibility:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq display-fill-column-indicator-character ?\N{U+2506})
  ;;;(customize-face 'fill-column-indicator)
  ;; or put something like this in your theme
  ;;; '(fill-column-indicator ((t (:foreground "#4e4e4e"))))

  (set-fill-column 115)

  ;; (setq whitespace-line-column 80) ;; limit line length
  ;; (setq whitespace-style '(face lines-tail))

  ;; (add-hook 'prog-mode-hook 'whitespace-mode)
  ;; (global-whitespace-mode +1)
  
  )

;; (blee:fill-column-indicator/enable)
(defun blee:fill-column-indicator/enable ()
  "Enable displaying of fill column indicator."
  (interactive)
  (setq display-fill-column-indicator t)
  (setq display-fill-column-indicator-character ?\N{U+2506})  
  )

;; (blee:fill-column-indicator/disable)
(defun blee:fill-column-indicator/disable ()
  "Toggle displaying of fill column indicator."
  (interactive)
  (setq display-fill-column-indicator nil)
  )

(defun blee:fill-column-indicator/toggle ()
  "Toggle displaying of fill column indicator."
  (interactive)
  (if display-fill-column-indicator
      (blee:fill-column-indicator/disable)
    (blee:fill-column-indicator/enable)
    )
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-visibility)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

