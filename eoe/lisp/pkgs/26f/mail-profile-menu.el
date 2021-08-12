;;; mail-profile-menu.el

(if (null (string-match "XEmacs" emacs-version))
    (error "mail-profile-menu.el only works with XEmacs!"))

(defvar mail-profile-menu-parent-menu (if (assoc "Mohsen" current-menubar) "Mohsen" "Edit")
  "The name of the parent menu that submenu of booleans 
is to be placed under.")

 
;;; -----------------------------------------------------------------
;;; Provides an automatically updated menu of booleans with names 
;;; that begin with `mail-profile-menu:'
;;; -----------------------------------------------------------------
(defun mail-profile-menu-update ()
  "Function called to update VM's menus."
  (if (assoc mail-profile-menu-parent-menu current-menubar)
      (progn
	(add-submenu `(,mail-profile-menu-parent-menu)
		      '("Mail-Profile Menu" ["Select Mail Profile" nil t] "-----")
		      "Help")
	(add-menu-button `(,mail-profile-menu-parent-menu)
			 ["-----" nil t]
			 "Help")
	(add-menu-button `(,mail-profile-menu-parent-menu)
			 ["-----" nil t]
			 "Help")

	(add-menu-button  `(,mail-profile-menu-parent-menu "Mail-Profile Menu") 
			  ["Show Current Profile" (mail-profile-menu:showProfile) t]
			 "Help")
	
	(add-menu-button  `(,mail-profile-menu-parent-menu "Mail-Profile Menu") 
			  ["Main Profile" (mail-profile-menu:main) t]
			 "Help")

	(add-menu-button  `(,mail-profile-menu-parent-menu "Mail-Profile Menu") 
			  ["ByName Profile" (mail-profile-menu:byname) t]
			 "Help")
  )))

(if (string-equal (system-name) "afrasiab.neda.com")
    (progn
      (setq vm-spool-files
	    `(;; local machine
	      ("~/LISTBOX" , (concat "/var/mail/" "mb-list") "~/LISTBOX.crash") ; solaris
	      ))
      (setq vm-primary-inbox "~/LISTBOX")))
  
  
		


(add-hook 'activate-menubar-hook 'mail-profile-menu-update t)

(defun mail-profile-menu:showProfile ()
  "Select Main Mail Profile"
  (describe-variable 'vm-primary-inbox)
  )


(defun mail-profile-menu:main ()
  "Select Main Mail Profile"
  (message "Select Main Mail Profile.")
  )

(defun mail-profile-menu:byname ()
  "Select Main Mail Profile"
  (message "Select Byname Mail Profile.")
  )


;;; -----------------------------------------------------------------
(provide 'mail-profile-menu)  
