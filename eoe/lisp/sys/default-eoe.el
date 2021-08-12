;;; -*- Mode: Emacs-Lisp -*-

;;; *** >>> THIS FILE IS BEING OBSOLETED, UNLESS ABSOLUTELY NECESSARY,
;;; DO NOT ADD TO IT... <<< ***

;;; This is default-eoe.el

;;; This file defines site-wide standard emacs functionality.  It is
;;; setup to allow site initializations for _multiple_ sites
;;; (site-specific, site-wide initialization), via the *eoe-site-name*
;;; global variable defined in this file.

;;; In general, the following variables and functions can be used to
;;; determine specifics of our environment:
;;;
;;; system-type             -- berkeley-unix, usg-unix-v
;;;                
;;; *eoe-emacs-type*        -- 19x, 19f, 18f (i.e., xemacs19, fsf19, fsf18)
;;;
;;; *eoe-site-name*         -- "neda.com", "tcs.com",  ...
;;;
;;; (system-name)           -- "neda", "seahawk", ...
;;;
;;; (user-real-login-name)  -- "mohsen", "plim", ... 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; load or autoload basic EOE functionality in eoe/lisp/sys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'basic-ext)

;;;
;;; emacs19x autoloads and requires
;;;
(if (equal *eoe-emacs-type* '19x)
    (progn

      ;; GNATS -- GNU problem Reporting System autoloads
      ;; 
      (autoload 'edit-pr      "gnats" "Command to edit a problem report." t)
      (autoload 'view-pr      "gnats" "Command to view a problem report." t)
      (autoload 'unlock-pr    "gnats" "Unlock a problem report." t)
      (autoload 'query-pr     "gnats" "Command to query information about problem reports." t)
      (autoload 'send-pr-mode "send-pr" "Major mode for sending problem reports." t)
      (autoload 'send-pr      "send-pr" "Command to create and send a problem report." t)

      ;; calc 2.02e
      ;;
      ;; Commands added by calc-private-autoloads on Fri Nov  1 14:36:58 1996.
      (autoload 'calc-dispatch	           "calc" "Calculator Options" t)
      (autoload 'full-calc		   "calc" "Full-screen Calculator" t)
      (autoload 'full-calc-keypad	   "calc" "Full-screen X Calculator" t)
      (autoload 'calc-eval		   "calc" "Use Calculator from Lisp")
      (autoload 'defmath		   "calc" nil t t)
      (autoload 'calc			   "calc" "Calculator Mode" t)
      (autoload 'quick-calc		   "calc" "Quick Calculator" t)
      (autoload 'calc-keypad		   "calc" "X windows Calculator" t)
      (autoload 'calc-embedded	           "calc" "Use Calc inside any buffer" t)
      (autoload 'calc-embedded-activate    "calc" "Activate =>'s in buffer" t)
      (autoload 'calc-grab-region	   "calc" "Grab region of Calc data" t)
      (autoload 'calc-grab-rectangle	   "calc" "Grab rectangle of data" t)
      (global-set-key "\e#" 'calc-dispatch)
      ;; End of Calc autoloads.

      ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; improve compatibility with non *eoe-emacs-type* packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cond ((or (equal *eoe-emacs-type* '19x)
	   (equal *eoe-emacs-type* '19f))
       (require '19-compat)
       )
      ((equal *eoe-emacs-type* '18f)
       (require 'emacs-19)		; emacs 19 compatibility for use in emacs 18
       )
      (t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; site-name specific, site-wide initialization 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; this section is now deprecated -- do not add new stuff here
;; instead use <*eoe-sys-dir*>/.emacs19x or <*eoe-sys-dir*>/.emacs19f 
;; as the case may be

(cond ((string= *eoe-site-name* "neda.com")

       ;; man setup
       (setq manual-formatted-dirlist
	     '(
	       ;; /usr/man
	       "/usr/man/cat1" "/usr/man/cat2"
	       "/usr/man/cat3" "/usr/man/cat4"
	       "/usr/man/cat5" "/usr/man/cat6"
	       "/usr/man/cat7" "/usr/man/cat8"
	       ;; /usr/public/man
	       "/usr/public/man/cat1" "/usr/public/man/cat2"
	       "/usr/public/man/cat3" "/usr/public/man/cat4"
	       "/usr/public/man/cat5" "/usr/public/man/cat6"
	       "/usr/public/man/cat7" "/usr/public/man/cat8"
	       ;; /usr/devenv/man
	       "/usr/devenv/man/cat1" "/usr/devenv/man/cat2"
	       "/usr/devenv/man/cat3" "/usr/devenv/man/cat4"
	       "/usr/devenv/man/cat5" "/usr/devenv/man/cat6"
	       "/usr/devenv/man/cat7" "/usr/devenv/man/cat8"
	       )))

      ((string= *eoe-site-name* "mdi_eng")

       ;; man setup
       (setq manual-formatted-dirlist
	     '("/usr/share/man/cat1" "/usr/share/man/cat2"
	       "/usr/share/man/cat3" "/usr/share/man/cat4"
	       "/usr/share/man/cat5" "/usr/share/man/cat6"
	       "/usr/share/man/cat7" "/usr/share/man/cat8"
	       "/u/man/cat1" "/u/man/cat2"
	       "/u/man/cat3" "/u/man/cat4"
	       "/u/man/cat5" "/u/man/cat6"
	       "/u/man/cat7" "/u/man/cat8"
	       "/z/ide/man/cat1" "/z/ide/man/cat2"
	       "/z/ide/man/cat3" "/z/ide/man/cat4"
	       "/z/ide/man/cat5" "/z/ide/man/cat6"
	       "/z/ide/man/cat7" "/z/ide/man/cat8"
	       "/usr/openwin/share/man/cat1" "/usr/openwin/share/man/cat2"
	       "/usr/openwin/share/man/cat3" "/usr/openwin/share/man/cat4"
	       "/usr/openwin/share/man/cat5" "/usr/openwin/share/man/cat6"
	       "/usr/openwin/share/man/cat7" "/usr/openwin/share/man/cat8"
	       ))))
