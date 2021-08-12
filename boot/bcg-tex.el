;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: bbdb -- GIT mode
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

(setq bcg:tex:usage:enabled-p t)

;;
;; (bcg:tex:full/update)
;;
(defun bcg:tex:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:tex:usage:enabled-p
    (bcg:tex:install/update)
    (bcg:tex:config/main)
    )
  )

;;
;; (bcg:tex:install/update)
;;
(defun bcg:tex:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package tex
    :ensure auctex
    ;;; :pin melpa-stable
    )
  )

;;
;; (bcg:tex:config/main)
;;

(defun bcg:tex:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (bcg:tex:common|config)  
  )

(defun bcg:tex:common|config ()
  ""
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


(bystar:tex:all-defaults-set)

  )



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
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-tex)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

