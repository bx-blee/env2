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

(setq bide:cl:usage:enabled-p t)

;;
;; (bide:cl:full/update)
;;
(defun bide:cl:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bide:cl:usage:enabled-p
    (bide:cl:install/update)
    (bide:cl:config/main)
    )
  )

;;
;; (bide:cl:install/update)
;;
(defun bide:cl:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package slime
    :ensure t
    :init
    ;;(slime-enable)
    )

  )

;;
;; (bide:cl:config/main)
;;

(defun bide:cl:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (bide:cl:common|config)  
  )

(defun bide:cl:common|config ()
  ""
  (blee:ann|this-func (compile-time-function-name))
  ;;; The SBCL binary and command-line arguments
  (setq inferior-lisp-program "/usr/bin/sbcl --noinform")
  )


;; (use-package company
;;   :defer t
;;   :config
;;   (define-key company-active-map (kbd "\C-n") 'company-select-next)
;;   (define-key company-active-map (kbd "\C-p") 'company-select-previous)
;;   (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
;;   (define-key company-active-map (kbd "M-.") 'company-show-location))

;; (use-package slime-company
;;   :defer t)

;; (use-package slime
;;   :bind (("M-TAB" . company-complete)
;; 	 ("C-c C-d C-s" . slime-describe-symbol)
;; 	 ("C-c C-d C-f" . slime-describe-function))
;;   :init
;;   (setq slime-lisp-implementations '((sbcl ("sbcl")))
;; 	slime-default-lisp 'sbcl)
;;   (setq common-lisp-hyperspec-root
;;         "/usr/local/share/doc/hyperspec/HyperSpec/")
;;   (setq common-lisp-hyperspec-symbol-table
;;         (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
;;   (setq common-lisp-hyperspec-issuex-table
;;         (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))
;;   (slime-setup '(slime-fancy slime-company slime-cl-indent)))

;; (defun slime-description-fontify ()
;;   (with-current-buffer "*slime-description*"
;;     (slime-company-doc-mode)))

;; (defadvice slime-show-description (after slime-description-fontify activate)
;;   "Fontify sections of SLIME Description."
;;   (slime-description-fontify))




(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bide-cl)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

