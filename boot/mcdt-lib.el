;;; mcdt-lib.el --- Mail Composition, Distribution And Tracking -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;
;;; Code:

;;(setq mail-user-agent 'gnus-user-agent)
(setq mail-user-agent 'message-user-agent)
 (require 'org-msg)
 (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
	org-msg-startup "hidestars indent inlineimages"
	org-msg-greeting-fmt "\nHi%s,\n\n"
	org-msg-recipient-names '(("jeremy.compostella@gmail.com" . "Jérémy"))
	org-msg-greeting-name-limit 3
	org-msg-default-alternatives '((new		. (text html))
				       (reply-to-html	. (text html))
				       (reply-to-text	. (text)))
	org-msg-convert-citation t
	org-msg-signature "

 Regards,

 #+begin_signature
 --
 *Mohsen*
 /One Emacs to rule them all/
 #+end_signature")
 (org-msg-mode)



(provide 'mcdt-lib)
;;; mcdt-lib.el ends here
