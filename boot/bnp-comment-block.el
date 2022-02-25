;;; bnp-comment-block.el --- Blee Native Package: comment-block  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'compile-time-function-name)
;;(require 'core-packages)
(require 'straight)
(require 'blee-lib-general)

(defvar bnp:comment-block:usage:enabled-p t "Comment-block package adoption control.")

;;; (bnp:comment-block:full/update)
(defun bnp:comment-block:full/update ()
  "Comment-block package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bnp:comment-block:usage:enabled-p
    (bnp:comment-block:install/update)
    (bnp:comment-block:config/main)
    )
  )


(defun bnp:comment-block:install/update ()
  "Comment-block package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; NOTYET, this should become a dblock.
  (unless blee:dev:mode?
    (straight-use-package
     '(comment-block :type git :host github :repo "bx-blee/comment-block")))

  (when blee:dev:mode?
    (straight-use-package
     '(comment-block :local-repo "/bisos/git/bxRepos/blee/comment-block")))
  )


(defun bnp:comment-block:config/main ()
  "Comment-block package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  )

;;;(require 'comment-block)
;;;
;;; (cmnt-begin "some comment" cmnt-end)

(provide 'bnp-comment-block)
;;; bnp-comment-block.el ends here
