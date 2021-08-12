;;; -*- Mode: Emacs-Lisp; -*-
;;; Rcs: $Id: bystar-emacs24f.el,v 1.82 2017-09-12 07:26:42 lsipusr Exp $

(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")

(funcall  (lambda () "
*     *blee-emacs24*
** TODO Global Activities tracker
"
	     (setq debug-on-error t)
	     ))

;;(setq debug-on-error nil)

(setq bidi-display-reordering t)

;;{{{ Bystar Initializations:

;;; -----------------------------------------------------------------
;;; prepend user's ~/lisp to load path, if exists
;;; -----------------------------------------------------------------
(if (file-directory-p (expand-file-name "~/lisp"))
    (setq load-path (cons (expand-file-name "~/lisp")
		      load-path)))

(if (file-directory-p (expand-file-name "~/lisp/widget"))
    (setq load-path (cons (expand-file-name "~/lisp/widget")
		      load-path)))


(if (file-directory-p (expand-file-name "~/lisp/emacsPlus/22Plus"))
    (setq load-path (cons (expand-file-name "~/lisp/emacsPlus/22Plus")
		      load-path)))

(if (file-directory-p (expand-file-name "~/BUE/elisp"))
    (setq load-path (cons (expand-file-name "~/BUE/elisp")
		      load-path)))			  

(setq load-path (cons (expand-file-name "/opt/public/neweoe/lisp/public/bbdb-filters-0.51")
		      load-path))

;;(setq load-path (cons "." load-path))

;;; -----------------------------------------------------------------
;;; Environement setup
;;; -----------------------------------------------------------------
(cond ((eq system-type 'windows-nt)
       ;; make USER = USERNAME, if not already set
       (if (null (getenv "USER")) (setenv "USER" (getenv "USERNAME"))))
      (t nil))

(setq eoe-uses-wide-screen t)
(setq eoe-font "10x20")
;;(setq eoe-keybinding-style "neda")
(setq eoe-use-toolbars nil)
(setq eoe-use-sound t)

(tool-bar-mode -1)  
;;;(tool-bar-mode 1)
(menu-bar-showhide-tool-bar-menu-customize-enable-top)

(menu-bar-right-scroll-bar)


(require 'eoeLsip)

(require 'blee-lib-common)
(require 'blee-lib-general)

(require 'blee-dict)
(require 'bx-lib)
(require 'fv-lib)
(require 'fto-lib)
(require 'fileParam-lib)
(require 'blee-iims-panel)
(require 'blee-iim-bash-cmnd)
(require 'blee-iicm-py-cmnd)

(require 'blee-global)
(require 'blee-packages-install)

(require 'bystar-ue-lib)
(bystar:ue:params-auto-set)

;;}}}

;;{{{ Globa Features:


;;; General Horizontal Facilities

(require 'bystar-folding)

;;; -----------------------------------------------------------------
;;; Shell stuff
;;; -----------------------------------------------------------------
;;(require 'ksh-mode)

(cond ((eq system-type 'windows-nt)
       (setq explicit-shell-file-name		"c:/cygwin/bin/bash")
       (setq      shell-file-name			"bash")
       (setq      shell-command-switch			"-i")
       )
      ((eq system-type 'cygwin32)
       (setq explicit-shell-file-name		"c:/cygwin/bin/bash")
       (setq      shell-file-name			"bash")
       (setq      shell-command-switch			"-i")
       )
      (t
       (setq explicit-shell-file-name		"/bin/bash")
       ;;(setq explicit-shell-file-name		"/bin/ksh")
       ;;(setq      shell-file-name			"/bin/ksh")
       (setq      shell-command-switch			"-c")
       ;(setq explicit-ksh-args (list "-i"))
       ))

(setq     shell-cd-regexp			"cd")
(setq     shell-popd-regexp			"popd\\|\-")
(setq     shell-pushd-regexp		"pd\\|pushd\\|\=\\|\+")
(setq     shell-prompt-pattern		"^[^#$%>\n]*[#$%>] *")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)


(defun comintPlus-editInput (arg)
  (interactive "p")
  (setq debug-on-error t)
  (comint-kill-whole-line 0)
  (end-of-buffer)
  (yank)
  ;;(comint-send-input t)
  ;;(comint-send-input)
  )

; ;; CVS
; ;;
; (eoe-require 'pcl-cvs)
(setq vc-follow-symlinks t)



(funcall  '(lambda () "
**     *MaGit*
"
	     (require 'setup-global-magit)
	     ))


;;
;; RCS
;;
;;(require 'rcs)

;;; -----------------------------------------------------------------
;;; dired
;;; -----------------------------------------------------------------
(eoe-require 'dired)



(require 'fshell)

;;(require 'dict)
;;(require 'lookup)
;;(setq lookup-search-agents '((ndict "dict.org")))

;;}}}

;;{{{ Bystar Setup:

;;; -----------------------------------------------------------------
;;; EOE Menu
;;; -----------------------------------------------------------------
;;(require 'eoeMenuBar)
;;(eoe-menu-install)

;;(require 'mobileMenuBar)
;;(mobile-menu-install)

;;; Choose bystar account or none

;;; bystar-star does either (require 'bystar-all) or (require 'bystar-all-nobody)
(require 'bystar-start)

(load "bystar-acct")



;;(require 'byname-menu)

;;(require 'personality-user)

;;(require 'personality-menu)

(require 'eoe-user-params)

(gnus-user-params)


; ;;; -----------------------------------------------------------------
; ;;; LSIP -- Lisp Interface -- Previously Neda Domain Management Tool -- NDMT
; ;;; -----------------------------------------------------------------
;;; 
;;; Shell Command invokation part of 
;;; NDMT. The rest of NDMT is out of date.
;;;
(eoe-require 'lsip-basic)

;;}}}

;;{{{ Interpersonl Communication:

;;; -----------------------------------------------------------------
;;; Email AND News  (gnus, bbdb, supercite, msend, ...)
;;; -----------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.mail\\'" . message-mode))


;;; -----------------------------------------------------------------
;;; W3M
;;; -----------------------------------------------------------------
(when (not (eq bystar:ue:form-factor 'handset))
  (load "bystar-w3m"))

(funcall  '(lambda () "
**     *Mail -- Gnus And Addons*
"
	     (load "bystar-mail")
	     ))

(funcall  '(lambda () "
**     *Mail -- offlineimap*
"
	     (require 'bystar-offlineimap)
	     ))



(funcall  '(lambda () "
**     *Mail -- Search -- notmuch, nnir*
"
	     ;;(require 'bystar-mail-search)
	     ))




;;; -----------------------------------------------------------------
;;; Rolodex -- BBDB
;;; -----------------------------------------------------------------
(load "bystar-bbdb")


;;; -----------------------------------------------------------------
;;; Email AND News  (gnus, bbdb, supercite, msend, ...)
;;; -----------------------------------------------------------------

;;;

;;; Initial Mail Submission Parameters

(eoe-require 'bbdb)

;; (msend-originator-submit-ua-select "message-auto")

;;  (cond ((or
;;  	(string-equal (user-login-name) "mbtest")
;;  	(string-equal (user-login-name) "mohsen"))
;;         (msend-originator-envelope-addr "admin@mohsen.banan.1.byname.net")
;;         (msend-originator-from-line "Mohsen Banan-Public <public@mohsen.banan.1.byname.net>")
;;         )
;;        (t
;;         (message "Unknown User -- from line not set")
;;         (msend-originator-envelope-addr "changeme@com")
;;         (msend-originator-from-line "changeme@com>")
;;         (sleep-for 1)
;;         )
;;        )


;;  (msend-compose-setup)

;;; -----------------------------------------------------------------
;;; Email Citations -- SuperCite
;;; -----------------------------------------------------------------
;;; NOTYET, Perhaps requires GNUS conversion
;(eoe-require 'supercite)
(require 'supercite)
(load "supercite-user")

;;}}}

;;{{{ Multi Media:

;;; -----------------------------------------------------------------
;;; EMMS
;;; -----------------------------------------------------------------
(load "bystar-emms")

;;(require 'menu-emms)
;;(emms-menu-install)


;;}}}

;;{{{ Web / Html / Interface

; ;;; -----------------------------------------------------------------
; ;;; Mozilla Browser integration
; ;;; -----------------------------------------------------------------
;;;
;;; configure browse-url.el
;;;
(require 'browse-url)

;; ~/lisp/browse-url-extra.el
;;(load "browse-url-extra.el")

;;(setq browse-url-browser-function 'browse-url-mozilla)
;;(setq browse-url-browser-function 'browse-url-firefox)
;;(setq browse-url-firefox-program "/opt/public/osmt/bin/firefox-bx")
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/opt/public/osmt/bin/firefox-bx")
;;}}}

;;{{{ Software Development

;;; -----------------------------------------------------------------
;;; C and C++ Programming Language -- Software Development 
;;; -----------------------------------------------------------------
(eoe-require 'cc-mode)			; covers C, C++

(require 'compile-ext)


;;; -----------------------------------------------------------------
;;; Python Programming Language -- Software Development 
;;; -----------------------------------------------------------------
(require 'blee-python)

;;; -----------------------------------------------------------------
;;; Templates and Substitution
;;; -----------------------------------------------------------------
(require 'template)
(eoe-require 'tmplt-ext)



(funcall  '(lambda () "
**     *YASnippet*
*** TODO yasnippit should obsolete template
"
	     (require 'blee-yasnippet)
	     ))


(funcall  '(lambda () "
**     *Auto-Complete*
"
	     (require 'blee-af-auto-complete)
	     ))

(funcall  '(lambda () "
**     *Google Maps*
"
;; (if (file-directory-p (expand-file-name "~/lisp/google-maps.el-master"))
;;     (setq load-path (cons (expand-file-name "~/lisp/google-maps.el-master")
;; 		      load-path)))

	     (require 'google-maps)
	     (require 'org-location-google-maps)
	     ))


(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *LanguageTool -- +diction/style* [[elisp:(org-cycle)][| ]]
"
	     (require 'bystar-langtool)
	     ))



(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Menu                  ::      *ProgTools* [[elisp:(org-cycle)][| ]]
"
	     (require 'bystar-progtools-menu)
	     ))


(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *Bx Tool-Bar* [[elisp:(org-cycle)][| ]]
"
	     (require 'bx-tool-bar)
	     ))

(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *BAC highlight-indentation* [[elisp:(org-cycle)][| ]]
"
	     (require 'bac-highlight-indentation)
	     ))






;;; Linux Utilities
(eoe-require 'apt-utils)


;;}}}

;;{{{ Office Facilities



;;; -----------------------------------------------------------------
;;; DOS mode
;;; -----------------------------------------------------------------
(require 'dos-mode)			; hide ^M characters


;;; -----------------------------------------------------------------
;;; Calc -- Arbitrary precision calculator
;;; -----------------------------------------------------------------
(load "bystar-calc")


;;; -----------------------------------------------------------------
;;; Info -- more info directories
;;; -----------------------------------------------------------------
(load "bystar-info")


;;; -----------------------------------------------------------------
;;; CALENDAR MODE -- And Appointment (APPT) -- And Diary
;;; -----------------------------------------------------------------
(load "bystar-calendar")

; ;;; -----------------------------------------------------------------
; ;;; Org-Mode and Remember
; ;;; -----------------------------------------------------------------
;; ~/lisp/orgModeInit.el

(load-file "~/lisp/orgModeInit.el")
(require 'bx-org-exports)

;;; Work Logs For Projects
(eoe-require 'worklog)

;;; TODO-MODE
(autoload 'todo-mode "todo-mode"
  "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode"
  "Show TODO items." t)
(autoload 'todo-insert-item "todo-mode"
  "Add TODO item." t)
(autoload 'todo-top-priorities "todo-mode"
  "Add TODO item." t)

(setq todo-show-priorities 2) ;; 0 shows all entries


;;}}}

;;{{{ Writing / Publishing

;;; -----------------------------------------------------------------
;;; Dictem -- Dictionary/Thesaurus lookup
;;; -----------------------------------------------------------------
(load "bystar-dictem")


;;; -----------------------------------------------------------------
;;; LaTeX, TeX, Bib, ttytex, 
;;; -----------------------------------------------------------------
(load "bystar-tex")  ;;;For 24.4 and 24.5

;;}}}

;;{{{ Man / Machine Interface

;;; Abbrev and Tempo

;;; TEMP DISABLED
(require 'bystar-tempo)


;;; -----------------------------------------------------------------
;;; Keyboard Definitions -- load keyboard function key setup
;;; -----------------------------------------------------------------

;;(eoe-load-keybindings "neda" "AT")


;;; -----------------------------------------------------------------
;;; Sound
;;; -----------------------------------------------------------------

;;
;; visible or audible bell...
;;
(cond (eoe-use-sound
       (setq visible-bell nil))
      (t
       (setq visible-bell t)))


;;; -----------------------------------------------------------------
;;; Screen Dressups -- Should be Done After All Packages Have Been Loaded
;;; -----------------------------------------------------------------

(load "dressups.el")
(eoe-dressup-auto)
(eoe-set-font "10x20")


;; Wheel mouse
(autoload 'mwheel-install "mwheel" "Enabal mouse wheel support.")
(mwheel-install)


;;; -----------------------------------------------------------------
;;; Global Key Bindings are maintained centrally in ~/lisp/blee-kbd-global.el
;;; -----------------------------------------------------------------

(require 'eoeKbdMenuSupport)
(require 'blee-kbd-global)

(eoe-kbd)

;;}}}

;;{{{ Absorb ELsewhere

(autoload 'babel "babel"
  "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)

;;  * the e-PROMPT motor at www.translate.ru (thanks to Ferenc Wagner)

;; NOTYET, set it as default e-PROMPT seems to work best.

(setq babel-preferred-to-language "French")

(setq google-license-key "Q1n7eV5QFHLUgKEGMzcVQr9bX34Rv7SP")

(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(setq recentf-save-file (recentf-expand-file-name "~/BUE/emacs/recentf.el"))
(recentf-mode 1)

;;; iswitchb + recentf
(require 'bx-iswitch)
(bx:iswitch:all-defaults-set)

(require 'bx-dblock)

;;; ./bystar-m17n.el
(load "bystar-m17n.el")

;;}}}

;;{{{ Menus And Keyboard



;;;
;;; TOP LEVEL MENUS
;;;

;; ./handset-menu-top.el
(if (string-equal opRunDistFamily "MAEMO")
    (load "handset-menu-top")
  )   

(require 'blee-menu-activities)
(blee:activities:menu)

(require 'blee-menu-blee)
(blee:blee:menu)

(require 'blee-menu-my)
(blee:my:menu)

;;}}}

;;{{{ myElisp

(if (file-directory-p (expand-file-name "~/BUE/elisp"))
    (progn
      (require 'bue-acct-main)
      (if (fboundp 'bue:acct:main)
	  (bue:acct:main))
      ))
;;
(setq-default lpr-switches '("-2P -t"))
(setq-default lpr-command "mpage")


;; ~/lisp/murl-base.el ~/lisp/murl-craigslist.el ~/lisp/murl-slink.el ~/lisp/murl-bbdb.el

(load "murl-base.el")
(load "murl-bbdb.el")            ;;; Captures mailto: into bbdb

;;}}}

;;{{{ Finalize

; ;;; -----------------------------------------------------------------
; ;;; GNU Server -- Should Run Last  after all else that is needed 
; ;;; -----------------------------------------------------------------
(require 'mozmail)

;; (when (string-equal (getenv "DISPLAY") ":0.0")
;;   (server-force-delete)
;;   (server-start)
;;   )

(blee:server:ensure)


(require 'bystar-init-screen)
(bystar:init:startup-message)

(bystar:mail:faces:background-dark)

(require 'color-theme)
;; emacsPlus/22Plus/themes/color-theme-library.el 
(load-library "themes/color-theme-library")

(require 'bystar-color-themes)
(color-theme:bystar:black-green)

(require 'bystar-printing-lib)
(bystar:printing:all-defaults-set)


(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Specific-Minor-Mode   ::      *Screencast Mode* [[elisp:(org-cycle)][| ]]
	Just Load. Not Setup yet. See Blee Minor Mode Panel For Details.
"
	     (load-file "~/lisp/screencast-mode-master/screencast-mode.el")
	     (load-file "~/lisp/screencast-mode-master/screencast-record.el")	     
	     ))


(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *festival -- TTS -- Say* [[elisp:(org-cycle)][| ]]
	Just Load. Not Setup yet. See Blee Minor Mode Panel For Details.
"
	     (load-file "~/lisp/festival.el")
	     ))

(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *ISPELL* [[elisp:(org-cycle)][| ]]
	Just Load. 
"
	     (load "bystar-ispell")
	     ))




(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *Tabbar* [[elisp:(org-cycle)][| ]]
	Tabbar setup needs to come late in the setup, perhaps after color-theme
"
	     (require 'setup-tabbar)
	     ))


(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *Dunamic Menu* [[elisp:(org-cycle)][| ]]
	Dynamic Menus -- Use Through Out -- For Now Centralized. Will be split across later.
"
	     (require 'blee-lib-widget)
	     (blee-lib-widget:all-defaults-set)
	     ))



(funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Temporary             ::      *old2new* [[elisp:(org-cycle)][| ]]
"
	     (load-file "~/lisp/old2new/elispBleePanelUpdate.el")
	     ))



;;; 
;;; To Be Sorted Later
;;;

(defun mb-policy-9 (string-arg)
""
string-arg
)


(require 'tramp)
(setq tramp-default-method "scp")

(load-file "~/lisp/Incoming/top-mode.el")

(load-file "~/lisp/choose-comletion.el")

(cd "~")

(setq debug-on-error nil)
;;(setq debug-on-error t)

(message "Bystar User Env Finished Loading")

;;}}}

;;{{{ end of file

;;; local variables:
;;; major-mode: lisp-mode
;;; folded-file: nil
;;; byte-compile-dynamic: t
;;; end:

(lambda () "
#+STARTUP: showall
"
)


;;}}}




