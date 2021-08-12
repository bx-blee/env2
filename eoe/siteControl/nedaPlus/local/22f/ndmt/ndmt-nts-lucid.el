;;; 
;;; RCS: $Id: ndmt-nts-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;


;;; NTS is The Network Terminal Server

(defvar *ndmt-nts-hostname* nil
  "The NTS host currently under mgmt")

;;;(setq *ndmt-nts-hostname*   "arash.neda.com")
(setq *ndmt-nts-hostname*   "zahak.neda.com")


(defconst ndmt-nts-menu
  '("NTS Commands"
    "-----"
    ["Show Recent Activity" ndmt-nts-show-recent-activity t] 
    ["Show Ongoing Activity" ndmt-nts-show-ongoing-activity t] 
    "-----"
    ["Show nts processes (port assignments)" ndmt-nts-show-ps-status t]
    "-----"
    ["Nts Help" (ndmt-nts-help) t]
    ["Nts Software Revision Info" ndmt-nts-rev-info t]
    ))


(defun ndmt-nts-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "NTS" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "NTS" (cdr ndmt-nts-menu) "Options"))))

(defun ndmt-nts-rev-info ()
  (interactive)
  (ndmt-run-command "echo SUN Network Terminal Server at 198.62.92.19"
		    (ndmt-nts-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-nts-show-recent-activity ()
  (interactive)
  (ndmt-tail-file  "/etc/acp_logfile"
		  (ndmt-nts-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-nts-show-ongoing-activity ()
  (interactive)
  (ndmt-tail-f-file "/etc/acp_logfile"
		    (ndmt-nts-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))

(defun ndmt-nts-show-ps-status ()
  (interactive)
  (ndmt-run-command (format "/usr/bin/ps -ef | grep rtelnet")
		    (ndmt-fqdn-host (ndmt-nts-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))


(defun ndmt-nts-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message "==> NDMT NTS HELP <==

* The Xyplex (SUN) Terminal Server is at
   IP Address 198.62.92.19

The Following Ports have been assigned:

    Port1  -  
    Port2  - 	             
    Port3  - 
    Port4  -  Subscriber DialIn  - MDM-1 - TBWB 14.4  -  644-2886
    Port5  -  Subscriber DialIn  - MDM-4 - USR  28.8  -  562-5954
    Port6  -  Internal DialIn    - MDM-5 - TBWB 14.4  -  Ext 30
    Port7  -  Internal DialIn    - MDM-6 - USR  28.8  -  Ext 31
    Port8  - 
    Port9  - 
    Port10 - 
    Port11 - 
    Port12 - 
    Port13 - 
    Port14 - 
    Port15 - 
    Port16 -  PagerOut           - MDM-3 - DCE 224     - Ext 26


---------
Note that the HylaFax Modem is not through the
terminal server.

HylaFax:  zahak - MDM-2 - TBWB - Ext 25
---------

" t)
    (goto-char p1)
    (recenter 0)))




(defun ndmt-nts-host ()
  (cond ((null *ndmt-nts-hostname*)
	 (ding)
	 (setq *ndmt-nts-hostname* (call-interactively 'ndmt-nts-select-host))
	 (cond ((string-equal *ndmt-nts-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-nts-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-nts-hostname*)))
	(t *ndmt-nts-hostname*)))

(defun ndmt-nts-full-path (relative-path)
  (format "%s/%s" (ndmt-nts-basedir) relative-path))

(defun ndmt-nts-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-nts-host)))

(provide 'ndmt-nts-lucid)
