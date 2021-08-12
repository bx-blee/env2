;;; eoe-menu.el

(defconst eoe-menu-fsf-emacs-p (null (string-match "XEmacs" emacs-version))
  "t if emacs is FSF, nil otherwise.")

;; emacs19f needs Lucid-style menu emulation
(if eoe-menu-fsf-emacs-p
    (require 'lmenu))


;;; ---------------------------------------------------------------
;;; EOE menu
;;; ---------------------------------------------------------------
(defconst eoe-menu
  '("EOE"
    ["Help" (message "Not yet implemented.") t]
    ))


(defun eoe-menu-install ()
  "Install `EOE' menu."
  (interactive)
  (cond (eoe-menu-fsf-emacs-p
	 (add-menu nil "EOE" (cdr eoe-menu) "Tools"))
	(t
	 (if current-menubar
	     (let ((assn (assoc "EOE" current-menubar)))
	       (cond (assn
		      (setcdr assn (cdr eoe-menu)))
		     (t
		      (add-menu nil "EOE" (cdr eoe-menu) "Tools"))))))))

;;; ---------------------------------------------------------------
;;; Put the EOE menu in the menubar
;;; ---------------------------------------------------------------

(cond (eoe-menu-fsf-emacs-p
       (eoe-menu-install))
      ((and (not eoe-menu-fsf-emacs-p)
	    (eq window-system 'x))
       (eoe-menu-install)
       (if (null (member 'eoe-menu-install activate-menubar-hook))
	   (add-hook 'activate-menubar-hook 'eoe-menu-install))))


;;; -----------------------------------------------------------------
;;; -----------------------------------------------------------------

;;; eoe-menu.el

;(setq eoe-menu-parent-menu (if (assoc "EOE" current-menubar) "EOE" "Edit"))
(defvar eoe-menu-parent-menu (if (assoc "EOE" current-menubar) "EOE" "Edit")
  "The name of the parent menu that submenu of Eoe
is to be placed under.")

 
;;; -----------------------------------------------------------------
;;; Provides an automatically updated menu of booleans with names 
;;; that begin with `eoe-menu:'
;;; -----------------------------------------------------------------
(defun eoe-menu-update ()
  "Function called to update  menus."
  (if (assoc eoe-menu-parent-menu current-menubar)
      (progn

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Email Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Email Menu") 
			  ["Read Mail -- GNUS" (gnus) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Email Menu") 
			  ["Send Mail" (mail) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Contacts Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Contacts Menu") 
			  ["Name Search" (call-interactively 'bbdb) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Contacts Menu") 
			  ["Phone Number Search" (call-interactively 'bbdb-phones) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Contacts Menu") 
			  ["Create Entry" (call-interactively 'bbdb-create) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Communications Records Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Communications Records Menu") 
			  ["Individual" (call-interactively 'bbdb) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Communications Records Menu") 
			  ["Group" (call-interactively 'bbdb) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Tasks Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Tasks Menu") 
			  ["Todo Show" (todo-show) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Tasks Menu") 
			  ["Todo Insert" (todo-show) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Tasks Menu") 
			  ["Todo Show All" (todo-top-priorities 0) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Tasks Menu") 
			  ["Todo Top Priorities" (todo-top-priorities) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Work Log Menu" ["Eoe Menu" nil t] "-----")
		      "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "Work Log Menu") 
			  ["Work Log View" (worklog-show) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Work Log Menu") 
			  ["Work Log Start" (call-interactively 'worklog-task-begin) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Work Log Menu") 
			  ["Work Log End" (call-interactively 'worklog-task-done) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Work Log Menu") 
			  ["Work Log Summarize" (worklog-summarize-tasks) t]
			 "Help")


	(add-submenu `(,eoe-menu-parent-menu)
		      '("Calendar Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Calendar Menu") 
			  ["Calendar" (calendar) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Diary Menu" ["Eoe Menu" nil t] "-----")
		      "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Insert" (progn
					    (make-diary-entry (current-time-string))
					    (beginning-of-line)
					    (kill-word)
					    (delete-char 1)
					    (forward-word 2)
					    (insert ",")
					    (delete-char 9)
					    (end-of-line)
					    ) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Today" (diary 1) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Week" (diary 7) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Month" (diary 31) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Year" (diary 365) t]
			 "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "Diary Menu") 
			  ["Diary Mail Entries" (diary-mail-entries) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Appointments Menu" ["Eoe Menu" nil t] "-----")
		      "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "Appointments Menu") 
			  ["Notice Within 10 mintes" (setq appt-display-duration 10) t]
			 "Help")

	(add-submenu `(,eoe-menu-parent-menu)
		      '("Raw Notes Menu" ["Eoe Menu" nil t] "-----")
		      "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "Raw Notes Menu") 
			  ["Visit Notes Folder" (call-interactively 'dired) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Raw Notes Menu") 
			  ["Create New Notes File" (call-interactively 'dired) t]
			 "Help")


	(add-submenu `(,eoe-menu-parent-menu)
		      '("Calculator Menu" ["Eoe Menu" nil t] "-----")
		      "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "Calculator Menu") 
			  ["RPN Calculator" (calc) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "Calculator Menu") 
			  ["Traditional Calculator" (calc) t]
			 "Help")


	(add-submenu `(,eoe-menu-parent-menu)
		      '("PDA Link Menu" ["Eoe Menu" nil t] "-----")
		      "Help")


	(add-menu-button  `(,eoe-menu-parent-menu "PDA Link Menu") 
			  ["Palm Connect" (noop) t]
			 "Help")

	(add-menu-button  `(,eoe-menu-parent-menu "PDA Link Menu") 
			  ["WinCE Connect" (noop) t]
			 "Help")


;;	(add-menu-button `(,eoe-menu-parent-menu)
;;			 ["             " nil t]
;;			 "Extra Help")
  )))


(add-hook 'activate-menubar-hook 'eoe-menu-update t)

(provide 'eoe-menu)  

