;; GNUS
;
;(require 'nntp)
;(require 'gnus)
;
;;;; -----------------------------------------------------------------
;;;; automatic PASSWORD support for NNTP AUTHINFO
;;;; -----------------------------------------------------------------
;(defvar nntp-authinfo-alist 'nil
;  "Alist of form '((<newsserver> <user> <password>) (<newsserver> <user> <password>) ...
;
;e.g.; ((\"betanews.microsoft.com\" \"149770\" \"qkf7bpw6hz4n5m\"))
;")
;
;(defun nntp-maybe-send-authinfo ()
;  "Send the auth info to the nntp server using information
;in `nntp-authinfo-alist', else do nothing."
;(ding)(ding)(ding)(ding)(ding)(ding)(ding)(ding)
;  (let (authinfo serv user pass)
;    (if (and (setq serv (nnoo-current-server 'nntp))
;	     (setq authinfo (assoc serv nntp-authinfo-alist)))
;	(progn
;	  (setq user (nth 1 authinfo))
;	  (setq pass (nth 2 authinfo))
;	  (cond ((and user pass)
;		 (message "sending AUTHINFO for %s: USER %s, PASS %s ..." serv user pass)
;		 (nntp-send-command "^.*\r?\n" "AUTHINFO USER" user)
;		 (nntp-send-command "^.*\r?\n" "AUTHINFO PASS" pass))
;		(t 
;		 (error "authinfo for %s in `nntp-authinfo-alist' is bad!" serv)))))))
;
;
;(add-hook 'nntp-server-opened-hook 'nntp-maybe-send-authinfo)
;(ding)(ding)(ding)(ding)
;
;;;; -----------------------------------------------------------------
;(provide 'gnus-ext)
