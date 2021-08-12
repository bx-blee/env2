;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bx-tool-bar.el,v 1.4 2017-11-22 01:44:42 lsipusr Exp $

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

(message "ByStar toolbar LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'easymenu)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bx:tool-bar:start)
")

(defun bx:Bxa ()
  ""
  (interactive)
  (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee")
  )

;; (bx:tool-bar:start)
(defun bx:tool-bar:start ()
  ""
  ;;(interactive)
  ;; /usr/share/emacs/24.5/etc/images/

  (add-to-list 'image-load-path (expand-file-name "~/lisp/images"))

  (when (find-image '((:type xpm :file "bxLogo-30.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    (tool-bar-add-item 
     "bxLogo-30" ;; "next-page" "letter"
     'bx:Bxa
     'BxA
     :help "Go To Top Level ByStar Panel"))

  (when (find-image '((:type xpm :file "letter.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    (tool-bar-add-item "letter" 'toggle-input-method 'ف/E
    :help "Toggle Input Method (Language)"
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    ;;(setq tool-bar-map (make-sparse-keymap))
    (tool-bar-add-item "letter" 'delete-other-windows 'W1
    :help "Delete Other Windows"
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    ;;(setq tool-bar-map (make-sparse-keymap))
    (tool-bar-add-item "letter" 'split-window-below 'W2
    :help "Split Window Below"
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    ;;(setq tool-bar-map (make-sparse-keymap))
    (tool-bar-add-item "letter" 'split-window-right 'W3
    :help "Split Window Right"    
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    (tool-bar-add-item "letter" 'blee:ppmm:org-mode-toggle 'TM
    :help "Bx: Toggle Major Mode Between Native and Org-Mode"    
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (tool-bar-mode 1))
    (tool-bar-add-item "letter" 'blee:ppmm:org-mode-content-list 'CL
    :help "Bx: Switch To Org-Mode, view at top level and goto contents list"    
    ))

  (when (find-image '((:type xpm :file "next-page.xpm")))
    (unless tool-bar-mode (goto-char (point-min)))
    (tool-bar-add-item "letter" 'blee:ppmm:org-mode-content-list 'Top
    :help "Bx: beginning-of-buffer"    
    ))
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

(bx:tool-bar:start)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bx-tool-bar)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
