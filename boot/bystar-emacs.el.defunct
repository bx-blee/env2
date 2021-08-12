;;; -*- Mode: Emacs-Lisp; -*-
;;; RCS: $Id: bystar-emacs.el,v 1.3 2011-01-30 16:10:23 lsipusr Exp $
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;; -----------------------------------------------------------------
;;; EOE - Emacs Office Environment Start Up
;;; -----------------------------------------------------------------
;;;
;;; The standard emacs init file for EOE users.
;;;
;;; THIS FILE DOES ONLY THE FOLLOWING THINGS:
;;; 0. Site determination.  Set the value of a well-known, global 
;;;    variable *eoe-site-name*.
;;; 1. Modifies the emacs load-path to include the EOE directories.
;;; 2. Determines the version of emacs being run, and sets the value 
;;;    of *eoe-emacs-type*.
;;; 3. Loads the EOE site-wide, run-time initialization library 
;;;    "default-eoe".
;;; 4. Loads the user's EOE user-parameters file if present, or else
;;;    the system's default. (.eoe)
;;; 5. Loads the EOE user's emacs init file, if found or else the
;;;    system's default. { .emacs18f | .emacs19f | .emacs19x }
;;;
;;; NO ADDITIONAL CODE FOR OTHER PURPOSES SHOULD BE PUT INTO THIS FILE.
;;; Any EOE site-specific startup code belongs in library default-eoe.el
;;; Any user-specific startup code belongs in the EOE user's emacs init file.
;;;
;;; -----------------------------------------------------------------
;;; SOME BACKGROUND:
;;; We use:
;;;    * this standard ~/.emacs file
;;;    * default-eoe.el library
;;;    * ~/emacs-usr.el file (emacs 18); ~/xemacs-usr.el file (xemacs)
;;;
;;; to provide a superset of the functionality that is provided by:
;;;    * site-init.el library (that is sourced once at emacs build time)
;;;    * ~/.emacs file
;;;    * default.el library
;;;
;;; In particular, this makes EOE easy to install at a new site since
;;; the startup files are effectively EOE controlled.  EOE disables
;;; loading of the default.el library (although the EOE user can
;;; override this).
;;; -----------------------------------------------------------------

(setq debug-on-error t) ; to simplify debugging EOE startup, may want
                        ; remove when done debugging.  This is turned
                        ; off at the end of this file just before loading
                        ; the user's eoe init file.

;; temporarily bump up gc-cons-threshold
(setq gc-cons-threshold (* gc-cons-threshold 10))

;;; -----------------------------------------------------------------
;;; Site Determination
;;; -----------------------------------------------------------------

;;
;; set the *eoe-site-name* variable below e.g., "neda.com"
;;
(defvar *eoe-site-name* "neda.com"	; <== EOE CUSTOMIZATION NEEDED HERE ***
  "The name string for the current site.")

(defun guess-site-name ()
  "Guess the current site, returning a string or nil if cannot guess."
  (let ((sn nil)
	(domainname-command "/bin/domainname"))
    (cond ((file-exists-p domainname-command)
	   ;; compute site name from domain name
	   (let ((result-buffer (get-buffer-create " *Guess Site Name*")))
	     (set-buffer result-buffer)
	     (kill-region (point-min) (point-max))
	     (call-process domainname-command nil result-buffer nil)
	     (setq sn (buffer-substring (point-min) (- (point-max) 1)))
	     (kill-buffer result-buffer)
	     ))
	  (t
	   ;; place holder for some other heuristic here
	   ))
    sn))

(cond ((or (null *eoe-site-name*)
	   (string= "" *eoe-site-name*))
       (ding)
       (message "EOE improperly set up--site name unspecified.  Guessing ...")
       (sleep-for 3)
       (cond ((setq *eoe-site-name* (guess-site-name))
	      (message "assuming %s" *eoe-site-name*)
	      (sleep-for 2))
	     (t
	      (error "Failed!  Check .emacs file."))))
      (t (message "Starting EOE for site %s" *eoe-site-name*)))


;;; -----------------------------------------------------------------
;;; emacs version determination and site-specific EOE load-path setup
;;; -----------------------------------------------------------------

;;; Prepend the emacs load path with EOE specific directories.
;;; Prepending allows overriding standard library files.  These
;;; directories are defined as well-known, global variables to allow
;;; for avoiding use of hardcoded paths in eoe files.



(defun blee:env:base-obtain-based-on-here ()
  "Eg /bisos/blee/env/"
  (file-name-directory
   (directory-file-name
    (file-name-directory
     (if buffer-file-name
	 buffer-file-name
       load-file-name)
     )))
  )

;;(defvar blee:env:base (blee:env:base-obtain-based-on-here) "Basedir of Blee")
(setq blee:env:base (blee:env:base-obtain-based-on-here))

;; (blee:env:base-obtain)
(defun blee:env:base-obtain ()
  "Eg /bisos/blee/env/"
  blee:env:base
  )


(defun blee:env:eoe:base-obtain ()
  "Eg /bisos/blee/env/eoe/"
    ;; (file-name-directory      buffer-file-name)
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "eoe"))
  )


;;
;; EOE base directory
;;
(defvar *eoe-root-dir* (cond ((eq system-type 'cygwin32)	; <== EOE CUSTOMIZATION MAYBE NEEDED ***
			      "u:/opt/public/neweoe")
			     (t
			      (directory-file-name (blee:env:eoe:base-obtain))))
  "This is the base EOE directory.")

;;
;; other directories are derived from *eoe-root-dir*
;;
(defvar *eoe-sys-dir* (concat *eoe-root-dir* "/lisp/sys")
  "Place where basic elisp code for EOE services is kept.
This must be non-emacs version specific code.")

(defvar *eoe-pkgs-dir* (concat *eoe-root-dir* "/lisp/pkgs")
  "Place where basic elisp code for EOE packages is kept.
This must be non-emacs version specific code.")

(defvar *eoe-public-dir* (concat *eoe-root-dir* "/lisp/public")
  "Place where public-domain, externally developed emacs code is kept.
This must be non-emacs version specific.")

(defvar *eoe-byname-dir* (concat *eoe-root-dir* "/lisp/byname")
  "Place where elisp code for EOE-BYNAME services is kept.
This must be non-emacs version specific code.")

(defvar *eoe-esfiles-dir* (concat *eoe-root-dir* "/lisp/esfiles")
  "Place to keep -site.el files that cannot be in the same directory as
the main .el file say due to file-permissions restrictions.
We call these estranged -eoeb.el files.
This must be non-emacs version specific code.")

;;
;; Determine Emacs version
;;

(load-file (concat *eoe-sys-dir* "/eoe.el"))
(load-file (concat *eoe-sys-dir* "/eoe-emacs-vers.el"))

;; All emacs version operations should be based on emacs-vers.el
;; the library is loaded with an explicit path because the load
;; path is currently a function of emacs versions so we cannot
;; yet use the load-path to resolve library names reliably
(message "Emacs version: %s %d.%d"
	 emacs-type emacs-major-version emacs-minor-version)

(setq *eoe-emacs-type*
      (cond ((equal emacs-type 'fsf)
	     (intern (format "%df" emacs-major-version)))
	    ((equal emacs-type 'xemacs)
	     (intern (format "%dx" emacs-major-version)))
	    ((equal emacs-type 'lucid)
	     (intern (format "%dl" emacs-major-version)))
	    (t
	     (message "Unsupported emacs type: %s" emacs-type)
	     (intern (format "%d%s" emacs-major-version)))))



(defvar *eoe-ver-pkgs-dir* (concat *eoe-root-dir*
				     (format "/lisp/pkgs/%s" *eoe-emacs-type*))
  "EOE developed emacs code kept here.")

(defvar *eoe-ver-public-dir* (concat *eoe-root-dir*
				     (format "/lisp/public/%s" *eoe-emacs-type*))
  "Public-domain, externally developed emacs code kept here.")

(defvar *eoe-ver-byname-dir* (concat *eoe-root-dir*
				     (format "/lisp/byname/%s" *eoe-emacs-type*))
  "Public-domain, externally developed emacs code kept here.")


(defvar *eoe-ver-esfiles-dir* (concat *eoe-root-dir*
				      (format "/lisp/esfiles/%s" *eoe-emacs-type*))
  "*-site.el files that can't be kept with their main .el files are kept here.
We call these estranged -eoeb.el files.")


;;
;; Site Specific Code
;;

(defvar *eoe-site-root-dir* (cond ((string= "neda.com" *eoe-site-name*)
			      "/opt/public/neweoe/siteControl/nedaPlus")
			     (t
			      (concat *eoe-root-dir* "/siteControl/" *eoe-site-name*)))
  "This is the base SITE EOE directory.")

(defvar *eoe-local-dir* (concat *eoe-site-root-dir* "/local")
  "Place where locally-developed elisp code for EOE services is kept.
This must be non-emacs version specific code.")

(defvar *eoe-ver-local-dir* (concat *eoe-site-root-dir*
				    (format "/local/%s" *eoe-emacs-type*))
  "Locally-developed, version specific, elisp code kept here.")


(defvar *eoe-esfiles-local-dir* (concat *eoe-site-root-dir* "/esfiles")
  "Place where local estranged files -site.el are kept.")

(defvar *eoe-ver-esfiles-local-dir* (concat *eoe-site-root-dir*
				    (format "/esfiles/%s" *eoe-emacs-type*))
  "Place where local estranged version specific files -site.el are kept.")


;;
;; Now setup the load-path
;;
(setq load-path (append (list *eoe-sys-dir*) ; eoe base files
			;;
			;; local directories
			;;
			(append (eoe-get-package-subdirs *eoe-ver-local-dir*) ; version dependant dir(s)
				(list *eoe-ver-local-dir*))
			(append (eoe-get-package-subdirs *eoe-local-dir*) ; version independant dir(s)
				(list *eoe-local-dir*))
			;;
			;; local estranged -eoeb.el file directories
			;;
			(list *eoe-ver-esfiles-local-dir* *eoe-esfiles-local-dir*)

			;;
			;; EOE Pkgs directories
			;;
			(append (eoe-get-package-subdirs *eoe-ver-pkgs-dir*) ; version dependant dir(s)
				(list *eoe-ver-pkgs-dir*))
			(append (eoe-get-package-subdirs *eoe-pkgs-dir*) ; version independant dir(s)
				(list  *eoe-pkgs-dir*))
			;;
			;; public directories
			;;
			(append (eoe-get-package-subdirs *eoe-ver-public-dir*) ; version dependant dir(s)
				(list *eoe-ver-public-dir*))
			(append (eoe-get-package-subdirs *eoe-public-dir*) ; version independant dir(s)
				(list  *eoe-public-dir*))
			;;
			;; estranged -eoeb.el file directories
			;;
			(list *eoe-ver-esfiles-dir* *eoe-esfiles-dir*)
			;;
			;; prepend to the existing load-path
			;;
			load-path
			))

;;; -----------------------------------------------------------------
;;; Setup EOE's info directories
;;; -----------------------------------------------------------------

(cond ((or (eq *eoe-emacs-type* '19x)
	   (eq *eoe-emacs-type* '19f))
       ;; emacs 19 supports a list of info directories
       (require 'info)
       (setq Info-directory-list
	     (append Info-directory-list
		     (list
		      (expand-file-name (format "%s/info" *eoe-root-dir*))
		      (expand-file-name (format "%s/lisp/%s/info" *eoe-root-dir* *eoe-emacs-type*))
		      (expand-file-name (format "%s/lisp/info" *eoe-root-dir*))
		      ))))
      ((eq *eoe-emacs-type* '18f)
       ;; emacs 18 only has 1 info directory--use eoe's
       (setq Info-directory (expand-file-name
			     (format "%s/info" *eoe-root-dir*))))
      )

;;; -----------------------------------------------------------------
;;; Now load the basic eoe functionality
;;; -----------------------------------------------------------------
(load "eoe")

;;; -----------------------------------------------------------------
;;; Now load the default-eoe library for site wide EOE run-time
;;; -----------------------------------------------------------------
(load "default-eoe")			; this is being obsoleted...

;; we don't use admin-administered emacs defaults (but we set this
;; *before* loading the user's init file so that this decision can be
;; overridden).
(setq inhibit-default-init t)

;;; -----------------------------------------------------------------
;;; Now load user-specific EOE parameters
;;; -----------------------------------------------------------------
(defvar *eoe-user-parameters-file* "~/.eoe"
  "User's init file to load (if present).")

(defvar *eoe-default-user-parameters-file* (format "%s/.eoe" *eoe-sys-dir*)
  "Default init file to load (if user's is not present).")

(cond ((file-exists-p *eoe-user-parameters-file*)
       (load *eoe-user-parameters-file*))
      (t
       (load *eoe-default-user-parameters-file*)))

;;; -----------------------------------------------------------------
;;; XEmacs initial fonts and faces setup
;;; -----------------------------------------------------------------
;; eoe uses dark background
(defconst eoe-background-mode 'dark "EOE uses dark background.")

;; ./lisp/eoeDressUps2.el 
;;;(load "/bisos/git/auth/bxRepos/blee/env/main/eoeDressUps2.el") ;; OBSOLETED MB 1/2011

;;; -----------------------------------------------------------------
;;; Now site-specific initialization (load packages, autoloads, ...)
;;; allow the user to override with his own
;;; -----------------------------------------------------------------
(defvar *eoe-site-init-file* (format "%s/.emacs%s" *eoe-sys-dir* *eoe-emacs-type*)
  "Site init file to load (if present).")

(defvar *eoe-user-init-file* (format "/bisos/git/auth/bxRepos/blee/env/main/bystar-emacs%s.el" *eoe-emacs-type*)
  "User's init file to load (if present).")

(cond ((file-exists-p *eoe-user-init-file*)
       (load *eoe-user-init-file*))
      ((file-exists-p *eoe-site-init-file*)
       (load *eoe-site-init-file*)))

;; ./lisp/notYetExtras.el 

(load "/bisos/git/auth/bxRepos/blee/env/main/notYetExtras.el")

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
	    (= emacs-major-version 19)
	    (>= emacs-minor-version 14))
	   (= emacs-major-version 20))
       (fboundp 'load-options-file))
  ;; load user's .xemacs-options or not present load eoe's
  (cond ((file-exists-p "~/.xemacs-options")
	 (load-options-file "~/.xemacs-options"))
	(t
	 (message "User ~/.xemacs-options not found, using default.")
	 (load-options-file (format "%s/.xemacs-options" *eoe-sys-dir*))))))
;; ============================
;; End of Options Menu Settings

