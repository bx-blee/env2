;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-


(lambda () "
* Description And Design
** 
** This Information should be moved to a BleePanel and blee manual etc.
** 
** In Blee, Availability of a number of Named emacs frames is assumed.
** 
** Concepts, Terminology, Labels and Acronyms:
*** ~NF~ : Named Frames (union of Native Named Frames and XINF)
*** ~NNF~ : Native Named Frames (native emacs frames)
*** ~EAF~ : Emacs Application Framework -- https://github.com/manateelazycat/emacs-application-framework
Emacs Application Framework (EAF) is a GUI application framework that
revolutionizes Emacs graphical capabilities to ultimately Live in
Emacs.
*** ~XIA~ : eXternally Integrated Applications (XIA) -- A better name for EAF -- and associated 
with named frames.
**** ~NAFM-Web-Browser~
**** ~NAFM-PDF-Viewer~
*** ~XINF~ : eXternally Integrated Named/emacs Frames
XINFs contain eXternally Integrated Applications (XIA) such as an EAF-browser.
*** ~ELAW~ : Emacs Linked Application Windows -- external (non-integrated) application such as firefox/chrome.
*** ~NAF~ : Named Activity Frames -- A set of Named Frames related to a given Activity.
*** ~NAFM~ : Named Activities Frames Manager -- A set of collaborating Named Frames to be managed collectively.
** 
")


(require 'easymenu)


;; (nafm:modes:menu:plugin/install modes:menu:global (s-- 3))
(defun nafm:modes:menu:plugin/install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."
  (interactive)

  (easy-menu-add-item
   <menuLabel
   nil
   (nafm:modes:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'nafm:menu|update-hook)
  )

(defun nafm:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(nafm:modes:menu|define)
  )

(defun browsers:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(browsers:menu|define)
  )


;; (nafm:menu-bar/install)
(defun nafm:menu-bar/install ()
  "Primary interface."
  
  (interactive)
  (nafm:menu:global|define)
  (add-hook 'menu-bar-update-hook 'nafm:menu-bar-update-hook)
  )


(defun nafm:menu-bar-update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."

  (nafm:menu:global|define)
  )

(lambda () "
* Constants, Variables
For Named Frames and More
")

(lambda () "
** NF :: Named Frame Structure
")

(cl-defstruct  nafm:named-frame:struct:
  "Named Frames Structure"
  (name nil :read-only t)
  title
  shortTitle
  type
  description
  )

(cl-defstruct  nafm:nf-activity:struct:
  "Named Frames Activity Structure"
  (name nil :read-only t)   ;; activity name
  title                      
  shortTitle
  nfList                   ;; List of NFs for this activity
  description
  )



(lambda () "
** XINF :: search-engine
")

(defvar nafm:search-engine:selected
  "https://google.com"
  "The primary nafm search-engine.")

(lambda () "
** Native Named Frames (NNF)
")

(lambda () "
*** Native Named Frames (NNF) -- Primary 
")

(defvar
  nafm:nnf:primary
  (make-nafm:named-frame:struct:
   :name "nafm:nnf:name:primary"
   :title "Emacs Primary Native Frame"
   :shortTitle "Primary Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Primary Native Named Frame."
  )

(lambda () "
*** Native Named Frames (NNF) -- Secondary
")

(defvar
  nafm:nnf:secondary
  (make-nafm:named-frame:struct:
   :name "nafm:nnf:name:secondary"
   :title "Emacs Secondary Native Frame"
   :shortTitle "Secondary Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Secondary Native Named Frame."
  )



(lambda () "
*** Native Named Frames (NNF) -- Gnus
")

(defvar
  nafm:nnf:gnus
  (make-nafm:named-frame:struct:
   :name "nafm:nnf:name:gnus"
   :title "Emacs Gnus Native Frame"
   :shortTitle "Gnus Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Gnus Native Named Frame."
  )

(lambda () "
** eXternally Integrated Named Frames (XINF)
")

(lambda () "
*** XINF :: web-browser
")

(lambda () "
**** XINF :: web-browser :: interactive
")

(lambda () "
***** XINF :: web-browser :: interactive :: default
")

(defvar
  nafm:xinf:web-browser:interactive:default
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:interactive:default"
   :title "Default Emacs XINF For Interactive Web Browsing"
   :shortTitle "Default Interactive Web Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for web browsing"
  )

(lambda () "
***** XINF :: web-browser :: interactive :: selected
")

(defvar
  nafm:xinf:web-browser:interactive:selected
  nafm:xinf:web-browser:interactive:default
  "Name of Active XINF For Interactive Web Browsing.")


(lambda () "
**** XINF :: web-browser :: at-point
")


(lambda () "
***** XINF :: web-browser :: at-point :: default
")

(defvar
  nafm:xinf:web-browser:at-point:default
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:at-point:default"
   :title "Emacs XINF For At-Point Default Web Browsing"
   :shortTitle "Default At-Point Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: at-point :: news
")

(defvar
  nafm:xinf:web-browser:at-point:news
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:at-point:news"
   :title "Emacs XINF For At-Point News Web Browsing"
   :shortTitle "News At-Point Browsing XINF"      
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )


(lambda () "
***** XINF :: web-browser :: at-point :: bxde
")

(defvar
  nafm:xinf:web-browser:at-point:bxde
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:at-point:bxde"
   :title "Emacs XINF For At-Point BXDE Web Browsing"
   :shortTitle "BXDE At-Point Browsing XINF"         
   :type "medium"
   :description "description of named-frame"
   )
  "BXDE XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: at-point :: selected
")

(defvar
  nafm:xinf:web-browser:at-point:selected
  nafm:xinf:web-browser:at-point:default
  "Named-Frame-Info of Selected XINF For At-Point Web Browsing.")


(lambda () "
**** XINF :: web-browser :: file (native html file)
")



(lambda () "
***** XINF :: web-browser :: file :: result
")

(defvar
  nafm:xinf:web-browser:file:result
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:file:result"
   :title "Emacs XINF For Results-File Web Browsing"
   :shortTitle "Results-File Web Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for HTML-File result web browsing"
  )



(lambda () "
***** XINF :: web-browser :: file :: mail
")

(defvar
  nafm:xinf:web-browser:file:mail
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:web-browser:file:mail"
   :title "Emacs XINF For Mail-File Web Browsing"
   :shortTitle "Mail-File Web Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for HTML-file mail web browsing"
  )

(lambda () "
***** XINF :: web-browser :: file :: selected
")

(defvar
  nafm:xinf:name:web-browser:file:selected
  nafm:xinf:web-browser:file:result
  "Name of Selected XINF For HTML-File Web Browsing.")


(lambda () "
*** XINF :: pdf
")


(lambda () "
**** XINF :: pdf :: at-point
")



(lambda () "
***** XINF :: pdf :: at-point :: default
")

(defvar
  nafm:xinf:pdf:at-point:default
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:pdf:at-point:default"
   :title "Emacs XINF For At-Point PDF Viewing"
   :shortTitle "At-Point PDF Viewing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for at-point Pdf viewing."
  )

(lambda () "
***** XINF :: pdf :: at-point :: selected
")

(defvar
  nafm:xinf:pdf:at-point:selected
  nafm:xinf:pdf:at-point:default
  "Name of Nafm primary frame.")



(lambda () "
**** XINF :: pdf :: result
")


(lambda () "
***** XINF :: pdf :: result :: default
")

(defvar
  nafm:xinf:pdf:result:default
  (make-nafm:named-frame:struct:
   :name "nafm:xinf:name:pdf:result:default"
   :title "Emacs XINF For Results PDF Viewing"
   :shortTitle "Results PDF Viewing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for result pdf viewing."
  )

(lambda () "
***** XINF :: pdf :: result :: selected
")

(defvar
  nafm:xinf:pdf:result:selected
  nafm:xinf:pdf:result:default
  "Selected XINF for result pdf viewing.")


(lambda () "
** NF :: List Of Named Frames
")

(defvar
  nafm:named-frame:list
  (list
   nafm:nnf:primary
   nafm:nnf:secondary
   nafm:nnf:gnus
   nafm:xinf:web-browser:interactive:default
   nafm:xinf:web-browser:at-point:default
   nafm:xinf:web-browser:at-point:news
   nafm:xinf:web-browser:at-point:bxde
   nafm:xinf:web-browser:file:result
   nafm:xinf:web-browser:file:mail
   nafm:xinf:pdf:at-point:default
   nafm:xinf:pdf:result:default
   )
  "List of Nafm Named Frames"
  )


(lambda () "
*** XINF :: activity :: gnus
")

(defvar
  nafm:nf:activity:gnus
  (make-nafm:nf-activity:struct:
   :name "nafm:nf:activity:gnus"
   :title "Named Frame GNUS Activity"
   :shortTitle "NF GNUS Activity"   
   :nfList (list
	    nafm:nnf:gnus
	    nafm:xinf:web-browser:file:mail
	    )
   :description "description of named-frame"
   )
  "Default XINF for result pdf viewing."
  )


(lambda () "
** NF :: List Of Named Activity Frames
")

(defvar
  nafm:nfActivity:list
  (list
   nafm:nf:activity:gnus
   )
  "List of Nafm Named Activity Frames"
  )



(lambda () "
* Activation And Selection Commands
")


(lambda () "
* Global Functions
")


(lambda () "
** Named Frame Creation And Population
")


(defun nafm:xinf|make-frame (@nf-info)
  "make-frame based on @NF-INFO (a named-frame-info structure)
A nafm layer on top of make-frame."
  (let (
	($name (nafm:named-frame:struct:-name @nf-info))
	($title (nafm:named-frame:struct:-title @nf-info))	       
	)
    (make-frame `((name                 . ,$name)
                  (icon-name            . ,$name)
                  (title                . ,$title)
                  (menu-bar-lines       . 1)
                  (tool-bar-lines       . 3)
                  (vertical-scroll-bars . t)
		  )
		)
    ))


;; (frame-visible-p (get-a-frame nafm:frame:name:xinf:web-browser-at-point))

;;;
;;; (nafm:xinf:selected:browse-url/at-point "http://www.neda.com")
;;; (nafm:xinf:selected:browse-url/at-point "https://google.com")
;;;
    
(defun nafm:xinf:selected:browse-url/at-point (@url &rest @args)
  "In the named-frame, nafm:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (nafm:xinf:browse-url/at-point
   nafm:xinf:web-browser:at-point:selected
   @url
   )
  )


(defun nafm:xinf:default:browse-url/at-point (@url &rest @args)
  "In the named-frame, nafm:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (nafm:xinf:browse-url/at-point
   nafm:xinf:web-browser:at-point:default
   @url
   )
  )


(defun nafm:xinf:news:browse-url/at-point (@url &rest @args)
  "In the named-frame, nafm:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (nafm:xinf:browse-url/at-point
   nafm:xinf:web-browser:at-point:news
   @url
   )
  )

(defun nafm:xinf:bxde:browse-url/at-point (@url &rest @args)
  "In the named-frame, nafm:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (nafm:xinf:browse-url/at-point
   nafm:xinf:web-browser:at-point:bxde
   @url
   )
  )


;;; (nafm:xinf:browse-url/at-point nafm:xinf:web-browser:at-point:selected "https://google.com")
;;; (nafm:xinf:browse-url/at-point nafm:xinf:web-browser:at-point:news "https://presstv.com")
;;; (nafm:xinf:browse-url/at-point nafm:xinf:web-browser:at-point:news "https://france24.com")
;;; (nafm:xinf:browse-url/at-point nafm:xinf:web-browser:at-point:news "https://aljazira.com")

;;; (nafm:named-frame:struct:-name nafm:xinf:web-browser:at-point:selected)

(defun nafm:xinf:browse-url/at-point (@nf-info @url &rest @args)
  "In the named-frame @nf-info open @url."
  (interactive)
  (let* (
	 ($originalFrame (selected-frame))
	 ($browserFrameName (nafm:named-frame:struct:-name @nf-info))
	 ($browserFrame (get-a-frame $browserFrameName))
	 )
    (when (not $browserFrame)
      (setq $browserFrame (nafm:xinf|make-frame @nf-info))
      )

    ;;(save-window-excursion        
    
    (select-frame-set-input-focus $browserFrame)
    (tab-bar-new-tab)    
    (eaf-open-browser @url t)
    (tab-bar-rename-tab (url-host (url-generic-parse-url @url)))
    )
  )

(defun nafm:$raiseNF (<nf)
  (interactive)  ;; Must be a command -- not just a function
  (raise-frame
   (get-a-frame (nafm:named-frame:struct:-name <nf))))



;;;   (setq browse-url-browser-function 'nafm:xinf:selected:browse-url/at-point)


(lambda () "
* Menus
")

(lambda () "
** Global Nafm Menu
")

;;
;; http://www.neda.com
;;

(defun s-- (<repeat)
  "Example: (s-- 3). Visually shorter than (s-repeat 3 \"-\"
For use in delimiters in easy-menu-define"
  (s-repeat <repeat "-"))

;;
;; http://www.neda.com
;; http://mohsen.1.banan.byname.net
;; 

;; (nafm:modes:menu|define)
(defun nafm:modes:menu|define (&rest <namedArgs)
  "Top level menu for all things xia related." 
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      nafm:modes:menu
      nil
      "Global NAFM Menu"
      `("Named Activities Frame Manager (NAFM)"
	:help "Named Activities Frame Manager (NAFM) and XIA eXternally Integrated Apps"
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)	
	))

    ;; (easy-menu-add-item
    ;;  nil '("NAFM")
    ;;  (nafm:menuItem:selected-if:browse-at-point|define)
    ;;  (s-- 3))

    ;; (easy-menu-add-item
    ;;  nil '("NAFM")  
    ;;  ;; (nafm:menu:browse-url:at-point|define :active nil :visible nil)
    ;;  (nafm:menu:browse-url:at-point|define :active t)
    ;;  (s-- 3))

    ;; (easy-menu-add-item
    ;;  nil '("NAFM")
    ;;  (nafm:menuItem:selected-if:search-with|define)
    ;;  (s-- 4))

    ;; (easy-menu-add-item
    ;;  nil '("NAFM")
    ;;  (nafm:menu:search-engines|define)
    ;;  (s-- 4))

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:menuItem:xia:browser:atPoint:open-with-history|define)
     (s-- 5))

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:menu:destinations|define)
     (s-- 5))

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:menuItem:xia:browser:atPoint:raise|define)
     (s-- 6))

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:menu:xinf:browse-url:at-point|define)
     (s-- 6))     

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:nf:manage/menuSelectDef nafm:named-frame:list)
     (s-- 7))

    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:nfActivity:manage/menuSelectDef nafm:nfActivity:list)
     (s-- 7))
    
    (easy-menu-add-item
     nafm:modes:menu nil
     (nafm:menu:help|define))
    )
  'nafm:modes:menu
  )

;;
;; (nafm:menuItem:selected-if:browse-at-point|define)q
(defun nafm:menuItem:selected-if:browse-at-point|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Browse At-Point With Selected-IF:\n  %s"
	       browse-url-browser-function)
      (find-file-at-point (ffap-url-at-point))
      :help "Selected-IF -- Browse at-point with current value of browse-url-browser-function"
      :active t
      :visible t
      ]
     )))


;; 
(defun nafm:menuItem:selected-if:search-with|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Selected-IF -- Search with:\n %s"
	       nafm:search-engine:selected)
      (find-file-at-point nafm:search-engine:selected)
      :help "Selected-IF -- Search with selected browser setting and selected engine"
      :active t	 
      :visible t
      ]
     )))

;; 
(defun nafm:menuItem:xia:browser:atPoint:open-with-history|define ()
  "Returns a menuItem vector. Static vector."
  [
   "Open URL With XIA (EAF) Browser In Selected XINF"
   (call-interactively 'eaf-open-browser-with-history)
   :help "Prompts for specification of a URL in minibufer"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:xia:browser:atPoint:raise|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [
      ,(format "Raise Selected XINF Browser At-Point Frame:\n  \"%s\""
	       "NOTYET")
      ;; ,(format "Raise Selected XINF Browser At-Point Frame:\n  \"%s\""
      ;;       (nafm:named-frame:struct:-shortTitle nafm:xinf:web-browser:at-point:selected))
      (message "NOTYET")
      ;; (raise-frame (get-a-frame (nafm:named-frame:struct:-name nafm:xinf:web-browser:at-point:selected)))
      :help "Raise XINF At Value Of nafm:xinf:web-browser:at-point:selected"
      :active t
      :visible t
      ]
     )))


;; (nafm:menu:help|define)
(defun nafm:menu:help|define ()  
  "Generic Nafm Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      nafm:menu:help
      nil
      "Help Menu For xia"
      `("xia Help"
	:help "Help For This Menu"
	["Visit xia Help Panel"
	 nafm:nafm:menu:overview-help
	 t
	 ]	 ;;; Notyet, should point to panel instead
	"---"
	[,(format "Visit %s" $thisFuncName)
	 (find-function (intern ,$thisFuncName))
	 t
	 ]	
	)
      )
    'nafm:menu:help
    ))

(lambda () "
* Existing Menu Code.
  ")


(lambda () "
** Global Nafm Menu
")


(when (equal blee:emacs:id '26f)
  (defvar browse-url-secondary-browser-function nil
    "Fake temporary 26f variable for same as introduced in 27f"))




;;
;; 
(defun nafm:menu:browse-url:at-point|define (&rest <namedArgs)
  "Returns org-roam-server:menu.
:active and :visible can be specified as <namedArgs.
"
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)


    ;; (setq $:nafm:menu:browse-url:at-point:active <active)
    (setq $:nafm:menu:browse-url:at-point:visible <visible)    

    (easy-menu-define
      nafm:menu:browse-url:at-point
      nil
      "Menu For Configuration Of browse-url-browser-function"
      `("Select At-Point Url Browser"
	:help "Show And Set Relevant Parameters"
	:visible $:nafm:menu:browse-url:at-point:visible
	:active ,<active
	"---"	
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
	"---"
	"---"
	 [
	  "XIA Browser Frame"
	  (setq browse-url-browser-function 'nafm:xinf:selected:browse-url/at-point)
	  :help "nafm:xinf:selected:browse-url/at-point is based on NOTYET"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'nafm:xinf:selected:browse-url/at-point)
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
	))
    'nafm:menu:browse-url:at-point
    ))

;;
;; 
(defun nafm:menu:xinf:browse-url:at-point|define ()
  "Define menu for setting and viewing of nafm:xinf:web-browser:at-point:selected"
  (let (
	($thisFuncName (compile-time-function-name))
	)

    (defun $set-selected (@selected)
      ;;(setq nafm:xinf:web-browser:at-point:selected @selected)
      (nafm:menu:global|define)
      )
    
    (easy-menu-define
      nafm:menu:xinf:browse-url:at-point
      nil
      "Menu for setting and viewing of nafm:xinf:web-browser:at-point:selected"
      `("XINF Browse-URL-At-Point Selections"
	:help "Show And Set Relevant Parameters"
	,(format
	  "**nafm:xinf:web-browser:at-point:selected = %s**"
	  (nafm:named-frame:struct:-name nafm:xinf:web-browser:at-point:selected))
	,(format
	  "**nafm:xinf:name:web-browser:file:selected = %s**"
	  (nafm:named-frame:struct:-name nafm:xinf:name:web-browser:file:selected))
	,(format
	  "**nafm:xinf:pdf:at-point:selected = %s**"
	  (nafm:named-frame:struct:-name nafm:xinf:pdf:at-point:selected))
	,(format
	  "**nafm:xinf:pdf:result:selected = %s**"
	  (nafm:named-frame:struct:-name nafm:xinf:pdf:result:selected))
	"---"	
	("Show Current nafm:xinf:web-browser:at-point:selected Settings"	
	 [
	  "nafm:xinf:web-browser:at-point:selected"
	  (describe-variable 'nafm:xinf:web-browser:at-point:selected)
	  :help "Describe current value of nafm:xinf:web-browser:at-point:selected"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	("Select At-Point Url Browser Frame"
	 [
	  "Default"
	  ($set-selected nafm:xinf:web-browser:at-point:default)
	  :help "Common default destination for at-point urls"
	  :active t
	  :visible t
	  ]
	 [
	  "News"
	  ($set-selected nafm:xinf:web-browser:at-point:news)
	  :help "News at-point url XINF destination"
	  :active t
	  :visible t
	  ]
	 [
	  "BXDE"
	  ($set-selected nafm:xinf:web-browser:at-point:bxde)
	  :help "BXDE at-point url XINF destination"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    'nafm:menu:xinf:browse-url:at-point
    ))


(defun nafm:menu:destinations|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      nafm:menu:destinations
      nil
      "Menu For Common Destinations"
      `("Common Destinations" :help "Show And Set Relevant Parameters"
	["duckduckgo" (find-file-at-point "https://www.duckduckgo.com") t]
	["google" (find-file-at-point "https://google.com") t]	 
	["bing" (find-file-at-point "https://bing.com") t]	 
	"---"
	("ByStar"
	["by-star.net" (find-file-at-point "http://www.by-star.net") t]
	["neda.com" (find-file-at-point "http://www.neda.com") t]	 
	["ByStar Overview Presentation" (find-file-at-point "http://www.by-star.net/PLPC/180054") t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    'nafm:menu:destinations
    ))


(defun nafm:menu:search-engines|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    
    (defun $selected-set (@searchEngineUrl)
      (setq nafm:search-engine:selected @searchEngineUrl)
      (nafm:menu:top:xia|define)
      )

    (easy-menu-define
      nafm:menu:search-engines
      nil
      "Menu Search Engine Selections"
      `("Search Engine Selections"
	:help "Show And Set Selection Of Search Engine by nafm:search-engine:selected"
	"---"
	,(format "**nafm:search-engine:selected = %s**" nafm:search-engine:selected)
	"---"	
	("Show Search Engine Current Settings"	
	 [
	  "nafm:search-engine:selected"
	  (describe-variable 'nafm:search-engine:selected)
	  :help "Describe current value of nafm:search-engine:selected"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	("Select Search Engine"
	 [
	  "duckduckgo"
	  ($selected-set "https://duckduckgo.com")
	  :help "Set nafm:search-engine:selected to https://duckduckgo.com"
	  :active t
	  :visible t
	  ]
	 [
	  "google"
	  ($selected-set "https://google.com")
	  :help "Set nafm:search-engine:selected to https://google.com"
	  :active t
	  :visible t
	  ]
	 [
	  "bing"
	  ($selected-set "https://bing.com")
	  :help "Set nafm:search-engine:selected to https://bing.com "
	  :active t
	  :visible t
	  ]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    'nafm:menu:search-engines
    ))


(lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(nafm:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (nafm:virsh:domain:menuSelectDef kvmHost) [[elisp:(org-cycle)][| ]]
  ")

;;
;; (nafm:nf:manage/menuSelectDef nafm:named-frame:list)
;; 

(defun nafm:nf:manage/menuSelectDef (<nfList)
  ""
  (interactive)
  (let (
	($menuHeading "Named Frames Management")
	)  
    (easy-menu-define
      nafm:nf:manage
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Raise NF: %s" (nafm:named-frame:struct:-shortTitle <each))
			 `(nafm:$raiseNF ,<each)
			 )
		 )
	       <nfList
	       )))
    'nafm:nf:manage
    ))


;;
;; (blee:nfActivity:manage/menuSelectDef blee:nfActivity:list)
;; 

(defun nafm:nfActivity:manage/menuSelectDef (<nfActivityList)
  ""
  (interactive)
  (let (
	($menuHeading "Named Activity Frames Management")
	)  
    (easy-menu-define
      nafm:nfActivity:manage
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Raise NF Activities: %s" (nafm:nf-activity:struct:-shortTitle <each))
			 `(lambda ()
			    (interactive)  ;; Must be a command -- not just a function
			    (message (nafm:nf-activity:struct:-shortTitle ,<each))
			    )
			 )
		 )
	       <nfActivityList
	       )))
    'nafm:nfActivity:manage
    ))

(provide 'nafm-menu)

