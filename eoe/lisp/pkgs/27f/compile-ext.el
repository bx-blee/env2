;;; -*- Mode: Emacs-Lisp; SCCS Info: @(#)compile-ext.el	1.1 4/21/92 -*-

(require 'compile)			; to modify stuff in compile.el
(require 'basic-ext)			; for sync-cd, time stuff

;;; I test before setq to make sure i'm really fixing the problem
;;; if some subsequent version of emacs changes the value of compile-command
;;; I want to know about it.
(cond ((string-equal compile-command "make -k ")
       (setq compile-command "make "))
      (t (message "value of compile-command not 'make -k '--not changed.")))

(defvar *last-compile-command* compile-command
  "save the last compile command")

;;; the compile function side-effects the value of the global variable
;;; compile-command which serves as the default compile command.
;;; compile-not-sticky leaves compile-command alone
;;;
(defun compile-not-sticky (command)
  "Version of 'compile' without sticky default compile command feature.
Additional documentation available with the 'compile' function."
  (interactive (list (read-string "Compile command: " compile-command)))
  (setq *last-compile-command* command)
  (compile-internal command "No more errors"))

;;; just use the current value of compile-command, no questions asked
;;;
;;; TODO: if the *compilation* buffer is currently being displayed in a
;;; window, then should make that the active window and move the mouse to
;;; point-max so that the user can follow the compilation's progress.
(defun compile-no-ask ()
  "Compile using the last compile-command, in the last compile-command
directory with no questions asked.  Additional documentation available with
the 'compile' function."
  (interactive)
  (cond ((get-buffer "*compilation*")
	 (save-window-excursion
	   (set-buffer "*compilation*")
	   (compile-internal *last-compile-command* "No more errors")
	   )

	 ;; if *compilation* buffer has a window
	 ;; then make that the current window and
	 ;; move to point-max
	 (let (compiation-window)
	   (cond ((setq compilation-window (get-buffer-window (get-buffer "*compilation*")))
		  (select-window compilation-window)
		  (goto-char (point-max)))))
	 )
	(t
	 (ding)
	 (message "*compilation* buffer not found!"))))

;;; Save old compilation dribbles in the *compilation* buffer in
;;; another buffer called *previous-compilations*

(defvar *previous-compilations-max* 5
  "max num of old *compilation* dribbles saved in *previous-compilation*")

(defvar *previous-compilations-saved* 0
  "number of saved *compilation* dribbles in *previous-compilation*")

(defvar *previous-compilation-delimiter*
  "\n--next compilation follows this line--\n"
  "String delimiting saved compilation dribble")

(defvar *new-compilation-buffer-p* t
  "used by save-compilation-dribble and next-error-with-converted-time-info")

(defun save-compilation-dribble ()
  "save current *compilation* in *previous-compilation*"
  (setq *new-compilation-buffer-p* t)
  (let ((current-buffer (current-buffer))
	(compilation-buffer (get-buffer "*compilation*")))
    (if compilation-buffer
	(progn
	  (switch-to-buffer " *previous-compilations*")
	  (end-of-buffer)
	  (insert *previous-compilation-delimiter*)
	  (insert-buffer compilation-buffer)
	  (if (> *previous-compilations-saved* *previous-compilations-max*)
	      (progn
		(trim-previous-compilation)
		(setq *previous-compilations-saved*
		      (- *previous-compilations-saved* 1))))
	  (setq *previous-compilations-saved*
		(+ 1 *previous-compilations-saved*))))
    (switch-to-buffer current-buffer)))

;;; trim *previous-compilations* buffer
;;;
(defun trim-previous-compilation ()
  "delete the oldest saved compilation dribble"
  (switch-to-buffer " *previous-compilations*")
  (save-excursion
    (goto-char (point-min))
    (search-forward *previous-compilation-delimiter*)
    (delete-region (point-min) (point))))

;;; used by 'next-error' to parse error messages to extract filenames.
;;; if forward-sexp fails print a more reasonable message than just
;;; "unbalanced parenthesis"!
;;;
(defun compilation-grab-filename ()
  "Return a string which is a filename, starting at point.
Ignore quotes and parentheses around it, as well as trailing colons."
  (if (eq (following-char) ?\")
      (save-restriction
	(narrow-to-region (point)
			  (progn
			    (condition-case ()
				(forward-sexp 1)
			      (error (message "failed to grab filename!")))
			    (point)))
	(goto-char (point-min))
	(read (current-buffer)))
    (buffer-substring (point)
		      (progn
			(skip-chars-forward "^ :,\n\t(")
			(point)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hack files.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the following is currently unused...

(defvar *never-ask-during-compile-internal*  
  "\\(^RMAIL*\\|^\\.emacs*\\|^\\.login*\\|^\\.cshrc*\\|^\\.newsrc*\\)"
  "regexp for names of buffer that don't need to be saved when compiling
in GNU Emacs.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TAGS enhancements
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun vtt()
  "Just like `visit-tags-table' except forces the default-directory
to be ~/tags/."
  (interactive)
  (let ((default-directory "~/tags/"))
    (call-interactively 'visit-tags-table)))


(defun fancy-find-tag (arg)
  "Same as `find-tag-other-window' except if ARG is supplied, 
then calls `find-tag' instead."
  (interactive "P")
  (cond (arg
	 (setq current-prefix-arg nil)
	 (call-interactively 'find-tag))
	(t
	 (call-interactively 'find-tag-other-window))))

;; rebind--find tag in other window instead
;; (global-set-key "\M-." 'fancy-find-tag)


(defun syncing-visit-tags-table ()
  "If the selected window has an associated process and the major-mode
is shell-mode or cmushell-mode, do a sync-cd first."
  (interactive)
  (if (and (get-buffer-process (current-buffer))
	   (memq major-mode '(shell-mode cmushell-mode)))
      (sync-cd))
  (call-interactively 'visit-tags-table))


(defun tags-search-typedef (typename)
  "Do a tags search for typedef of TYPENAME."
  (interactive (find-tag-tag "Tags search for typedef (regexp): "))
  (tags-search (format "\\(^\\s *typedef\\s +.*%s\\s *;\\|}\\s *\\**%s\\s *;\\)"
		       typename typename)))


(defun tags-search-define (def)
  "Do a tags search for definition of DEF." 
  (interactive (find-tag-tag "Tags search for #define (regexp): "))
  (tags-search (format "^\\s *#\\s *define\\s +%s\\(\\s +\\|(\\)" def)))


(defun tags-search-struct (stag)
  "Do a tags search for structure tag STAG." 
  (interactive (find-tag-tag "Tags search for structure tag (regexp): "))
  (tags-search (format "^\\s *struct\\s +%s\\s +" stag)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'compile-ext)
