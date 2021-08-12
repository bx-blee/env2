;;; 
;;; RCS: $Id: ndmt-nts-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
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
    ["Send Test Nts" ndmt-nts-test-send nil]
    "-----"
    ["Nts Help" ndmt-not-yet nil]
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
