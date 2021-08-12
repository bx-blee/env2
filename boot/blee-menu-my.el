;;;
;;;

(require 'easymenu)

;;;
;;; Global My Menu
;;;


;; (blee:my:menu)
(defun blee:my:menu ()
  (easy-menu-define 
    my-menu-global
    global-map 
    "Global My Menu"
    '("My"
      ["My Master Top Activities Panel" (blee:bnsm:panel-goto "/acct/employee/lsipusr/BUE/activeDocs/curProjs") t]
      "---"
      ["This Platform Info" (message (format "opRunDistFamily=%s" opRunDistFamily)) t]
      ["ByStar Account Info" bystar:acct:current-show t]
      "---"
      ("Platform/Screen/Kbd Customizations (Size, Color)"
       ["Screen Size Wide" (epe:screen:size:set "wide") t]
       ["Screen Size Basic" (epe:screen:size:set "basic") t]
       ["Screen Size Small" (epe:screen:size:set "small") t]
       "---"
       ["Dark Background" (progn
			    (bystar:mail:faces:background-dark)
			    (bystar:bbdb:faces:background-dark))
	t]
       ["ByStar Black Background (Green)" (color-theme:bystar:black-green) t]
       ["White Background" (color-theme-snow) t]
       ["Blueish (Gnome) Background" (color-theme-gnome2) t]
       )
      "---"
      ("Bookmarks And Information Sources"
       ["bookmark Jump" bookmark-jump t]
       ["bookmark Set" bookmark-set t]
       ["bookmark Delete" bookmark-delete t]
       ["bookmark Edit" edit-bookmarks t]
       "---"
	["With MozRepl open tabs" (message "NOTYET") t]
       )
      ;;"---"
      ;;["Site Panel, Activities, and Information" (blee:bnsm:panel-goto "/private/site/activeDocs/bxSite") t]
      "---"
      ["My Help" my-menu-help t]
      )
    )
  )


;; 
(defun my-menu-help ()
  (interactive)
  (message "my-menu-help NOTYET")
  )

(provide 'blee-menu-my)


