;;; 
;;; RCS: $Id: ndmt-sendmail-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

;;;
;;; sendmail menu generating function
;;;
(defun ndmt-sendmail-menu (host-sexpr)
  `("sendmail"
    ["Show Recent Activity" (ndmt-sendmail-show-mail-log ,host-sexpr nil) t]
    ["Show Ongoing Activity" (ndmt-sendmail-show-mail-log ,host-sexpr t) t]
    "-----"
    ["Show Mail Queue" (ndmt-sendmail-show-mail-queue ,host-sexpr) t]
    ["Show Mailers" (ndmt-sendmail-show-mailers ,host-sexpr) t]
    "-----"
    ["Software Revision Info" (ndmt-sendmail-revision-info) nil]
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; "Sendmail" Sub Menu

(defun ndmt-sendmail-show-mail-log (host ongoing-p)
  "Tail the sendmail mail log.  If ONGOING-P then tail -f."
  (cond (ongoing-p 
	 (ndmt-tail-f-file "/var/adm/maillog"
			   host
			   (ndmt-user)
			   (ndmt-password)
			   (ndmt-frame-params 'wide-and-short)
			   ))
	(t
	 (ndmt-tail-file "/var/adm/maillog"
			 host
			 (ndmt-user)
			 (ndmt-password)))))


(defun ndmt-sendmail-show-mail-queue (host)
  "Dired the mail queue directory."
  (ndmt-visit-file "/var/spool/mqueue"
		   host
		   (ndmt-user)
		   (ndmt-password)
		   nil
		   t))


(defun ndmt-sendmail-show-mailers (host)
  "Dired the mail queue directory."
  (ndmt-visit-file "/etc/mail/mailers"
		   host
		   (ndmt-user)
		   (ndmt-password)
		   nil
		   t))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-sendmail-lucid)
