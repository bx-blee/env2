;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bystar-progtools-menu.el,v 1.2 2015-11-22 07:22:20 lsipusr Exp $

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

(message "ByStar LanguageTool-Menu LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'easymenu)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:progtools-global:menu)
")

(defun bystar:progtools-global:menu ()
  (easy-menu-define 
    progtools-global-menu 
    nil
    "Global Programmer's Workbench"
    '("Programmer's Workbench"
      ["Start realgud:pdb Debugger" realgud:pdb t]
      ["Start realgud:trepan2 Debugger" realgud:trepan2 t]      
      "---"
      ["Run pyclbr" (python-check (format "pyclbr %s" (bx:buf-fname))) t]
      "---"
      ["Run pyflakes" (python-check (format "pyflakes %s" (bx:buf-fname))) t]
      ["Run pychecker  -- executes" (python-check (format "pychecker %s" (bx:buf-fname))) t]
      ["Run pep8" (python-check (format "pep8 %s" (bx:buf-fname))) t]
      ["Run flake8" (python-check (format "flake8 %s" (bx:buf-fname))) t]
      ["Run pylint" (python-check (format "pylint %s" (bx:buf-fname))) t]
      "---"
      ("ByStar Programmer Workbench Help/Documentation"
       ["Help: Programmer" bystar:music:doc:howto:all-help t]
       )
      ))
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:progtools-global:keybd) (bystar:progtools-mode:keybd)
")

(defun bystar:progtools-global:keybd ()
  ""
  ;;(interactive)
  (define-key global-map [(pause)] nil)

  ;; pause  -- progtools
  (define-key global-map [(pause) (pause)] 'progtools-pause)
  (define-key global-map [(pause) (e)] 'progtools)
)


(defun bystar:progtools-mode:keybd ()
  ""
  ;; progtools-playlist-mode keys
  (define-key progtools-playlist-mode-map "g" 'progtools-score-up-file-on-line) ;; g for good
)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:progtools-mode:menu)
")

(defun bystar:progtools-mode:menu ()
  (easy-menu-define 
    progtools-mode-menu 
    progtools-playlist-mode-map
    "Local PROGTOOLS Menu"
    '("PROGTOOLS"
      ["Pause" progtools-pause t]
      ["Volume Down" progtools-volume-mode-minus t]
      ["Volume Up" progtools-volume-mode-plus t]
      ["Center Around Playing" progtools-volume-mode-plus t]
      "---"
      ["Save" progtools-playlist-sort-by-score t]
      ["Quit" progtools-playlist-mode-bury-buffer t]
      ))
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

;;(bystar:progtools:all-defaults-set)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bystar-progtools-menu)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
