;;; bool-menu.el

(if (null (string-match "XEmacs" emacs-version))
    (error "bool-menu.el only works with XEmacs!"))

(defvar bool-menu-parent-menu (if (assoc "EOE" current-menubar) "EOE" "Edit")
  "The name of the parent menu that submenu of booleans 
is to be placed under.")

 
;;; -----------------------------------------------------------------
;;; Provides an automatically updated menu of booleans with names 
;;; that begin with `bool-menu:'
;;; -----------------------------------------------------------------
(defun bool-menu-update ()
  "Function called to update VM's menus."
  (if (assoc bool-menu-parent-menu current-menubar)
      (progn
	(add-submenu `(,bool-menu-parent-menu)
		      '("Bool Menu" ["`bool-menu:xxx' booleans" nil t] "-----")
		      "Help")
	(add-menu-button `(,bool-menu-parent-menu)
			 ["-----" nil t]
			 "Help")
	(add-menu-button `(,bool-menu-parent-menu)
			 ["-----" nil t]
			 "Help")
	(mapcar '(lambda (boolean-name)
		   (add-menu-button  `(,bool-menu-parent-menu "Bool Menu") 
				     `[,(format "%s" boolean-name)
				       (setq ,boolean-name (not ,boolean-name))
				       :style toggle :selected ,boolean-name]))
		(bool-menu:find-booleans)))))

(add-hook 'activate-menubar-hook 'bool-menu-update t)


(defun bool-menu:find-booleans ()
  "Returns the list of bound symbols beginning with `bool-menu:'."
  (sort (mapcar 'intern
		(all-completions "bool-menu:" obarray 'boundp))
	'string-lessp))


(defvar bool-menu:sample-boolean nil
  "Example of an bool-menu.el boolean.")



;;; -----------------------------------------------------------------
(provide 'bool-menu)  
