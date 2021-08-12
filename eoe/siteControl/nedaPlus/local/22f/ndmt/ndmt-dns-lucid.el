;;; 
;;; RCS: $Id: ndmt-dns-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(require 'ndmt-dired-lucid)

(defvar *ndmt-dns-hostname* "rostam"
  "The DNS Server currently under mgmt.")


(defconst ndmt-dns-menu
  `("DNS"
    ["Select DNS Server" ndmt-dns-select-host t]
    "-----"
    ["Visit /etc/resolv.conf on DNS Server" (ndmt-dns-visit-file "/etc/resolv.conf") t]
    ["Visit /etc/resolv.conf on localhost" (ndmt-dns-visit-file "/etc/resolv.conf" (ndmt-fqdn-host (system-name))) t]
    "-----"
    ["nslookup main-router.neda.com" (ndmt-dns-run-command (concat "nslookup main-router.neda.com " *ndmt-dns-hostname*)) t]
    ["nslookup ftp.uu.net" (ndmt-dns-run-command "nslookup ftp.uu.net") t]
    ["nslookup neda.com (ls)" (progn (ndmt-dns-run-command (concat "nslookup - " *ndmt-dns-hostname*))
				     (ndmt-dns-run-command "ls neda.com")
				     (ndmt-network-run-command "exit")) t]
    "-----"
    ["DNS Help" (ndmt-dns-help) t]
    ))


;;; Put the VM menu in the menubar

(defun ndmt-dns-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "DNS" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "DNS" (cdr ndmt-dns-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in DNS Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-dns-select-host (host)
  (interactive (list (read-string "Enter DNS Node: "
				  (or *ndmt-dns-hostname*
				      *ndmt-lsm-mts-hostname* ; maybe mts host == ivr host
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-dns-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected DNS node is now `%s'." *ndmt-dns-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

;;; -----------------------------------------------------------------
;;; Helper Functions
;;; -----------------------------------------------------------------

(defun ndmt-dns-run-command (command &optional host user password)
  (ndmt-run-command command
		    (or host (ndmt-dns-host))
		    (or user (ndmt-user))
		    (or password (ndmt-password))
		    ))

(defun ndmt-dns-visit-file (file-name &optional host user password)
  (ndmt-visit-file file-name
		   (or host (ndmt-dns-host))
		   (or user (ndmt-user))
		   (or password (ndmt-password))
		   nil t))

(defun ndmt-dns-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message (format "===> Help for {DNS} <===

DNS Server currently selected is %s.

"
(ndmt-dns-host)) t)
    (goto-char p1)
    (recenter 0)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-dns-host ()
  (cond ((null *ndmt-dns-hostname*)
	 (ding)
	 (setq *ndmt-dns-hostname* (call-interactively 'ndmt-dns-select-host))
	 (cond ((string-equal *ndmt-dns-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-dns-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-dns-hostname*)))
	(t *ndmt-dns-hostname*)))


(provide 'ndmt-dns-lucid)
