;;; -*- Mode: Emacs-Lisp; SCCS: %W% %G%-*-

;;; define the notion of a program that takes ascii and converts it to
;;; a printer-specific format.  E.g., for PostScript, this will
;;; typically be something like 'enscript' or 'a2ps'.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hacks for printing emacs buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar *ascii-print-parameter-sets*
  '((a2ps 
     "a2ps"				; program path
     ("-ns")				; landscape 2-up
     ("-ns" "-w")			; landscape 1-up
     ("-ns" "-p")			; portrait
     "-H"				; header switch
     )
    (enscript
     "enscript"				; prog path
     ("-2r" "-G")			; landscape 2-up
     ("-r" "-G")			; landscape 1-up
     ("-R" "-G")			; portrait
     "-b "				; header switch
     )
    (genscript				; GNU Enscript
     "genscript"			; prog path
     ("-2r" "-G")			; landscape 2-up
     ("-r" "-G" "--font=Courier7")	; landscape 1-up
     ("-R" "-G")			; portrait
     "-b "				; header switch
     )
    )
  "expected format is an a-list : ((<ascii-print-prog>
    <prog path> 
    <landscape-2up-switches> 
    <landscape-switches> 
    <portrait-switches>
    <header-switch))")

(defvar *ascii-print-program* 'a2ps
  "Ascii printing program to use.  See the variable `*ascii-print-parameter-sets*' for
the list of supported ASCII printing programs.")
				      
(defun ascii-print-path()
  (nth 1 (assoc *ascii-print-program* *ascii-print-parameter-sets*)))

(defun ascii-print-landscape-2up-switches()
  (nth 2 (assoc *ascii-print-program* *ascii-print-parameter-sets*)))

(defun ascii-print-landscape-switches()
  (nth 3 (assoc *ascii-print-program* *ascii-print-parameter-sets*)))

(defun ascii-print-portrait-switches()
  (nth 4 (assoc *ascii-print-program* *ascii-print-parameter-sets*)))

(defun ascii-print-header-switch()
  (nth 5 (assoc *ascii-print-program* *ascii-print-parameter-sets*)))

(defun ascii-print-buffer (arg)
  "Print buffer in landscape \"2-up\" orientation.
If ARG is nil, prints in portrait-orientation. 
If ARG is 1, prints in landscape-orientation 1-up.
If ARG is 2 or 4, prints in landscape-orientation, 2-up.
Includes the buffer's full filename (if any) in the page header."
  (interactive "p")
  (catch 'abort
    (let (orig-buffer-name buffer-filename buffer-renamed-p orientation)
      (setq orig-buffer-name (buffer-name))
      ;; set lpr-switches and orientation
      (cond ((= arg 1)			; M-x
	     (setq lpr-switches (ascii-print-portrait-switches)
		   orientation "portrait"))
	    ((= arg 0)			; C-u 0 M-x
	     (setq lpr-switches (ascii-print-landscape-switches)
		   orientation "landscape"))
	    ((or (= arg 4)		; C-u 4 M-x or C-u M-x
		 (= arg 2)		; C-u 2 M-x
		 )
	     (setq lpr-switches (ascii-print-landscape-2up-switches)
		   orientation "landscape 2-up"))
	    (t (ding)
	       (message (format "ARG of %d invalid. Use 1 => portait; 0 => landscape; 2 or 4 => landscape 2-up." arg))
	       (throw 'abort nil)))
      (if (y-or-n-p (format "Print %s in %s orientation? " orig-buffer-name orientation))
	  (unwind-protect
	      (progn
		(cond ((and (setq buffer-filename (buffer-file-name)) ; has assoc file
			    (not (string= buffer-filename orig-buffer-name)))
		       (rename-buffer buffer-filename)
		       (setq buffer-renamed-p t)
		       ))
		(ascii-print-region-1 (point-min) (point-max) lpr-switches))
	    ;; unwind protect actions
	    (if buffer-renamed-p
		(rename-buffer orig-buffer-name)))
	(message "ascii-print-buffer aborted.")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; stolen from print-region-1 (lpr.el) and modified

(defun ascii-print-region-1 (start end switches)
  (let ((name (buffer-name))
	(width tab-width)
	cpr-args)
    (save-excursion
      (message "Spooling...")
      (if (/= tab-width 8)
	  (let ((oldbuf (current-buffer)))
	    (set-buffer (get-buffer-create " *spool temp*"))
	    (widen) (erase-buffer)
	    (insert-buffer-substring oldbuf start end)
	    (setq tab-width width)
	    (untabify (point-min) (point-max))
	    (setq start (point-min) end (point-max))))
      (setq cpr-args (nconc (list start end (ascii-print-path)
				  nil nil nil)
			    (nconc (list (concat (ascii-print-header-switch) name))
				   switches)))
      (cond (nil			; for debugging
	     (setq foo cpr-args)
	     (message "call-process-region args: %s" cpr-args))
	    (t (apply 'call-process-region cpr-args)
	       (message "Spooling...done"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ascii-print)

