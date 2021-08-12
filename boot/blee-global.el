;;; -*- Mode: Emacs-Lisp -*-


(message "BLEE GLOBAL FACILITIES")

;;;(load-file "~/lisp/push-pop-major-modes.el")
;;; (load-file "push-pop-major-modes.el")
(require 'push-pop-major-modes)

;; (blee:global:all-defaults-set)
(defun blee:global:all-defaults-set ()
  ""
  (interactive)

  (ido-mode t)

  ;; -------------------- extra nice things --------------------
  ;; use shift to move around windows
  ;;(windmove-default-keybindings 'shift)
  ;;(show-paren-mode t)
  ;; ; Turn beep off
  ;; (setq visible-bell nil)

  (message "blee:global:all-defaults-set -- Done." )
  )

(blee:global:all-defaults-set)

(provide 'blee-global)

