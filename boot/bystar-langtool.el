;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bystar-langtool.el,v 1.2 2015-01-28 00:42:02 lsipusr Exp $

(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ##################
*      ================
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* General TODO List 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== *[Xref]* Blee Panel Documentation  [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/bleeActivities/fullUsagePanel-en.org::LanguageTool][LanguageTool]]  <<Xref-Here->> 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")

(message "ByStar LaTeX LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'langtool)
(require 'diction)   
(require 'bystar-langtool-menu)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Define 
")


;; (bystar:langtool:all-defaults-set)
(defun bystar:langtool:all-defaults-set ()
  ""
  (interactive)

  (setq langtool-language-tool-jar "/usr/local/bin/LanguageTool-2.8/languagetool-commandline.jar")

  (global-set-key "\C-x4w" 'langtool-check)
  (global-set-key "\C-x4W" 'langtool-check-done)
  (global-set-key "\C-x4l" 'langtool-switch-default-language)
  (global-set-key "\C-x44" 'langtool-show-message-at-point)
  (global-set-key "\C-x4c" 'langtool-correct-buffer)

  (setq langtool-mother-tongue "en")

  (message "bystar:langtool:all-defaults-set -- Done." )
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== mode-hooks -- Minor Modes
")


;;; (bystar:langtool:mode-hooks)
(defun bystar:langtool:mode-hooks ()
  ""
  (interactive)
  (message "Omni Mode")
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== usage
")


;;; (bystar:langtool:usage)
(defun bystar:langtool:usage ()
  "
## Usage:

** To check current buffer and show warnings.

	M-x langtool-check (C-x 4 w)

** To correct marker follow LanguageTool suggestions.

    M-x langtool-correct-buffer (C-x 4 c)

** Goto warning point and

    M-x langtool-show-message-at-point (C-x 4 4)

** To finish checking. All marker is removed.

    M-x langtool-check-done (C-x 4 W)
"
  (interactive)
  (describe-function 'bystar:langtool:usage)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

(bystar:langtool:all-defaults-set)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bystar-langtool)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

