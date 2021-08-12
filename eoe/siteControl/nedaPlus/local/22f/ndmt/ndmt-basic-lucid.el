;;; 
;;; RCS: $Id: ndmt-basic-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;; NDMT "Basic" Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; ndmt-view-file

(defun ndmt-view-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to view: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))

  (ndmt-visit-file-internal filename node user password frame-params force-ange-ftp-p)
  (toggle-read-only 1))


;;; ndmt-visit-file

(defun ndmt-visit-file (filename node user password &optional frame-params force-ange-ftp-p)
  (interactive (list (read-file-name "File to visit: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  (ndmt-visit-file-internal filename node user password frame-params force-ange-ftp-p))


;;; ndmt-tail-file

(defun ndmt-tail-file (filename node user password &optional frame-params)
  (interactive (list (read-file-name "File to tail: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  ;; new frame
  ;; shell, rsh tail 
  (ndmt-run-command (format "tail -80 %s" filename) node user password nil nil nil frame-params)
  )


;;; ndmt-tail-f-file

(defun ndmt-tail-f-file (filename node user password &optional frame-params)
  (let (command) 
    (interactive (list (read-file-name "File to tail -f: ") 
		       (read-string "Node: " "localhost")
		       (read-string "Username: " (getenv "USER"))
		       (vm-read-password "Password: ")))
    ;; new frame
    ;; shell, rsh tail -f
    (setq command (format "tail -80f %s" filename))
    (cond ((equal *ndmt-tail-f-method* 'frame)
	   (ndmt-run-command command node user password nil t command frame-params))
	  ((equal *ndmt-tail-f-method* 'xterm)
	   (setq command (format "xterm -sb -sl 256 -display %s %s -e %s"
				 (ndmt-display)
				 (ndmt-basic-xterm-label-options node filename)
				 command))
	   (ndmt-run-command command node user password t nil command frame-params))
	  ((equal *ndmt-tail-f-method* nil)
	   (ndmt-run-command command node user password nil nil command frame-params))
	  (t
	   (error "Unrecognized method for handling `tail -f': %s" *ndmt-tail-f-method*)))))


;;; ndmt-run-command

(defun ndmt-run-command (command node user password &optional backgroundp new-buffer-and-frame-p new-buffer-suffix frame-params)
  "Runs a command in an emacs shell buffer."
  (interactive (list (read-shell-command "Shell command: ") 
		     (read-string "Node: " "localhost")
		     (read-string "Username: " (getenv "USER"))
		     (vm-read-password "Password: ")))
  (let ((shell-buffer (ndmt-buffer-for-host node new-buffer-and-frame-p new-buffer-suffix))
	(switch-user-p (not (string-equal (ndmt-user) user)))
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

    ;; modify command to use rsh if not on local node or if switching user is specified
    (if (or (not (or (string-equal (ndmt-fqdn-host node) (ndmt-fqdn-host (system-name)))
		     (string-equal (ndmt-fqdn-host node) "localhost")))
	    switch-user-p)
	(progn
	  (ndmt-maybe-do-xhost node)
	  (setq command (format "rsh %s%s %s"
				(if switch-user-p (format "-l %s " user) "")
				node
				(if command (format "\"%s\"" command) "")))))

    ;; modify command to run in background if specified.
    (if backgroundp
	(setq command (concat command " &")))

    ;; do command
    (save-window-excursion
      (switch-to-buffer shell-buffer)
      (goto-char (point-max))
      (insert command)
      (comint-send-input))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CURENVBASE routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-curenvbase ()
  (cond (*ndmt-curenvbase* 
	 *ndmt-curenvbase*)
	(t (let ((env_curenvbase (getenv "CURENVBASE")))
	     (setq *ndmt-curenvbase*
		   (cond (env_curenvbase
			  (message "Using environment's CURENVBASE: (%s)" env_curenvbase)
			  env_curenvbase)
			 (t (message "Setting CURENVBASE to default: (%s)" *ndmt-default-curenvbase*)
			    *ndmt-default-curenvbase*)))
	     (ndmt-basic-update-curenvbase-in-subprocesses)
	     *ndmt-curenvbase*
	     ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Buffer Processes Helper functions
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NDMT host/user/password routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defvar *ndmt-host* nil
  "Name of the machine that NDMT is running on.")

(defun ndmt-host ()
  (cond ((null *ndmt-host*)
	 (setq *ndmt-host* (ndmt-fqdn-host (system-name))))
	(t *ndmt-host*)))

(defvar *ndmt-user* nil "NDMT user")

(defun ndmt-user ()
  (cond ((null *ndmt-user*)
	 (setq *ndmt-user* (or (user-login-name) ; for now...
			       (read-string "Username: " (getenv "USER")))))
	(t *ndmt-user*)))

(defvar *ndmt-password* nil "NDMT user's password")

(defun ndmt-password ()
  (cond ((null *ndmt-password*)
	 (setq *ndmt-password* (or "nopasswordfornow"
				   (vm-read-password "Password: "))))
	(t *ndmt-password*)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NDMT per-host buffer routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (ndmt-fqdn-host ".bar") ==> ""
;; (ndmt-fqdn-host "foo.bar") ==> "foo"
;; (ndmt-fqdn-host "foo") ==> "foo"

(defun ndmt-fqdn-host (fqdn)
  "Return the host portion (left of leftmost dot) of FQDN.
If no dot, return FQDN."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn 0 first-dot-pos))
	  (t fqdn))))



;; (ndmt-fqdn-domain "foo.bar.baz") ==> "bar.baz"
;; (ndmt-fqdn-domain "foo") ==> nil
;; (ndmt-fqdn-domain "foo.") ==> ""

(defun ndmt-fqdn-domain (fqdn)
  "Return everything to the right of the first dot.
If no dot, return nil."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn (1+ first-dot-pos)))
	  (t nil))))


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
	    (message "Creating buffer `*NDMT* %s'..." host)
	    (sit-for 1)
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NDMT main buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NDMT logging
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ndmt-log-message (msg &optional insert-blank-line-p)
  (save-window-excursion
    (switch-to-buffer (ndmt-main-buffer))
    (goto-char (point-max))
    (if insert-blank-line-p (insert "\n"))
    (insert-time)
    (insert (format ": %s\n" msg))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; file name related helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; X-related helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *ndmt-xhosted-list* nil "list of hosts that have been 'xhost +'-ed")


(defun ndmt-maybe-do-xhost (host)
  (cond ((member host *ndmt-xhosted-list*) nil)
	(t
	 (shell-command (format "xhost + %s" host))
	 (setq *ndmt-xhosted-list* (cons host *ndmt-xhosted-list*)))))

    
(defun ndmt-display ()
  "Figure out the proper X server to use."
  (let* ((display (or (getenv "DISPLAY") ":0.0"))
	 (display-host (substring display 0 (string-match ":" display))))
    (cond ((not (string-equal display-host "")) 
	   display)
	  (t (format "%s:0" (system-name))))))


(defun ndmt-basic-xterm-label-options (host filename)
  (let (basename label)
    (setq basename (file-name-nondirectory filename))
    (setq label (format "%s@%s" basename host))
    (format "-T %s -n %s" label label)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NDMT miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun ndmt-not-yet ()
  (interactive "")
  (while (> arg 0)
    (ding)
    (setq arg (- arg 1)))
  (message "Not yet implemented."))


;; (ndmt-fqdn-host ".bar") ==> ""
;; (ndmt-fqdn-host "foo.bar") ==> "foo"
;; (ndmt-fqdn-host "foo") ==> "foo"

(defun ndmt-fqdn-host (fqdn)
  "Return the host portion (left of leftmost dot) of FQDN.
If no dot, return FQDN."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn 0 first-dot-pos))
	  (t fqdn))))



;; (ndmt-fqdn-domain "foo.bar.baz") ==> "bar.baz"
;; (ndmt-fqdn-domain "foo") ==> nil
;; (ndmt-fqdn-domain "foo.") ==> ""

(defun ndmt-fqdn-domain (fqdn)
  "Return everything to the right of the first dot.
If no dot, return nil."
  (let (first-dot-pos)
    (cond ((setq first-dot-pos (string-match "\\." fqdn))
	   (substring fqdn (1+ first-dot-pos)))
	  (t nil))))


(defun ndmt-trim-trailing-slash (dirname)
  (if (string-equal "/" (substring dirname (- (length dirname) 1)))
      (substring dirname 0 (- (length dirname) 1))
    dirname))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ndmt-basic-lucid)
