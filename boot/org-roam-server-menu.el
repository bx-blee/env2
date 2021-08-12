;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(lambda () "
* Authors: 
** Mohsen Banan --  http://mohsen.1.banan.byname.net/contact
** Email: emacs at mohsen.1.banan.byname.net
* Copying And Usage: This is a perpetual Libre-Halaal polyexistential.
* Functional Specification:
** 
** 
")

(require 'browse-url)

; (org-roam-server:uri/construct)
(defun org-roam-server:uri/construct ()
  ""
  (interactive)
  (format "http://%s:%s" org-roam-server-host org-roam-server-port)
  )

;; (browse-url-chrome (org-roam-server:uri/construct))
;; (org-roam-server-mode)

(require 'easymenu)

;;
;; (org-roam-server:menu|define)
;; (org-roam-server:menu|define :active nil)
;; 
(defun org-roam-server:menu|define (&rest <namedArgs)
  "Returns org-roam-server:menu.
:active and :visible can be specified as <namedArgs.
Implementation: 
Instead of ,<active I got it working with $:org-roam-server:menu:active.
,<active should have worked. Don't understand why it is not.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	(<visible (get-arg <namedArgs :visible t))
	($thisFuncName (compile-time-function-name))
	)
    
    (setq $:org-roam-server:menu:active <active)
    (setq $:org-roam-server:menu:visible <visible)    

    (easy-menu-define
      org-roam-server:menu
      nil
      "org-roam-server menu"
      `("org-roam Server"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-server:menu:active
	:visible $:org-roam-server:menu:visible
	"---"	
	 [
	  "Server Start"
	  (org-roam-server-mode)
	  :help "Server Start -- (org-roam-server-mode)"
	  :active t
	  :visible t
	  ]
	 ["Server Stop"
	  (org-roam-server-mode -1)
	  :help "Server Stop -- (org-roam-server-mode -1)"
	  :active t
	  :visible t
	  ]
	"----"
	 [
	  "Visit Server At Url With Chrome"
	  (browse-url-chrome (org-roam-server:uri/construct))
	  :help "Visit Server At Url With Chrome -- (browse-url-chrome (org-roam-server:uri/construct))"
	  :active t
	  :visible t
	  ]
	"-----"
	))
    (easy-menu-add-item org-roam-server:menu nil
			(org-roam-server:menu:help|define) "-----")    
    'org-roam-server:menu
    ))


;; (org-roam-server:menu:help|define)
(defun org-roam-server:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      org-roam-server:menu:help
      nil
      "Help Menu For org-roam-server"
      `("org-roam-server Help"
	:help "Help For This Menu"
	["Visit org-roam-server Help Panel"
	 blee:blee:menu:overview-help
	 t
	 ]	 ;;; Notyet, should point to panel instead
	"---"
	[,(format "Visit %s" $thisFuncName)
	 (find-function (intern ,$thisFuncName))
	 t
	 ]	
	)
      )
    'org-roam-server:menu:help
    ))

(provide 'org-roam-server-menu)

