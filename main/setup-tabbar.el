;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: tabbar -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-tabbar.el,v 1.5 2015-04-26 00:55:04 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Tabbar
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")

(message "ByStar Tabbar LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'tabbar)      ;; needed to define Tabbar-mode-hook under AUCTabbar


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:tabbar:defaults-set -- Define 
")


;; (bx:setup:tabbar:defaults-set)
(defun bx:setup:tabbar:defaults-set ()
  ""
  (interactive)

  (tabbar-mode)

  (custom-set-faces  '(tabbar-button-highlight ((t (:background "grey50" :foreground "white" :height 0.8 :family "Sans Serif")))))
  (custom-set-faces  '(tabbar-default ((t (:background "grey50" :foreground "yellow" :height 0.8 :family "Sans Serif")))))
  ;;(custom-set-faces  '(tabbar-selected ((t (:background "grey50" :foreground "red" :box (:line-width 1 :color "white" :style pressed-button) :height 0.8 :family "Sans Serif")))))
  (custom-set-faces  '(tabbar-selected ((t (:background "white" :foreground "black" :box (:line-width 1 :color "white" :style pressed-button) :height 0.8 :family "Sans Serif")))))
  (custom-set-faces  '(tabbar-unselected ((t (:background "grey50" :foreground "blue" :box (:line-width 2 :color "black" :style released-button) :height 0.8 :family "Sans Serif")))))
  (custom-set-faces  '(tabbar-modified ((t (:background "grey50" :foreground "yellow" :box (:line-width 1 :color "white" :style released-button))))))

  ;;(custom-set-variables '(tabbar-mode t nil (tabbar)))
  ;;

  ;; (setq tabbar-ruler-global-tabbar t) ; If you want tabbar
  ;; (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
  ;; (setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
  ;; (setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
  ;; (setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
  ;;                                       ; scroll bar when your mouse is moving.
  ;; (require 'tabbar-ruler)

  ;; (tabbar-ruler-group-buffer-groups)


  (message "bystar:tabbar:all-defaults-set -- Done." )
  )

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:tabbar:defaults-set -- Invoke 
")

(bx:setup:tabbar:defaults-set)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'setup-tabbar)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

