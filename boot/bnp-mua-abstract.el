;;; bnp-comeega.el --- Blee Native Package: mua-abstract  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'compile-time-function-name)
;;(require 'core-packages)
(require 'straight)
(require 'blee-lib-general)

(setq blee:dev:mode? t)

(defvar bnp:mua-abstract:usage:enabled-p t "Mua-Abstract package adoption control.")

;;; (bnp:mua-abstract:full/update)
(defun bnp:mua-abstract:full/update ()
  "Mua-Abstract package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bnp:mua-abstract:usage:enabled-p
    (bnp:mua-abstract:install/update)
    (bnp:mua-abstract:config/main)
    )
  )


(defun bnp:mua-abstract:install/update ()
  "Mua-Abstract package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; NOTYET, this should become a dblock.
  (unless blee:dev:mode?
    (straight-use-package
     '(mua-abstract :type git :host github :repo "bx-blee/mua-abstract")))

  (when blee:dev:mode?
    (straight-use-package
     '(mua-abstract :local-repo "/bisos/git/bxRepos/blee/mua-abstract")))
  )


(defun bnp:mua-abstract:config/main ()
  "Mua-Abstract package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  )

;;;(require 'mua-abstract)
;;;
;;; (cmnt-begin "some comment" cmnt-end)

(provide 'bnp-mua-abstract)
;;; bnp-mua-abstract.el ends here
