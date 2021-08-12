;;; 
;;; RCS: $Id: ndmt-backup-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(defvar *ndmt-backup-tape-server* "jamshid.neda.com"
  "The system providing the tape drive used for backup.")

(defvar *ndmt-backup-fulldump-node* (ndmt-fqdn-host (system-name))
  "The system to be fully backed up.")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in "Tape Backup" Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-backup-show-config ()
  (ndmt)
  (ndmt-log-message "=== {NDMT>Tape Backup>Show Backup Configuration} ===" nil)
  (ndmt-log-message (format "System Providing Backup Tape Drive: `%s'." *ndmt-backup-tape-server*) nil)
  (ndmt-log-message (format "Nightly Tape Backup System Files found in: `%s'." (ndmt-backup-full-path "")) nil)
  (ndmt-log-message (format "System Currently Selected for Full Backup: `%s'." *ndmt-backup-fulldump-node*) nil)
  )


(defun ndmt-backup-select-tape-server (node)
  (interactive (list (read-string "Enter Tape Server: "
				  (or *ndmt-backup-tape-server*
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-backup-tape-server* (ndmt-fqdn-host node))
    (ndmt-log-message (format "Selected tape backup node is now `%s'." *ndmt-backup-tape-server*) t)
    ;; create buffer for this node
    (ndmt-buffer-for-host *ndmt-backup-tape-server* nil)
    ))



(defun ndmt-backup-select-fulldump-node (node)
  (interactive (list (read-string "Enter System to be Fully Backed Up: "
				  (or *ndmt-backup-fulldump-node*
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-backup-fulldump-node* (ndmt-fqdn-host node))
    (ndmt-log-message (format "System to be Fully Backed Up is now `%s'." *ndmt-backup-fulldump-node*) t)
    ;; create buffer for this node
    (ndmt-buffer-for-host *ndmt-backup-fulldump-node* nil)
    ))


(defun ndmt-backup-do-fulldump ()
  "Invoke the /rfulldump script on the previously specified node to be fully backed up."
  (interactive)
  (let (is-root ndmt-buffer)
    (setq ndmt-buffer (ndmt-buffer-for-host (ndmt-backup-fulldump-node)))
    ;; check for root
    (ndmt-run-command "id" (ndmt-backup-fulldump-node) (ndmt-user) nil)
    (set-buffer ndmt-buffer)
    (sleep-for 5)
    (re-search-backward shell-prompt-pattern)
    (re-search-backward shell-prompt-pattern)
    (setq is-root (search-forward "root" nil t))
    (cond ((not is-root)
	   (goto-char (point-max))
	   (ding)
	   (message "Switch to root in buffer <%s> then repeat this command."
		    ndmt-buffer))
	  (t 
	   (ndmt-run-command "/rfulldump" (ndmt-backup-fulldump-node) (ndmt-user) nil)))))


(defun ndmt-backup-show-log ()
  (ndmt-tail-file (ndmt-backup-full-path "log")
		  (ndmt-fqdn-host (ndmt-backup-tape-server))
		  (ndmt-user)
		  (ndmt-password)))



(defun ndmt-backup-run-command-on-tape-server (command &optional as-user)
  (ndmt-run-command command
		    (ndmt-fqdn-host (ndmt-backup-tape-server))
		    (or as-user (ndmt-user)) ; login as user `backup'
		    nil
		    ))


(defun ndmt-backup-view-config (config-file)
  (ndmt-visit-file (ndmt-backup-full-path config-file)
		   (ndmt-fqdn-host (ndmt-backup-tape-server))
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-backup-help ()
  (ndmt)
  (let (p1 (readme-file-name (ndmt-backup-full-path "README")))
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message (format "=== {NDMT>Tape Backup>Backup Help} ===

Backups tapes are written on a system hosting a tape drive.  It is
presently set as `%s'. There are two flavors of Tape Backup:

1.  Nightly Backups of Network File Systems.

The set of NFS shared filesystems is partitioned into several subsets
which are then sytematically backed up in consecutive fashion.  These
backups are initiated on the system hosting the backup tape drive.  It
is assumed that the NFS drives are mounted on that system.  The files
comprising this system are found in %s on the tape server system.

2.  Occasional Full System Backups.

These are backups of an entire system's filesystems in ufsdump format.
They are initiated on the system to be backed up by running the
/rfulldump script as superuser.

For more info on Tape Backup please see document titled `Solaris
Computing and Communications Environment at Neda Communications,
Inc.'.  
"
			      (ndmt-backup-tape-server)
			      (ndmt-backup-full-path "")
			      )
		      t)
    (goto-char p1)
    (recenter 0)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-backup-tape-server ()
  (cond ((null *ndmt-backup-tape-server*)
	 (ding)
	 (setq *ndmt-backup-tape-server* (call-interactively 'ndmt-backup-select-tape-server))
	 (cond ((string-equal *ndmt-backup-tape-server* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-backup-tape-server* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-backup-tape-server*)))
	(t *ndmt-backup-tape-server*)))


(defun ndmt-backup-fulldump-node ()
  (cond ((null *ndmt-backup-fulldump-node*)
	 (ding)
	 (setq *ndmt-backup-fulldump-node* (call-interactively 'ndmt-backup-select-fulldump-node))
	 (cond ((string-equal *ndmt-backup-fulldump-node* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-backup-fulldump-node* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-backup-fulldump-node*)))
	(t *ndmt-backup-fulldump-node*)))


(defun ndmt-backup-list-nth-ufsdump (n)
  (interactive "nList which ufsdump on tape [1-n]? ")
  (ndmt-run-command (format "mt -f %s:/dev/rmt/0hn rewind ;  mt -f %s:/dev/rmt/0hn fsf %d ; ufsrestore tf %s:/dev/rmt/0hn"
			    (ndmt-backup-tape-server)
			    (ndmt-backup-tape-server)
			    (1- n)
			    (ndmt-backup-tape-server))
		    (ndmt-backup-fulldump-node)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-backup-full-path (relative-path)
  (format "/h9/backup/%s" relative-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tape Backup Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst ndmt-backup-menu
  `("Tape Backup"
    ["Show Backup Configuration" (ndmt-backup-show-config) t]
    ["Select Tape Server" ndmt-backup-select-tape-server t]
    "-----"
    ("Nightly Backups"
     ["Show Recent Backup Activity" (ndmt-backup-show-log) t]
     ["List Backup Tape Contents" (ndmt-backup-run-command-on-tape-server "cat /dev/rmt/0c | cpio -imdvt") t]
     "-----"
     ["Schedule Backup (update cron job)" (ndmt-backup-run-command-on-tape-server nil "backup") t] ; just login as user `backup'
     [,(format "View Currently Scheduled Backup (%s)" (ndmt-backup-full-path "today")) (ndmt-backup-view-config "today") t]
     "-----"
     ["Reschedule Last Backup" (progn (message "Resetting backup/nextback and backup/nextseq...")
				      (ndmt-backup-run-command-on-tape-server (ndmt-backup-full-path "bad"))
				      (sleep-for 5)
				      (message "(Re)scheduling backup.")
				      (ndmt-backup-run-command-on-tape-server nil "backup")) t]
     "-----"
     ["View All Directory Sets (backdirs)" (ndmt-backup-view-config "backdirs") t]
     ["View Next Directory Set (nextback)" (ndmt-backup-view-config "nextback") t]
     ["View Previous Directory Set (lastback)" (ndmt-backup-view-config "lastback") t]
     ["View Max Directory Sets (maxseq)" (ndmt-backup-view-config "maxseq") t]
     ["View Crontab" (ndmt-visit-file "/var/spool/cron/crontabs/root" (ndmt-backup-tape-server) "root" nil nil t) t]
     "-----"
     [,(format "Dired %s" (ndmt-backup-full-path "")) (ndmt-backup-view-config "") t]
     )

    ("Full System Backup"    
     ["Select System to Backup" ndmt-backup-select-fulldump-node t]
     "-----"
     ["Show Full Backup History (/etc/dumpdates)" (ndmt-visit-file "/etc/dumpdates" (ndmt-backup-fulldump-node)
								(ndmt-user) (ndmt-password) nil t) t]
     ["Edit Full Backup Config" (progn (save-excursion
					 (ndmt-run-command "/usr/ucb/df" (ndmt-backup-fulldump-node)
							   (ndmt-user) (ndmt-password)))
				       (split-window-vertically)
				       (ndmt-visit-file "/rfulldump" (ndmt-backup-fulldump-node)
							(ndmt-user) (ndmt-password) nil t)) t]
     "-----"
     ["Do System Backup" ndmt-backup-do-fulldump t]
     "-----"
     ["Rewind Full Backup Tape" (ndmt-run-command "mt rewind" (ndmt-backup-tape-server) (ndmt-user) (ndmt-password)) t]
     ["List n-th ufsdump File on Tape" ndmt-backup-list-nth-ufsdump t]
     )
    "-----"
    ["Backup Help" (ndmt-backup-help) t]
    ))


(provide 'ndmt-backup-lucid)





