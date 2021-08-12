;;; 
;;; RCS: $Id: ndmt-lsm-mts-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(require 'ndmt-sendmail-lucid)
(require 'ndmt-lsros-lucid)
(require 'ndmt-dired-lucid)

(defvar *ndmt-lsm-mts-hostname* nil
  "The MTS host currently under mgmt")


(defconst ndmt-lsm-mts-menu
  `("LSM-MTS"
    ["Select MTS Node" ndmt-lsm-mts-select-host t]	
    "-----"
    ["Show Status of Processes" ndmt-lsm-mts-show-ps-status t]		
    ["Show Recent Activity" ndmt-lsm-mts-status t]	
    ["Show Ongoing Activity" ndmt-lsm-mts-status-ongoing t]	
    ["View Trace File" (ndmt-lsm-mts-view-trace) t]		
    "-----"
    ["Visit MTS .ini" ndmt-lsm-mts-visit-ini t]		
    ["Visit Subscriber Profile" ndmt-lsm-mts-visit-subscriber-profile t] 
    "-----"
    ("Manage Processes"
     ["Run `lsm-mts'" ndmt-lsm-mts-run-lsm-mts t] 
     ["Kill `lsm-mts'" ndmt-lsm-mts-kill-lsm-mts t] 
     "-----"
     ["Run All LSM Processes on MTS Node" ndmt-lsm-mts-run-all-processes t]
     ["Kill All LSM Processes on MTS Node" ndmt-lsm-mts-kill-all-processes t] 
     "-----"
     ["Run `watchdog.sh'" (ndmt-lsm-mts-run-watchdog) t] 
     )
    ("Manage Directories"
     ["Show Submit New" (ndmt-lsm-mts-show-submit-new) t] 
     ["Show Submit Queue" (ndmt-lsm-mts-show-submit-queue) t] 
     ["Show Deliver New" (ndmt-lsm-mts-show-deliver-new) t]
     ["Show Deliver Queue" (ndmt-lsm-mts-show-deliver-queue) t] 
     ["Clean *All* Queues on Node" (ndmt-lsm-mts-clean-all-queues) t]
     "-----"
     ["Show Logs" (ndmt-lsm-mts-show-logs) t] 
     )
    ,(ndmt-dired-menu '(ndmt-lsm-mts-host))
    "-----"
    ,(ndmt-lsros-menu '(ndmt-lsm-mts-host))
    "-----"
    ,(ndmt-sendmail-menu '(ndmt-lsm-mts-host))
    "-----"
    ["LSM MTS Help" ndmt-not-yet nil]
    ["Software Revision Info" (ndmt-lsm-mts-revision) t]
    ))


;;; Put the VM menu in the menubar

(defun ndmt-lsm-mts-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "LSM-MTS" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "LSM-MTS" (cdr ndmt-lsm-mts-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-lsm-mts-select-host (host)
  (interactive (list (read-string "Enter MTS Node: "
				  (or *ndmt-lsm-mts-hostname*
				      *ndmt-lsm-ua-hostname* ; try "locality of reference"
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-lsm-mts-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected MTS is now `%s'." *ndmt-lsm-mts-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

(defun ndmt-lsm-mts-status ()
  (interactive)
  (ndmt-tail-file (ndmt-lsm-mts-full-path "log/lsm-mts.trace")
		  (ndmt-lsm-mts-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-lsm-mts-status-ongoing ()
  (interactive)
  (ndmt-tail-f-file (ndmt-lsm-mts-full-path "log/lsm-mts.trace")
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))


(defun ndmt-lsm-mts-view-trace ()
  (ndmt-view-file (ndmt-lsm-mts-full-path "log/lsm-mts.trace")
		  (ndmt-lsm-mts-host)
		  (ndmt-user)
		  (ndmt-password)))


(defun ndmt-lsm-mts-visit-ini ()
  (interactive)
  (ndmt-visit-file (ndmt-lsm-mts-full-path "config/lsm-mts.ini")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-visit-subscriber-profile ()
  (interactive)
  (ndmt-visit-file (ndmt-lsm-mts-full-path (format "config/subscriber.%s" (ndmt-lsm-mts-host)))
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-show-ps-status ()
  (interactive)
  (ndmt-run-command (ndmt-lsm-mts-full-path "bin/showProcs.sh")
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)
		    ))

;;; "Manage Processes" Sub Menu

(defun ndmt-lsm-mts-kill-all-processes ()
  (interactive)
  (ndmt-run-command (ndmt-lsm-mts-full-path "bin/killAll.sh")
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsm-mts-run-all-processes ()
  (interactive)
  (let ((fullpath (ndmt-lsm-mts-full-path "bin/runAll.sh")))
    (ndmt-run-command (format "setenv CURENVBASE %s ; cd %s ; ./%s"
			      (ndmt-curenvbase)
			      (file-name-directory fullpath)
			      (file-name-nondirectory fullpath))
		      (ndmt-lsm-mts-host)
		      (ndmt-user)
		      (ndmt-password))))


(defun ndmt-lsm-mts-run-lsm-mts ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-mts-full-path "bin/runMtsLsm.sh"))
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsm-mts-kill-lsm-mts ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-mts-full-path "bin/killMtsLsm.sh"))
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsm-mts-run-watchdog ()
  (let ((fullpath (ndmt-lsm-mts-full-path "bin/watchdog.sh")))
    (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; cd %s ; xterm -display %s -e ./%s ; exit'"
			      (ndmt-curenvbase)
			      (file-name-directory fullpath)
			      (ndmt-display)
			      (file-name-nondirectory fullpath))
		      (ndmt-lsm-mts-host)
		      (ndmt-user)
		      (ndmt-password)
		      t)))

;;; "Manage Spool Directories" Sub Menu

(defun ndmt-lsm-mts-show-submit-queue ()
  (ndmt-visit-file (ndmt-lsm-mts-full-path "spool/lsm-mts/submitQueue")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-show-submit-new ()
  (ndmt-visit-file (ndmt-lsm-mts-full-path "spool/lsm-mts/submitNew")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-show-deliver-queue ()
  (ndmt-visit-file (ndmt-lsm-mts-full-path "spool/lsm-mts/deliverQueue")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-show-deliver-new ()
  (ndmt-visit-file (ndmt-lsm-mts-full-path "spool/lsm-mts/deliverNew")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-clean-all-queues ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-mts-full-path "bin/cleanQueues.sh"))
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsm-mts-show-logs ()
  (ndmt-visit-file (ndmt-lsm-mts-full-path "log")
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-revision ()
  (ndmt-run-command (ndmt-arch-full-path (ndmt-lsm-mts-host) "bin/lsm-mts -V")
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-lsm-mts-host ()
  (cond ((null *ndmt-lsm-mts-hostname*)
	 (ding)
	 (setq *ndmt-lsm-mts-hostname* (call-interactively 'ndmt-lsm-mts-select-host))
	 (cond ((string-equal *ndmt-lsm-mts-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-lsm-mts-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-lsm-mts-hostname*)))
	(t *ndmt-lsm-mts-hostname*)))

(defun ndmt-lsm-mts-full-path (relative-path)
  (format "%s/%s" (ndmt-lsm-mts-basedir) relative-path))

(defun ndmt-lsm-mts-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-lsm-mts-host)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-lsm-mts-lucid)
