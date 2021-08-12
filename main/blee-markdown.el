;;; -*- Mode: Emacs-Lisp; -*-
;;; Rcs: $Id: blee-markdown.el,v 1.1 2018-11-06 22:12:05 lsipusr Exp $

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
*      ======[[elisp:(org-cycle)][Fold]]====== *[Xref]* Blee Panel Documentation
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/bleeActivities/fullUsagePanel-en.org::Python][Python Major Mode]]  <<Xref-Here->>
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")

(message "ByStar MARKDOWN LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Define 
")


;; (blee:markdown:all-defaults-set)
(defun blee:markdown:all-defaults-set ()
  ""
  (interactive)

  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

  (autoload 'gfm-mode "markdown-mode"
    "Major mode for editing GitHub Flavored Markdown files" t)
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))  

  (message "blee:markdown:defaults-set -- Done." )
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== mode-hook s -- Minor Modes
")


;; ;;; (bystar:tex:mode-hooks)
;; (defun bystar:tex:mode-hooks ()
;;   ""
;;   (interactive)
;;   (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
;;   )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

(blee:markdown:all-defaults-set)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")


(provide 'blee-markdown)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
