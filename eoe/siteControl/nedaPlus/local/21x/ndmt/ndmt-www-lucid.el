;;; 
;;; RCS: $Id: ndmt-www-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(defvar *ndmt-www-hostname* "arash.neda.com"
  "The WWW host currently under mgmt.")

(defconst ndmt-www-menu
  '("World Wide Web (WWW)"
    ["Select WWW Host" ndmt-www-select-host t]
    "-----"
    ["Show Access Activity" (ndmt-www-show-log 'access nil) t]
    ["Show Access Activity Ongoing" (ndmt-www-show-log 'access t) t]
    ["Show Access Errors" (ndmt-www-show-log 'error nil) t]
    ["Show Access Errors Ongoing" (ndmt-www-show-log 'error t) t]
    "-----"
    ["Show Process Status" (ndmt-www-show-ps-status) t]
    ["Start Web Server" (ndmt-www-init.d 'start) t]
    ["Stop Web Server" (ndmt-www-init.d 'stop) t]
    "-----"
    ["Visit access.conf" (ndmt-www-visit-config 'access) t]
    ["Visit httpd.conf" (ndmt-www-visit-config 'httpd) t]
    ["Visit srm.conf" (ndmt-www-visit-config 'srm) t]
    "-----"
    ["WWW Help" (ndmt-www-help) t]
    ["Software Revision Info" (ndmt-www-revinfo) t]
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in WWW Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-www-select-host (host)
  (interactive (list (read-string "Enter WWW Node: "
				  (or *ndmt-www-hostname*
				      *ndmt-lsm-mts-hostname* ; maybe mts host == www host
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-www-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected WWW node is now `%s'." *ndmt-www-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

(defun ndmt-www-init.d (cmd)
  "CMD is either 'start or 'stop."
  (ndmt-run-command
   (format "/etc/init.d/neda-httpd %s" cmd)
   (ndmt-www-host)
   (ndmt-user)
   (ndmt-password)
   ))


(defun ndmt-www-show-log (log-type ongoing-p)
  (cond (ongoing-p 
	 (ndmt-tail-f-file (ndmt-www-full-path (format "logs/%s_log" log-type))
			   (ndmt-fqdn-host (ndmt-www-host))
			   (ndmt-user)
			   (ndmt-password)
			   (ndmt-frame-params 'wide-and-short)
			   ))
	(t
	 (ndmt-tail-file (ndmt-www-full-path (format "logs/%s_log" log-type))
			 (ndmt-fqdn-host (ndmt-www-host))
			 (ndmt-user)
			 (ndmt-password)))))


(defun ndmt-www-show-ps-status ()
  (ndmt-run-command (format "/usr/bin/ps -ef | grep httpd | grep -v grep")
		    (ndmt-fqdn-host (ndmt-www-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))


(defun ndmt-www-visit-config (config-type)
  (ndmt-visit-file (ndmt-www-full-path (format "conf/%s.conf" config-type))
		   (ndmt-fqdn-host (ndmt-www-host))
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-www-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message "==> NDMT WWW HELP <==

Apache Web Server info & documentation

http://www.apache.org
" t)
    (goto-char p1)
    (recenter 0)))


(defun ndmt-www-revinfo ()
  (ndmt-run-command (format "%s/bin/httpd-solaris -v" (ndmt-www-base-dir))
		    (ndmt-fqdn-host (ndmt-www-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-www-host ()
  (cond ((null *ndmt-www-hostname*)
	 (ding)
	 (setq *ndmt-www-hostname* (call-interactively 'ndmt-www-select-host))
	 (cond ((string-equal *ndmt-www-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-www-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-www-hostname*)))
	(t *ndmt-www-hostname*)))

(defun ndmt-www-base-dir ()
  (format "/opt/public/networking/www/apache_1.1.3"))

(defun ndmt-www-server-root ()
  (format "%s/%s" (ndmt-www-base-dir) (ndmt-fqdn-host (ndmt-www-host))))

(defun ndmt-www-full-path (relative-path)
  (format "%s/%s" (ndmt-www-server-root) relative-path))


(provide 'ndmt-www-lucid)
