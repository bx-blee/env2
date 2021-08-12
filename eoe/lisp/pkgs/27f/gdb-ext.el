;;; -*- Mode: Emacs-Lisp; SCCS: @(#)gdb-ext.el	1.3 4/5/93 -*-

(require 'eoe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; GDB mode hacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eoe-baroque-require 'gdb 'def-gdb)	; can't simply use 'gdb for some reason

;;; =====================================================================
;;; overwrite gdb to save the path as a buffer local variable

(defvar gdb-exec-file-path nil
  "This is a buffer-local variable, bound to the executable file pathname.")

(defun gdb (path)
  "Run gdb on program FILE in buffer *gdb-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for GDB.  If you wish to change this, use
the GDB commands `cd DIR' and `directory'."
  (interactive "FRun gdb on file: ")
  (setq path (expand-file-name path))
  (let ((file (file-name-nondirectory path)))
    (switch-to-buffer (concat "*gdb-" file "*"))
    (setq default-directory (file-name-directory path))
    (or (bolp) (newline))
    (insert "Current directory is " default-directory "\n")
    (make-shell (concat "gdb-" file) gdb-command-name nil "-fullname"
		"-cd" default-directory file)
    (gdb-mode)
    (set-process-filter (get-buffer-process (current-buffer)) 'gdb-filter)
    (set-process-sentinel (get-buffer-process (current-buffer)) 'gdb-sentinel)
    (gdb-set-buffer)
    (make-local-variable 'gdb-exec-file-path)
    (setq gdb-exec-file-path path)
    ))

;;; =====================================================================

(def-gdb "frame"   "\M-l"  "Display current stack frame")

(defvar *gdb-prefix* "*gdb-"
  "all gdb buffer-names start with this prefix")

(defun get-gdb-buffers()
  (let ((gdb-buffers '()))
    (mapcar 
     (function (lambda (buf)
		 (let ((buf-name (buffer-name buf)))
		   (if (string-has-prefix-p buf-name *gdb-prefix*)
		       (setq gdb-buffers (cons buf-name gdb-buffers))))))
     (buffer-list))
    (sort gdb-buffers 'string-lessp)))

(defun gdb-raise-buffers (arg)
  "Make windows show as many existing gdb buffers as possible.  If ARG is \
supplied, then run `gdb' instead."
  (interactive "P")
  (let (sel-win gdb-buffers)
    (cond (arg
	   (call-interactively 'gdb))
	  ((setq gdb-buffers (get-gdb-buffers))
	   (home-window)
	   (setq sel-win (selected-window))
	   (mapcar (function (lambda (gdb-buf)
			       (switch-to-buffer gdb-buf)
			       (goto-char (point-max))
			       (other-window 1)))
		   gdb-buffers)
	   (select-window sel-win))
	  (t (mention t 1 "No buffers found with prefix \"%s\"." *gdb-prefix*)
	     (call-interactively 'gdb)
	     ))))

;;; *** this function doesn't update the => in corresponding source file
;;;
(defun gdb-jump ()
  "Jump to this source line."
  (interactive)
  (send-string 
   (get-buffer-process current-gdb-buffer)
   ;; 1+ to be consistent with gdb-break
   (concat "jump " (1+ (point-line)) "\n")))

(define-key ctl-x-map "j" 'gdb-jump)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Symbol demangling is hacked from code originally written by
;;; Mark Kromer.

;;; =====================================================================

(defvar nm++-pathname "nm++"
  "Pathname for running nm++ required by make-mangle-table.")

(defun make-mangle-table (arg)
  "Create a mangle table for the C++ program.  If ARG is supplied, prompt
for executable name, otherwise use value of gdb-exec-file-path buffer local 
variable.  The mangle table is in a buffer named *mangle-table-<execfile>*."
  (interactive "P")
  (let (exec-file-path mangle-table-buffer-name)
    (setq exec-file-path (expand-file-name (if arg
					       (read-file-name 
						"Executable file: "
						default-directory
						(concat default-directory
							(substring (buffer-name nil) 5 -1))
						t)
					     gdb-exec-file-path)))
    (setq mangle-table-buffer-name (mangle-table-buffer-name exec-file-path))
    (save-window-excursion
      (catch 'abort
	(let ((old-case-replace case-replace)
	      (old-case-fold-search case-fold-search))
	  (setq case-replace nil
		case-fold-search t)
	  (if (get-buffer mangle-table-buffer-name)
	      (cond ((y-or-n-p (format "Delete existing %s "
				       mangle-table-buffer-name))
		     (kill-buffer mangle-table-buffer-name))
		    (t 
		     (ding)
		     (message "Abort.")
		     (throw 'abort nil))))
	  (message "Making mangle table, please wait...")
	  (shell-command (concat nm++-pathname " " exec-file-path))
	  (set-buffer "*Shell Command Output*")
	  (rename-buffer mangle-table-buffer-name)
	  (if (= 1 (count-lines (point-min) (point-max)))
	      (progn
		(message "Make mangle table using \"%s\" failed!" nm++-pathname)
		(sit-for 1)
		(throw 'abort nil)))
	  (goto-char (point-min))
	  (while (search-forward "[" nil t nil)
	    (backward-char 1)
	    (backward-delete-char 14 nil)
	    (insert "   ")
	    (beginning-of-line 1)
	    (delete-char 13)
	    (forward-line 1))
	  (goto-char (point-min))
	  (delete-non-matching-lines "\\[")
	  (goto-char (point-min))
	  (while (make-unique) (forward-line))
	  (goto-char (point-min))
	  (while (search-forward "\n\n" nil t nil)
	    (previous-line 2)
	    (delete-blank-lines))
	  (goto-char (point-min))
	  (replace-string "[_" "[")
	  (sort-lines nil (point-min) (point-max))
	  (local-set-key "" 'insert-mangle)
	  (setq case-replace old-case-replace
		case-fold-search old-case-fold-search)
	  (toggle-read-only)
	  (message "Mangle table %s created." mangle-table-buffer-name))))))

;;; ---------------------------------------------------------------------

(defun mid (demangled-identifier)
  "Prompts user for a DEMANGLED-IDENTIFIER and inserts it's mangled version
in the current buffer at point."
  (interactive (mid-string "Identifier to mangle: "))
  (let (result)
    (if (null (get-buffer (mangle-table-buffer-name gdb-exec-file-path)))
	(make-mangle-table nil))
    (setq result (mid-internal
		  demangled-identifier
		  (mangle-table-buffer-name gdb-exec-file-path)))
    (if result
	(insert result)
      (message "No match for \"%s\"." demangled-identifier))
    result))

;;; ---------------------------------------------------------------------

(defun lookup-mangle ()
  (interactive)
  (switch-to-buffer (mangle-table-buffer-name gdb-exec-file-path))
  (goto-char (point-min)))

(define-key gdb-mode-map "\C-cl" 'lookup-mangle)

;;; ---------------------------------------------------------------------

(defun insert-mangle ()
  (interactive)
  (beginning-of-line 1)
  (search-forward "[" nil nil nil)
  (setq mangle-start (point))
  (search-forward "]" nil nil nil)
  (backward-char)
  (toggle-read-only)
  (setq mangle-end (point))
  (kill-region mangle-start mangle-end)
  (yank)
  (toggle-read-only)
  (bury-buffer)
  (switch-to-buffer return-to-buffer)
  (yank))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; internals

(defun make-unique ()
  (cond
   ((= (point) (point-max)) nil)
   (t
    (progn 
      (beginning-of-line)
      (kill-line nil)
      (yank)
      (replace-string (car kill-ring) "") t))))


(defun mangle-table-buffer-name (exec-file-path)
  "Return the canonical name for the buffer used to store the mangle table."
  (format "*mangle-table-%s*" (file-name-nondirectory exec-file-path)))


(defun mid-internal (demangled-identifier mangle-table-buffer)
  "Look up DEMANGLED-IDENTIFIER in the buffer name MANGLE-TABLE-BUFFER.  Return
mangled symbol or nil."
  (save-excursion
    (set-buffer mangle-table-buffer)
    (goto-char (point-min))
    (if (string-match (concat "\n" demangled-identifier "[ ]+\\\[\\\([a-z0-9A-Z_]*\\\)\\\]")
		      (buffer-string))
	(substring (buffer-string) (match-beginning 1) (match-end 1)))))

(defun mid-string (prompt-string)
  (let* ((default (mid-default))
	 (spec (read-string
		(if default
		    (format "%s(default %s) " prompt-string default)
		  string))))
    (list (if (equal spec "")
	      default
	    spec))))

(defun mid-default ()
  "get the symbol to be mangled"
  (save-excursion
    (while (looking-at "\\sw\\|\\s_")
      (forward-char 1))
    (if (re-search-backward "\\sw\\|\\s_" nil t)
	(progn (forward-char 1)
	       (buffer-substring (point)
				 (progn (forward-sexp -1)
					(while (looking-at "\\s'")
					  (forward-char 1))
					(point))))
      nil)))

(provide 'gdb-ext)


