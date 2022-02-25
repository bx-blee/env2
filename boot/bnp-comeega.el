;;; bnp-comeega.el --- Blee Native Package: comeega  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'compile-time-function-name)
;;(require 'core-packages)
(require 'straight)
(require 'blee-lib-general)

(defvar bnp:comeega:usage:enabled-p t "Comeega package adoption control.")

;;; (bnp:comeega:full/update)
(defun bnp:comeega:full/update ()
  "Comeega package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bnp:comeega:usage:enabled-p
    (bnp:comeega:install/update)
    (bnp:comeega:config/main)
    )
  )


(defun bnp:comeega:install/update ()
  "Comeega package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; NOTYET, this should become a dblock.
  (unless blee:dev:mode?
    (straight-use-package
     '(comeega :type git :host github :repo "bx-blee/comeega")))

  (when blee:dev:mode?
    (straight-use-package
     '(comeega :local-repo "/bisos/git/bxRepos/blee/comeega")))
  )


(defun bnp:comeega:config/main ()
  "Comeega package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  )

;;;(require 'comeega)
;;;
;;; (cmnt-begin "some comment" cmnt-end)

(provide 'bnp-comeega)
;;; bnp-comeega.el ends here
