;;; 
;;; RCS: $Id: ndmt-ivr-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(require 'ndmt-dired-lucid)

(defvar *ndmt-ivr-hostname* "sudabeh"
  "The IVR host currently under mgmt.")


(defconst ndmt-ivr-menu
  `("IVR"
    ["Select IVR Host" ndmt-ivr-select-host t]
    "-----"
    ("D4x Line 1"
     ["Show Recent Activity" (ndmt-ivr-show-status 1) t]
     ["Show Ongoing Activity" (ndmt-ivr-show-status-ongoing 1) t]
     "-----"
     ["Show IVR Process Status" (ndmt-ivr-show-ps-status 1) t]
     ["Run IVR Process" (ndmt-ivr-run 1) t]
     ["SIGUSR1 IVR Process" (ndmt-ivr-signal 1 "-USR1") t]
     ["Kill IVR Process" (ndmt-ivr-signal 1) t]
     "-----"
     ["View IVR Trace File" (ndmt-ivr-view-trace 1) t]
     )
    ("D4x Line 2"
     ["Show Recent Activity" (ndmt-ivr-show-status 2) t]
     ["Show Ongoing Activity" (ndmt-ivr-show-status-ongoing 2) t]
     "-----"
     ["Show IVR Process Status" (ndmt-ivr-show-ps-status 2) t]
     ["Run IVR Process" (ndmt-ivr-run 2) t]
     ["SIGUSR1 IVR Process" (ndmt-ivr-signal 2  "-USR1") t]
     ["Kill IVR Process" (ndmt-ivr-signal 2) t]
     "-----"
     ["View IVR Trace File" (ndmt-ivr-view-trace 2) t]
     )
    ("D4x Line 3"
     ["Show Recent Activity" (ndmt-ivr-show-status 3) t]
     ["Show Ongoing Activity" (ndmt-ivr-show-status-ongoing 3) t]
     "-----"
     ["Show IVR Process Status" (ndmt-ivr-show-ps-status 3) t]
     ["Run IVR Process" (ndmt-ivr-run 3) t]
     ["SIGUSR1 IVR Process" (ndmt-ivr-signal 3 "-USR1") t]
     ["Kill IVR Process" (ndmt-ivr-signal 3) t]
     "-----"
     ["View IVR Trace File" (ndmt-ivr-view-trace 3) t]
     )
    ("D4x Line 4"
     ["Show Recent Activity" (ndmt-ivr-show-status 4) t]
     ["Show Ongoing Activity" (ndmt-ivr-show-status-ongoing 4) t]
     "-----"
     ["Show IVR Process Status" (ndmt-ivr-show-ps-status 4) t]
     ["Run IVR Process" (ndmt-ivr-run 4) t]
     ["SIGUSR1 IVR Process" (ndmt-ivr-signal 4 "-USR1") t]
     ["Kill IVR Process" (ndmt-ivr-signal 4) t]
     "-----"
     ["View IVR Trace File" (ndmt-ivr-view-trace 4) t]
     )
    "-----"
    ["Visit IVR .ini" (ndmt-ivr-visit-ini) t]
    ["Visit Subscriber Profile" (ndmt-ivr-visit-subscriber-profile) t]
    "-----"
    ,(ndmt-dired-menu '(ndmt-ivr-host))
    "-----"
    ,(ndmt-sendmail-menu '(ndmt-ivr-host))
    "-----"
    ["IVR Help" (ndmt-ivr-help) t]
    ["Software Revision Info" (ndmt-ivr-revision) t]
    ))


;;; Put the VM menu in the menubar

(defun ndmt-ivr-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "IVR" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "IVR" (cdr ndmt-ivr-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in IVR Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-ivr-select-host (host)
  (interactive (list (read-string "Enter IVR Node: "
				  (or *ndmt-ivr-hostname*
				      *ndmt-lsm-mts-hostname* ; maybe mts host == ivr host
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-ivr-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected IVR node is now `%s'." *ndmt-ivr-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

;;; D4x Sub Menus

(defun ndmt-ivr-run (line)
  (ndmt-run-command
   (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
	   (ndmt-ivr-full-path (format "bin/runIvrmsg.sh %d" line)))
   (ndmt-ivr-host)
   (ndmt-user)
   (ndmt-password)
   ))


(defun ndmt-ivr-signal (line &optional signal)
  (if (null signal) 
      (setq signal ""))
  (ndmt-run-command
   (format "/usr/bin/ps -ef | grep ivrmsg | egrep \\(-p\\ %d\\) | /bin/tr -s ' ' | cut -f 3 -d ' ' | xargs kill %s"
	   line signal)
   (ndmt-ivr-host)
   (ndmt-user)
   (ndmt-password)
   ))


(defun ndmt-ivr-show-status (line)
  (ndmt-tail-file (ndmt-ivr-full-path (format "log/ivrmsg-%d.trace" line))
		  (ndmt-ivr-host)
		  (ndmt-user)
		  (ndmt-password)))


(defun ndmt-ivr-show-status-ongoing (line)
  (ndmt-tail-f-file (ndmt-ivr-full-path (format "log/ivrmsg-%d.trace" line))
		    (ndmt-ivr-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))


(defun ndmt-ivr-show-ps-status (line)
  (ndmt-run-command (format "/usr/bin/ps -ef | grep ivrmsg | egrep \\(-p\\ %d\\)" line)
		    (ndmt-ivr-host)
		    (ndmt-user)
		    (ndmt-password)
		    ))


(defun ndmt-ivr-view-trace (line)
  (ndmt-view-file (ndmt-ivr-full-path (format "log/ivrmsg-%d.trace" line))
		  (ndmt-ivr-host)
		  (ndmt-user)
		  (ndmt-password)))


(defun ndmt-ivr-visit-ini ()
  (ndmt-visit-file (ndmt-ivr-full-path "config/ivrmsg.ini")
		   (ndmt-ivr-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-ivr-visit-subscriber-profile ()
  (ndmt-visit-file (ndmt-ivr-full-path (format "config/subscriber.%s" (ndmt-ivr-host)))
		   (ndmt-ivr-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-ivr-help ()
  (ndmt)
  (let (p1)
    (goto-char (point-max))
    (setq p1 (point))
    (ndmt-log-message "==> NDMT IVR HELP <==

* IVR External Phone Number:  +1 206 644 2972
	Immediate Ring on Ext 28
	Delayed Ring on Ext 29

  Line 1: Ext 28
  Line 2: Ext 29
  Line 3: Ext 30
  Line 4: Ext 31
	             


Subscriber ID  format: <Sub-Address Type><Sub-Address Value>
-------------
  where <Sub-Address Type>::= 1   // Neda Msg. Center Subscriber Identifier
			      3   // Subscriber's International Phone Number
			      4   // Subscriber's NANP Phone Number
  EXAMPLES:

   1-201-001 	      // person with Neda Msg Center Subscriber ID 201.001 
   4-206-644-8026     // person with NANP Phone Number (206) 644 8026

Recipient ID  format: <Sub-Address Type><Sub-Address Value><Access Unit Selector>
------------
  where <Access Unit Selector> ::= 0   // via recipient's default address
                                   1   // via recipient's email address
				   2   // via recipient's Fax address
				   3   // via recipient's Pager address
				   5   // via recipient's LSM address
				   7   // via recipient's PocketNet address
				   8   // via recipient's SMS address
                                   9   // via all valid addresses for recipient

  EXAMPLES:

   1-201-002-1				// via email
   4-206-644-8026-1			// via email
   1-201-002-2				// via fax
   4-206-644-8026-7			// via PocketNet
   4-206-644-8026-9			// via all hailing frequencies...
" t)
    (goto-char p1)
    (recenter 0)))


(defun ndmt-ivr-revision ()
  (ndmt-run-command (ndmt-arch-full-path (ndmt-ivr-host) "bin/ivrmsg -V")
		    (ndmt-ivr-host)
		    (ndmt-user)
		    (ndmt-password)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-ivr-host ()
  (cond ((null *ndmt-ivr-hostname*)
	 (ding)
	 (setq *ndmt-ivr-hostname* (call-interactively 'ndmt-ivr-select-host))
	 (cond ((string-equal *ndmt-ivr-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-ivr-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-ivr-hostname*)))
	(t *ndmt-ivr-hostname*)))

(defun ndmt-ivr-full-path (relative-path)
  (format "%s/%s" (ndmt-ivr-basedir) relative-path))

(defun ndmt-ivr-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-ivr-host)))


(provide 'ndmt-ivr-lucid)
