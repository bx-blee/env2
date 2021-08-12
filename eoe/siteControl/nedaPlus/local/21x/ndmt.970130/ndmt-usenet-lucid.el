;;; 
;;; RCS: $Id: ndmt-usenet-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(defvar *ndmt-usenet-hostname* "afrasiab"
  "The USENET news server currently under mgmt")


(defconst ndmt-usenet-menu
  '("USENET"
    ["Select Usenet Node" ndmt-usenet-select-host t]	
    "-----"
    ["History File Date" ndmt-usenet-show-status t]		
    ["Tail History File" ndmt-usenet-status t]	
    "-----"
    ["Visit News Feed" ndmt-usenet-visit-ini t]		
    ["Visit Subscriber Profile" ndmt-usenet-visit-subscriber-profile t] 

    ["Stop Usenet" ndmt-usenet-kill-all-processes t] 
    ["Start Usenet" ndmt-usenet-run-all-processes t]

    ["Show Submit Queue" ndmt-usenet-show-submit-queue t] 
    ["Show Submit New" ndmt-usenet-show-submit-new t] 
    ["Show Deliver Queue" ndmt-usenet-show-deliver-queue t] 
    ["Show Deliver New" ndmt-usenet-show-deliver-new t]
    ["Clean *All* Queues on Node" ndmt-usenet-clean-all-queues t]
    ))


;;; Put the VM menu in the menubar

(defun ndmt-usenet-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "USENET" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "USENET" (cdr ndmt-usenet-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-usenet-select-host (host)
  (interactive (list (read-string "Enter USENET Node: "
				  (or *ndmt-usenet-hostname*
				      *ndmt-lsm-ua-hostname* ; try "locality of reference"
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-usenet-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected USENET node is now `%s'." *ndmt-usenet-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

(defun ndmt-usenet-status ()
  (interactive)
  (ndmt-tail-file "/h4/news/history"
		  (ndmt-usenet-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-usenet-status-ongoing ()
  (interactive)
  (ndmt-tail-f-file (ndmt-usenet-full-path "log/usenet.trace")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))


(defun ndmt-usenet-visit-ini ()
  (interactive)
  (ndmt-visit-file (ndmt-usenet-full-path "config/usenet.ini")
		  (ndmt-usenet-host)
		  (ndmt-user)
		  (ndmt-password)))


(defun ndmt-usenet-visit-subscriber-profile ()
  (interactive)
  (ndmt-visit-file (ndmt-usenet-full-path (format "config/subscriber.%s" (ndmt-usenet-host)))
		   (ndmt-usenet-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-usenet-show-status ()
  (interactive)
  (ndmt-run-command "ls -l /h4/news/history"
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)
		    ))

;;; "Manage Processes" Sub Menu

(defun ndmt-usenet-kill-all-processes ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/killAll.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-run-all-processes ()
  (interactive)
  (let ((fullpath (ndmt-usenet-full-path "bin/runAll.sh")))
    (ndmt-run-command (format "setenv CURENVBASE %s ; cd %s ; ./%s"
			      (ndmt-curenvbase)
			      (file-name-directory fullpath)
			      (file-name-nondirectory fullpath))
		      (ndmt-usenet-host)
		      (ndmt-user)
		      (ndmt-password))))

(defun ndmt-usenet-run-usenet ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/runMtsLsm.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-run-lsros ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/runLsros.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

;;; "Manage Spool Directories" Sub Menu

(defun ndmt-usenet-show-submit-queue ()
  (interactive)
  (ndmt-run-command (concat "ls -lf " (ndmt-usenet-full-path "spool/usenet/submitQueue"))
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-show-submit-new ()
  (interactive)
  (ndmt-run-command (concat "ls -lf " (ndmt-usenet-full-path "spool/usenet/submitNew"))
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-show-deliver-queue ()
  (interactive)
  (ndmt-run-command (concat "ls -lf " (ndmt-usenet-full-path "spool/usenet/deliverQueue"))
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-show-deliver-new ()
  (interactive)
  (ndmt-run-command (concat "ls -lf " (ndmt-usenet-full-path "spool/usenet/deliverNew"))
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-clean-all-queues ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/cleanQueues.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

;;; "Sendmail" Sub Menu

(defun ndmt-usenet-sendmail-show-mail-log ()
  (interactive)
  (ndmt-tail-file "/var/adm/maillog"
		  (ndmt-usenet-host)
		  (ndmt-user)
		  (ndmt-password)))


;;; "LSROS" Sub Menu

(defun ndmt-usenet-lsros-show-pdu-log ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/lropscope.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-usenet-lsros-show-pdu-log-interpreted ()
  (interactive)
  (ndmt-run-command (ndmt-usenet-full-path "bin/lsmscope.sh")
		    (ndmt-usenet-host)
		    (ndmt-user)
		    (ndmt-password)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-usenet-host ()
  (cond ((null *ndmt-usenet-hostname*)
	 (ding)
	 (setq *ndmt-usenet-hostname* (call-interactively 'ndmt-usenet-select-host))
	 (cond ((string-equal *ndmt-usenet-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-usenet-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-usenet-hostname*)))
	(t *ndmt-usenet-hostname*)))

(defun ndmt-usenet-full-path (relative-path)
  (format "%s/%s" (ndmt-usenet-basedir) relative-path))

(defun ndmt-usenet-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-usenet-host)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-usenet-lucid)
