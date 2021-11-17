;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: gif-screencast -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-gif-screencast.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Gif-Screencast
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
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:gif-screencast:defaults-set -- Define
")

(setq bap:gif-screencast:usage:enabled-p t)

(defun bap:gif-screencast:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:gif-screencast:usage:enabled-p
    (bap:gif-screencast:install/update)
    (bap:gif-screencast:config/main)
    )
  )


(defun bap:gif-screencast:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:gif-screencast:install/update")
  (use-package gif-screencast
    :ensure t
    ;;; :pin melpa-stable
    )
  )


(defun bap:gif-screencast:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  )

(defun bap:gif-screencast:last/view-animated ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "NOTYET, should run: gifview -s lastFile")
  )


;;;
;;; Global Menu
;;;

;; (blee:blee:menu)
;; (bap:gif-screencast:global:menu)
(defun bap:gif-screencast:global:menu ()
  (easy-menu-define 
    bap-gif-screencast-menu
    nil 
    "Gif-Screencast Menu"
    '("Gif-Screencast Menu"
      "---"
      ["Start Or Stop Gif-Screencast" (gif-screencast-start-or-stop) t]      
      ["Stop Gif-Screencast" (gif-screencast-stop) t]
      "---"
      ["Pause-Toggle Gif-Screencast Mode" (gif-screencast-start-or-stop) t]  
      "---"
      ["Enable Gif-Screencast Mode" (gif-screencast-mode 1) t]
      ["Disable Gif-Screencast Mode" (gif-screencast-mode -1) t]
      "---"
      ["View Latest animated gif-screencast" (bap:gif-screencast:last/view-animated) t]  
      ))
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-gif-screencast)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

