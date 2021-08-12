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


(lambda () "

Next Steps
Capture this in a function.

Also, consider

(featurep 'org-roam)

(if org-roam-mode
    (message \"Enabled\")
  (message \"Disabled\"))

Add engine/primary engine/secondary
Add C-c s 1 for primary 2 and 3.
C-c s 0 is list subject to words for globish.
C-c s 9 is list subject to words for secondary language.

")


(require 'browse-url)

(require 'easymenu)

(require 'browsers-menu)

(require 'engine-mode)


;;;
;;; The following should be integrated with engine-mode.el
;;; 

(defun engine/prompted-search-term (engine-name)
  "Over-rights the pkg function. If thing-at-point is valid, don't prompt"
  (let ((current-word (or (thing-at-point 'symbol 'no-properties) "")))
    (when (string-equal current-word "")
      (setq current-word 
	    (read-string (engine/search-prompt engine-name current-word)
			 nil nil current-word)))
    current-word))


(defcustom engine/primary 'engine/search-google
  "The primary (default) search engine.
Defaults to `engine/search-google'."
  :group 'engine-mode
  :type 'symbol)

(defcustom engine/selected-list (engine/list-commands)
  "The list of selected search engines.
Defaults to engine/list-commands which means to search with all."
  :group 'engine-mode
  :type 'list)

; (web:search:word/english)
(defun web:search:word/english ()
  "List of all search engines and translations that apply to words."
  (setq engine/selected-list
	(list
	 'engine/search-google
	 'engine/search-duckduckgo
	 'engine/search-wikipedia
	 )
	))

; (web:search:primary|select 'engine/search-google)
(defun web:search:primary|select (<searchEngine)
  "Set engine/primary to <searchEngine."
  (setq engine/primary <searchEngine))

;; (engine/visit-list)
(defun engine/visit-list (&optional <enginesList)
  "Search with each of the engines"
  (interactive)
  (let (
	($enginesList <enginesList)
	)
    (when (not $enginesList)
      (setq $enginesList engine/selected-list))
    (mapcar (lambda (<each)
	      (call-interactively <each))
	    $enginesList)))

;; (engine/visit-primary)
(defun engine/visit-primary ()
  "Search with the selected engine/primary engine."
  (interactive)
  (if (not engine/primary)
      (message "Missing engine/primary")
    (progn
      (call-interactively engine/primary))))


;; (web:search:modes:menu:plugin/install modes:menu:global (s-- 6))
(defun web:search:modes:menu:plugin/install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."
  (interactive)

  (easy-menu-add-item
   <menuLabel
   nil
   (web:search:menuItem:selected-if:search-with|define)
   <menuDelimiter
   )
  
  (easy-menu-add-item
   <menuLabel
   nil
   (web:search:menu|define :active t)
   <menuDelimiter
   )

  ;;(add-hook 'menu-bar-update-hook 'web:search:menu|update-hook)
  )

(defun web:search:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  (web:search:menu|define)
  )

;; 
(defun web:search:menuItem:selected-if:search-with|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Web Search With Selected Engine (engine/primary):\n %s"
	       engine/primary)
      (engine/visit-primary)
      :help "Selected Engine -- Search with selected browser setting and selected engine"
      :active t	 
      :visible t
      ]
     )))


;;
;; (web:search:menu|define :active nil)
;; (popup-menu (symbol-value (web:search:menu|define)))
;; 
(defun web:search:menu|define (&rest <namedArgs)
  "Returns web:search:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)
    
    ;; (setq $:web:search:menu:visible <visible)    ;; because ,visible does not work

    (easy-menu-define
      web:search:menu
      nil
      "Web Search Global Minor Mode (engine-mode)"
      `("Web Search Global Minor Mode (engine-mode)"
	:help "Show And Set Relevant Parameters"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)	
	))

    (easy-menu-add-item
     web:search:menu nil
     (web:search:menuItem:selected-browser-function|define)
     (s-- 3))

    (easy-menu-add-item
     web:search:menu nil     
     (web:search:menuItem:selected-engine|define)
     (s-- 4))

    (easy-menu-add-item
     web:search:menu nil
     (web:search:with-engine|define)     
     (s-- 5))

    (easy-menu-add-item
     web:search:menu nil
     (web:search:select-primary-engine|define)
     (s-- 6))
    
    (easy-menu-add-item
     web:search:menu nil          
     (web:search:menu:help|define)
     (s-- 8))
    
    'web:search:menu
    ))


;;
;; (setq engine/browser-function nil)
;;

;; (web:search:engine:browser|report)
(defun web:search:engine:browser|report ()
  "Returns a string as a report."
  (if  engine/browser-function
      (format "engine/browser-function is:\n %s"
	      engine/browser-function)
    (format "engine/browser-function is nil, in use is:\n %s"
	    browse-url-browser-function)))


;;
;; (web:search:menuItem:selected-browser-function|define)
(defun web:search:menuItem:selected-browser-function|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(web:search:engine:browser|report)
      (describe-variable 'engine/browser-function)
      :help "Selected Web Search Browser -- (describe-variable 'engine/browser-function)"
      :active t
      :visible t
      ]
     )))




;;
(defun web:search:menuItem:selected-engine|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Search With Primary Engine:\n %s"
	       engine/primary)
      (engine/visit-primary)
      :help "Selected engine -- (engine/visit-primary)"
      :active t	 
      :visible t
      ]
     )))


;;
;; (popup-menu (symbol-value (web:search:with-engine|define)))
;; 
(defun web:search:with-engine|define ()
  ""
  (let (
	($menuHeading "Search With Engine")
	)  
    (easy-menu-define
      web:search:with-engine
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Search With: %s" <each)
			 `(call-interactively ',<each)
			   :help (format "Searching with command: %s" <each)
			 )
		 )
	       (engine/list-commands)
	       )))
    'web:search:with-engine
    ))

;; ($:web:search|selectAsPrimary 'engine/search-google)
(defun  $:web:search|selectAsPrimary(<each)
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [
      ,(format "Select As Primary: %s" <each)
      (setq engine/primary ',<each)
      :help ,(format "Selected Web Search Browser -- (setq engine/primary %s)" <each)
      :active t
      :visible t
      :style radio	  
      :selected ,(eq engine/primary <each)
      ]
     )))

;;
;; (popup-menu (symbol-value (web:search:select-primary-engine|define)))
;;
(defun web:search:select-primary-engine|define ()
  ""
  (let (
	($menuHeading "Selected Primary Search Engine")
	)
    (setq web:search:select-primary-engine:radio 'radio)
    (easy-menu-define
      web:search:select-primary
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 ($:web:search|selectAsPrimary <each)
		 )
	       (engine/list-commands)
	       )))
    'web:search:select-primary
    ))

;; (web:search:menu:help|define)
(defun web:search:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      web:search:menu:help
      nil
      "Help Menu For web:search"
      `("web:search Help"
	:help "Help For This Menu"
	["Visit web:search Help Panel"
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
    'web:search:menu:help
    ))

(provide 'engine-mode-menu)

