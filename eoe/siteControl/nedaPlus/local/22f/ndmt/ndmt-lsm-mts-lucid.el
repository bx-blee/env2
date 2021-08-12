;;; 
;;; RCS: $Id: ndmt-lsm-mts-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
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
    ["Show Status of Processes"   (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/showProcs.sh")) t]		
    ["Show Recent Activity" (ndmt-lsm-mts-tail-fail (ndmt-lsm-mts-full-path "log/lsm-mts.trace")) t]	
    ["Show Ongoing Activity" (ndmt-lsm-mts-tail-f-file (ndmt-lsm-mts-full-path "log/lsm-mts.trace")) t]	
    ["View Trace File" (ndmt-lsm-mts-visit-file (ndmt-lsm-mts-full-path "log/lsm-mts.trace")) t]		
    "-----"
    ["Visit MTS .ini" (ndmt-lsm-mts-visit-file (ndmt-lsm-mts-full-path "config/lsm-mts.ini")) t]		
    ["Visit Subscriber Profile" (ndmt-lsm-mts-visit-file (ndmt-lsm-mts-full-path (format "config/subscriber.%s" (ndmt-lsm-mts-host)))) t] 
    "-----"
    ("Manage Processes"
     ["Run `lsm-mts'" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/runMtsLsm.sh")) t] 
     ["Kill `lsm-mts'" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/killMtsLsm.sh")) t] 
     "-----"
     ["Run All LSM Processes on MTS Node" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/runAll.sh") t) t]
     ["Kill All LSM Processes on MTS Node" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/killAll.sh") t) t] 
     "-----"
     ["Run `watchdog.sh'" (ndmt-lsm-mts-run-watchdog) t] 
     )
    ("Manage Directories"
     ["Show Submit New"  (ndmt-lsm-mts-visit-spool-dir "submitNew") t] 
     ["Show Submit Queue" (ndmt-lsm-mts-visit-spool-dir "submitQueue") t] 
     ["Show Submit Data" (ndmt-lsm-mts-visit-spool-dir "submitData") t] 
     ["Show Submit Spool" (ndmt-lsm-mts-visit-spool-dir "submitSpool") t] 
    "-----"
     ["Show Deliver New" (ndmt-lsm-mts-visit-spool-dir "deliverNew") t]
     ["Show Deliver Queue" (ndmt-lsm-mts-visit-spool-dir "deliverQueue") t] 
     ["Show Deliver Data" (ndmt-lsm-mts-visit-spool-dir "deliverData") t] 
     ["Show Deliver Spool Recip Control" (ndmt-lsm-mts-visit-spool-dir "deliverSpool/recipControl") t] 
     ["Show Deliver Spool Recip Data" (ndmt-lsm-mts-visit-spool-dir "deliverSpool/recipData") t] 
    "-----"
     ["Trim *All* Queues on Node" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/cleanQueuesPartial.sh") t) t]
     ["Clean *All* Queues on Node" (ndmt-lsm-mts-run-command (ndmt-lsm-mts-full-path "bin/cleanQueues.sh") t) t]
     "-----"
     ["Show Logs" (ndmt-lsm-mts-visit-file (ndmt-lsm-mts-full-path "log")) t] 
     )
    ,(ndmt-dired-menu '(ndmt-lsm-mts-host))
    "-----"
    ,(ndmt-lsros-menu '(ndmt-lsm-mts-host))
    "-----"
    ,(ndmt-sendmail-menu '(ndmt-lsm-mts-host))
    "-----"
    ["LSM MTS Help" ndmt-not-yet nil]
    ["Software Revision Info" (ndmt-lsm-mts-run-command (ndmt-arch-full-path (ndmt-lsm-mts-host) "bin/lsm-mts -V")) t]
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

;;; "Manage Processes" Sub Menu

(defun ndmt-lsm-mts-run-watchdog ()
  (let* ((fullpath (ndmt-lsm-mts-full-path "bin/watchdog.sh"))
	 (basename (file-name-nondirectory fullpath)))
    (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; cd %s ; xterm -display %s %s -e ./%s ; exit'"
			      (ndmt-curenvbase)
			      (file-name-directory fullpath)
			      (ndmt-display)
			      (ndmt-basic-xterm-label-options (ndmt-lsm-mts-host) fullpath)
			      (file-name-nondirectory fullpath))
		      (ndmt-lsm-mts-host)
		      (ndmt-user)
		      (ndmt-password)
		      t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-lsm-mts-visit-spool-dir (relpath)
  (ndmt-lsm-mts-visit-file (ndmt-lsm-mts-full-path (concat "spool/lsm-mts/" relpath))))

(defun ndmt-lsm-mts-tail-f-file (file)
  (interactive)
  (ndmt-tail-f-file file
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))

(defun ndmt-lsm-mts-tail-file (file)
  (interactive)
  (ndmt-tail-file file
		  (ndmt-lsm-mts-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-lsm-mts-visit-file (path)
  (ndmt-visit-file path
		   (ndmt-lsm-mts-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-mts-run-command (cmd &optional cd-p)
  "Set `CURENVBASE' and run CMD.  If optional variable CD-P is t, then 
do a cd to the directory CMD comnd before running it."
  (ndmt-run-command (cond (cd-p 
			   (format "csh -c 'setenv CURENVBASE %s ; cd %s ; %s ; exit'"
				   (ndmt-curenvbase) (file-name-directory cmd) cmd))
			  (t 
			   (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'"
				   (ndmt-curenvbase) cmd)))
		    (ndmt-lsm-mts-host)
		    (ndmt-user)
		    (ndmt-password)))

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
