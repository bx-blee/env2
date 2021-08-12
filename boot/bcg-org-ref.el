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

(setq bcg:org:ref:usage:enabled-p nil)

(defun bcg:org:ref:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:org:ref:usage:enabled-p
    ;;
    (bc:org-ref:install/update)
    (bc:org-ref:config/main)
    ;;
    (bc:org-roam-bibtex:install/update)
    (bc:org-roam-bibtex:config/main)
    )
  )

(defun bc:org-ref:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package org-ref
    :ensure t
    ;;; :pin melpa-stable
    )
  )

(defun bc:org-ref:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))

  ;; see org-ref for use of these variables
  ;; (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
  ;;     org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
  ;;     org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")

  )

(defun bc:org-ref:key|activate-keys ()
  "All addional keys come here"

  (blee:ann|this-func (compile-time-function-name))
  
  ;; org-roam-mode-map
  ;;(define-key org-roam-mode-map [(control ?c) (n)] nil)
  ;;(define-key org-roam-mode-map [(control ?c) (n) (l)] 'org-roam)
  )


(defun bc:org-roam-bibtex:install/update ()
  "NOTYET Place holder"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package org-roam-bibtex
    :after (org-roam)
    :hook (org-roam-mode . org-roam-bibtex-mode)
    :ensure t
    ;;; :pin melpa-stable
    )
  )

(defun bc:org-roam-bibtex:config/main ()
  "Place Holder"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (setq orb-preformat-keywords
   '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}
- tags ::
- keywords :: ${keywords}
\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"
           :unnarrowed t)))
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-org-roam)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

