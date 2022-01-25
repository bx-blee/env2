;;; blee-org-msg.el --- Org-Msg Configurations  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(setq mail-user-agent 'gnus-user-agent)
;; (setq mail-user-agent 'message-user-agent)

(require 'org-msg)

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



(provide 'blee-org-msg)
;;; blee-org-msg.el ends here
