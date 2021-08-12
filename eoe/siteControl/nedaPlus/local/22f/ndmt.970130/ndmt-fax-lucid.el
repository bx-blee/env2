;;; 
;;; RCS: $Id: ndmt-fax-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(defvar *ndmt-fax-hostname* nil
  "The FAX host currently under mgmt")

;;;(setq *ndmt-fax-hostname*   "arash.neda.com")
(setq *ndmt-fax-hostname*   "zahak.neda.com")


(defconst ndmt-fax-menu
  '("FAX Commands"
    ["Start Fax Server" ndmt-fax-server-start t]
    ["Stop Fax Server" ndmt-fax-server-stop t]
    "-----"
    ["Fax Show Queue" ndmt-fax-queue-show t]
    ["Resubmit Fax" ndmt-fax-resubmit t]
    "-----"
    ["Show Recent Activity" ndmt-fax-show-recent-activity t] 
    ["Show Ongoing Activity" ndmt-fax-show-ongoing-activity t] 
    "-----"
    ["Send Test Fax" ndmt-fax-test-send t]
    "-----"
    ["Fax Help" ndmt-not-yet nil]
    ["Fax Software Revision Info" ndmt-fax-rev-info t]
    ))


(defun ndmt-fax-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "FAX" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "FAX" (cdr ndmt-fax-menu) "Options"))))

(defun ndmt-fax-rev-info ()
  (interactive)
  (ndmt-run-command "echo FlexFax Revision X.X with lots of local add-ons"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-server-start ()
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/etc/rc2.d/S99fax start"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-server-stop ()
  (interactive)
  ;;; Note that the start and stop arguments have not been implemented yet
  (ndmt-run-command "/etc/rc2.d/S99fax stop"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-queue-show ()
  (interactive)
  (ndmt-run-command "faxstat -a"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-resubmit ()
  (interactive)
  (ndmt-run-command "faxalter -p jobNumberFromFaxStatGoesHere"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-test-send ()
  (interactive)
  (ndmt-run-command (concat "sendfax -c \'Testing FlexFax.\' -r \'FlexFax Test.\'"
			     " -x \'Company\'"
			     " -y \'Location\' -m -d \'Some Body@5629591\'"
			     " /usr/devenv/doc/nedaCapabilityStatement/market1.ps")
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-fax-show-recent-activity ()
  (interactive)
  (ndmt-tail-file "/usr/spool/fax/etc/xferlog"
		  (ndmt-fax-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-fax-show-ongoing-activity ()
  (interactive)
  (ndmt-tail-f-file "/usr/spool/fax/etc/xferlog"
		    (ndmt-fax-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))


(defun ndmt-fax-host ()
  (cond ((null *ndmt-fax-hostname*)
	 (ding)
	 (setq *ndmt-fax-hostname* (call-interactively 'ndmt-fax-select-host))
	 (cond ((string-equal *ndmt-fax-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-fax-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-fax-hostname*)))
	(t *ndmt-fax-hostname*)))

(defun ndmt-fax-full-path (relative-path)
  (format "%s/%s" (ndmt-fax-basedir) relative-path))

(defun ndmt-fax-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-fax-host)))

(provide 'ndmt-fax-lucid)
