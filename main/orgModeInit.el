;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)


(require 'remember)

(require 'org)
;;; Somewhere in org a one day diary is invoked, we undo that below
(switch-to-buffer "*scratch*")
(delete-other-windows)

;;(require 'org-link-minor-mode)
;;(require 'outshine)
;;(require 'outorg)

;;(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;;(add-hook 'message-mode-hook 'outline-minor-mode)

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

(add-hook 'org-mode-hook 'bap:org:key|activate-keys)

;;;(setq org-insert-heading-hook nil)
;;;(add-hook 'org-insert-heading-hook (lambda () (insert  "[[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   ")))

;;(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;;(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'|\\`[^.].*\\.tex\\'||\\`[^.].*\\.ttytex\\'")

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


;;;
;;; custom variables modified interactively can over write these
;;; Make sure you get rid of those.
;;; 



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

(bx:package:install-if-needed 'use-package)
(bx:package:install-if-needed 'org-bullets)

(use-package org-bullets
   :config
   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-hide-emphasis-markers t)

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "orgModeInit"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'orgModeInit)
;;;#+END:
