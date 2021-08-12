;;; 
;;; RCS: $Id: ndmt-sendmail-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
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
    ["Show Aliases" (ndmt-sendmail-show-aliases ,host-sexpr) t]
    ["Run newaliases" (ndmt-sendmail-run-newaliases ,host-sexpr) t]
    ["Run Show Queues" (ndmt-sendmail-run-showQueues ,host-sexpr) t]
    ["Run Process Queues" (ndmt-sendmail-run-processQueues ,host-sexpr) t]
    ["Start Sendmail Daemon" (ndmt-sendmail-run-startDaemon ,host-sexpr) t]
    ["Stop Sendmail Daemon" (ndmt-sendmail-run-stopDaemon ,host-sexpr) t]
    "-----"
    ["Address Debug" (ndmt-sendmail-run-addressDebug ,host-sexpr) t]
    ["LSM Mailer Debug" (ndmt-sendmail-run-mailerDebug ,host-sexpr) t]
    "-----"
    ["Software Revision Info" (ndmt-sendmail-revision-info) nil]
    ))


;;;
;;; NOTYET
;;; Facilities for support of mailing lists
;;; in a general way based on a may be a sub menu
;;; 
;;;

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


(defun ndmt-sendmail-show-aliases (host)
  "Dired the mail queue directory."
  (ndmt-visit-file "/etc/mail/aliases"
		   host
		   (ndmt-user)
		   (ndmt-password)
		   nil
		   t))

(defun ndmt-sendmail-run-newaliases (host)
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/bin/newaliases"
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-sendmail-run-showQueues (host)
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/bin/mailq"
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-sendmail-run-processQueues (host)
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/usr/lib/sendmail -q"
		    host
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-sendmail-run-mailerDebug (host)
  (interactive)
  ;;; At This point it would be good to split the screen and 
  ;;; put help in the ndmt help screen
  (ndmt-run-command "/home/arash/mohsen/tmp/lsmTest1.sh"
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-sendmail-run-startDaemon (host)
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/etc/init.d/sendmail start"
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-sendmail-run-stopDaemon (host)
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/etc/init.d/sendmail stop"
		    host
		    (ndmt-user)
		    (ndmt-password)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-sendmail-lucid)
