;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(lambda () "
* Authors: Mohsen Banan
* Copying And Usage: List is a perpetual Libre-Halaal polyexistential.
* Functional Specification:
** 
** 
")


(require 'easymenu)

;; (org-roam:modes:global-minor:menu:plugin|install modes:menu:global-minor (s-- 3))  
(defun org-roam:modes:global-minor:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (when bcg:org:roam:usage:enabled-p
    (easy-menu-add-item
     <menuLabel
     nil
     (org-roam:menu|define :active t)
     <menuDelimiter
     )

    (add-hook 'menu-bar-update-hook 'web:search:menu|update-hook)
    )
  )


(defun org-roam:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."

  (org-roam:menu:global|define)
  
  ;; (easy-menu-add-item
  ;;  nil '("Roam") (org-roam:menuItem:param:org-roam-directory|define) "---")
    
  ;; (easy-menu-add-item
  ;;  nil '("Roam") (org-roam:menuItem:param:org-roam-db-location|define) "---")
  
  )

;; (popup-menu (symbol-value (org-roam:menu|define)))
(defun org-roam:menu|define (&rest <namedArgs)
  "Top level menu for all things org-roam related."
  (let (
	(<active (get-arg <namedArgs :active t))	
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      org-roam:menu
      nil
      "Global org-roam menu"
      `("Roam"
	:help "Org-Roam And Roam-Server Primary Actions"
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
     org-roam:menu nil
     (org-roam:menuItem:param:org-roam-directory|define)
     (s-- 3))

    (easy-menu-add-item
     org-roam:menu nil
     (org-roam:menuItem:param:org-roam-db-location|define)
     (s-- 3))
    
    (easy-menu-add-item
     org-roam:menu nil     
     (org-roam:menuItem:db-update|define)
     (s-- 4))
    
    (easy-menu-add-item
     org-roam:menu nil
     (org-roam:menuItem:buffer-toggle|define)
     (s-- 4))     

    (easy-menu-add-item
     org-roam:menu nil          
     (org-roam:menuItem:buffer-display|define)
     (s-- 4))
    
    (easy-menu-add-item
     org-roam:menu nil     
     (org-roam:menuItem:buffer-hide|define)
     (s-- 4))          

    (easy-menu-add-item
     org-roam:menu nil          
     (org-roam:menuItem:find-file|define)
     (s-- 5))               

    (easy-menu-add-item
     org-roam:menu nil               
     (org-roam:menuItem:graph|define)
     (s-- 5))                    

    (easy-menu-add-item
     org-roam:menu nil                    
     (org-roam:menuItem:insert|define)
     (s-- 5))                    

    (easy-menu-add-item
     org-roam:menu nil                         
     (org-roam:menuItem:insert-immediate|define)
     (s-- 5))                         

    (if (package-installed-p 'org-roam-server)
	(easy-menu-add-item
	 org-roam:menu nil                         	 
	 (org-roam-server:menu|define)
	 (s-- 6))                         
      (easy-menu-add-item
       org-roam:menu nil                         	        
       (org-roam-server:menu:stub|define :active nil)
       (s-- 6))                         
      )
    
    ;; NOTYET org-roam-bibtex:menu|define has not been implemented yet
    ;;(if (package-installed-p 'org-roam-bibtex)  
    (if nil
	(easy-menu-add-item
	 org-roam:menu nil                         	        	 
	 (org-roam-bibtex:menu|define)
	 (s-- 7))                         	 
      (easy-menu-add-item
       org-roam:menu nil                         	        	        
       (org-roam-bibtex:menu:stub|define :active nil)
       (s-- 7))                         	        
      )
    
    (easy-menu-add-item
     org-roam:menu nil                         	        	        
     (org-roam:menu:help|define)
     (s-- 8))                         	             
    )
  'org-roam:menu
  )

;; (org-roam:menuItem:param:org-roam-directory|define)
(defun org-roam:menuItem:param:org-roam-directory|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:org-roam:menuItem:params:org-roam-directory
	(format "org-roam-directory=\n  %s"
		(bcf:var/localized 'org-roam-directory)))
  [
   $:org-roam:menuItem:params:org-roam-directory
   (describe-variable 'org-roam-directory)      
   t
   ]
  )

;; (org-roam:menuItem:param:org-roam-db-location|define)
(defun org-roam:menuItem:param:org-roam-db-location|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:org-roam:menuItem:params:org-roam-db-location
	(format "org-roam-db-location=\n  %s"
		(bcf:var/localized 'org-roam-db-location)))
  [
   $:org-roam:menuItem:params:org-roam-db-location
   (describe-variable 'org-roam-db-location)      
   t
   ]
  )

;; (find-function 'org-roam:menuItem:db-update|define)
;; (org-roam:menuItem:db-update|define)
(defun org-roam:menuItem:db-update|define ()
  [
   "Re-Build The Data Base"
   (org-roam-db-update)
   :help "Refresh the database"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-toggle|define ()
  [
   "Toggle Display Of org-roam buffer"
   (org-roam)
   :help "Toggle"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-display|define ()
  [
   "Activate org-roam buffer"
   (org-roam-buffer-activate)
   :help "Activate org-roam buffer -- (org-roam-buffer-activate)"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-hide|define ()
  [
   "Deactivate org-roam buffer"
   (org-roam-buffer-deactivate)
   :help "Deactivate org-roam buffer (org-roam-buffer-deactivate)"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:find-file|define ()
  [
   "Find and open an Org-roam file"
   (org-roam-find-file)
   :help "Find and open an Org-roam file (org-roam-find-file)"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:graph|define ()
  [
   "Display a graph for current"
   (org-roam-graph)
   :help "Display a graph for current (org-roam-graph)"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:insert|define ()
  [
   "With Org-roam file, insert a relative org link at point"
   (org-roam-insert)
   :help "With Org-roam file, insert a relative org link at point (org-roam-insert)"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:insert-immediate|define ()
  [
   "With Org-roam file, insert a relative org link at point with capture-immediate-template"
   (org-roam-insert-immediate)
   :help "With Org-roam file, insert a relative org link at point with capture-immediate-template (org-roam-insert-immediate)"
   :active t	 
   :visible t
   ]
  )


;; (org-roam:menu:help|define)
(defun org-roam:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      org-roam:menu:help
      nil
      "Help Menu For org-roam"
      `("org-roam Help"
	:help "Help For This Menu"
	["Visit org-roam Help Panel"
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
    'org-roam:menu:help
    ))

;;
;; (org-roam-server:menu:stub|define)
;; (org-roam-server:menu:stub|define :active nil)
;; 
(defun org-roam-server:menu:stub|define (&rest <namedArgs)
  "org-roam-server menu."
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
	))
    'org-roam-server:menu
    ))

;;
;; (org-roam-bibtex:menu:stub|define)
;; (org-roam-bibtex:menu:stub|define :active nil)
;; 
(defun org-roam-bibtex:menu:stub|define (&rest <namedArgs)
  "org-roam-bibtex menu."
  (let (
	(<active (get-arg <namedArgs :active t))
	(<visible (get-arg <namedArgs :visible t))
	($thisFuncName (compile-time-function-name))
	)

    (setq $:org-roam-bibtex:menu:active <active)
    (setq $:org-roam-bibtex:menu:visible <visible)    
    
    (easy-menu-define
      org-roam-bibtex:menu
      nil
      "org-roam-bibtex menu"
      `("org-roam Bibtex"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-bibtex:menu:active
	:visible $:org-roam-bibtex:menu:visible
	"---"
	))
    'org-roam-bibtex:menu
    ))


(provide 'org-roam-menu)

