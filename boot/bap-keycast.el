;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: keycast -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-keycast.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Keycast
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
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:keycast:defaults-set -- Define
")

(setq bap:keycast:usage:enabled-p t)

(defun bap:keycast:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:keycast:usage:enabled-p
    (bap:keycast:install/update)
    (bap:keycast:config/main)
    )
  )


(defun bap:keycast:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:keycast:install/update")
  (use-package keycast
    :ensure t
    ;;; :pin melpa-stable
    )
  )


(defun bap:keycast:config/main ()
  ""
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line (fix for use with doom-mode-line)."
    :global t
    (if keycast-mode
        (add-hook 'pre-command-hook 'keycast--update t)
      (remove-hook 'pre-command-hook 'keycast--update)))
  (add-to-list 'global-mode-string '("" mode-line-keycast))
  )

(defun turn-on-keycast%% ()
  (interactive)
  (add-to-list 'global-mode-string '("" mode-line-keycast " "))
)

(defun turn-off-keycast%% ()
  (interactive)
  (setq global-mode-string (delete '("" mode-line-keycast " ") global-mode-string))
  (force-mode-line-update)
)



;;;
;;; Global Menu/biso
;;;

;; (blee:blee:menu)
;; (bap:keycast:global:menu)
(defun bap:keycast:global:menu ()
  (easy-menu-define 
    bap-keycast-menu
    nil 
    "Keycast Menu"
    '("Keycast Menu"
      "---"
      ["Enable Keycast Mode" (keycast-mode 1) t]  
      ["Disable Keycast Mode" (keycast-mode -1) t]
      "---"
      ["Enable Keycast Log Mode" (keycast-log-mode 1) t]  
      ["Disable Keycast Log Mode" (keycast-log-mode -1) t]
      ["Keycast Log Erase Buffer" (keycast-log-erase-buffer) t]
      ))
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-keycast)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

