;;; 
;;; RCS: $Id: ndmt-printer-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(defvar *ndmt-printer-hostname* "arash.neda.com"
  "The Printer host currently under mgmt.")

(defconst ndmt-printer-menu
  '("Print Services (Printer)"
    ["Select Printer Host" ndmt-printer-select-host t]
    "-----"
    ["Show User Default" (ndmt-printer-show-user-default) t]
    ["Set User Default" (ndmt-printer-set-user-default) t]
    ["Set System Default" (ndmt-printer-set-system-default) t]
    "-----"
    ["Show Printer Queues" (ndmt-printer-show-queues) t]
    ["Cancel A Job" (ndmt-printer-show-log 'error t) t]
    "-----"
    ["Show Process Status" (ndmt-printer-show-ps-status) t]
    ["Start Print Server" (ndmt-printer-init.d 'start) t]
    ["Stop Print Server" (ndmt-printer-init.d 'stop) t]
    "-----"
    ["Printer Help" (ndmt-printer-help) t]
    ["Printer Info" (Info-find-node "/usr/devenv/sysadmin/printers/doc/main.info" "Top") t]
    ["Software Revision Info" (ndmt-printer-revinfo) t]
    ))

;;; Put the VM menu in the menubar

(defun ndmt-printer-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "PRINTER" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "PRINTER" (cdr ndmt-printer-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in Printer Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-printer-select-host (host)
  (interactive (list (read-string "Enter Printer Node: "
				  (or *ndmt-printer-hostname*
				      *ndmt-lsm-mts-hostname* ; maybe mts host == www host
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-printer-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected Printer node is now `%s'." *ndmt-printer-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

(defun ndmt-printer-init.d (cmd)
  "CMD is either 'start or 'stop."
  (ndmt-run-command
   (format "/etc/init.d/lp %s" cmd)
   (ndmt-printer-host)
   (ndmt-user)
   (ndmt-password)
   ))


(defun ndmt-printer-set-system-default ()
  (ndmt-run-command (format "/usr/sbin/lpadmin -d SUNprinter")
		    (ndmt-fqdn-host (ndmt-printer-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))

(defun ndmt-printer-show-user-default ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message (format "default printer is %s" (getenv "LPDEST"))
		      t)
    (goto-char p1)
    (recenter 0)))


(defun ndmt-printer-set-user-default ()
  (setenv "LPDEST" "SUNprinter1")
  )


(defun ndmt-printer-show-queues ()
  (ndmt-run-command (format "/usr/bin/lpstat -t")
		    (ndmt-fqdn-host (ndmt-printer-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))


(defun ndmt-printer-show-ps-status ()
  (ndmt-run-command (format "/usr/bin/ps -ef | grep lp | grep -v grep")
		    (ndmt-fqdn-host (ndmt-printer-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))



(defun ndmt-printer-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message "==> NDMT Printer HELP <==

Sun Print Services

SUNprinter  -- SparcPrinter E (Lexmark Optra R?)
SUNprinter1 -- SparcPrinter E Double Sided 

" t)
    (goto-char p1)
    (recenter 0)))


(defun ndmt-printer-revinfo ()
  (ndmt-run-command (format "uname -a")
		    (ndmt-fqdn-host (ndmt-printer-host))
		    (ndmt-user)
		    (ndmt-password)
		    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-printer-host ()
  (cond ((null *ndmt-printer-hostname*)
	 (ding)
	 (setq *ndmt-printer-hostname* (call-interactively 'ndmt-printer-select-host))
	 (cond ((string-equal *ndmt-printer-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-printer-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-printer-hostname*)))
	(t *ndmt-printer-hostname*)))


(provide 'ndmt-printer-lucid)
