;;; -*- Mode: Emacs-Lisp -*-
;;; RcsId="$Id: bystar-init-screen.el,v 1.5 2016-02-01 00:13:51 lsipusr Exp $"
;;; 

;;; Description:  Customizer for folding


;;{{{ Code:

;;(bystar:init:startup-message)
(defun bystar:init:startup-message ()
  ;(setq initial-scratch-message "Hello world") 
  (bystar-scratch-welcome-buffer)
  ;(setq initial-buffer-choice "/opt/public/osmt/bin/ByStarUserEnv.welcome")
  (setq initial-buffer-choice t)
  (setq inhibit-startup-message t)
  )

(defun bystar-scratch-welcome-buffer ()
  "do fancy things"
  (let ((my-buffer (get-buffer-create "*scratch*")))
    (with-current-buffer my-buffer
      ;; this is what you customize
      ;;(insert-file (expand-file-name "~/lisp/splashScreen/ByStarUserEnv.org")))
      (load-file (expand-file-name
		    (concat
		     (file-name-as-directory (blee:env:splashScreen:base-obtain))
		     "ByStarUserEnv.el")))
      (insert-welcome-buffer (blee:env:images:base-obtain))
      )
    (org-mode)
    (switch-to-buffer my-buffer)))

(defun bystar-welcome-buffer-okay2Del ()
  "do fancy things"
  (let ((my-buffer (get-buffer-create "bystar-welcome-buffer")))
    (with-current-buffer my-buffer
      ;; this is what you customize
      ;; (insert-file (expand-file-name "~/lisp/splashScreen/ByStarUserEnv.org"))
      (insert-file (expand-file-name
		    (concat
		     (file-name-as-directory (blee:env:splashScreen:base-obtain))
		     "ByStarUserEnv.org")))
      (org-mode)
      )
    (switch-to-buffer my-buffer)))


(defun b:splash|vanilaGnuEmacs ()
  (switch-to-buffer "*GNU Emacs*")
  (delete-other-windows)
  (beginning-of-buffer)
  )


;; (add-hook 'emacs-startup-hook 'my-startup-fcn)  ;; Does not work 

;;}}}

(provide 'bystar-init-screen)

;;{{{ end of file

;;; local variables:
;;; folded-file: nil
;;; byte-compile-dynamic: t
;;; end:

;;}}}
