;;; -*- Mode: Emacs-Lisp; -*-
;;; Rcs: $Id: blee-python.el,v 1.15 2017-05-06 00:54:19 lsipusr Exp $

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

(message "ByStar PYTHON LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'iim-python)
(require 'flymake-python-pyflakes)
(require 'blee-flymake)
(require 'realgud)
(setq realgud-populate-common-fn-keys-function nil)  ;;; Don't bind any keys. Default (realgud-populate-common-fn-keys-standard) has problems removing itself. 

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Define 
")


;; (blee:python:all-defaults-set)
(defun blee:python:all-defaults-set ()
  ""
  (interactive)

  ;; (if (file-directory-p (expand-file-name "~/lisp/python-mode.el-6.1.2"))
  ;;   (setq load-path (cons (expand-file-name "~/lisp/python-mode.el-6.1.2")
  ;; 		      load-path)))

  ;;;
  ;;;  GIT Interface
  ;;;
  ;;(require 'magit)   
  ;;;(global-set-key "\C-xg" 'magit-status)

  (require 'auto-complete)
  (setq ac-source-yasnippet nil)
  ;;;(require 'autopair)  --- Emacs24 Native electric-pair-mode -- Used instead
  (require 'flymake)

  ;;;(global-set-key [f7] 'find-file-in-repository)

  ;;;	auto-complete mode extra settings
  (setq
   ac-auto-start 2
   ac-override-local-map nil
   ac-use-menu-map t
   ac-candidate-limit 20)

  ;; ;; Python mode settings

  (setq python-shell-interpreter "ipython")
  (when (not (bx:emacs24.5p))
    (require 'ipython-autoloads))

  ;;(require 'python-mode)
  ;;(autoload 'python-mode "python-mode" "Python Mode." t)

  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))

  (setq py-electric-colon-active t)
  ;;;(add-hook 'python-mode-hook 'autopair-mode)
  (add-hook 'python-mode-hook 'electric-pair-mode)
  ;;;(add-hook 'python-mode-hook 'yas-minor-mode)

  ;; ;; Jedi settings
  (setq jedi:setup-keys t)                      ; optional
  (setq jedi:complete-on-dot t)                 ; optional
  (require 'jedi)

  ;; if you need to change your python intepreter, if you want to change it
  ;; (setq jedi:server-command
  ;;       '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))

  (add-hook 'python-mode-hook
	    (lambda ()
	      (jedi:setup)
	      (jedi:ac-setup)
	      (local-set-key "\C-cd" 'jedi:show-doc)
	      (local-set-key (kbd "M-SPC") 'jedi:complete)
	      (local-set-key (kbd "M-.") 'jedi:goto-definition)))

  ;;(add-hook 'python-mode-hook 'eldoc-mode)

  (add-hook 'post-command-hook 'ca-flymake-show-help)

  ;; (add-to-list 'flymake-allowed-file-name-masks
  ;; 	       '("\\.py\\'" flymake-python-init))

  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
  (add-hook 'python-mode-hook 'flymake-activate)
  (add-hook 'python-mode-hook 'auto-complete-mode)
  (defun highlight-indentation-current-column-mode-activate ()
    (interactive)
    (highlight-indentation-current-column-mode +1)
    )
  (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode-activate)

  ;;;(add-hook 'comint-output-filter-functions 'python-pdbtrack-comint-output-filter-function)


  (message "blee:python:defaults-set -- Done." )
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

(blee:python:all-defaults-set)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")


(provide 'blee-python)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Junk Yard
")


;; Flymake settings for Python
(defun flymake-python-init-OBSOLETED ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "epylint" (list local-file))))



;; (defun flymake-activate ()
;;   "Activates flymake when real buffer and you have write access"
;;   (if (and
;;        (buffer-file-name)
;;        (file-writable-p buffer-file-name))
;;       (progn
;;         (flymake-mode t)
;;         ;; this is necessary since there is no flymake-mode-hook...
;;         (local-set-key (kbd "C-c n") 'flymake-goto-next-error)
;;         (local-set-key (kbd "C-c p") 'flymake-goto-prev-error))))

;; (defun ca-flymake-show-help ()
;;   (when (get-char-property (point) 'flymake-overlay)
;;     (let ((help (get-char-property (point) 'help-echo)))
;;       (if help (message "%s" help)))))


;; (bystar:python:builtin:all-defaults-set)
(defun bystar:python:builtin:all-defaults-set-Old ()
  ""
  (interactive)
  (require 'python)

  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

  (message "bystar:python:defaults-set -- Done." )
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
