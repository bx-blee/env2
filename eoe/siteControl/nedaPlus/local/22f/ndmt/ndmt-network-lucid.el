;;;
;;; RCS: $Id: ndmt-network-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(defvar *ndmt-network-hostname* (ndmt-fqdn-host (system-name))
  "The network host currently under mgmt.")

(defconst ndmt-network-menu
  '("Network Connectivity"
    ["Select Managment Station" ndmt-network-select-host t]
    "-----"
    ["ping FR Local IP (192.207.47.22)" (ndmt-network-run-command "ping 192.207.47.22") t]
    ["ping FR Remote IP (192.207.47.1)" (ndmt-network-run-command "ping 192.207.47.1") t]
    ["ping nwfocus.wa.com" (ndmt-network-run-command "ping nwfocus.wa.com") t]
    ["ping ftp.uu.net" (ndmt-network-run-command "ping ftp.uu.net") t]
    "-----"
    ["traceroute FR Local IP (192.207.47.22)" (ndmt-network-run-command "/usr/public/networking/bin/traceroute 192.207.47.22") t]
    ["traceroute FR Remote IP (192.207.47.1)" (ndmt-network-run-command "/usr/public/networking/bin/traceroute 192.207.47.1") t]
    ["traceroute nwfocus.wa.com" (ndmt-network-run-command "/usr/public/networking/bin/traceroute nwfocus.wa.com") t]
    ["traceroute ftp.uu.net" (ndmt-network-run-command "/usr/public/networking/bin/traceroute ftp.uu.net") t]
    "-----"
    ["Network Help" (ndmt-network-help) t]
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in NETWORK Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-network-select-host (host)
  (interactive (list (read-string "Management Station Hostname: "
				  (or *ndmt-network-hostname*
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-network-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected Management Station is now `%s'." *ndmt-network-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))


(defun ndmt-network-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message "===> Help for {NDMT>Network Connectivity} <===

US West Advanced Comm.
Customer Service:      800.227.2218

NW Nexus:              800.539.3505

Frame Relay Circuit ID for Neda:       74XHGL 17252
Frame Relay Circuit ID for NW Nexus:   74HCGL 16168


 +-----------+    36      +-----------+
 |           |   <---     |           |
 |    Neda   |   DLCI     | N.W.Nexus |
 |           |   --->     |           |
 +-----------+    16      +-----------+

" t)
    (goto-char p1)
    (recenter 0)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-network-run-command (command)
  (ndmt-run-command command
		    (ndmt-fqdn-host (ndmt-network-host))
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-network-host ()
  (cond ((null *ndmt-network-hostname*)
	 (ding)
	 (setq *ndmt-network-hostname* (call-interactively 'ndmt-network-select-host))
	 (cond ((string-equal *ndmt-network-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-network-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-network-hostname*)))
	(t *ndmt-network-hostname*)))


(provide 'ndmt-network-lucid)
