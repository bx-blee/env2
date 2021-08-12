; smtpmail-site.el

(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server eoe-smtp-server)
(setq smtpmail-smtp-service "smtp")
(setq smtpmail-local-domain *eoe-site-name*)
(setq smtpmail-debug-info t)
(setq smtpmail-code-conv-from nil)

			 


