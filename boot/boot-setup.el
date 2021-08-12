;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (boot-setup:),  [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
")
;;;#+END:



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")

(lambda () "
* blee:env:  Base determinations
")

;;; (blee:env:base-obtain-based-on-here)
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

(defvar blee:env:base (blee:env:base-obtain-based-on-here)
  "Base Directory of Blee")

;; (blee:env:base-obtain)
(defun blee:env:base-obtain ()
  "Eg /bisos/blee/env/ -- This function will be invoked frequently, so it uses the obtained variable"
  blee:env:base
  )

;; (blee:base-obtain)
(defun blee:base-obtain ()
  "Eg /bisos/blee"
  (file-name-directory (directory-file-name (blee:env:base-obtain)))
  )


(lambda () "
* Emacs and Blee type defvars
")

(defvar *emacs-type* "fsf"
  "Historic but kept for future resurrections -- used to distinguish lucid emacs etc")

(defvar blee:emacs:type "fsf"
  "We are assuming that other than fsf emacs types could exist -- used to distinguish lucid emacs etc")


(defvar *eoe-emacs-type* (intern (format "%df" emacs-major-version))
  "A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")

(defvar blee:emacs:id (intern (format "%df" emacs-major-version))
  "A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")



(lambda () "
* Explicit Base Specifications -- eg info yasnipets widgets
")


(defun blee:env:eoe:base-obtain ()
  "Eg /bisos/blee/env/eoe/"
    ;; (file-name-directory      buffer-file-name)
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "eoe"))
  )

(defun blee:env:main:base-obtain ()
  "Eg /bisos/blee/env/boot/"
    ;; (file-name-directory      buffer-file-name)
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "boot"))
  )

(defun blee:env:lib:base-obtain ()
  "Eg /bisos/blee/env/lib/"
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "lib"))
  )

(defun blee:env:info:base-obtain ()
  "Eg /bisos/blee/env/info/"
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "info"))
  )

(defun blee:env:dblocks:base-obtain ()
  "Eg /bisos/blee/env/dblocks/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "dblocks")
  )

(defun blee:env:widgets:base-obtain ()
  "Eg /bisos/blee/env/widgets/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "widgets")
  )


(defun blee:env:splashScreen:base-obtain ()
  "Eg /bisos/blee/env/splashScreen/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "splashScreen")
  )

(defun blee:env:snippets:base-obtain ()
  "Eg /bisos/blee/env/snippets/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "snippets")
  )

(defun blee:env:panels:base-obtain ()
  "Eg /bisos/blee/env/panels/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "panels")
  )

(defun blee:env:images:base-obtain ()
  "Eg /bisos/blee/env/images/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "images")
  )

(defun blee:env:aPkgs:base-obtain ()
  "Eg /bisos/blee/env/aPkgs/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "aPkgs")
  )

(lambda () "
* Historic Bases
")

(defvar *eoe-root-dir*  (directory-file-name (blee:env:eoe:base-obtain))
  "This is the base EOE directory.")

(setq *eoe-site-root-dir* "/NOTYET") ;; This is used just in here
(setq *eoe-site-name* "NOTYET")      ;; This is used somewhere in eoe library

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


(lambda () "
* ByStar User Environment (BUE) Bases
")

(defun blee:bue:base-obtain%% ()
  "Either ~/BUE/elisp or ~/blee"
  (let* (bueElispBase (expand-file-name "~/BUE/elisp"))
    )
  (when (file-exists-p bueElispBase)
    bueElispBase)

  (unless (file-exists-p bueElispBase)  
    "~/blee"
    )
  )

(lambda () "
* Package ELPA Bases
")


;;; (blee:elpa:base-obtain)
(defun blee:elpa:base-obtain ()
  "Eg. /bisos/blee/27f/elpa/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name *eoe-emacs-type*)		    
		    "/elpa/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )

;;; (blee:run:base-obtain)
(defun blee:run:base-obtain ()
  "Eg. /bisos/blee/27f/run/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name *eoe-emacs-type*)		    
		    "/run/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )

;;; (blee:tmp:base-obtain)
(defun blee:tmp:base-obtain ()
  "Eg. /bisos/blee/27f/tmp/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name *eoe-emacs-type*)		    
		    "/tmp/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )


(lambda () "
* Now setup the load-path -- (describe-variable 'load-path)
")

;;
;; (describe-variable 'load-path)
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
			;;
			;; prepend to the existing load-path
			;;
			load-path
			))

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
;;(defvar *eoe-site-init-file* (format "%s/.emacs%s" *eoe-sys-dir* *eoe-emacs-type*)
;;  "Site init file to load (if present).")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:load-path:add) [[elisp:(org-cycle)][| ]]
")



(defun blee:load-path:add (@dirPath)
  "@dirPath is added to load-path after verification."
  (let (
	($dirPath (expand-file-name @dirPath))
	)
    (if (file-directory-p $dirPath)
	(add-to-list 'load-path $dirPath)
      )))


(funcall  (lambda () "
*     load-path setup
**    +env/main +env/lib +env/dblocks
"
	    (blee:load-path:add (blee:env:main:base-obtain))
	    (blee:load-path:add (blee:env:lib:base-obtain))
	    (blee:load-path:add (blee:env:dblocks:base-obtain))
	    (blee:load-path:add (blee:env:widgets:base-obtain))	    
	    (blee:load-path:add "~/BUE/elisp")
	    (blee:load-path:add "/opt/public/neweoe/lisp/public/bbdb-filters-0.51")	    
	    ))



;; ;;{{{ Bystar Initializations:

;; ;;; -----------------------------------------------------------------
;; ;;; prepend user's /bisos/git/auth/bxRepos/blee/env/main to load path, if exists
;; ;;; -----------------------------------------------------------------
;; (if (file-directory-p (expand-file-name "/bisos/git/auth/bxRepos/blee/env/main"))
;;     (setq load-path (cons (expand-file-name "/bisos/git/auth/bxRepos/blee/env/main")
;; 		      load-path)))

;; (if (file-directory-p (expand-file-name "/bisos/git/auth/bxRepos/blee/env/lib/widget"))
;;     (setq load-path (cons (expand-file-name "/bisos/git/auth/bxRepos/blee/env/lib/widget")
;; 			  load-path)))

;; (if (file-directory-p (expand-file-name "/bisos/git/auth/bxRepos/blee/env/dblocks"))
;;     (setq load-path (cons (expand-file-name "/bisos/git/auth/bxRepos/blee/env/dblocks")
;; 		      load-path)))

;; (if (file-directory-p (expand-file-name "/bisos/git/auth/bxRepos/blee/env/lib"))
;;     (setq load-path (cons (expand-file-name "/bisos/git/auth/bxRepos/blee/env/lib")
;; 		      load-path)))

;; (if (file-directory-p (expand-file-name "~/BUE/elisp"))
;;     (setq load-path (cons (expand-file-name "~/BUE/elisp")
;; 		      load-path)))			  

;; (setq load-path (cons (expand-file-name "/opt/public/neweoe/lisp/public/bbdb-filters-0.51")
;; 		      load-path))

;; ;;(setq load-path (cons "." load-path))



;;; -----------------------------------------------------------------
;;; Setup EOE's info directories
;;; -----------------------------------------------------------------

(defun blee:info-path ()
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
  )



;;(require 'blee-comeega)
;;(load-file "blee-comeega.el")  ;;; require does not work with (compile-time-function-name), so we load




(setq debug-on-error nil)
;;(setq debug-on-error t)


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "boot-setup"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'boot-setup)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; major-mode: emacs-lisp-mode
;;; end:



