;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bystar-tex.el,v 1.9 2017-08-01 00:21:18 lsipusr Exp $

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

;;(require 'tex-site) ;; This Should Come Here
(require 'latex)    ;; needed to define LaTeX-mode-hook under AUCTeX
(require 'tex)      ;; needed to define TeX-mode-hook under AUCTeX

;;(load-library "auctex")


;;(load-library "tex-site")

(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-texpath-environment-variables '("!kpsewhich -show-path=.tex"))  ;;; Is not working
(setq-default TeX-master nil)
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.
(setq reftex-toc-include-file-boundaries t)

(setq reftex-plug-into-AUCTeX t)

 	
(setq reftex-file-extensions
      '(("nw" "tex" "ttytex" ".ttytex" ".tex" ".ltx") ("bib" ".bib")))
(setq TeX-file-extensions
      '( "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo" "ttytex"))


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Define 
")


;; (bystar:tex:all-defaults-set)
(defun bystar:tex:all-defaults-set ()
  ""
  (interactive)


  (add-to-list 'auto-mode-alist '("\\.ttytex\\'" . latex-mode))

  ;; (setq load-path (cons (expand-file-name "/usr/share/emacs/site-lisp/auctex")
  ;; 		      load-path))

  (bystar:tex:mode-hooks)

  ;;(setq TeX-print-command "dvips %s -t letter -P%p")

  (message "bystar:tex:all-defaults-set -- Done." )
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== mode-hooks -- Minor Modes
")


;;; (bystar:tex:mode-hooks)
(defun bystar:tex:mode-hooks ()
  ""
  (interactive)
  (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

(bystar:tex:all-defaults-set)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bystar-tex)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

