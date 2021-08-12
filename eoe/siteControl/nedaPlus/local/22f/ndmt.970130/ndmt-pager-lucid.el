;;; 
;;; RCS: $Id: ndmt-pager-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(defvar *ndmt-pager-hostname* nil
  "The PAGER host currently under mgmt")

(setq *ndmt-pager-hostname*   "zahak.neda.com")

(defconst ndmt-pager-menu
  '("PAGER Commands"
    ["Start Pager Server" ndmt-not-yet nil]
    ["Stop Pager Server" ndmt-not-yet nil]
    "-----"
    ["Pager Show Queue" (ndmt-pager-show-queue) t]
    ["Resubmit Pager" ndmt-not-yet nil]
    "-----"
    ["Show Recent Activity" ndmt-pager-show-recent-activity t] 
    ["Show Ongoing Activity" ndmt-pager-show-ongoing-activity t] 
    "-----"
    ["Send Test Page" ndmt-pager-test-send t]
    "-----"
    ["Pager Help" ndmt-not-yet nil]
    ["Software Revision Info" ndmt-pager-rev-info t]
    ))


(defun ndmt-pager-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "PAGER" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "PAGER" (cdr ndmt-pager-menu) "Options"))))

(defun ndmt-pager-rev-info ()
  (interactive)
  (ndmt-run-command "echo IXO Pager Revision X.X with lots of local add-ons"
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-pager-show-status ()
  (interactive)
  (ndmt-run-command "pagerstat -a"
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-pager-show-queue ()
  (interactive)
  (ndmt-visit-file "/var/adm/pqueue"
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)
		    nil
		    t))

(defun ndmt-pager-resubmit ()
  (interactive)
  (ndmt-run-command "NOTYET - pageralter -p jobNumberFromPagerStatGoesHere"
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-pager-test-send ()
  ;;; Would be nice if we could add a sequence number in here
  (interactive)
  (ndmt-run-command (concat "tpage -v -d 18007596366 -p 1882263" 
			     " -e mohsen@neda.com  mohsen"
			     " `date`")
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-pager-show-recent-activity ()
  (interactive)
  (ndmt-tail-file  "/var/adm/pqueue/tpage.log"
		  (ndmt-pager-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-pager-show-ongoing-activity ()
  (interactive)
  (ndmt-tail-f-file "/var/adm/pqueue/tpage.log"
		    (ndmt-pager-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))


(defun ndmt-pager-host ()
  (cond ((null *ndmt-pager-hostname*)
	 (ding)
	 (setq *ndmt-pager-hostname* (call-interactively 'ndmt-pager-select-host))
	 (cond ((string-equal *ndmt-pager-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-pager-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-pager-hostname*)))
	(t *ndmt-pager-hostname*)))

(defun ndmt-pager-full-path (relative-path)
  (format "%s/%s" (ndmt-pager-basedir) relative-path))

(defun ndmt-pager-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-pager-host)))

(provide 'ndmt-pager-lucid)
