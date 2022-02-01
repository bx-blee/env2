;;; bap-org-msg.el --- Blee Adopted Package: Org-Msg  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(setq mail-user-agent 'gnus-user-agent)
;; (setq mail-user-agent 'message-user-agent)

(require 'org-msg)


(defvar bap:org-msg:usage:enabled-p t "Org-msg package adoption control.")

(defun bap:org-msg:full/update ()
  "Org-msg package adoption full/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:org-msg:usage:enabled-p
    (bap:org-msg:install/update)
    (bap:org-msg:config/main)
    )
  )


(defun bap:org-msg:install/update ()
  "Org-msg package adoption install/update template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;; (use-package org-msg
  ;;   :ensure t
  ;;   ;;; :pin melpa-stable
  ;;   )
  )


(defun bap:org-msg:config/main ()
  "Org-msg package adoption config/mail template."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t")
  (setq org-msg-startup "hidestars indent inlineimages")

  ;; (setq org-msg-greeting-fmt "\nHi%s,\n\n")
  ;; (setq org-msg-recipient-names '(("jeremy.compostella@gmail.com" . "Jérémy")))
  ;; (setq org-msg-greeting-name-limit 3)
  ;; (setq org-msg-signature "

  ;;  Regards,

  ;;  #+begin_signature
  ;;  --
  ;;  *Mohsen*
  ;;  /One Emacs to rule them all/
  ;;  #+end_signature")


  (setq org-msg-default-alternatives '((new		. (text html))
		                       (reply-to-html	. (text html))
			               (reply-to-text	. (text))))

  (setq org-msg-convert-citation t)

  (add-to-list 'auto-mode-alist '("\\.orgMsg\\'" . org-msg-edit-mode))

  (org-msg-mode)
  )


(provide 'bap-org-msg)
;;; bap-org-msg.el ends here
