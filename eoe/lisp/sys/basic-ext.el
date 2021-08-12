;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic Extensions to Emacs Lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun circularize (head-cons &optional last-cons)
  "Make LIST circular."
  (cond ((null head-cons)
	 (error "LIST is null!"))
	((null last-cons)
	 (circularize head-cons (last-cons head-cons)))
	(t
	 (setcdr last-cons head-cons)
	 head-cons)))

(defun last-cons (list)
  (cond ((null list) nil)
	((consp (cdr list)) (last-cons (cdr list)))
	(t list)))	 

(defun point-line ()
  "return the current line that point is on"
  (save-restriction
    (widen)
    (count-lines 1 (point))))

(defun string-has-prefix-p (string prefix)
  "if STRING starts with PREFIX, return t"
  (let ((prefix-length (length prefix)))
    (and (> (length string) prefix-length)
	 (string= (substring string 0 prefix-length) prefix))))

(defun string-has-suffix-p (string suffix)
  "if STRING ends with SUFFIX, return t"
  (let ((suffix-length (length suffix)))
    (and (> (length string) suffix-length)
	 (string= (substring string (- suffix-length)) suffix))))

(defun string-replace-regexp (string regexp to-string)
  "Search through STRING and replace each occurence of REGEXP with TO-STRING."
  (save-excursion
    (set-buffer (get-buffer-create " *boe-scratch*"))
    (kill-region (point-min) (point-max))
    (insert string)
    (goto-char (point-min))
    (replace-regexp regexp to-string)
    (buffer-string)))

;;; for all the times i want to write [(ding)] (message ...) (sleep-for ..)
;;;
(defun mention (ding-p for-n-secs format-string &rest format-args)
  "Ring bell if DING-P, then FOR-N-SECONDS display FORMAT-STRING with
FORMAT-ARGS (if any) in the mini-buffer"
  (and ding-p (ding))
  (apply 'message format-string format-args)
  (sit-for for-n-secs))


;;; Spet 9, 2019 -- oldstyle backquote -- With emacs 27
;;;
;; ;;; higer-order function for chop-string
;; (defun chop-string-fn (separator-regexp &optional reversed-ok-p)
;;   "Return a function to chop a string at SEPARATOR-REGEXP."
;;   (` (lambda (string)
;; 	      (chop-string string (, separator-regexp) (, reversed-ok-p)))))

;;; for cutting up a string into a list of strings based on a regexp separator
(defun chop-string (string separator-regexp &optional reversed-ok-p)
  "chop STRING using SEPARATOR-REGEXP.  Result is reversed if REVERSED-OK-P is not nil"
  (chop-string-internal string separator-regexp 0 '() reversed-ok-p))

(defun chop-string-internal (string separator-regexp start-index result-list reversed-ok-p)
  (cond ((string-match separator-regexp string start-index)
	 (chop-string-internal string separator-regexp (match-end 0)
			       (cons (substring string start-index (match-beginning 0))
				     result-list)
			       reversed-ok-p))
	(t (if reversed-ok-p
	       (cons (substring string start-index) result-list)
	     (reverse (cons (substring string start-index) result-list))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Operating System Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq hostname  "spock.msg.airdata.com")
;(setq fqdn-force-trialing-dot-p t)
;(eoe-hostname-to-ip "spock.msg.airdata.com" t)

(defun eoe-hostname-to-ip (hostname &optional fqdn-force-trialing-dot-p)
  (let (lookup-result hostname-for-nslookup)
    (setq hostname-for-nslookup (cond ((and  fqdn-force-trialing-dot-p ; required
					     (string-match "\\." hostname) ; looks like a fqdn
					     (not (string-equal "." (substring hostname (1- (length hostname)))))) ; no trailing dot
				       (concat hostname "."))
				      (t hostname)))	     
	
    (setq lookup-result (car (call-process-result (format "nslookup -type=a %s | xargs" hostname-for-nslookup))))
    ;; => "Server: arash.neda.com Address: 198.62.92.10 Name: tahmineh.neda.com Address: 198.62.92.32"
    ;; look for "Name: <hostname> Address: "
    (if (null (string-match (format "Name:\ \\S *%s\\S *\ Address:\ " hostname) lookup-result))
	(error "Failed to find IP for %s" hostname)
      (substring lookup-result (match-end 0)))))


(defun eoe-ip-to-fqdn (ip)
  (let (lookup-result)
    (setq lookup-result (car (call-process-result (format "nslookup -type=a %s | xargs" ip))))
    ;; ==> "Server: arash.neda.com Address: 198.62.92.10 Name: sudabeh.neda.com Address: 198.62.92.28"
    ;; look for "Name: <hostname> Address: <ip>"
    (if (null (string-match (format "Name:\ \\(\\S *\\)\ Address:\ %s" ip) lookup-result))
	(error "Failed to find hostname for %s" ip)
      (substring lookup-result (match-beginning 1) (match-end 1)))))


(defun eoe-hostname-to-fqdn (hostname)
  (eoe-ip-to-fqdn (eoe-hostname-to-ip hostname t)))


(defun eoe-seconds-since-midnight (&optional hh:mm:ss)
  "return number of minutes since midnight, or optionally, since HH:MM:SS"
  (let (current-time)
    (or hh:mm:ss (setq current-time (eoe-current-time)))
    (+ (* 3600 (cond (hh:mm:ss (read (substring hh:mm:ss 0 2)))
		     (t (nth 3 current-time))))
       (* 60 (cond (hh:mm:ss (read (substring hh:mm:ss 3 5)))
		   (t (nth 4 current-time))))
       (cond (hh:mm:ss (read (substring hh:mm:ss 6 8)))
	     (t (nth 5 current-time))))))


(defun seconds-since-midnight (&optional hh:mm:ss)
  "return number of minutes since midnight, or optionally, since HH:MM:SS"
  (message "Obsolete function seconds-since-midnight called; use eoe-seconds-since-midnight.")
  (let (current-time)
    (or hh:mm:ss (setq current-time (eoe-current-time)))
    (+ (* 3600 (cond (hh:mm:ss (read (substring hh:mm:ss 0 2)))
		     (t (nth 3 current-time))))
       (* 60 (cond (hh:mm:ss (read (substring hh:mm:ss 3 5)))
		   (t (nth 4 current-time))))
       (cond (hh:mm:ss (read (substring hh:mm:ss 6 8)))
	     (t (nth 5 current-time))))))

(defun current-time-string-as-hh:mm:ss (&optional current-time-string)
  (substring (or current-time-string (current-time-string)) 11 19))

(defun seconds-to-hh:mm:ss (secs)
  (let (hh mm ss)
    (setq hh (/ secs 3600)		; integer arithmetic
	  mm (/ (- secs (* hh 3600)) 60)
	  ss (- secs (* hh 3600) (* mm 60)))
    (format "%02d:%02d:%02d" hh mm ss)))

(defun eoe-current-time ()
  "Returns a list of yyy mn dd hh mm ss dow."
  (interactive)
  (let (time-string mn-sym yyyy mn mm dd hh mm ss dow-sym)
    (setq time-string (current-time-string)) ; "Wed Mar 10 10:58:36 1993"
    (setq dow-sym (read (substring time-string 0 3)))
    (setq mn (progn (setq mn-sym  (read (substring time-string 4 7)))
		    (cond ((eq mn-sym 'Jan) 1)
			  ((eq mn-sym 'Feb) 2)
			  ((eq mn-sym 'Mar) 3)
			  ((eq mn-sym 'Apr) 4)
			  ((eq mn-sym 'May) 5)
			  ((eq mn-sym 'Jun) 6)
			  ((eq mn-sym 'Jul) 7)
			  ((eq mn-sym 'Aug) 8)
			  ((eq mn-sym 'Sep) 9)
			  ((eq mn-sym 'Oct) 10)
			  ((eq mn-sym 'Nov) 11)
			  ((eq mn-sym 'Dec) 12)
			  (t (error "Shouldn't happen.")))))
    (setq dd (read (substring time-string 8 10)))
    (setq hh (read (substring time-string 11 13)))
    (setq mm (read (substring time-string 14 16)))
    (setq ss (read (substring time-string 17 19)))
    (setq yyyy (read (substring time-string 20 24)))
    (list yyyy mn dd hh mm ss dow-sym)))

(defun eoe-current-time-yyyy (current-time)
  (nth 0 current-time))

(defun eoe-current-time-mn (current-time)
  (nth 1 current-time))

(defun eoe-current-time-dd (current-time)
  (nth 2 current-time))

(defun eoe-current-time-hh (current-time)
  (nth 3 current-time))

(defun eoe-current-time-mm (current-time)
  (nth 4 current-time))

(defun eoe-current-time-ss (current-time)
  (nth 5 current-time))

(defun eoe-current-time-dow (current-time)
  (nth 6 current-time))

(defun eoe-datestamp (&optional compactp)
  "Returns a date string.  If optional argument COMPACTP is
non-nil, the format is YYYYMMDD.  Default is YYYY-MM-DD."
  (let (current-time format-string)
    (setq current-time (eoe-current-time))
    (setq format-string (cond (compactp "%04d%02d%02d")
			      (t "%04d-%02d-%02d")))
    (format format-string
	    (eoe-current-time-yyyy current-time)
	    (eoe-current-time-mn current-time)
	    (eoe-current-time-dd current-time))))

(defun datestamp (&optional dd mm yyyy)
  "If optional args (integers) DD MM and YYYY are not supplied uses current-time-string."
  (message "Obsolete function datestamp called; use eoe-datestamp instead!")
  (let (time-string mm-temp)
    (if (not (and dd mm yyyy))
	(setq time-string (current-time-string))) ; "Wed Mar 10 10:58:36 1993"
    ;; date
    (setq dd (cond (dd dd)
		   (t (car (read-from-string (substring time-string 8 10))))))
    ;; month
    (setq mm (cond (mm mm)
		   (t (setq mm-temp (car (read-from-string (substring time-string 4 7))))
		      (cond ((equal mm-temp 'Jan) 1)
			    ((equal mm-temp 'Feb) 2)
			    ((equal mm-temp 'Mar) 3)
			    ((equal mm-temp 'Apr) 4)
			    ((equal mm-temp 'May) 5)
			    ((equal mm-temp 'Jun) 6)
			    ((equal mm-temp 'Jul) 7)
			    ((equal mm-temp 'Aug) 8)
			    ((equal mm-temp 'Sep) 9)
			    ((equal mm-temp 'Oct) 10)
			    ((equal mm-temp 'Nov) 11)
			    ((equal mm-temp 'Dec) 12)
			    (t (error "Shouldn't happen."))))))
    ;; year
    (setq yyyy (cond (yyyy yyyy)
		     (t (car (read-from-string (substring time-string 20 24))))))
    (format "%04d-%02d-%02d" yyyy mm dd)))

(defun grep-and-count-lines-internal (regexp-list command-string)
  (cond ((null regexp-list) command-string)
	(t (grep-and-count-lines-internal (cdr regexp-list)
			       (concat command-string
				       (format "| egrep '%s' " (car regexp-list)))))))

(defun grep-and-count-lines (filename regexp-list &optional post-processing-fns)
  (unwind-protect
      (save-excursion
	(buffer-flush-undo (get-buffer-create "*Shell Command Output*"))
	(shell-command (grep-and-count-lines-internal regexp-list (format "cat %s " filename)) nil)
	(set-buffer (get-buffer-create "*Shell Command Output*"))
	(if post-processing-fns
	    (mapcar 'funcall post-processing-fns))
	(count-lines (point-min) (point-max)))
    (buffer-enable-undo (get-buffer-create  "*Shell Command Output*"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Date and Time routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mmddyy-to-yy:mm:dd (mmddyy)
  (format "%s:%s:%s"
	  (substring mmddyy 4 6)
	  (substring mmddyy 0 2)
	  (substring mmddyy 2 4)))

(defun hhmmss-to-hh:mm:ss (hhmmss)
  (format "%s:%s:%s"
	  (substring hhmmss 0 2)
	  (substring hhmmss 2 4)
	  (substring hhmmss 4 6)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Generic buffer manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eoe-buffer-list (&optional keep-regexp flush-regexp)
  "Returns a list of buffers whose names match KEEP-REGEXP and
do not match FLUSH-REGEXP.  Both arguments are optional and if 
either argument is nil then it's associated processing is ignored."
  (interactive)
  (let (wconfig pos blist) 
    (setq wconfig (current-window-configuration))
    (unwind-protect (progn 
		      (set-buffer (get-buffer-create " *eoe-scratch*"))
		      (kill-region (point-min) (point-max))
		      ;; one buffer name per line
		      (mapcar '(lambda (buffer) 
			   	 (insert (buffer-name buffer))
				 (newline))
			      (buffer-list))
		      (if keep-regexp
			  (progn (goto-char (point-min))
				 (keep-lines keep-regexp)))
		      (if flush-regexp
			  (progn (goto-char (point-min))
				 (flush-lines flush-regexp)))
		      (goto-char (point-min))
		      (setq blist nil)
		      (while (not (eobp))
			(beginning-of-line)
			(setq pos (point))
			(end-of-line)
			(setq blist (cons (get-buffer (buffer-substring pos (point))) blist))
			(next-line 1))
		      (reverse blist))
      (set-window-configuration wconfig)
      nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Generic window manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun set-window-width (new-width)
  "set window to WIDTH columns wide"
  (interactive "P")
  (enlarge-window-horizontally
   (- new-width (window-width (selected-window)))))

;;; like other-window, but goes to end of buffer
;;;
(defun other-window-at-end ()
  "like other-window, but goes to end of buffer"
  (interactive)
  (other-window 1)
  (goto-char (point-max)))

;;; If there is a window for buffer-name select it, otherwise NIL
;;;
(defun maybe-select-window (buffer-name)
  "if there is an window for buffer-name select that"
  (let (buffer buffer-window)
    (cond ((and (setq buffer (get-buffer buffer-name))
		(setq buffer-window (get-buffer-window buffer)))
	   (select-window buffer-window))
	  (t nil))))

;;; If buffer-name has one or more windows displaying it, kill
;;; all of them
(defun maybe-delete-windows (buffer-name)
  (let ((bw (get-buffer-window buffer-name)))
    (if bw
	(progn (delete-window bw)
	       (maybe-delete-windows buffer-name)))))


;;; return canonical ordering of windows wrt current-window
;;;
(defun window-list ()
  (let ((wlist '()))
    (window-list-internal (selected-window))))

(defun window-list-internal (win)
  (cond ((memq win wlist) wlist)
	(t (setq wlist (cons win wlist))
	   (window-list-internal (next-window win)))))

;;; extract window edges

(defun left-edge (win)
  (cond ((eq *eoe-emacs-type* '19x)
	 (nth 0 (window-pixel-edges win)))
	(t
	 (nth 0 (window-edges win))))) 
  

(defun top-edge (win)
  (cond ((eq *eoe-emacs-type* '19x)
	 (nth 1 (window-pixel-edges win)))
	(t
	 (nth 1 (window-edges win)))))


(defun right-edge (win)
  (cond ((eq *eoe-emacs-type* '19x)
	 (nth 2 (window-pixel-edges win)))
	(t
	 (nth 2 (window-edges win)))))


(defun bottom-edge (win)
  (cond ((eq *eoe-emacs-type* '19x)
	 (nth 3 (window-pixel-edges win)))
	(t
	 (nth 3 (window-edges win)))))


;;; return the leftmost window(s)
;;;
(defun leftmost-windows ()
  (let ((leftmost-windows '())
	(leftmost-edge 1000))
    (leftmost-windows-internal (window-list))))

(defun leftmost-windows-internal (wlist)
  (let (left-edge curr-win)
    (cond ((null wlist) leftmost-windows)
	  (t (setq curr-win (car wlist))
	     (setq left-edge (left-edge curr-win))
	     (cond ((< left-edge leftmost-edge)
		    ;; found a new leftmost window
		    (setq leftmost-windows (list curr-win))
		    (setq leftmost-edge left-edge))
		   ((= leftmost-edge left-edge)
		    ;; found another equally leftmost window
		    (setq leftmost-windows (cons curr-win leftmost-windows))))
	     (leftmost-windows-internal (cdr wlist))))))

;;; return the topmost windows
;;;
(defun topmost-windows ()
  (let ((topmost-windows '())
	(topmost-edge 1000))
    (topmost-windows-internal (window-list))))

(defun topmost-windows-internal (wlist)
  (let (top-edge curr-win)
    (cond ((null wlist) topmost-windows)
	  (t (setq curr-win (car wlist))
	     (setq top-edge (top-edge curr-win))
	     (cond ((< top-edge topmost-edge)
		    ;; found a new topmost window
		    (setq topmost-windows (list curr-win))
		    (setq topmost-edge top-edge))
		   ((= topmost-edge top-edge)
		    ;; found another equally topmost window
		    (setq topmost-windows (cons curr-win topmost-windows))))
	     (topmost-windows-internal (cdr wlist))))))

;;; return the top-left window
;;;
(defun topleft-window ()
  (let ((topmost-windows (topmost-windows)))
    (catch 'found
      (mapcar (function (lambda (win)
			  (if (memq win topmost-windows)
			      (throw 'found win))))
	      (leftmost-windows)))))

(defun home-window ()
  "goto top-left window"
  (interactive)
  (select-window (topleft-window)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; call-process-result
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; use call-process to wait for the sub process to exit
;;; before returning
(defun call-process-result (shell-cmd-string &optional include-last-line-p)
  "Invoke SHELL-CMD-STRING in a csh.  If optional argument INCLUDE-LAST-LINE-P
is not null include the last line (usually just an empty string)"
  (let ((result-buffer (get-buffer-create " *Call-Process-Result Buffer*"))
	raw-result)
    (set-buffer result-buffer)
    (kill-region (point-min) (point-max))
    (call-process "/bin/csh" nil result-buffer nil
		  "-f" "-c" shell-cmd-string)
    (setq raw-result (chop-string (buffer-string) "[\n]" t))
    (reverse (if include-last-line-p
		 raw-result
	       (cdr raw-result)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; extensions to the shell mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'shell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sync-cd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; sometimes emacs loses track of the current directory associated
;;; with the *shell* process.  This is a kludge to make emacs set it's
;;; default directory based on the result of a pwd command executed
;;; from the *shell*
;;;
(defun sync-cd ()
  "Set the cd of the current buffer to be that of its process."
  (interactive)
  (let (wd pwd-result-list)
    (setq pwd-result-list (query-buffer-process "pwd" 2 1))

    ;; sometimes, when a buffer process has been around along time
    ;; commands get echoed in the buffer.  Consequently, the pwd
    ;; result list could be in either of 2 formats...  (i)
    ;; ("/tmp_mnt/home/gumby/plim/devel/src/dmib" "bigleaf[3]%") (ii)
    ;; ("pwd" "/tmp_mnt/home/gumby/plim/devel/src/dmib") so we look
    ;; for the first elt of the list starting with /

    (setq wd (cond ((string-match "/" (car pwd-result-list))
		    (car pwd-result-list))
		   ((string-match "/" (nth 1 pwd-result-list))
		    (nth 1 pwd-result-list))))
    
    (cond (wd 
	   (message "Default directory now [%s] for %s." wd (buffer-name))
	   (cd (filename-sans-automount-prefix wd)))
	  (t
	   (message "Failed to determine working directory of buffer's process!")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; query-buffer-process
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *collect-process-output-max-lines* 1
  "max number of output lines expected in collecting process output")

(defvar *collect-process-output-secs-to-timeout* 0
  "number of seconds before we stop collecting process output")

(defvar *collect-process-output-results* nil
  "list of outputs from process-send-strings")

;;; Function to synchronously execute SHELL-CMD-STRING in the current
;;; buffer's process (or if none, the *shell* process) and get back
;;; results as a string.  Consider shell command done when MAX-LINES
;;; have been received.
;;;
(defun query-buffer-process (shell-cmd-string max-lines &optional query-timeout)
  (let (buffer-process result-strings)
    (cond ((setq buffer-process  (get-buffer-process (current-buffer)))
	   (setq *collect-process-output-results* nil)
	   ;; timeout is query-specific default is 2 seconds
	   (setq *collect-process-output-secs-to-timeout* (or query-timeout 2))
	   (setq *collect-process-output-max-lines* max-lines)

	   (set-process-filter buffer-process 'collect-process-output-filter)
	   (process-send-string buffer-process (format "%s\n" shell-cmd-string))

	   ;; loop while not max lines and not timeout
	   (while (and (< (length *collect-process-output-results*)
			  *collect-process-output-max-lines*)
		       (>  *collect-process-output-secs-to-timeout* 0))
	     (sleep-for 1)
	     (setq *collect-process-output-secs-to-timeout*
		   (- *collect-process-output-secs-to-timeout* 1)))

	   ;; reset the output filter
	   (set-process-filter buffer-process nil)

	   ;; massage results--last output elt is shell prompt
	   (setq result-strings (reverse *collect-process-output-results*)))
	  (t (error "Current buffer has no process!")))))

(defun collect-process-output-filter (process output)
  (let (length)
    ;; collect output as a LIFO list
    (setq *collect-process-output-results*
	  (append (reverse (chop-string output "\n"))
		  *collect-process-output-results*))
    ;; trim length if chop-string returns a list of > 1 element
    (setq length (length *collect-process-output-results*))
    (if (> length *collect-process-output-max-lines*)
	(setq *collect-process-output-results*
	      (nthcdr (- length *collect-process-output-max-lines*)
		      *collect-process-output-results*)))
    *collect-process-output-results*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; filename manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun filename-sans-automount-prefix (filename)
  ;; Get rid of the prefixes added by the automounter.
  (if (string-match "^/tmp_mnt/" filename)
      (substring filename (1- (match-end 0)))
    filename))

;(if (fboundp 'expand-file-name)
;   (progn
;     (defconst *original-expand-file-name-function*
;       (symbol-function 'expand-file-name)
;       "Extending this original function")
;
;     (defun expand-file-name(filename &optional default)
;       "Extended to take into consideration automounter."
;       (filename-sans-automount-prefix (funcall *original-expand-file-name-function*
;       					 filename
;       					 default)))))


(defun maybe-dereference-filename (filename verbose)
  "If filename (file or directory) is a symbolic link, dereference it
completely."
  (let (deref-filename)
    (cond ((setq deref-filename (file-symlink-p filename))
	   (and verbose
		(mention nil 1 "Deferenced %s -> %s" filename deref-filename))
	   (maybe-dereference-filename deref-filename verbose))
	  (t filename))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hook functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Add hook function.  Stolen from Andy Norman's ange-ftp-add-hook
;;;
(defun eoe-add-hook (hook-var hook-function-name)
  "Prepend to HOOK-VAR's value, a HOOK-FUNCTION-NAME, if it is not already an element.
HOOK-VAR's value may be a single function or a list of functions.
e.g.: (eoe-add-hook 'dired-load-hook 'my-dired-hook-function)"
  (if (boundp hook-var)
      (let ((value (symbol-value hook-var)))
        (if (and (listp value) (not (eq (car value) 'lambda)))
            (and (not (memq hook-function-name value))
                 (set hook-var
                      (if value (cons hook-function-name value) hook-function-name)))
          (and (not (eq hook-function-name value))
               (set hook-var
                    (list hook-function-name value)))))
    (set hook-var hook-function-name)))

;; (defun hook-run-notification (hookname)
;;   "Second order function.  Returns a hook function that beeps & prints a message saying HOOKNAME is being run.
;; Example: to see when term-setup-hook is run, say:

;;    (setq term-setup-hook (cons (hook-run-notification 'term-setup-hook) term-setup-hook))"

;;   (` (lambda ()
;;        (mention t 2  "%s hooks being run." '(, hookname)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'basic-ext)
