;;; 
;;; RCS: $Id: ndmt-basic-lucid.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;

(require 'vm-minibuf)			; vm-read-password
(require 'vm-summary)			; vm-read-password (indirect)
(require 'vm-misc)			; vm-read-password (indirect)
(require 'misc-lim)			; insert-time
(require 'fshell)			; (shell t)
(require 'shell-font)			; highlighting in shell mode

(require 'ndmt-lsm-mts-lucid)
(require 'ndmt-lsm-ua-lucid)
(require 'ndmt-www-lucid)
(require 'ndmt-pager-lucid)


(defconst *ndmt-default-curenvbase* "/neda/sw/curenv.sol2"
  "default curenv directory used to derive the lsm-mts-basedir")

(defvar *ndmt-curenvbase* nil
  "base directory of the MTS under mgmt")

;(defvar *ndmt-use-frames* nil "Set to t if you want to use frames")

(defvar *ndmt-tail-f-method* 'xterm "If nil, just use the primary buffer for the host.  
If 'frame create a new frame and buffer for it.
If 'xterm create an xterm for it.")

(defvar *ndmt-use-ange-ftp* nil "Set to t if ange-ftp is to be used for remote files/directories.")

(defconst *ndmt-window-types-alist*
  '((wide-and-short (width . 110) (height . 15))
    (narrow-and-short (width . 80) (height . 15))
    (narrow-and-tall (width . 80) (height . 50))
    (wide-and-tall (width . 110) (height . 50))
    (wide (width . 120))
    (tall (height . 50)))
  "to be used to pass args to make-frame")
    

(defun ndmt-frame-params (style)
  (cdr (assoc style *ndmt-window-types-alist*)))


(defconst ndmt-basic-menu
  `("NDMT"
    ["Show NDMT Configuration" ndmt-show-config t]
    "-----"
    ["Specify Other CURENVBASE" ndmt-basic-specify-curenvbase t]
    "-----"
    ["Clear Viewport" (progn (goto-char (point-max))(recenter 0)) t]
    ["Toggle Line Truncation" (setq truncate-lines (not truncate-lines))
     :style toggle :selected truncate-lines]
    ["Always Use ange-ftp for Remote Hosts" (setq *ndmt-use-ange-ftp* (not *ndmt-use-ange-ftp*))
     :style toggle :selected *ndmt-use-ange-ftp*]
    ("Method for `tail -f'"
     ["Use New `xterm'" (setq *ndmt-tail-f-method* 'xterm)
      :style radio :selected (equal *ndmt-tail-f-method* 'xterm)]
     ["Use New Buffer & Frame" (setq *ndmt-tail-f-method* 'frame)
      :style radio :selected (equal *ndmt-tail-f-method* 'frame)]
     ["Use \"*NDMT* <host>\" Buffer" (setq *ndmt-tail-f-method* 'nil)
      :style radio :selected (equal *ndmt-tail-f-method* nil)]
     )
    "-----"
    ,ndmt-www-menu
    "-----"
    ("White Pages"
     ["Lookup..." ndmt-not-yet nil]
     ["View Database" ndmt-not-yet nil]
     )
    "-----"
    ["NDMT Help" ndmt-not-yet nil]
    ))


;;; Put the menu in the menubar
(defun ndmt-basic-install-menubar ()
  "Install"
  (interactive)
  (if current-menubar
      (let ((assn (assoc "NDMT" current-menubar)))
	(cond (assn
	       ;; pulldown already exists
	       (setcdr assn (cdr ndmt-basic-menu)))
	      (t
	       ;; new 
	       (set-buffer-menubar (copy-sequence current-menubar))
	       (add-menu nil "NDMT" (cdr ndmt-basic-menu) "Options"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-show-config ()
  (interactive)
  (ndmt)
  (ndmt-log-message (format "current CURENVBASE: `%s'." (ndmt-curenvbase)) t)
  (ndmt-log-message (format "current LSM-MTS node is: `%s'." *ndmt-lsm-mts-hostname*) nil)
  (ndmt-log-message (format "current LSM-UA node is: `%s'." *ndmt-lsm-ua-hostname*) nil)
  (ndmt-log-message (format "current LSM-UA user is: `%s'." *ndmt-lsm-ua-username*) nil)
  (ndmt-log-message (format "current IVR node is: `%s'." *ndmt-ivr-hostname*) nil)
  (ndmt-log-message (format "current Pager node is: `%s'." *ndmt-pager-hostname*) nil)
  (ndmt-log-message (format "current USENET node is: `%s'." *ndmt-usenet-hostname*) nil)
  (ndmt-log-message (format "current WWW node is: `%s'." *ndmt-www-hostname*) nil)
  )


(defun ndmt-basic-specify-curenvbase (new-curenvbase)
  (interactive (list (read-directory-name (format "Specify new CURENVBASE (default should be %s): "
						  *ndmt-default-curenvbase*)
					  (or *ndmt-curenvbase* (getenv "CURENVBASE") (ndmt-curenvbase))
					  (or *ndmt-curenvbase* (getenv "CURENVBASE") (ndmt-curenvbase)))))
  (setq *ndmt-curenvbase* (ndmt-trim-trailing-slash (expand-file-name new-curenvbase)))
  
  (ndmt-basic-update-curenvbase-in-subprocesses)
  (message (format "CURENVBASE is now: `%s'." (ndmt-curenvbase)))
  (ndmt-log-message (format "CURENVBASE is now: `%s'." (ndmt-curenvbase)) t))  

  
;;; "Basic" Sub Menu

(defun ndmt-view-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to view: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))

  (ndmt-visit-file-internal filename node user password frame-params force-ange-ftp-p)
  (toggle-read-only 1))


(defun ndmt-visit-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to visit: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  (ndmt-visit-file-internal filename node user password frame-params force-ange-ftp-p))


(defun ndmt-tail-file (filename node user password &optional frame-params)
  (interactive (list (read-file-name "File to tail: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  ;; new frame
  ;; shell, rsh tail -f
  (ndmt-run-command (format "tail %s" filename) node user password nil nil nil frame-params)
  )


(defun ndmt-tail-f-file (filename node user password &optional frame-params)
  (let (command) 
    (interactive (list (read-file-name "File to tail -f: ") 
		       (read-string "Node: " "localhost")
		       (read-string "Username: " (getenv "USER"))
		       (vm-read-password "Password: ")))
    ;; new frame
    ;; shell, rsh tail -f
    (setq command (format "tail -f %s" filename))
    (cond ((equal *ndmt-tail-f-method* 'frame)
	   (ndmt-run-command command node user password nil t command frame-params))
	  ((equal *ndmt-tail-f-method* 'xterm)
	   (setq command (format "xterm -sb -sl 256 -display %s -e %s" (ndmt-display) command))
	   (ndmt-run-command command node user password t nil command frame-params))
	  ((equal *ndmt-tail-f-method* nil)
	   (ndmt-run-command command node user password nil nil command frame-params))
	  (t
	   (error "Unrecognized method for handling `tail -f': %s" *ndmt-tail-f-method*)))))


(defun ndmt-run-command (command node user password &optional backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params)
  "Runs a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  (let ((shell-buffer (ndmt-buffer-for-host node new-buffer-and-frame-p new-buffer-suffix))
	shell-buffer-window)

    ;; test that buffer has a process
    (if (null (get-buffer-process shell-buffer))
	(condition-case ()		; handle any enclosing save-window-excursions
	    (progn
	      (message "Buffer %s has no process, creating new one." shell-buffer)
	      (kill-buffer shell-buffer)
	      (sleep-for 2)
	      (ndmt-run-command command node user password backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params))
	  ()))

    ;; switch to NDMT buffer for node
    (cond (new-buffer-and-frame-p
	   (save-window-excursion
	     (switch-to-buffer shell-buffer)
	     (make-frame frame-params)
	     (setq shell-buffer-window (get-buffer-window (current-buffer)))))
	  ((setq shell-buffer-window (get-buffer-window shell-buffer))
	   ;; shell buffer already has window
	   (select-window shell-buffer-window))
	  (t
	   ;; shell buffer does not have window
	   (switch-to-buffer shell-buffer)))

    ;; interrupt any running subjob
    (ndmt-basic-maybe-interrupt-subprocess shell-buffer)

    ;; maybe use rsh if not on local node
    (if (not (or (string-equal (ndmt-fqdn-host node)
			       (ndmt-fqdn-host (system-name)))
		 (string-equal (ndmt-fqdn-host node)
			       "localhost")))
	(progn
	  (ndmt-maybe-do-xhost node)
	  (setq command (format "rsh %s \"%s\"" node command))
	  )) 

    ;; maybe in background
    (if backgroundp
	(setq command (concat command "&")))

    (save-window-excursion
      (switch-to-buffer shell-buffer)
      (goto-char (point-max))
      (insert command)
      (comint-send-input))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-basic-maybe-interrupt-subprocess (buf)
  "Interrupt any running subjob."
  (save-window-excursion
    (switch-to-buffer buf)

    ;; if not back at prompt, interrupt subjob
    (goto-char (point-max))
    (beginning-of-line)
    (if (not (looking-at comint-prompt-regexp))
	(progn
	  (comint-interrupt-subjob)
	  (sleep-for 3)
	  ))
    ;; if not back at prompt, show no mercy...
    (goto-char (point-max))
    (beginning-of-line)
    (if (not (looking-at comint-prompt-regexp))
	(progn
	  (comint-kill-subjob)
	  (sleep-for 3)
	  ))))


(defun ndmt-basic-update-curenvbase-in-subprocesses ()
  (mapcar '(lambda (buf)
	     (if (and (equal 0 (string-match *ndmt-buffer-name-prefix* (buffer-name buf))) ; an NDMT buffer...
		      (get-buffer-process buf)) ; ...with a process
		 (ndmt-basic-set-buffer-process-curenvbase buf)))
	  (buffer-list)))
  

(defun ndmt-basic-set-buffer-process-curenvbase (buf)
  (save-excursion
    (let (shell cmd)
      ;; figure out what shell is running--assume no different subshells started
      (setq shell (car (read-from-string (file-name-nondirectory (or explicit-shell-file-name
								     (getenv "ESHELL")
								     (getenv "SHELL"))))))
      (message "Setting CURENVBASE in subprocess of buffer <%s>." (buffer-name buf))
      (set-buffer buf)
      (ndmt-basic-maybe-interrupt-subprocess buf)
      (cond ((equal shell 'csh)
	     (setq cmd (format "setenv CURENVBASE %s" (ndmt-curenvbase))))
	    (t
	     ;; assume bourne, ksh compatible
	     (setq cmd (format "CURENVBASE=%s; export CURENVBASE" (ndmt-curenvbase)))))
      (goto-char (point-max))
      (insert cmd)
      (comint-send-input)
      (sleep-for 1)
      (goto-char (point-max))
      )
    ))


(defun ndmt-visit-file-internal (filename node user password &optional frame-params force-ange-ftp-p)
  (let ((use-ange-ftp *ndmt-use-ange-ftp*)
	file-buf)
    (unwind-protect
	(progn
	  (if force-ange-ftp-p (setq *ndmt-use-ange-ftp* t))

	  ;; maybe build an ange-ftp filename
	  (setq filename (ndmt-basic-maybe-ange-ftpize-filename filename node user))

	  (setq file-buf (find-file-noselect filename))
	  (switch-to-buffer file-buf)
	  (ndmt-install-menus)

	  ;; do a refresh unless buffer is modified, directories always refreshed
	  (cond ((file-directory-p filename)
		 (revert-buffer))
		((buffer-modified-p file-buf)
		 (message "Buffer modified, not rereading from disk.")
		 (sleep-for 2))
		(t 
		 (revert-buffer nil t))))
      (setq *ndmt-use-ange-ftp* use-ange-ftp))
    file-buf
    ))


(defun ndmt-basic-maybe-ange-ftpize-filename (filename node user)
  (cond ((or (null *ndmt-use-ange-ftp*)
	     (string-equal node (ndmt-host)))
	 filename)
	(t (format "/%s@%s:%s" user node filename))))

(defvar *ndmt-host* nil
  "Name of the machine that ndmt is running on.")

(defun ndmt-host ()
  (cond ((null *ndmt-host*)
	 (setq *ndmt-host* (ndmt-fqdn-host (system-name))))
	(t *ndmt-host*)))

(defvar *ndmt-user* nil "MTS user")

(defun ndmt-user ()
  (cond ((null *ndmt-user*)
	 (setq *ndmt-user* (or (user-login-name) ; for now...
			       (read-string "Username: " (getenv "USER")))))
	(t *ndmt-user*)))

(defvar *ndmt-password* nil "MTS user password")

(defun ndmt-password ()
  (cond ((null *ndmt-password*)
	 (setq *ndmt-password* (or "nopasswordfornow"
				   (vm-read-password "Password: "))))
	(t *ndmt-password*)))

(defun ndmt-not-yet ()
  (interactive "")
  (while (> arg 0)
    (ding)
    (setq arg (- arg 1)))
  (message "Not yet implemented."))


(defun ndmt-fqdn-host (fqdn)
  (car (chop-string fqdn "\\.")))


(defun ndmt-trim-trailing-slash (dirname)
  (if (string-equal "/" (substring dirname (- (length dirname) 1)))
      (substring dirname 0 (- (length dirname) 1))
    dirname))


(defun ndmt-buffer-for-host (host &optional new-buffer-p new-buffer-name-suffix)
  (let* ((base-buffer-name (format "%s %s" *ndmt-buffer-name-prefix* host))
	 (base-buffer (get-buffer base-buffer-name)))
    (save-window-excursion
      ;; always make sure the base buffer exists
      (if (null base-buffer)
	  (progn
	    (setq base-buffer (shell t)) ; create new shell
	    (sleep-for 3)		; give time for the shell process to start...
	    (rename-buffer base-buffer-name)
	    (ndmt-setup-host-buffer (current-buffer))
	    (message "Base buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	    (current-buffer)
	    ))
      ;; if new-buffer-p, create a new one, else return the base buffer
      (cond (new-buffer-p
	     (shell t)
	     (sleep-for 3)
	     (rename-buffer (generate-new-buffer-name (format "%s [%s]" base-buffer-name
							      new-buffer-name-suffix)))
	     (ndmt-setup-host-buffer (current-buffer))
	     (message "New buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	     (current-buffer))
	    (t base-buffer)))))


(defun ndmt-setup-host-buffer (buffer)
  (save-window-excursion
    (switch-to-buffer buffer)
    (set-buffer-menubar default-menubar)
    (setq truncate-lines nil)		; wrap by default
    (ndmt-install-menus)
    (ndmt-basic-set-buffer-process-curenvbase buffer)
    (goto-char (point-max))
    ))


(defun ndmt-main-buffer ()
  (let ((buf (get-buffer *ndmt-buffer-name-prefix*)))
    (cond (buf buf)
	  (t (prog1 (setq buf (get-buffer-create *ndmt-buffer-name-prefix*))
	       (save-excursion
		 (switch-to-buffer buf)
		 (set-buffer-menubar default-menubar)
		 (ndmt-install-menus)
		 (insert (format
			  "Welcome to Neda Domain Managment Tool (NDMT) Version %s.
Please send bug reports to Pean Lim <pean@neda.com>.

Please select an MTS node from the [LSM-MTS] pull-down menu 
and/or a UA node from the [LSM-UA] pull-down menu.

"
			  *ndmt-version*))
		 ))))))


(defun ndmt-log-message (msg &optional insert-blank-line-p)
  (save-window-excursion
    (switch-to-buffer (ndmt-main-buffer))
    (goto-char (point-max))
    (if insert-blank-line-p (insert "\n"))
    (insert-time)
    (insert (format ": %s\n" msg))))


(defvar *ndmt-xhosted-list* nil "list of hosts that have been 'xhost +'-ed")


(defun ndmt-maybe-do-xhost (host)
  (cond ((member host *ndmt-xhosted-list*) nil)
	(t
	 (shell-command (format "xhost + %s" host))
	 (setq *ndmt-xhosted-list* (cons host *ndmt-xhosted-list*)))))

    
(defun ndmt-curenvbase-full-path (rel-path)
  (expand-file-name (format "%s/%s" (ndmt-curenvbase) rel-path)))


(defun ndmt-system-full-path (system rel-path)
  (expand-file-name (format "%s/results/systems/%s/%s"
			    (ndmt-curenvbase) system rel-path)))


(defun ndmt-arch-full-path (system rel-path)
  (expand-file-name (format "%s/results/arch/%s/%s"
 			    (ndmt-curenvbase)
			    (ndmt-system-arch system)
			    rel-path)))


(defun ndmt-system-arch (system)
  (let (result)
    (setq result (call-process-result (format "rsh %s arch" system)))
    (if (consp result)
	(car result)
      (error "Could not determine architecture of host %s" system))))


(defun ndmt-display ()
  "Figure out the proper X server to use."
  (let* ((display (or (getenv "DISPLAY") ":0.0"))
	 (display-host (substring display 0 (string-match ":" display))))
    (cond ((not (string-equal display-host "")) 
	   display)
	  (t (format "%s:0" (system-name))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ndmt-basic-lucid)
