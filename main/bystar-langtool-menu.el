;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bystar-langtool-menu.el,v 1.2 2015-02-05 02:49:06 lsipusr Exp $

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
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:langtool-global:menu)
")

(defun bystar:langtool-global:menu ()
  (easy-menu-define 
    langtool-global-menu 
    nil
    "Global M17n Writer's Workbench"
    '("Writer's Workbench"
      ["LangTool Check Region/Buffer -- <f6>wr" langtool-check t]
      ["LangTool Done/Quit -- <f6>wq" langtool-check-done t]
      ["LangTool Switch Language -- <f6>wl" langtool-switch-default-language t]
      ["LangTool Show Message -- <f6>ws" langtool-show-message-at-point t]
      ["LangTool Correct Buffer -- <f6>wc" langtool-correct-buffer t]
      "---"
      ["Diction Buffer" diction-buffer t]
      ["Diction Region" diction-region t]
      ["Diction See Results" (progn (split-window-below) (switch-to-buffer (get-buffer "*Diction-Output*"))) t]
      "---"
      ["Style Buffer" style-buffer-NOTYET t]
      ["Style Region" style-regioen-NOTYET t]
      "---"
      ("ByStar Writer Workbench Help/Documentation"
       ["Help: Music" bystar:music:doc:howto:all-help t]
       )
      ))
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:langtool-global:keybd) (bystar:langtool-mode:keybd)
")

(defun bystar:langtool-global:keybd ()
  ""
  ;;(interactive)
  (define-key global-map [(pause)] nil)

  ;; pause  -- langtool
  (define-key global-map [(pause) (pause)] 'langtool-pause)
  (define-key global-map [(pause) (e)] 'langtool)
)


(defun bystar:langtool-mode:keybd ()
  ""
  ;; langtool-playlist-mode keys
  (define-key langtool-playlist-mode-map "g" 'langtool-score-up-file-on-line) ;; g for good
)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bystar:langtool-mode:menu)
")

(defun bystar:langtool-mode:menu ()
  (easy-menu-define 
    langtool-mode-menu 
    langtool-playlist-mode-map
    "Local LANGTOOL Menu"
    '("LANGTOOL"
      ["Pause" langtool-pause t]
      ["Volume Down" langtool-volume-mode-minus t]
      ["Volume Up" langtool-volume-mode-plus t]
      ["Center Around Playing" langtool-volume-mode-plus t]
      "---"
      ["Save" langtool-playlist-sort-by-score t]
      ["Quit" langtool-playlist-mode-bury-buffer t]
      ))
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

;;(bystar:langtool:all-defaults-set)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bystar-langtool-menu)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
