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

(require 'easymenu)



;;
;; (engine/list-commands)
;;
(defun engine/list-commands ()
  "Produces a list of available search engine commands."
  (apropos-internal "engine/search-" 'commandp)
  )




;; (browsers:modes:menu:plugin/install modes:menu:global (s-- 3))
(defun browsers:modes:menu:plugin/install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."
  (interactive)

  (easy-menu-add-item
   <menuLabel
   nil
   (browsers:menuItem:at-point-url:with-selected|define)
   <menuDelimiter
   )

  (easy-menu-add-item
   <menuLabel
   nil
   (browsers:menu:at-point-url:select|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'browsers:menu|update-hook)
  )

(defun browsers:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(browsers:menu|define)
  )

;;
;; (browsers:menuItem:at-point-url:selected-if|define)
(defun browsers:menuItem:at-point-url:with-selected|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Browse At-Point URL With Selected Browser:\n  %s"
	       browse-url-browser-function)
      (find-file-at-point (ffap-url-at-point))
      :help "With Selected At-Point Browser specified with browse-url-browser-function, browse at-point URL"
      :active t
      :visible t
      ]
     )))


(when (equal blee:emacs:id '26f)
  (defvar browse-url-secondary-browser-function nil
    "Fake temporary 26f variable for same as introduced in 27f"))

;;
;; [[elisp:(popup-menu (symbol-value (browsers:menu:help|define)))][This Menu]]
;; (popup-menu (symbol-value (browsers:menu:at-point-url:select|define)))
;;
(defun browsers:menu:at-point-url:select|define (&rest <namedArgs)
  "Returns org-roam-server:menu.
:active and :visible can be specified as <namedArgs.
"
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    ;; (setq $:browsers:menu:browse-url:at-point:active <active)
    (setq $:browsers:menu:browse-url:at-point:visible <visible)    

    (easy-menu-define
      browsers:menu:browse-url:at-point
      nil
      "Menu For Configuration Of browse-url-browser-function"
      `("Select At-Point Url Browser"
	:help "Show And Set Relevant Parameters"
	:visible $:browsers:menu:browse-url:at-point:visible
	:active ,<active
	,(s-- 3)
	[
	,(format "**browse-url-browser-function =\n %s**" browse-url-browser-function)	 
	  (describe-variable 'browse-url-browser-function)
	  :help "Describe current value of browse-url-browser-function"
	  :active t
	  :visible t
	  ]
	[
	 ,(format "**browse-url-secondary-browser-function =\n %s**" browse-url-secondary-browser-function)		 
	  (describe-variable 'browse-url-secondary-browser-function)
	  :help "Describe current value of browse-url-secondary-browser-function"
	  :active t
	  :visible t
	  ]
	,(s-- 4)	
	 [
	  "XIA Browser Frame"
	  (setq browse-url-browser-function 'browsers:xinf:selected:browse-url/at-point)
	  :help "browsers:xinf:selected:browse-url/at-point is based on NOTYET"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browsers:xinf:selected:browse-url/at-point)
	  ]
	 [
	  "Firefox"
	  (setq browse-url-browser-function 'browse-url-firefox)
	  :help "Send Url to Firefox tab with: browse-url-firefox"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-firefox)
	  ]
	 [
	  "Chrome"
	  (setq browse-url-browser-function 'browse-url-chrome)
	  :help "Send Url to Chrom new tab with: browse-url-chrome"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-chrome)
	  ]
	 [
	  "Chromium"
	  (setq browse-url-browser-function 'browse-url-chromium)
	  :help "Send Url to Chrom new tab with: browse-url-chromium"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-chromium)
	  ]
	 [
	  "EWW"
	  (setq browse-url-browser-function 'eww-browse-url)
	  :help "Send Url to eww with eww-browse-url"
	  :active t
	  :visible t
	  :style radio
	  :selected ,(eq browse-url-browser-function 'eww-browse-url)
	  ]
	 ,(s-- 5)
	 ,(s-- 6)
	 ,(s-- 7)	 	 	 
	 ))
    
	 (easy-menu-add-item
	  browsers:menu:browse-url:at-point
	  nil          
	  (browsers:menu:browse-url:at-point:with-function|define)
	  (s-- 6))

	 (easy-menu-add-item
	  browsers:menu:browse-url:at-point
	  nil          
	  (browsers:menu:help|define)
	  (s-- 7))

    'browsers:menu:browse-url:at-point
    ))


;;
;; (popup-menu (symbol-value (browsers:menu:browse-url:at-point:with-function|define)))
;; 
(defun browsers:menu:browse-url:at-point:with-function|define ()
  ""
  (let (
	($menuHeading "browse-url:at-point|with-function")
	)  
    (easy-menu-define
      browsers:menu:browse-url:at-point:with-function
      nil
      "Menu" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Visit At-Point URL With: %s" <each)
			 `(call-interactively ',<each)
			 )
		 )
	       (list
		'browsers:xinf:selected:browse-url/at-point
		'browse-url-firefox
		'browse-url-chrome
		'browse-url-chromium
		'eww-browse-url
	       ))))
    'browsers:menu:browse-url:at-point:with-function
    ))



;; (popup-menu (symbol-value (browsers:menu:help|define)))
(defun browsers:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      browsers:menu:help
      nil
      "Help Menu For browsers"
      `("browsers Help"
	:help "Help For This Menu"
	["Visit browsers Help Panel"
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
    'browsers:menu:help
    ))

(provide 'browsers-menu)

