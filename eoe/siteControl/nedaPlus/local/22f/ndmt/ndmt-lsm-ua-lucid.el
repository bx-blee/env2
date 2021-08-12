;;; 
;;; RCS: $Id: ndmt-lsm-ua-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(require 'basic-ext)
(require 'ndmt-sendmail-lucid)
(require 'ndmt-lsros-lucid)
(require 'ndmt-dired-lucid)
(require 'nss-spro)

(defvar *ndmt-lsm-ua-hostname* nil
  "The UA host currently under mgmt")

(defvar *ndmt-lsm-ua-username* nil
  "The UA current user")

(defvar *ndmt-lsm-ua-known-users* nil
  "The alist of known ua users")

(defvar *ndmt-lsm-ua-test-msg-count* 0)

(defconst ndmt-lsm-ua-menu
  `("LSM-UA"
    ["Select UA Node" ndmt-lsm-ua-select-host t]
    ["Select UA User" ndmt-lsm-ua-select-user t]
    "-----"
    ["Show Status of Processes" ndmt-lsm-ua-show-ps-status t]
    ["Show Recent Activity" ndmt-lsm-ua-status t]
    ["Show Ongoing Activity" ndmt-lsm-ua-status-ongoing t]
    ["View Trace File" (ndmt-lsm-ua-view-trace) t]
    "-----"
    ["Visit UA .ini" ndmt-lsm-ua-visit-ini t]
    "-----"
    ("Manage Processes"
     ["Run `lsm-ua'" (ndmt-lsm-ua-run-lsm-ua) t]
     ["Kill `lsm-ua'" (ndmt-lsm-ua-kill-lsm-ua) t]
     "-----"
     ["Run All LSM Processes on UA Node" ndmt-lsm-ua-run-all-processes t]
     ["Kill All LSM Processes on UA Node" ndmt-lsm-ua-kill-all-processes t]
     )
    ("Manage Directories"
     ["Show Submit New" (ndmt-lsm-ua-show-submit-new) t]
     ["Show Submit Queue" (ndmt-lsm-ua-show-submit-queue) t]
     ["Show Deliver New" (ndmt-lsm-ua-show-deliver-new) t]
     ["Show Deliver Queue" (ndmt-lsm-ua-show-deliver-queue) t]
     ["Clean *All* Queues on Node" ndmt-lsm-ua-clean-all-queues t]
     "-----"
     ["Show LSM Mailboxes" (ndmt-lsm-ua-show-mbox) t]
     "-----"
     ["Show Logs" (ndmt-lsm-ua-show-logs) t]
     )
    ,(ndmt-dired-menu '(ndmt-lsm-ua-host))
    "-----"
    ["Run Mail UI (LSM Pine)" ndmt-lsm-ua-run-lsmpine t]
    "-----"
    ,(ndmt-lsros-menu '(ndmt-lsm-ua-host))
    "-----"
    ,(ndmt-sendmail-menu '(ndmt-lsm-ua-host))
    "-----"
    ("Tests"
     ["Insert 1 Canned Test Message in Submit New" (ndmt-lsm-ua-test-insert-submit-new 1) t]
     ["Insert n Canned Test Messages in Submit New" (ndmt-lsm-ua-test-insert-submit-new) t]
     ["Send 1 Canned Test Message via sendmail" (ndmt-lsm-ua-test-via-sendmail nil 1) t]
     ["Send n Canned Test Messages via sendmail" (ndmt-lsm-ua-test-via-sendmail nil nil) t]
     )
    ["LSM UA Help" ndmt-not-yet nil]
    ["Software Revision Info" (ndmt-lsm-ua-revision) t]
    ))

;;; Put the VM menu in the menubar

(defun ndmt-lsm-ua-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "LSM-UA" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "LSM-UA" (cdr ndmt-lsm-ua-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-lsm-ua-select-host (host)
  (interactive (list (read-string "Enter UA Node: "
				  (or *ndmt-lsm-ua-hostname*
				      *ndmt-lsm-mts-hostname* ; try "locality of reference"
				      (ndmt-fqdn-host (system-name))))))
  (prog1 (setq *ndmt-lsm-ua-hostname* (ndmt-fqdn-host host))
    (ndmt-log-message (format "Selected UA is now `%s'."
			      *ndmt-lsm-ua-hostname*) t)
    ;; create buffer for this host
    (ndmt-buffer-for-host host nil)
    ))

(defun ndmt-lsm-ua-select-user (user)
  (interactive (list (ndmt-lsm-ua-get-ua-user)))
  (setq *ndmt-lsm-ua-username*
	(cond ((string-equal user "")
	       (ndmt-log-message "UA user not selected." t)
	       nil)
	      (t
	       (ndmt-log-message (format "Selected UA user is now `%s'." user) t)
	       user))))

(defun ndmt-lsm-ua-status ()
  (interactive)
  (ndmt-tail-file (ndmt-lsm-ua-full-path "log/lsm-ua.trace")
		  (ndmt-lsm-ua-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-lsm-ua-status-ongoing ()
  (interactive)
  (ndmt-tail-f-file (ndmt-lsm-ua-full-path "log/lsm-ua.trace")
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)
		    (ndmt-frame-params 'wide-and-short)
		    ))

(defun ndmt-lsm-ua-show-ps-status ()
  (interactive)
  (ndmt-run-command (ndmt-lsm-ua-full-path "bin/showProcs.sh")
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)
		    ))

(defun ndmt-lsm-ua-view-trace ()
  (ndmt-view-file (ndmt-lsm-ua-full-path "log/lsm-ua.trace")
		  (ndmt-lsm-ua-host)
		  (ndmt-user)
		  (ndmt-password)))

(defun ndmt-lsm-ua-visit-ini ()
  (interactive)
  (ndmt-visit-file (ndmt-lsm-ua-full-path "config/lsm-ua.ini")
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-lsm-ua-run-lsmpine ()
  (interactive)
  (let* ((label (format "lsmpine:%s:%s" (ndmt-lsm-ua-host) (ndmt-ua-user-id)))
	 pinerc-file-name)

    (setq pinerc-file-name (expand-file-name (format "%s/results/systems/%s/pinerc/pinerc.%s"
						     (ndmt-curenvbase)
						     (ndmt-lsm-ua-host)
						     (ndmt-ua-user-id)
						     )))
    ;; maybe create pinerc for the user
    (if (not (file-exists-p pinerc-file-name))
	(let ((full-path (ndmt-lsm-ua-full-path (format "bin/pine_rc.sh %s" (ndmt-ua-user-id)))))
	  (ndmt-run-command
	   (format "csh -c 'setenv CURENVBASE %s ; cd %s ; ./%s ; exit'"
		   (ndmt-curenvbase)
		   (file-name-directory full-path)
		   (file-name-nondirectory full-path)
		   )
	   (ndmt-lsm-ua-host)
	   (ndmt-user)
	   (ndmt-password))

	  ;; wait for completion...
	  (save-window-excursion
	    (switch-to-buffer (ndmt-buffer-for-host (ndmt-lsm-ua-host) nil))
	    (while (not (looking-at comint-prompt-regexp))
	      (sleep-for 1)
	      (goto-char (point-max))
	      (beginning-of-line)))

	  ))

    ;; run the UA
    (ndmt-run-command
     (format "csh -c 'setenv CURENVBASE %s ; xterm -display %s -T %s -n %s -e %s %s ; exit'"
	     (ndmt-curenvbase)
	     (ndmt-display)
	     label
	     label
	     (ndmt-lsm-ua-full-path "bin/lsmpine.sh")
	     (ndmt-ua-user-id))
     (ndmt-lsm-ua-host)
     (ndmt-user)
     (ndmt-password)
     t)))

;;; "Manage Processes" Sub Menu

(defun ndmt-lsm-ua-kill-all-processes ()
  (interactive)
  (ndmt-run-command (ndmt-lsm-ua-full-path "bin/killAll.sh")
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-lsm-ua-run-all-processes ()
  (interactive)
  (let ((fullpath (ndmt-lsm-ua-full-path "bin/runAll.sh")))
    (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; cd %s ; ./%s ; exit'"
			      (ndmt-curenvbase)
			      (file-name-directory fullpath)
			      (file-name-nondirectory fullpath))
		      (ndmt-lsm-ua-host)
		      (ndmt-user)
		      (ndmt-password))))


(defun ndmt-lsm-ua-run-lsm-ua ()
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-ua-full-path "bin/runUaLsm.sh"))
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsm-ua-kill-lsm-ua ()
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-ua-full-path "bin/killUaLsm.sh"))
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))

;;; "Manage Spool Directories" Sub Menu

(defun ndmt-lsm-ua-show-submit-queue ()
  (interactive)
  (ndmt-visit-file (ndmt-lsm-ua-submit-queue-dir)
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-lsm-ua-show-submit-new ()
  (ndmt-visit-file (ndmt-lsm-ua-submit-new-dir)
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-lsm-ua-show-deliver-queue ()
  (ndmt-visit-file (ndmt-lsm-ua-full-path "spool/lsm-ua/deliverQueue")
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-lsm-ua-show-deliver-new ()
  (ndmt-visit-file (ndmt-lsm-ua-deliver-new-dir)
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))

(defun ndmt-lsm-ua-clean-all-queues ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-ua-full-path "bin/cleanQueues.sh"))
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-lsm-ua-show-mbox ()
  (ndmt-visit-file (ndmt-lsm-ua-submit-mbox-dir)
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-lsm-ua-show-logs ()
  (ndmt-visit-file (ndmt-lsm-ua-submit-log-dir)
		   (ndmt-lsm-ua-host)
		   (ndmt-user)
		   (ndmt-password)))


;;; "LSROS" Sub Menu

(defun ndmt-lsm-ua-lsros-show-pdu-log ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-ua-full-path "bin/lropscope.sh"))
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))

(defun ndmt-lsm-ua-lsros-show-pdu-log-interpreted ()
  (interactive)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-lsm-ua-full-path "bin/lsmscope.sh"))
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))

;;; "Tests" Sub Menu

(defun ndmt-lsm-ua-test-insert-submit-new (&optional num-copies)
  (let (buf
	test-message
	backup-files
	(to-field (ndmt-test-message-to-field))
	(from-field (ndmt-test-message-from-field))
	(count 1))

    (if (null num-copies)
	(setq num-copies (car (read-from-string (read-string "Number of copies: "
							     (format "%d" (or ndmt-test-message-previous-num-copies
									      1)))))))

    (setq ndmt-test-message-previous-num-copies num-copies)

    (while (<= count num-copies)
      (setq *ndmt-lsm-ua-test-msg-count* (+ 1 *ndmt-lsm-ua-test-msg-count*))
      (setq test-message (format "From %s@%s %s
Date: %s
From: %s
To: %s
Subject: NDMT originated Test Message %d/%d from host %s
X-Warning: UNAuthenticated Sender
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII

This is a canned message injected into the Submit New queue of the UA
by NDMT.
"
				 (user-login-name)
				 (ndmt-fqdn-domain (system-name))
				 (current-time-string)
				 (current-time-string)
				 from-field
				 to-field
				 count
				 num-copies
				 (system-name)
				 ))
      (save-window-excursion
	(setq buf (get-buffer-create " NDMT scratch"))
	(switch-to-buffer buf)
	(kill-region (point-min) (point-max))
	(insert test-message)
	(setq backup-files make-backup-files
	      make-backup-files nil)	; don't want ~ files lying around...
	(write-file (format "%s/S_%d" (ndmt-lsm-ua-submit-new-dir) *ndmt-lsm-ua-test-msg-count*))
	;; squirrel away the last copy
	(if (= count num-copies)
	    (progn
	      (write-file (format "/tmp/ndmt.msg"))
	      (message "%d test message(s) sent to \"%s\" and a copy saved in /tmp/ndmt.msg." num-copies to-field)
	      (sleep-for 1)))
	(setq make-backup-files backup-files))

      (setq count (1+ count)))
    ))


(defvar ndmt-test-message-previous-num-copies nil)

(defun ndmt-lsm-ua-test-via-sendmail (&optional to-field num-copies)
  (if (null to-field)
      (setq to-field (ndmt-test-message-to-field)))
  
  (if (null num-copies)
      (setq num-copies (car (read-from-string (read-string "Number of copies: "
							   (format "%d" (or ndmt-test-message-previous-num-copies
									    1)))))))
  (setq ndmt-test-message-previous-num-copies num-copies)

  (ndmt-lsm-ua-test-via-sendmail-internal to-field num-copies))


(defun ndmt-lsm-ua-test-via-sendmail-internal (to-field num-copies)
  (let (buf test-message backup-files msg-file-name (count 1)
	    (from-field (ndmt-test-message-from-field)))
    (setq *ndmt-lsm-ua-test-msg-count* (+ 1 *ndmt-lsm-ua-test-msg-count*))
    (while (<= count num-copies)
      (setq test-message (format "From: %s
To: %s
Subject: NDMT test %s-%s msg %d/%d
X-Warning: UNAuthenticated Sender
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII

This is a canned message sent via sendmail using NDMT.
"
				 from-field
				 to-field
				 (system-name)
				 *ndmt-lsm-ua-test-msg-count*
				 count
				 num-copies
				 ))
      (save-window-excursion
	(setq buf (get-buffer-create " NDMT scratch"))
	(switch-to-buffer buf)
	(kill-region (point-min) (point-max))
	(insert test-message)
	(setq backup-files make-backup-files
	      make-backup-files nil)	; don't want ~ files lying around...
	(setq msg-file-name (format "/tmp/ndmt-test-message.%d" count))
	(write-file msg-file-name)

	(shell-command (format "/usr/lib/sendmail -t < %s&" msg-file-name))
	(message "%s sent via sendmail." msg-file-name)
	(setq make-backup-files backup-files)
	)
      (setq count (1+ count))
      )
    ;; force mail queue processing
    (message "Forcing sendmail queue processing...")
    (sleep-for 10)
    (shell-command (format "/usr/lib/sendmail -q" msg-file-name))
    (message "%d message(s) sent to \"%s\"." num-copies to-field)
    ))


;;; Help submenu items

(defun ndmt-lsm-ua-revision ()
  (ndmt-run-command (ndmt-arch-full-path (ndmt-lsm-ua-host) "bin/lsm-ua -V")
		    (ndmt-lsm-ua-host)
		    (ndmt-user)
		    (ndmt-password)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-lsm-ua-host ()
  (cond ((null *ndmt-lsm-ua-hostname*)
	 (ding)
	 (setq *ndmt-lsm-ua-hostname* (call-interactively 'ndmt-lsm-ua-select-host))
	 (cond ((string-equal *ndmt-lsm-ua-hostname* "localhost") ; if enters "localhost", use the real name
		(setq *ndmt-lsm-ua-hostname* (ndmt-fqdn-host (system-name))))
	       (t *ndmt-lsm-ua-hostname*)))
	(t *ndmt-lsm-ua-hostname*)))


(defun ndmt-ua-user ()
  (cond ((null *ndmt-lsm-ua-username*)
	 (ding)
	 (setq *ndmt-lsm-ua-username* (call-interactively 'ndmt-lsm-ua-select-user)))
	(t *ndmt-lsm-ua-username*)))


(defun ndmt-ua-user-id ()
  (let ((user (ndmt-ua-user)))
    (substring user
	       (+ (string-match "\\[" user) 1)
	       (string-match "\\]" user))))


(defun ndmt-lsm-ua-full-path (relative-path)
  (format "%s/%s" (ndmt-lsm-ua-basedir) relative-path))


(defun ndmt-lsm-ua-basedir ()
  (format "%s/results/systems/%s" (ndmt-curenvbase) (ndmt-lsm-ua-host)))


(defun ndmt-lsm-ua-get-ua-user ()
  (let (users user)
    (save-window-excursion
      (setq users (ndmt-lsm-ua-known-ua-users)))
    (cond ((= (length users) 1)
	   (setq user (car (car users)))
	   (message "Only 1 user in lsm-ua.ini file, using that user: %s" user)
	   (sleep-for 2)
	   user)
	  (t
	   (completing-read "Enter UA user (TAB for help): " users)))))


(defun ndmt-lsm-ua-known-ua-users ()
  (let (cur-buf ini-buf curr-id curr-name p1)
    (call-interactively 'ndmt-lsm-ua-visit-ini)
    (setq *ndmt-lsm-ua-known-users* nil)
    (save-window-excursion
      (setq cur-buf (current-buffer))
      (ndmt-visit-file (ndmt-lsm-ua-full-path "config/lsm-ua.ini")
		       (ndmt-lsm-ua-host)
		       (ndmt-user)
		       (ndmt-password))
      (setq ini-buf (current-buffer)))
    (set-buffer ini-buf)
    (goto-char (point-min))
    (while (re-search-forward (format "^\\[\\(%s\\)\\]" nss-subscriber-id-regexp) nil t)
      (setq curr-id (buffer-substring (match-beginning 1) (match-end 1)))
      (setq curr-name (if (re-search-forward "Name\\(\\ \\|\t\\)+=\\ *")
			  (progn
			    (setq p1 (point))
			    (end-of-line)
			    (buffer-substring p1 (point)))
			"? Name Unknown ?"))
      (setq *ndmt-lsm-ua-known-users* (cons (list (format "%s [%s]" curr-name curr-id))
					    *ndmt-lsm-ua-known-users*)))
    *ndmt-lsm-ua-known-users*))


(defun ndmt-lsm-ua-submit-log-dir ()
  (ndmt-lsm-ua-full-path "log"))


(defun ndmt-lsm-ua-submit-mbox-dir ()
  (ndmt-lsm-ua-full-path "spool/lsm-ua/mbox"))


(defun ndmt-lsm-ua-submit-new-dir ()
  (ndmt-lsm-ua-full-path "spool/lsm-ua/submitNew"))


(defun ndmt-lsm-ua-submit-queue-dir ()
  (ndmt-lsm-ua-full-path "spool/lsm-ua/submitQueue"))


(defun ndmt-lsm-ua-deliver-new-dir ()
  (ndmt-lsm-ua-full-path "spool/lsm-ua/deliverNew"))


(defun ndmt-lsm-ua-deliver-queue-dir ()
  (ndmt-lsm-ua-full-path "spool/lsm-ua/deliverQueue"))


;;; test message from/to fields

(defvar *ndmt-test-message-previous-to-field* nil)


(defun ndmt-test-message-to-field ()
  (setq *ndmt-test-message-previous-to-field*
	(read-string "Enter `To:' field: "
		     (or *ndmt-test-message-previous-to-field*
			 (format "(NDMT Test Msg Recipient) <%s@lsm.%s>"
				 (ndmt-ua-user-id)
				 (ndmt-fqdn-domain (system-name)))))))


(defun ndmt-test-message-from-field ()
  (format "(NDMT Test Msg Originator) <%s@%s>"
	  (user-login-name)
	  (ndmt-fqdn-domain (system-name))))  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-lsm-ua-lucid)

