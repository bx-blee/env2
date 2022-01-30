;;; bap-polymode.el --- Blee Adopted Package: Polymode  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; Not Used Yet -- Farsi needs to be added
;;
;;
;;; Code:

(require 'compile-time-function-name)
(require 'polymode)

(defvar bap:polymode:usage:enabled-p t "polymode package adoption control.")

;;; (bap:polymode:full/update)
(defun bap:polymode:full/update ()
  "polymode package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:polymode:usage:enabled-p
    (bap:polymode:install/update)
    (bap:polymode:config/main)
    )
  )


(defun bap:polymode:install/update ()
  "polymode package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; (use-package polymode
  ;;   :ensure t
  ;;   ;;; :pin melpa-stable
  ;;   )
  )


(defun bap:polymode:config/main ()
  "polymode package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
)


(provide 'bap-polymode)
;;; bap-polymode.el ends here
