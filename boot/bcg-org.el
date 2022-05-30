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

(setq bcg:org:usage:enabled-p t)

(defun bcg:org:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:org:usage:enabled-p
    (bcg:org:install/update)
    (bcg:org:config/main)
    )
  )

(defun bcg:org:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package org-bullets
    :ensure t
    ;;; :pin melpa-stable
    )

  (use-package epc
    :ensure t
    )

  (use-package org-recoll
    :load-path "/bisos/blee/extPkgs/org-recoll"
    )
  
  (require 'remember)

  (require 'org)

  ;; /bisos/blee/env/dblocks
  (blee:load-path:add  
   (file-name-as-directory
    (concat  (file-name-as-directory (blee:env:base-obtain))
	     "dblock")
    )
   )
  
  (require 'bx-dblock)

  (require 'lsip-basic)
  
  )

(defun bcg:org:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (bcg:org:common|config)  
  
  (bcg:org:bullets|config)

  (bcg:org:export|config)  
  )

(defun bcg:org:export|config ()
  ""
  (require 'ox-md)          ;; Markdown export backend
  )

(defun bap:org:key|insert-key-hook ()
  "Insert blee preface"
  (insert  "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   ")
  )  

(defun bap:org:key/hooked-insert-key ()
  "M-Ret with a temporary hook"
  (interactive)
  (add-hook 'org-insert-heading-hook 'bap:org:key|insert-key-hook)
  (org-meta-return)
  (remove-hook 'org-insert-heading-hook 'bap:org:key|insert-key-hook)  
  )


(defun bap:org:key|activate-keys ()
  "All addional keys come here"
  (local-set-key (kbd "<C-return>") 'bap:org:key/hooked-insert-key)
  )


(defun bcg:org:common|config ()
  ""
  (blee:ann|this-func (compile-time-function-name))
  
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

  ;;; (add-hook 'org-insert-heading-hook (lambda () (insert  "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   ")))

  (add-hook 'org-mode-hook 'bap:org:key|activate-keys)  

(setq org-agenda-diary-file "/acct/employee/lsipusr/org/events/main.org")

(define-key mode-specific-map [?a] 'org-agenda)

(setq org-confirm-elisp-link-function nil)

(eval-after-load "org"

  '(progn

     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"

       #'(lambda nil (interactive) (org-todo "CANCELLED")))

     (define-key org-todo-state-map "d"

       #'(lambda nil (interactive) (org-todo "DONE")))

     (define-key org-todo-state-map "f"

       #'(lambda nil (interactive) (org-todo "DEFERRED")))

     (define-key org-todo-state-map "l"

       #'(lambda nil (interactive) (org-todo "DELEGATED")))

     (define-key org-todo-state-map "s"

       #'(lambda nil (interactive) (org-todo "STARTED")))

     (define-key org-todo-state-map "w"

       #'(lambda nil (interactive) (org-todo "WAITING")))



     ;;(define-key org-agenda-mode-map "\C-n" 'next-line)

     ;;(define-key org-agenda-keymap "\C-n" 'next-line)

     ;;(define-key org-agenda-mode-map "\C-p" 'previous-line)

     ;;(define-key org-agenda-keymap "\C-p" 'previous-line)

     ))




;;(define-key global-map [(control meta ?r)] 'remember)


;;
;; custom variables modified interactively can over write these
;; Make sure you get rid of those.
;; 



  (custom-set-variables

 '(org-default-notes-file "~/org/notes.org")

 '(org-agenda-ndays 7)

 '(org-deadline-warning-days 14)

 '(org-agenda-show-all-dates t)

 '(org-agenda-skip-deadline-if-done t)

 '(org-agenda-skip-scheduled-if-done t)

 '(org-agenda-start-on-weekday nil)

 '(org-reverse-note-order t)

 '(org-fast-tag-selection-single-key (quote expert))

 '(org-agenda-custom-commands

   (quote (("d" todo "DELEGATED" nil)

           ("c" todo "DONE|DEFERRED|CANCELLED" nil)

           ("w" todo "WAITING" nil)

           ("W" agenda "" ((org-agenda-ndays 21)))

	   ("A" agenda ""

	    ((org-agenda-skip-function

	      (lambda nil

		(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))

             (org-agenda-ndays 1)

	     (org-agenda-overriding-header "Today's Priority #A tasks: ")))

	   ("u" alltodo ""

	    ((org-agenda-skip-function

	      (lambda nil

		(org-agenda-skip-entry-if (quote scheduled) (quote deadline)

					  (quote regexp) "<[^>\n]+>")))

	     (org-agenda-overriding-header "Unscheduled TODO entries: ")))))))


(setq org-remember-store-without-prompt t)

(setq org-remember-templates

    (quote ((?t "* TODO %?\n  %u" "~/org/todo.org" "Tasks")
            (?n "* %u %?" "~/org/notes.org" "Notes")
	    (?j "* %U %?\n\n  %i\n  %a" "~/org/journal.org")
	    (?i "* %^{Title}\n  %i\n  %a" "~/org/remember.org" "New Ideas")
	    )))

(setq org-reverse-note-order t)  ;; note at beginning of file by default.
(setq org-default-notes-file "~/org/remember.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)


(setq org-agenda-include-diary t)

(setq org-directory "~/org")

(global-set-key "\C-cr" 'org-remember)
(global-set-key [(f12)] 'org-remember)

(setq org-hide-emphasis-markers t)

;;; Work Logs For Projects
;;;(eoe-require 'worklog)

;;; TODO-MODE
(autoload 'todo-mode "todo-mode"
  "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode"
  "Show TODO items." t)
(autoload 'todo-insert-item "todo-mode"
  "Add TODO item." t)
(autoload 'todo-top-priorities "todo-mode"
  "Add TODO item." t)

(setq todo-show-priorities 2) ;; 0 shows all entries

  
  )


(defun bcg:org:bullets|config ()
  ""
  (blee:ann|this-func (compile-time-function-name))    
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;;; NOTYET, 5/31/2022  Mohsen --- Below is not the right place.
  (add-hook 'org-mode-hook (lambda () (setq bidi-paragraph-direction nil))) ;;; org-mode sets thus to left-to-right.
  )

(defun bcg:org:export/portNu-fixup ()
  "Convert All sections to their dblocks" 
  (interactive)
  (goto-char (point-min))  
  (replace-regexp "\\(\\[\\[TCP Port \\)\\(.*\\)\\(]]\\)" "[[TCP Port \\2][TCP Port \\2]]" nil (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)) nil)
  (goto-char (point-min))  
  (replace-regexp "\\(\\[\\[UDP Port \\)\\(.*\\)\\(]]\\)" "[[UDP Port \\2][UDP Port \\2]]" nil (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)) nil)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-org)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

