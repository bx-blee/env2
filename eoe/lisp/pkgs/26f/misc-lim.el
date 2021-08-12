;;; -*- Mode: Emacs-Lisp -*-

(require 'basic-ext)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Miscellaneous New Commands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; delete successive duplicate lines
;;;
(defun remove-duplicatesConflictsWithYas()
  "Flush duplicate lines that are consequtively identical."
  (interactive)
  (save-excursion
    (while (and (not (eobp))
		(re-search-forward "\\(^.*\\)\n\\1" nil 'move-to-end))
      (delete-region (match-beginning 1) (+ (match-end 1) 1))
      (goto-char (match-beginning 1)))))


(defun eoe-set-bell (&optional state)
  "toggle bell between audible and visible.  Optional argument STATE 
which should be either 'audible or 'visible can also be passed to 
explicitly set the bell."
  (interactive)
  (cond ((equal window-system 'x)
	 (cond (state
		(cond ((eq state 'visible)
		       (x-set-bell 'visible)
		       (setq visible-bell nil))
		      ((eq state 'audible)
		       (x-set-bell nil)
		       (setq visible-bell t))
		      (t
		       (message "Invalid value for STATE parameter."))))))
	(t (message "Command only works with the X Window System."))))

(defun eoe-toggle-bell (&optional state)
  "toggle bell between audible and visible.  Optional argument STATE 
which should be either 'audible or 'visible can also be passed to 
explicitly set the bell."
  (interactive)
  (cond ((equal window-system 'x)
	 (cond (visible-bell
		;; make audible
		(eoe-set-bell 'visible))
	       (t
		;; make visible
		(eoe-set-bell 'audible))))
	(t (message "Command only works with the X Window System.")))
  (ding))

;;; number lines
;;;
(defun number-lines(start)
  "Number lines from current-line to the end of buffer,
starting with optional argument START."
  (interactive "P")
  (let ((count (prefix-numeric-value start)))
    (while (not (eobp))
      (beginning-of-line)
      (insert (format "%s" count))
      (setq count (+ count 1))
      (next-line 1))))


(defun current-line ()
  "Returns the current line number (in the buffer) of point."
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (beginning-of-line)
      (1+ (count-lines 1 (point))))))

(defun line-to-window-top ()
  "Display the current line at the top of the window."
  (interactive)
  (recenter 0))

(defun other-window-at-end ()
  "Like other-window, but goes to end of buffer.  If the point is
not currently at the end of the buffer, mark the position before moving
point to the end of buffer enabling the user to exchange-point-and-mark."
  (interactive)
  (other-window 1)
  ;; if point is not at end, push a mark
  (if (not (eq (point) (point-max)))
      (push-mark (point)))
  (goto-char (point-max)))

(progn
  (defun toggle-truncate-lines ()
    "Toggle between wrapping and truncation for long lines."
    (interactive)
    (setq truncate-partial-width-windows
	  (setq truncate-lines (not truncate-lines)))
    (recenter))

  ;; call once to sync up the values of
  ;; truncate-partial-width-windows and truncate-lines
  (toggle-truncate-lines)
  )

(defun interactive-blink-matching-open ()
  (interactive)
  (blink-matching-open))

(defun flash-filename ()
  "Display the current buffers filename in the message area."
  (interactive)
  (let (filename)
    (if (setq filename (buffer-file-name))
	(message (concat "Buffer file name: " filename))
      (message "No buffer file name."))))

(global-set-key "\C-cf" 'flash-filename)

(defun insert-filename ()
  "Stuff the buffer-file-name into the buffer"
  (interactive)
  (insert-string (buffer-file-name) ""))

(defun insert-time ()
  "Stuff the result of current-time-string into the buffer"
  (interactive)
  (insert-string (current-time-string)))

(global-set-key "\C-c\C-t" 'insert-time)

(defun fancy-goto-line ()
  "Show current line then call goto-line.  Point MUST be on first char of a line.
First line is numbered 1."
  (interactive)
  (mention nil 1 (format "Currently at %s ... " (what-line)))
  (call-interactively 'goto-line))

(defun scroll-up-1 ()
  "Scroll up by 1 line."
  (interactive)
  (scroll-up 1))

(defun scroll-down-1 ()
  "Scroll down by 1 line."
  (interactive)
  (scroll-down 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Buffer Manipulation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *trim-buffer-list-never-trim-list* '("RMAIL" ".newsrc" "+inbox")
  "Command trim-buffer-list should never try to trim buffers with these names.")

(setq _trim-buffer-list-never-trim-list_ nil)	; global variable

(defun maybe-trim-buffer (buf)
  (switch-to-buffer buf)
  (cond
   ;; never trimmable clause
   ((or (memq buf _trim-buffer-list-never-trim-list_)
	(eq major-mode 'dired-mode)
	;; additional "always save" criteria can follow here
	)
    nil)
   ;; always trimmable clause
   ((or buffer-read-only
	(string-has-prefix-p (buffer-name buf) "TAGS<")
	;; additional "always kill" criteria can follow here
	)
    (kill-buffer buf))))

(defun trim-buffer-list ()
  "Delete some buffers using function maybe-trim-buffer."
  (interactive)
  (let ((start-buf (current-buffer)))

    ;; first recompute the buffer list at trim-buffer-list invocation time
    (setq _trim-buffer-list-never-trim-list_ '()) ; to be recomputed in this fn
    (mapcar (function (lambda (buf-name)
			(let ((never-trim-buffer (get-buffer buf-name)))
			  (if never-trim-buffer
			      (setq _trim-buffer-list-never-trim-list_
				    (cons never-trim-buffer _trim-buffer-list-never-trim-list_))))
			))
	    *trim-buffer-list-never-trim-list*)

    (mapcar 'maybe-trim-buffer (buffer-list))
    (if (memq start-buf (buffer-list))
	(switch-to-buffer start-buf))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Window Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; keep-two-windows
;;;

(defun keep-two-windows (arg)
  "Split screen into two; horizontally (side by side).  If ARG, then 
split vertically (top and bottom).  If there are only
two windows of the same height or width, swap their buffers."
  (interactive "P")
  (let ((b1 (window-buffer))
	;; note window-buffer on nil is => buffer of current window
	(b2 (progn (other-window 1)
		   (window-buffer)))
	temp)

    ;; if there are already two windows and the seem to be previously
    ;; split (i.e., they either have the same height or width,
    ;; depending), then swap buffers
    (if (= 2 (length (window-list)))	; two windows
	(if (or (and (null arg)
		     (= (window-height)	(- (screen-height) 1)))
		(and arg
		     (= (window-width) (screen-width))))
	    (setq temp b1
		  b1 b2
		  b2 temp)))	    

    ;; configure emacs to have just two windows, either
    ;; horizontally or vertically
    (delete-other-windows)
    (if arg (split-window-vertically)
      (split-window-horizontally))

    (switch-to-buffer b1)
    (other-window 1)
    (switch-to-buffer b2)
    (other-window 1)
    ))

;;; just have two windows, split vertically
;;;
(defun two-vertical-windows-by-ratio (ratio)
  "bottom window is 1/RATIO the height of the top window"
  (delete-other-windows)
  (split-window-vertically)
  (enlarge-window (/ (screen-height) ratio)))

;;; Split my windows into 2 or 3 for programming
;;;
(defun windows-for-hacking (arg)
  "Configure screen with 2 or 3 windows.  Provides an 80-column wide
coding window, a compilation dribble window, and (if the screen is
wide enough) a shell interaction window.  If ARG, omit the compilation
dribble window."
  (interactive "P")
  ;; set up the windows
  (two-vertical-windows-by-ratio 5)

  ;; split top window horizontally to make left pane 80 columns wide
  (split-window-horizontally)
  (enlarge-window-horizontally
   (- 80 (window-width (selected-window))))

  ;; If the screen width is big enough for 2 80 columns side-by-side then we
  ;; have 3 windows right to go away on 80 colum screens.  If not we
  ;; start/goto the user's preferred shell window in the right hand
  ;; pane (screen-width)
  (if (= 3 (length (window-list)))
      (progn
	(other-window 1)
	(goto-shell t)
	(goto-char (point-max))))

  ;; make the next pane the *compilation* buffer and
  ;; goto point max
  (other-window 1)
  (switch-to-buffer "*compilation*")
  (goto-char (point-max))

  ;; If ARG, then don't display the compilation window
  (if arg (maybe-delete-windows "*compilation*"))

  ;; select window
  (home-window)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CVS additions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun cvs-update-local ()
  (interactive)
  (cvs-update default-directory t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; shell interaction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *preferred-shell-function* 'shell
  "Name of a function that creates a shell interaction buffer.
Default value is 'shell.")

(defun goto-shell (change-cd)
  "Select window for the shell specified by *preferred-shell-function*.
If the shell buffer already has a window, then that window is selected.  
Otherwise, the current window is used.

Positions cursor at the end of the shell's buffer.  With argument CHANGE-CD,
then also do a cd to the default-directory of the current-buffer at
function invocation time."
  (interactive "P")
  (let ((current-buffer (current-buffer))
	(current-default-directory default-directory)
	shell-buffer
	shell-buffer-window)

    ;; find the shell buffer
    (save-window-excursion
      (apply *preferred-shell-function* '())
      (setq shell-buffer (current-buffer)))

    (cond ((setq shell-buffer-window (get-buffer-window shell-buffer))
	   ;; shell buffer already has window
	   (select-window shell-buffer-window))
	  (t
	   ;; shell buffer does not have window
	   (switch-to-buffer shell-buffer)))

    (goto-char (point-max))
    (if (and change-cd current-default-directory)
	(progn
	  (process-send-string
	   (get-buffer-process (current-buffer))
	   ;;(format "cd %s\n" current-default-directory)
	   (format "pushd %s\n" current-default-directory)
	   )
	  (sleep-for 2)			; give process-send-string some time
	  (goto-char (point-max))
	  (cd current-default-directory) ; set for the buffer as well
	  ))
    ))


(defun goto-shell-with-cd ()
  "Equivalent to `goto-shell' with ARG."
  (interactive)
  (goto-shell t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mail
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *preferred-mail-reading-function*
  'rmail
  "Name of preferred mail reading function.
Default value is 'rmail.  Could also be 'mh-rmail.")

(defvar *preferred-mail-writing-function*
  'mail
  "Name of preferred mail writing function.
Default value is 'mail.  Could also be 'mh-smail.")

;;; read-mail
;;;
(defun read-mail ()
  "Read mail using *preferred-mail-reading-function*."
  (interactive)
  (funcall *preferred-mail-reading-function*))

;;; write-mail
;;;
(defun write-mail ()
  "Write mail using *preferred-mail-writing-function*."
  (interactive)
  (funcall *preferred-mail-writing-function*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shell Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Picture Mode Hacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar picture-movement-toggle-list
  '(
    ;; picture-movement-up
    picture-movement-down
    ;; picture-movement-left
    picture-movement-right
    ;; picture-movement-ne
    ;; picture-movement-nw
    ;; picture-movement-se
    ;; picture-movement-sw
    )
  "Picture-movement-toggle cycles through these orientations."
  )

(defun picture-movement-toggle()
  "Cycle amongst orientation in picture-movement-toggle-list."
  (interactive)
  (let (next-movement-function)
    (cond ((eq major-mode 'edit-picture)
	   (setq next-movement-function (car picture-movement-toggle-list))
	   (funcall next-movement-function)
	   (message "Picture movement set to be: %s." next-movement-function)
	   (setq picture-movement-toggle-list

		 (append (cdr picture-movement-toggle-list)
			 (list next-movement-function))))
	  (t (message "Not currently editing a picture!")))))

(defun picture-mode-toggle()
  "Toggle in and out of picture mode."
  (interactive)
  (if (eq major-mode 'edit-picture)
      (picture-mode-exit)
    (edit-picture)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; writing support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun fancy-spell-word (arg)
  "Just like 'spell-word', except with ARG invokes 'webster' instead."
  (interactive "P")
  (if arg
      (call-interactively 'webster)
    (call-interactively 'ispell-word)))

; (global-set-key "\M-$" 'fancy-spell-word)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mail & RMAIL stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun goto-rmail ()
  "Select the RMAIL window, creating it if necessary."
  (interactive)
  (let ((rmail-buffer (get-buffer "RMAIL")))
    ;; go to the correct window
    (or (maybe-select-window "RMAIL")
	(progn (home-window)
	       (other-window 1)))
    ;; go to the correct buffer, creating it if necessary
    (rmail)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'misc-lim)
