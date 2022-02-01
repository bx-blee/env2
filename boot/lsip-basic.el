;;; 
;;; RCS: $Id: lsip-basic.el,v 1.10 2016-02-07 02:39:18 lsipusr Exp $
;;;

;;(require 'misc-lim)			; insert-time
;;(require 'fshell)			; (shell t)
;;(require 'shell-font)			; highlighting in shell mode


(defvar *lsip-version* "$Revision: 1.10 $")

(defvar *lsip-buffer-name-prefix* "*LSIP*")


(defconst *lsip-default-curenvbase* "/neda/sw/curenv.sol2"
  "default curenv directory used to derive the lsm-mts-basedir")

(defvar *lsip-curenvbase* nil
  "base directory of the MTS under mgmt")

(defvar *lsip-tail-f-method* 'xterm "If nil, just use the primary buffer for the host.  
If 'frame create a new frame and buffer for it.
If 'xterm create an xterm for it.")

(defvar *lsip-use-ange-ftp* nil "Set to t if ange-ftp is to be used for remote files/directories.")

(defvar lsip-local-run-command-window 2 "Window Position After Runing Command")

(defconst *lsip-window-types-alist*
  '((wide-and-short (width . 110) (height . 15))
    (narrow-and-short (width . 80) (height . 15))
    (narrow-and-tall (width . 80) (height . 50))
    (wide-and-tall (width . 110) (height . 50))
    (wide (width . 120))
    (tall (height . 50)))
  "to be used to pass args to make-frame")
    

(defun lsip-frame-params (style)
  (cdr (assoc style *lsip-window-types-alist*)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;; LSIP "Basic" Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; lsip-view-file

(defun lsip-view-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to view: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (read-string "Password: ")))

  (lsip-visit-file-internal filename node user password frame-params force-ange-ftp-p)
  (toggle-read-only 1))


;;; lsip-visit-file

(defun lsip-visit-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to visit: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (read-string "Password: ")))
  (lsip-visit-file-internal filename node user password frame-params force-ange-ftp-p))


;;; lsip-tail-file

(defun lsip-tail-file (filename node user password &optional frame-params)
  (interactive (list (read-file-name "File to tail: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (read-string "Password: ")))
  ;; new frame
  ;; shell, rsh tail 
  (lsip-run-command (format "tail -80 %s" filename) node user password nil nil nil frame-params)
  )


;;; lsip-tail-f-file

(defun lsip-tail-f-file (filename node user password &optional frame-params)
  (interactive (list (read-file-name "File to tail -f: ") 
		       (read-string "Node: " "localhost")
		       (read-string "Username: " (getenv "USER"))
		       (read-string "Password: "))
		 )
  (let (command) 
    
    ;; new frame
    ;; shell, rsh tail -f
    (setq command (format "tail -80f %s" filename))
    (cond ((equal *lsip-tail-f-method* 'frame)
	   (lsip-run-command command node user password nil t command frame-params))
	  ((equal *lsip-tail-f-method* 'xterm)
	   (setq command (format "xterm -sb -sl 256 -display %s %s -e %s"
				 (lsip-display)
				 (lsip-basic-xterm-label-options node filename)
				 command))
	   (lsip-run-command command node user password t nil command frame-params))
	  ((equal *lsip-tail-f-method* nil)
	   (lsip-run-command command node user password nil nil command frame-params))
	  (t
	   (error "Unrecognized method for handling `tail -f': %s" *lsip-tail-f-method*)))))


;;; lsip-run-command

;;; (lsip-run-command "date" "localhost" (user-login-name) "nopasswd")
;;; (lsip-run-command "ssh 192.168.0.181 bash -i" "192.168.0.181" (user-login-name) "nopasswd")
;;; (lsip-run-command "hostname" "192.168.0.181" (user-login-name) "nopasswd")
;;; (lsip-run-command "date" "192.168.0.181" (user-login-name) "nopasswd")

(defun lsip-run-command (command node user password &optional backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params)
  "Runs a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (read-string "Password: ")))
  (let ((shell-buffer (lsip-buffer-for-host node new-buffer-and-frame-p new-buffer-suffix))
	(switch-user-p (not (string-equal (lsip-user) user)))
	shell-buffer-window)


    ;; test that buffer has a process
    (if (null (get-buffer-process shell-buffer))
	(condition-case ()		; handle any enclosing save-window-excursions
	    (progn
	      (message "Buffer %s has no process, creating new one." shell-buffer)
	      (kill-buffer shell-buffer)
	      (sleep-for 2)
	      (lsip-run-command command node user password backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params))
	  ()))

    ;; switch to LSIP buffer for node
    (cond (new-buffer-and-frame-p
	   (save-window-excursion
	     (switch-to-buffer shell-buffer)
	     (make-frame frame-params)
	     (setq shell-buffer-window (get-buffer-window (current-buffer)))))
	  ((setq shell-buffer-window (get-buffer-window shell-buffer))
	   ;; shell buffer already has window
	   (select-window shell-buffer-window)
	   )
	  (t
	   ;; shell buffer does not have window
	   (switch-to-buffer shell-buffer)))

    ;; interrupt any running subjob
    (lsip-basic-maybe-interrupt-subprocess shell-buffer)

    ;; modify command to use rsh if not on local node or if switching user is specified
    (if (or (not (or (string-equal (lsip-fqdn-host node) (lsip-fqdn-host (system-name)))
		     (string-equal (lsip-fqdn-host node) "localhost")))
	    switch-user-p)
	(progn
	  (lsip-maybe-do-xhost node)
;;; 	  (setq command (format "rsh %s%s %s"
;;; 				(if switch-user-p (format "-l %s " user) "")
;;; 				node
;;; 				(if command (format "\"%s\"" command) "")))
;;; 	  (setq command (format "ssh %s%s %s"
;;; 				(if switch-user-p (format "%s@" user) "")
;;; 				node
;;; 				(if command (format "\"%s\"" command) "")))
		))

    ;; modify command to run in background if specified.
    (if backgroundp
	(setq command (concat command " &")))

    ;; do command
    (save-window-excursion
      (switch-to-buffer shell-buffer)
      (goto-char (point-max))
      (insert command)
      (comint-send-input)
      ;;(comint-goto-process-mark)
      ;;(recenter-top-bottom)
      (goto-char (point-max))
      )
    )
  )

(defun lsip-run-command-here (command node user password &optional backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params)
  "Runs a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (read-string "Password: ")))
  (let ((shell-buffer (lsip-buffer-for-host node new-buffer-and-frame-p new-buffer-suffix))
	(current-default-directory default-directory)
	(switch-user-p (not (string-equal (lsip-user) user)))
	shell-buffer-window)

    ;; test that buffer has a process
    (if (null (get-buffer-process shell-buffer))
	(condition-case ()		; handle any enclosing save-window-excursions
	    (progn
	      (message "Buffer %s has no process, creating new one." shell-buffer)
	      (kill-buffer shell-buffer)
	      (sleep-for 2)
	      (lsip-run-command command node user password backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params))
	  ()))

    ;; switch to LSIP buffer for node
    (cond (new-buffer-and-frame-p
	   (save-window-excursion
	     (switch-to-buffer shell-buffer)
	     (make-frame frame-params)
	     (setq shell-buffer-window (get-buffer-window (current-buffer)))))
	  ((setq shell-buffer-window (get-buffer-window shell-buffer))
	   ;; shell buffer already has window
	   (select-window shell-buffer-window)
	   )
	  (t
	   ;; shell buffer does not have window
	   (switch-to-buffer shell-buffer)))

    ;; interrupt any running subjob
    (lsip-basic-maybe-interrupt-subprocess shell-buffer)

    ;; modify command to use rsh if not on local node or if switching user is specified
    (if (or (not (or (string-equal (lsip-fqdn-host node) (lsip-fqdn-host (system-name)))
		     (string-equal (lsip-fqdn-host node) "localhost")))
	    switch-user-p)
	(progn
	  (lsip-maybe-do-xhost node)
		))

    ;; modify command to run in background if specified.
    (if backgroundp
	(setq command (concat command " &")))

    ;; So that emacs-client can hit this emacs
    (bx:server-running-ensure)
    
    ;; do command
    (save-window-excursion
      (switch-to-buffer shell-buffer)
      (if (not (equal current-default-directory default-directory))
	  (progn
	    (goto-char (point-max))
	    (insert (format "pushd %s\n" current-default-directory))
	    (comint-send-input)
	    (sleep-for 1)			; give process-send-string some time
	    (cd current-default-directory) ; set for the buffer as well
	    )
	)
      (goto-char (point-max))
      (insert command)
      (comint-send-input)
      ;;(comint-goto-process-mark)
      ;;(recenter-top-bottom)
      (goto-char (point-max))
      )
    )
  )


;;; (lsip-local-run-command "date")
;;;
(defun lsip-local-run-command (command)
  "On Local HostRuns a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ")))
  (save-window-excursion
    (lsip-run-command 
     command
     "localhost"
     (user-login-name)
     "nopasswd")
    )
  ;;
  ;; There should be a better way to do this instead of scrolling
  ;; This is there for split-windows to work better (not right)
  ;; (ignore-errors (end-of-buffer-other-window))
  (ignore-errors (scroll-other-window))

  (when (eq lsip-local-run-command-window 1)
    (blee:bnsm:results-here)
    )
  (when (eq lsip-local-run-command-window 2)
    (delete-other-windows)
    (split-window-below)
    (other-window 1)
    (blee:bnsm:results-here)
    )
  (when (eq lsip-local-run-command-window 3)
    (delete-other-windows)
    (split-window-right)
    (other-window 1)
    (blee:bnsm:results-here)
    )
  )

;;; (lsip-local-run-command-here "pwd")
;;;
(defun lsip-local-run-command-here (command)
  "On Local HostRuns a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ")))
  (save-window-excursion
    (lsip-run-command-here
     command
     "localhost"
     (user-login-name)
     "nopasswd")
    )
  ;;
  ;; There should be a better way to do this instead of scrolling
  ;; This is there for split-windows to work better (not right)
  ;; (ignore-errors (end-of-buffer-other-window))
  (ignore-errors (scroll-other-window))

  (when (eq lsip-local-run-command-window 1)
    (blee:bnsm:results-here)
    )
  (when (eq lsip-local-run-command-window 2)
    (delete-other-windows)
    (split-window-below)
    (other-window 1)
    (blee:bnsm:results-here)
    )
  (when (eq lsip-local-run-command-window 3)
    (delete-other-windows)
    (split-window-right)
    (other-window 1)
    (blee:bnsm:results-here)
    )
  )
	       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CURENVBASE routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lsip-curenvbase ()
  (cond (*lsip-curenvbase* 
	 *lsip-curenvbase*)
	(t (let ((env_curenvbase (getenv "CURENVBASE")))
	     (setq *lsip-curenvbase*
		   (cond (env_curenvbase
			  (message "Using environment's CURENVBASE: (%s)" env_curenvbase)
			  env_curenvbase)
			 (t (message "Setting CURENVBASE to default: (%s)" *lsip-default-curenvbase*)
			    *lsip-default-curenvbase*)))
	     (lsip-basic-update-curenvbase-in-subprocesses)
	     *lsip-curenvbase*
	     ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Buffer Processes Helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(defun lsip-basic-maybe-interrupt-subprocess (buf)
  ;;"Interrupt any running subjob."
  ;; (save-window-excursion
  ;;   (switch-to-buffer buf)

  ;;   ;; if not back at prompt, interrupt subjob
  ;;   (goto-char (point-max))
  ;;   (beginning-of-line)
  ;;   (if (not (looking-at comint-prompt-regexp))
  ;; 	(progn
  ;; 	  (comint-interrupt-subjob)
  ;; 	  (sleep-for 3)
  ;; 	  ))
  ;;   ;; if not back at prompt, show no mercy...
  ;;   (goto-char (point-max))
  ;;   (beginning-of-line)
  ;;   (if (not (looking-at comint-prompt-regexp))
  ;; 	(progn
  ;; 	  (comint-kill-subjob)
  ;; 	  (sleep-for 3)
  ;; 	  )))
;;  )


(defun lsip-basic-maybe-interrupt-subprocess (buf)
  "Interrupt any running subjob."
  (save-window-excursion
    (switch-to-buffer buf)
    (goto-char (point-max))
    (beginning-of-line)
    )
  )


(defun lsip-basic-update-curenvbase-in-subprocesses ()
  (mapcar '(lambda (buf)
	     (if (and (equal 0 (string-match *lsip-buffer-name-prefix* (buffer-name buf))) ; an LSIP buffer...
		      (get-buffer-process buf)) ; ...with a process
		 (lsip-basic-set-buffer-process-curenvbase buf)))
	  (buffer-list)))
  

(defun lsip-basic-set-buffer-process-curenvbase (buf)
  (save-excursion
    (let (shell cmd)
      ;; figure out what shell is running--assume no different subshells started
      (setq shell (car (read-from-string (file-name-nondirectory (or explicit-shell-file-name
								     (getenv "ESHELL")
								     (getenv "SHELL"))))))
      (message "Setting CURENVBASE in subprocess of buffer <%s>." (buffer-name buf))
      (set-buffer buf)
      (lsip-basic-maybe-interrupt-subprocess buf)
      (cond ((equal shell 'csh)
	     (setq cmd (format "setenv CURENVBASE %s" (lsip-curenvbase))))
	    (t
	     ;; assume bourne, ksh compatible
	     (setq cmd (format "CURENVBASE=%s; export CURENVBASE" (lsip-curenvbase)))))
      (goto-char (point-max))
      (insert cmd)
      (comint-send-input)
      (sleep-for 1)
      (goto-char (point-max))
      )
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LSIP host/user/password routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defvar *lsip-host* nil
  "Name of the machine that LSIP is running on.")

(defun lsip-host ()
  (cond ((null *lsip-host*)
	 (setq *lsip-host* (lsip-fqdn-host (system-name))))
	(t *lsip-host*)))

(defvar *lsip-user* nil "LSIP user")

(defun lsip-user ()
  (cond ((null *lsip-user*)
	 (setq *lsip-user* (or (user-login-name) ; for now...
			       (read-string "Username: " (getenv "USER")))))
	(t *lsip-user*)))

(defvar *lsip-password* nil "LSIP user's password")

(defun lsip-password ()
  (cond ((null *lsip-password*)
	 (setq *lsip-password* (or "nopasswordfornow"
				   (read-string "Password: "))))
	(t *lsip-password*)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LSIP per-host buffer routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (lsip-fqdn-host ".bar") ==> ""
;; (lsip-fqdn-host "foo.bar") ==> "foo"
;; (lsip-fqdn-host "foo") ==> "foo"

(defun lsip-fqdn-host (fqdn)
  "Return the host portion (left of leftmost dot) of FQDN.
If no dot, return FQDN."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn 0 first-dot-pos))
	  (t fqdn))))



;; (lsip-fqdn-domain "foo.bar.baz") ==> "bar.baz"
;; (lsip-fqdn-domain "foo") ==> nil
;; (lsip-fqdn-domain "foo.") ==> ""

(defun lsip-fqdn-domain (fqdn)
  "Return everything to the right of the first dot.
If no dot, return nil."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn (1+ first-dot-pos)))
	  (t nil))))


(defun lsip-trim-trailing-slash (dirname)
  (if (string-equal "/" (substring dirname (- (length dirname) 1)))
      (substring dirname 0 (- (length dirname) 1))
    dirname))


(defun lsip-buffer-for-hostOrig (host &optional new-buffer-p new-buffer-name-suffix)
  (let* ((base-buffer-name (format "%s %s" *lsip-buffer-name-prefix* host))
	 (base-buffer (get-buffer base-buffer-name)))
    (save-window-excursion
      ;; always make sure the base buffer exists
      (if (null base-buffer)
	  (progn
	    (message "Creating buffer `*LSIP* %s'..." host)
	    (sit-for 1)
	    (setq base-buffer (shell t)) ; create new shell
	    (sleep-for 3)		; give time for the shell process to start...
	    (rename-buffer base-buffer-name)
	    (lsip-setup-host-buffer (current-buffer))
	    (message "Base buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	    (current-buffer)
	    ))
      ;; if new-buffer-p, create a new one, else return the base buffer
      (cond (new-buffer-p
	     (shell t)
	     (sleep-for 3)
	     (rename-buffer (generate-new-buffer-name (format "%s [%s]" base-buffer-name
							      new-buffer-name-suffix)))
	     (lsip-setup-host-buffer (current-buffer))
	     (message "New buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	     (current-buffer))
	    (t base-buffer)))))



(defun lsip-buffer-for-host (host &optional new-buffer-p new-buffer-name-suffix)
  (let* ((base-buffer-name (format "%s %s" *lsip-buffer-name-prefix* host))
	 (base-buffer (get-buffer base-buffer-name)))
    (save-window-excursion
      ;; always make sure the base buffer exists
      (if (null base-buffer)
	  (progn
	    (message "Creating buffer `*LSIP* %s'..." host)
	    (sit-for 1)
	    (setq base-buffer (shell t)) ; create new shell
	    (sleep-for 3)		; give time for the shell process to start...
	    (rename-buffer base-buffer-name)
	    ;; modify command to use rsh if not on local host or if switching user is specified
	    (if (not (or (string-equal (lsip-fqdn-host host) (lsip-fqdn-host (system-name)))
			     (string-equal (lsip-fqdn-host host) "localhost")))
		(let (command)
		  (setq command (format "ssh lsipusr@%s bash --noediting -i"
					host
					))
		  ;; do command
		  (save-window-excursion
		    (switch-to-buffer base-buffer-name)
		    (goto-char (point-max))
		    (insert command)
		    (comint-send-input))
		  ))

	    (lsip-setup-host-buffer (current-buffer))
	    (message "Base buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	    (current-buffer)
	    ))
      ;; if new-buffer-p, create a new one, else return the base buffer
      (cond (new-buffer-p
	     (shell t)
	     (sleep-for 3)
	     (rename-buffer (generate-new-buffer-name (format "%s [%s]" base-buffer-name
							      new-buffer-name-suffix)))
	     (lsip-setup-host-buffer (current-buffer))
	     (message "New buffer \"%s\" created for host %s." (buffer-name (current-buffer)) host)
	     (current-buffer))
	    (t base-buffer)))))


(defun lsip-setup-host-buffer (buffer)
  (save-window-excursion
    (switch-to-buffer buffer)
    ;;(set-buffer-menubar default-menubar)
    (setq truncate-lines nil)		; wrap by default
    ;;(lsip-install-menus)
    (lsip-basic-set-buffer-process-curenvbase buffer)
    (goto-char (point-max))
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LSIP main buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lsip-main-buffer ()
  (let ((buf (get-buffer *lsip-buffer-name-prefix*)))
    (cond (buf buf)
	  (t (prog1 (setq buf (get-buffer-create *lsip-buffer-name-prefix*))
	       (save-excursion
		 (switch-to-buffer buf)
		 (set-buffer-menubar default-menubar)
		 (lsip-install-menus)
		 (insert (format
			  "Welcome to Neda Domain Managment Tool (LSIP) Version %s.
Please send bug reports to Pean Lim <pean@neda.com>.

Please select an MTS node from the [LSM-MTS] pull-down menu 
and/or a UA node from the [LSM-UA] pull-down menu.

"
			  *lsip-version*))
		 ))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LSIP logging
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lsip-log-message (msg &optional insert-blank-line-p)
  (save-window-excursion
    (switch-to-buffer (lsip-main-buffer))
    (goto-char (point-max))
    (if insert-blank-line-p (insert "\n"))
    (insert-time)
    (insert (format ": %s\n" msg))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; file name related helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lsip-visit-file-internal (filename node user password &optional frame-params force-ange-ftp-p)
  (let ((use-ange-ftp *lsip-use-ange-ftp*)
	file-buf)
    (unwind-protect
	(progn
	  (if force-ange-ftp-p (setq *lsip-use-ange-ftp* t))

	  ;; maybe build an ange-ftp filename
	  (setq filename (lsip-basic-maybe-ange-ftpize-filename filename node user))

	  (setq file-buf (find-file-noselect filename))
	  (switch-to-buffer file-buf)
	  (lsip-install-menus)

	  ;; do a refresh unless buffer is modified, directories always refreshed
	  (cond ((file-directory-p filename)
		 (revert-buffer))
		((buffer-modified-p file-buf)
		 (message "Buffer modified, not rereading from disk.")
		 (sleep-for 2))
		(t 
		 (revert-buffer nil t))))
      (setq *lsip-use-ange-ftp* use-ange-ftp))
    file-buf
    ))


(defun lsip-basic-maybe-ange-ftpize-filename (filename node user)
  (cond ((or (null *lsip-use-ange-ftp*)
	     (string-equal node (lsip-host)))
	 filename)
	(t (format "/%s@%s:%s" user node filename))))


(defun lsip-curenvbase-full-path (rel-path)
  (expand-file-name (format "%s/%s" (lsip-curenvbase) rel-path)))


(defun lsip-system-full-path (system rel-path)
  (expand-file-name (format "%s/results/systems/%s/%s"
			    (lsip-curenvbase) system rel-path)))


(defun lsip-arch-full-path (system rel-path)
  (expand-file-name (format "%s/results/arch/%s/%s"
 			    (lsip-curenvbase)
			    (lsip-system-arch system)
			    rel-path)))


(defun lsip-system-arch (system)
  (let (result)
    (setq result (call-process-result (format "rsh %s arch" system)))
    (if (consp result)
	(car result)
      (error "Could not determine architecture of host %s" system))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; X-related helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *lsip-xhosted-list* nil "list of hosts that have been 'xhost +'-ed")


(defun lsip-maybe-do-xhost (host)
  (cond ((member host *lsip-xhosted-list*) nil)
	(t
	 (shell-command (format "xhost + %s" host))
	 (setq *lsip-xhosted-list* (cons host *lsip-xhosted-list*)))))

    
;;; (lsip-display)
(defun lsip-display ()
  "Figure out the proper X server to use."
  (let* ((display (or (getenv "DISPLAY") ":0.0"))
	 (display-host (substring display 0 (string-match ":" display))))
    (cond ((not (string-equal display-host "")) 
	   display)
	  (t (format "%s:0" (system-name))))))


(defun lsip-basic-xterm-label-options (host filename)
  (let (basename label)
    (setq basename (file-name-nondirectory filename))
    (setq label (format "%s@%s" basename host))
    (format "-T %s -n %s" label label)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LSIP miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun lsip-not-yet ()
  (interactive "")
  (while (> arg 0)
    (ding)
    (setq arg (- arg 1)))
  (message "Not yet implemented."))


;; (lsip-fqdn-host ".bar") ==> ""
;; (lsip-fqdn-host "foo.bar") ==> "foo"
;; (lsip-fqdn-host "foo") ==> "foo"

(defun lsip-fqdn-host (fqdn)
  "Return the host portion (left of leftmost dot) of FQDN.
If no dot, return FQDN."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn 0 first-dot-pos))
	  (t fqdn))))



;; (lsip-fqdn-domain "foo.bar.baz") ==> "bar.baz"
;; (lsip-fqdn-domain "foo") ==> nil
;; (lsip-fqdn-domain "foo.") ==> ""

(defun lsip-fqdn-domain (fqdn)
  "Return everything to the right of the first dot.
If no dot, return nil."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn (1+ first-dot-pos)))
	  (t nil))))


(defun lsip-trim-trailing-slash (dirname)
  (if (string-equal "/" (substring dirname (- (length dirname) 1)))
      (substring dirname 0 (- (length dirname) 1))
    dirname))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'lsip-basic)
