;;;-*- Mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)
(require 'blee-nested-menus)

;; (apps:org:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:org:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:org:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:org:menu|update-hook)
  )

(defun apps:org:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;;  NOTYET, Taken from bystar:org:menu:define

;;
;; (apps:org:menu|define :active nil)
;; (popup-menu (symbol-value (apps:org:menu|define)))
;;
(defun apps:org:menu|define (&rest <namedArgs) "
*** Returns apps:org:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:org:menu
      nil
      (format "org-mode Menu")
      `(
	,(format "org-mode Menu")
	:help "For additional features and for global start functions"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	"ByStar Org Mode (Tasks)"
	["Block Update" (org-dblock-update) t]
	["Block Update Buffer" (org-dblock-update-buffer-bx) t]
	["Set Start/End Mode RegExp" (org-dblock-mode-comment-regexp-bx) t]
	("ToDos Menu"
	 ["TODO Insert" eoe-todo-insert t]
	 ["TODO Visit" eoe-todo-visit t]
	 ["TODO List (Agenda)" eoe-todo-list t]
	 ) 
	"---"
	("Work Log Menu"
	 ["Work Log View" (worklog-show) t]
	 ["Work Log Start" (call-interactively 'worklog-task-begin) t]
	 ["Work Log End" (call-interactively 'worklog-task-done) t]
	 ["Work Log Summarize" (worklog-summarize-tasks) t]
	 ) 
	"---"
	("Capture Menu"
	 ["Capture Task" (worklog-show) t]
	 ["Work Log Start" (call-interactively 'worklog-task-begin) t]
	 ["Work Log End" (call-interactively 'worklog-task-done) t]
	 ["Work Log Summarize" (worklog-summarize-tasks) t]
	 ) 
	"---"
	("Refile Menu"
	 ["Refile In All" (bx:org:refile:projs-all) t]
	 ["Refile In Personal" (bx:org:refile:projs-personal-all) t]
	 ["Refile In ByStar" (bx:org:refile:projs-bystar-all) t]
	 ["Refile In Clients" (bx:org:refile:projs-clients-all) t]
	 ) 
	"---"
	["ByStar Org Mode Help" bystar:org:doc:howto:all-help t]
	))

    (defun apps:org:menu:links|install (<active <dest)
      (easy-menu-add-item apps:org:menu nil
			  (apps:org:menu:links|define :active <active) <dest)
    
      (easy-menu-add-item apps:org:menu:links nil
			  (apps:org:menuItem:org-store-link|define) <dest)

      (easy-menu-add-item apps:org:menu:links nil
			  (apps:org:menuItem:org-insert-link|define) <dest)
      )
    (apps:org:menu:links|install <active (s-- 3))

    'apps:org:menu
    ))



(defun apps:org:menu:links|define (&rest <namedArgs) "
*** Returns apps:org:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:org:menu:links
      nil
      (format "Links (ORG) Menu")
      `(
	,(format "Links (ORG) Menu")
	:help "Links (ORG) Menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))
    'apps:org:menu:links
    ))

(defun apps:org:menuItem:org-store-link|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Global: Store A Link")
      (call-interactively 'org-store-link)
      :help "Store A Link For Future Use -- (org-store-link)"
      :active t
      :visible t
      ]
     )))

(defun apps:org:menuItem:org-insert-link|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Insert A Link")
      (org-insert-link)
      :help "Insert A Link, perhaps using the previous org-store-link -- (org-insert-link)"
      :active t
      :visible t
      ]
     )))


;; (easy-menu-add-item nil '("Blee") 'bystar:org:menu:definition "Blee Help")

(defun blee:activities:contacts () (interactive) (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/contacts"))
(defun blee:activities:agendaManagement () (interactive) (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/agendaManagement"))
(defun blee:activities:agendaAll () (interactive) (blee:bnsm:action-func 'bx:org:agenda:projs-all))


;; (bystar:org:menu:global-kbd)  
(defun bystar:org:menu:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f11)] nil)

  ;;;(define-key global-map [(f11) (f11) ] 'org-capture)
  (define-key global-map [(f11) (f11) ] 'bx:org:panel:current)

  ;;;
  ;;; Todo -- Capture
  ;;;
  (define-key global-map [(f11) (t)] nil)
  (define-key global-map [(f11) (t) (c) ] 'org-capture)
  (define-key global-map [(f11) (t) (t) ] 'bx:org:capture:todo)
  (define-key global-map [(f11) (t) (T) ] 'bx:org:capture:Todo)
  (define-key global-map [(f11) (t) (e) ] 'bx:org:capture:event)
  (define-key global-map [(f11) (t) (E) ] 'bx:org:capture:Event)
  (define-key global-map [(f11) (t) (v) ] 'bx:org:capture:visit-captures)

  ;;;
  ;;; ByStar In Buffer Menus
  ;;;
  (define-key global-map [(f11) (x)] nil)
  (define-key global-map [(f11) (x) (x) ] 'bx:bnsm:top:panel-listOfDocs)
  (define-key global-map [(f11) (x) (b) ] 'bx:bnsm:top:panel-blee)
  (define-key global-map [(f11) (x) (u) ] 'bx:bnsm:top:doc-blee)

  ;;;
  ;;; Diary / Calendar / Appointment (See)
  ;;;
  (define-key global-map [(f11) (c)] nil)
  (define-key global-map [(f11) (c) (c) ] 'calendar)
  (define-key global-map [(f11) (c) (i) ] 'bx:diary:insert-today)
  (define-key global-map [(f11) (c) (t) ] 'bx:diary:diary-today)
  (define-key global-map [(f11) (c) (w) ] 'bx:diary:diary-week)
  (define-key global-map [(f11) (c) (m) ] 'bx:diary:diary-month)
  (define-key global-map [(f11) (c) (y) ] 'bx:diary:diary-year)

  ;;;
  ;;; Diary / Calendar / Appointment Edit
  ;;;
  (define-key global-map [(f11) (d)] nil)
  (define-key global-map [(f11) (d) (d) ] 'bx:org:agenda:my-diary-list)
  (define-key global-map [(f11) (d) (a) ] 'bx:org:agenda:all-diary-list)
  (define-key global-map [(f11) (d) (i) ] 'bx:org:diary:main-vist)
  (define-key global-map [(f11) (d) (c) ] 'calendar)
  (define-key global-map [(f11) (d) (f) ] 'bx:org:agenda:this-file-plus-events)
  (define-key global-map [(f11) (d) (v) ] 'bx:org:diary:base-dir-vist)

  ;;;
  ;;; Notes / Information
  ;;;
  (define-key global-map [(f11) (n)] nil)
  (define-key global-map [(f11) (n) (n) ] 'bx:org:notes:visit-notes)
  (define-key global-map [(f11) (n) (d) ] 'bx:org:notes:visit-dir)

  ;;;
  ;;; Personal Codes
  ;;;
  (define-key global-map [(f11) (p)] nil)
  (define-key global-map [(f11) (p) (m)] nil)
  (define-key global-map [(f11) (p) (m) (a)] nil)
  (define-key global-map [(f11) (p) (m) (a) (r)] '(lambda nil (interactive) (progn
									      (bbdb "maryam shafaei" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))
									      (delete-other-windows))))
  (define-key global-map [(f11) (p) (d)] nil)
  (define-key global-map [(f11) (p) (d) (a)] nil)
  (define-key global-map [(f11) (p) (d) (a) (n)] '(lambda nil (interactive) (progn
									      (bbdb "daniel banan-office" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))

									      (delete-other-windows))))
  ;;;
  ;;;
  (define-key global-map [(f11) (p) (d)] nil)
  (define-key global-map [(f11) (p) (d) (a)] nil)
  (define-key global-map [(f11) (p) (d) (a) (n)] '(lambda nil (interactive) (progn
									      (bbdb "daniel banan-office" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))
									      (delete-other-windows))))
  ;;;
  (define-key global-map [(f11) (p) (a)] nil)
  (define-key global-map [(f11) (p) (a) (r)] nil)
  (define-key global-map [(f11) (p) (a) (r) (g)] '(lambda nil (interactive) (progn
									      (bbdb "arghavan banan" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))
									      (delete-other-windows))))
  ;;;
  ;;; Remember Is Obsoleted By Capture
  ;;;
  ;; (define-key global-map [(f11) (r)] nil)
  ;; (define-key global-map [(f11) (r) (r) ] 'org-remember)
  ;; (define-key global-map [(f11) (r) (l) ] 'org-remember-goto-last-stored)
  ;; (define-key global-map [(f11) (r) (j) ] 'bx:org:remember:journal)
  ;; (define-key global-map [(f11) (r) (i) ] 'bx:org:remember:idea)
  ;; (define-key global-map [(f11) (r) (n) ] 'bx:org:remember:note)
  ;;;

  ;;;
  ;;; ReFile
  ;;;
  (define-key global-map [(f11) (r)] nil)
  (define-key global-map [(f11) (r) (r) ] 'bx:org:refile:projs-all)
  (define-key global-map [(f11) (r) (p) ] 'bx:org:refile:projs-personal-main)
  (define-key global-map [(f11) (r) (P) ] 'bx:org:refile:projs-personal-all)
  (define-key global-map [(f11) (r) (b) ] 'bx:org:refile:projs-bystar-all)
  (define-key global-map [(f11) (r) (c) ] 'bx:org:refile:projs-clients-all)



  ;;;
  ;;; Bbdb / Address Book
  ;;;
  (define-key global-map [(f11) (b)] nil)
  (define-key global-map [(f11) (b) (b) ] '(lambda nil (interactive) (progn
								       (call-interactively 'bbdb)
								       (switch-to-buffer (get-buffer "*BBDB*"))
								       (delete-other-windows))))

  (define-key global-map [(f11) (b) (p) ] 'bbdb-phones)
  (define-key global-map [(f11) (b) (c) ] 'bbdb-create)

  (define-key global-map [(f11) (b) (x) ] 'blee:activities:contacts)

  ;;;
  ;;; Agenda, Calendar and Time/Projects Management
  ;;;


  (define-key global-map [(f11) (a)] nil)
  (define-key global-map [(f11) (a) (a) ] 'blee:activities:agendaAll)
  (define-key global-map [(f11) (a) (f) ] 'bx:org:agenda:this-file)
  (define-key global-map [(f11) (a) (x) ] 'blee:activities:agendaManagement)
  ;;;
  ;;; Abacus / Calculator
  ;;;
  (define-key global-map [(f11) (A)] nil)
  (define-key global-map [(f11) (A) (a) ] 'calculator)
  (define-key global-map [(f11) (A) (c) ] 'calc)
  (define-key global-map [(f11) (A) (k) ] 'calc-keypad)

  (define-key global-map [(f11) (z)  ] 'org-toggle-link-display)

  ;;;
  ;;; Help
  ;;;
  (define-key global-map [(f11) (\?)  ] 'bystar:org:menu:global-kbd-help)
  (define-key global-map [(f11) (h)  ] 'bystar:org:menu:global-kbd-help)
  )


;; (bystar:org:menu:global-kbd-n810)  
(defun bystar:org:menu:global-kbd-n810 ()
  ""
  ;;(interactive)
  (define-key global-map [(f4)] nil)

  (define-key global-map [(f4) (f4) ] 'eoe-todo-insert)

  ;;;
  ;;; Todo
  ;;;
  (define-key global-map [(f4) (t)] nil)
  (define-key global-map [(f4) (t) (t) ] 'eoe-todo-visit)
  (define-key global-map [(f4) (t) (i) ] 'eoe-todo-insert)

  ;;;
  ;;; Worklog
  ;;;
  (define-key global-map [(f4) (l)] nil)
  (define-key global-map [(f4) (l) (\1) ] 'gnus-level-1:bx)

  ;;;
  ;;; Diary / Calendar / Appointment (See)
  ;;;
  (define-key global-map [(f4) (c)] nil)
  (define-key global-map [(f4) (c) (c) ] 'calendar)
  (define-key global-map [(f4) (c) (i) ] 'bx:diary:insert-today)
  (define-key global-map [(f4) (c) (t) ] 'bx:diary:diary-today)
  (define-key global-map [(f4) (c) (w) ] 'bx:diary:diary-week)
  (define-key global-map [(f4) (c) (m) ] 'bx:diary:diary-month)
  (define-key global-map [(f4) (c) (y) ] 'bx:diary:diary-year)

  ;;;
  ;;; Diary / Calendar / Appointment Edit
  ;;;
  (define-key global-map [(f4) (d)] nil)
  (define-key global-map [(f4) (d) (d) ] 'bx:diary:insert-today)
  (define-key global-map [(f4) (d) (i) ] 'bx:diary:insert-today)
  (define-key global-map [(f4) (d) (c) ] 'calendar)
  (define-key global-map [(f4) (d) (v) ] 'bx:diary:visit-to-make-entry)

  ;;;
  ;;; Notes / Information
  ;;;
  (define-key global-map [(f4) (n)] nil)
  (define-key global-map [(f4) (n) (n) ] 'bx:org:notes:visit-notes)
  (define-key global-map [(f4) (n) (d) ] 'bx:org:notes:visit-dir)

  ;;;
  ;;; Notes / Information
  ;;;
  (define-key global-map [(f4) (r)] nil)
  (define-key global-map [(f4) (r) (r) ] 'org-remember)
  (define-key global-map [(f4) (r) (l) ] 'org-remember-goto-last-stored)
  (define-key global-map [(f4) (r) (j) ] 'bx:org:remember:journal)
  (define-key global-map [(f4) (r) (i) ] 'bx:org:remember:idea)
  (define-key global-map [(f4) (r) (n) ] 'bx:org:remember:note)

  ;;;
  ;;; Personal Codes
  ;;;
  (define-key global-map [(f4) (p)] nil)
  (define-key global-map [(f4) (p) (m)] nil)
  (define-key global-map [(f4) (p) (m) (a)] nil)
  (define-key global-map [(f4) (p) (m) (a) (r)] '(lambda nil (interactive) (progn
									      (bbdb "maryam shafaei" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))
									      (delete-other-windows))))
  (define-key global-map [(f4) (p) (d)] nil)
  (define-key global-map [(f4) (p) (d) (a)] nil)
  (define-key global-map [(f4) (p) (d) (a) (n)] '(lambda nil (interactive) (progn
									      (bbdb "daniel banan-office" nil)
									      (switch-to-buffer (get-buffer "*BBDB*"))
									      (delete-other-windows))))
  ;;;
  ;;; Bbdb / Address Book
  ;;;
  (define-key global-map [(f4) (b)] nil)
  (define-key global-map [(f4) (b) (b) ] '(lambda nil (interactive) (progn
								       (call-interactively 'bbdb)
								       (switch-to-buffer (get-buffer "*BBDB*"))
								       (delete-other-windows))))
  (define-key global-map [(f4) (b) (p) ] 'bbdb-phones)
  (define-key global-map [(f4) (b) (c) ] 'bbdb-create)

  ;;;
  ;;; Abacus / Calculator
  ;;;
  (define-key global-map [(f4) (a)] nil)
  (define-key global-map [(f4) (a) (a) ] 'calculator)
  (define-key global-map [(f4) (a) (c) ] 'calc)
  (define-key global-map [(f4) (a) (k) ] 'calc-keypad)

  ;;;
  ;;; Help
  ;;;
  (define-key global-map [(f4) (\?)  ] 'bystar:org:menu:global-kbd-help)
  (define-key global-map [(f4) (h)  ] 'bystar:org:menu:global-kbd-help)
  )

(defun bx:org:remember:note ()
  (interactive)
  (org-remember nil "n")
  )

(defun bx:org:remember:idea ()
  (interactive)
  (org-remember nil "i")
  )

(defun bx:org:remember:journal ()
  (interactive)
  (org-remember nil "j")
  )



(defun bx:org:notes:visit-dir ()
  (interactive)
  (find-file "~/org")
  )

(defun bx:org:notes:visit-notes ()
  (interactive)
  (find-file "~/org/notes.org")
  )


(defun eoe-todo-insert-Obsoleted ()
  (interactive)
  (org-remember [] 116)
  )

(defun bx:org:agenda:todo-list ()
  (interactive)
  (org-agenda-main-bx)
  (org-agenda-list)
  (delete-other-windows)
  )

(defun eoe-todo-list ()
  (interactive)
  (bx:org:agenda:todo-list)
  )


(defun eoe-todo-visit ()
  (interactive)
  (find-file "~/org/agenda/personal/Main.org")
  )


(defun eoe-notes-visit ()
  (interactive)
  (find-file "~/org/notes.org")
  )

(defun eoe-org-visit ()
  (interactive)
  (find-file "~/org")
  )


(defun bx:org:agenda:all-diary-list ()
  (interactive)
  (org-agenda-all-diaries-bx)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:events:list-all ()
  (interactive)
  (org-agenda-all-diaries-bx)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:events:list-my ()
  (interactive)
  (org-agenda-my-diaries-bx)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:events:list-my-and-shared ()
  (interactive)
  (org-agenda-my-diaries-bx)
  (org-agenda-list)
  (delete-other-windows)
  )


;;; (bx:org:agenda:diary-all-plus-shared)
(defun bx:org:agenda:diary-all-plus-shared ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (file-expand-wildcards "~/org/events/*.org")
	 (file-expand-wildcards "~/org/agendaShared/*.org")
	 )
	)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:my-diary-list ()
  (interactive)
  (org-agenda-my-diaries-bx)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda-files:projs-all ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (list "~/org/captures.org")
	 (split-string
	  (replace-regexp-in-string "\n" ""  
				    (shell-command-to-string 
				     "find  ~/org/agenda -type f -print  | egrep  \".org$\" | xargs echo"))
	  )
	 (file-expand-wildcards "~/org/events/*.org")
	 )
	)
  )


(defun bx:org:agenda:projs-all ()
  (interactive)
  (bx:org:agenda-files:projs-all)
  (org-agenda-list)
  (delete-other-windows)
  )

(defun bx:org:refile:projs-all ()
  (interactive)
  (bx:org:agenda-files:projs-all)
  (org-refile)
  )



(defun bx:org:agenda:projs-all-plus-shared ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (list "~/org/captures.org")
	 (split-string 
	  (replace-regexp-in-string "\n" ""  
				    (shell-command-to-string 
				     "find  ~/org/agenda -type f -print  | egrep  \".org$\" | xargs echo"))
	  )
	 (file-expand-wildcards "~/org/events/*.org")
	 (file-expand-wildcards "~/org/agendaShared/*.org")
	 )
	)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:this-file-otherWin ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (list (buffer-file-name))))
  ;;(other-frame 1)
  (org-agenda-list)
  )

(defun bx:org:agenda:this-file-1 ()
  (interactive)
  (bx:org:agenda:this-file-otherWin)
  (delete-other-windows)
  )

(defun bx:org:todo:this-file-otherWin ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (list (buffer-file-name))))
  (org-todo-list nil)
  )

(defun bx:org:agenda:files/blank ()
  (interactive)
  (setq org-agenda-files (list))
  )


(defun bx:org:todo:this-node-otherWin ()
  (interactive)
  (setq org-agenda-files
	(blee:file:dir:listNotableSubdirs ".." :expandedFileName t :includeMain t)
	)
  (org-todo-list nil)
  )

(defun bx:org:agenda:this-node ()
  (interactive)
  (setq org-agenda-files
	(blee:file:dir:listNotableSubdirs ".." :expandedFileName t :includeMain t)
	)
  (org-agenda-list)
  ;;(delete-other-windows)
  )

(defun bx:org:todo:linkWith-otherWin ()
  (interactive)
  (setq org-agenda-files (list (buffer-file-name)))
  (goto-char (point-min))  
  (blee:org-update-named-dblocks "blee:bxPanel:linkWithTreeElem")
  (org-todo-list nil)
  )

(defun bx:org:agenda:linkWith-otherWin ()
  (interactive)
  (setq org-agenda-files (list (buffer-file-name)))
  (blee:org-update-named-dblocks "blee:bxPanel:linkWithTreeElem")
  (org-agenda-list)
  ;;(delete-other-windows)
  )


(defun bx:org:find-agenda-files-in-orgMode ()
  ;;
  ;; org-agenda-files now may include .org files as well as .tex or .py or .bash or .etc
  ;; org-todo function expects these files to be open in org-mode.
  ;; So, we put them all in org-mode.
  ;;
  (bx:find-files-in-mode org-agenda-files "(org-mode)")
  )


(defun bx:org:todo:these-files-otherWin ()
  (interactive)
  (let (
	($theseFiles "./bx-org-agenda-files.el")
	)
    (setq org-agenda-files (list))
    (when (file-exists-p $theseFiles)
      (load-file  $theseFiles)
      (bx:org:find-agenda-files-in-orgMode)
      )
    ;; (setq org-agenda-files 
    ;; 	  (append
    ;; 	   org-agenda-files
    ;; 	   (list (buffer-file-name)
    ;; 		 )))
    (org-todo-list nil)
    )
  )

(defun bx:org:agenda:these-files-otherWin ()
  (interactive)
  (let (
	($theseFiles "./bx-org-agenda-files.el")
	)
    (setq org-agenda-files (list))
    (when (file-exists-p $theseFiles)
      (load-file  $theseFiles)
      (bx:org:find-agenda-files-in-orgMode)
      )
    ;; (setq org-agenda-files 
    ;; 	  (append
    ;; 	   org-agenda-files
    ;; 	   (list (buffer-file-name)
    ;; 		 )))
    (org-agenda-list)    
    )
  )


(defun bx:org:todo:this-file-1 ()
  (interactive)
  (bx:org:todo:this-file-otherWin)
  (delete-other-windows)
  )



(defun bx:org:agenda:this-file-plus-events ()
  (interactive)
  (setq org-agenda-files 
	(append
	 (list (buffer-file-name))
	 (file-expand-wildcards "~/org/events/*.org")
	 )
	)
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda:projs-personal-all ()
  (interactive)
  (setq org-agenda-files (file-expand-wildcards "~/org/agenda/personal/*.org"))
  (org-agenda-list)
  (delete-other-windows)
  )


(defun bx:org:agenda-files:projs-personal-all ()
  (interactive)
  (setq org-agenda-files (file-expand-wildcards "~/org/agenda/personal/*.org"))
  )

(defun bx:org:refile:projs-personal-all ()
  (interactive)
  (bx:org:agenda-files:projs-personal-all)
  (org-refile)
  )


(defun bx:org:agenda-files:projs-personal-main ()
  (interactive)
  (setq org-agenda-files (file-expand-wildcards "~/org/agenda/personal/Main.org"))
  )

(defun bx:org:refile:projs-personal-main ()
  (interactive)
  (bx:org:agenda-files:projs-personal-main)
  (org-refile)
  )


(defun bx:org:agenda:visit:projs-personal-dired ()
  (interactive)
  (find-file "~/org/agenda/personal/")
  )


(defun bx:org:agenda:projs-bystar-all ()
  (interactive)
  (bx:org:agenda-files:projs-bystar-all)
  (org-agenda-list)
  (delete-other-windows)
  )

(defun bx:org:agenda-files:projs-bystar-all ()
  (interactive)
  ;;;(setq org-agenda-files (file-expand-wildcards "~/org/agenda/bystar/*.org"))
  (setq org-agenda-files 
	(list
	 "/libre/ByStar/InitialTemplates/activeDocs/bleeDev/fullUsagePanel-en.org"
	 )
	)
  )
;;;	 "/libre/ByStar/InitialTemplates/activeDocs/bxServicesDev/fullUsagePanel-en.org"
;;;	 "/libre/ByStar/InitialTemplates/activeDocs/bxServicesUnstable/fullUsagePanel-en.org"


(defun bx:org:refile:projs-bystar-all ()
  (interactive)
  (bx:org:agenda-files:projs-bystar-all)
  (org-refile)
  )


(defun bx:org:agenda:visit:projs-bystar-dired ()
  (interactive)
  (find-file "~/org/agenda/bystar/")
  )


(defun bx:org:agenda-files:projs-clients-all ()
  (interactive)
  ;;;(setq org-agenda-files (file-expand-wildcards "~/org/agenda/clients/*.org"))
  (setq org-agenda-files 
	(append
	 (split-string 
	  (replace-regexp-in-string "\n" ""  
				    (shell-command-to-string 
				     "find  ~/org/agenda/clients -type f -print  | egrep  \".org$\" | xargs echo"))
	  )
	 )
	)
  )


(defun bx:org:agenda:projs-clients-all ()
  (interactive)
  (bx:org:agenda-files:projs-clients-all)
  (org-agenda-list)
  (delete-other-windows)
  )

;; (bx:org:refile:projs-clients-all)
(defun bx:org:refile:projs-clients-all ()
  (interactive)
  (bx:org:agenda-files:projs-clients-all)
  (org-refile)
  )


(defun bx:org:agenda:visit:projs-clients-dired ()
  (interactive)
  (find-file "~/org/agenda/clients/")
  )


(defun bx:org:diary:main-vist ()
  (interactive)
  (find-file "~/org/events/main.org")
  (end-of-buffer)
  (org-insert-heading)
  (let ((here (point-marker)))
    (insert "  ")
    (org-time-stamp nil)
    (goto-char here)
    )
  )

(defun bx:org:todo:insert-schedule ()
  (interactive)
  (org-insert-heading)
  (let ((here (point-marker)))
    (insert "  ")
    (org-todo)
    (org-schedule)
    (goto-char here)
    (org-end-of-line)
    )
  )


(defun bx:org:diary:base-dir-vist ()
  (interactive)
  (find-file "~/org/events")
  )

(defun bx:bnsm:top:panel-listOfDocs ()
  (interactive)
  (blee:bnsm:top:panel-init "/libre/ByStar/InitialTemplates/activeDocs/listOfDocs")
  )


(defun bx:bnsm:top:panel-blee ()
  (interactive)
  (blee:bnsm:top:panel-init "/libre/ByStar/InitialTemplates/activeDocs/blee")
  )

(defun bx:bnsm:top:doc-blee ()
  (interactive)
  (blee:bnsm:top:doc-init "/libre/ByStar/InitialTemplates/activeDocs/blee")
  )


;; (bystar:org:menu:global-kbd-help)
(defun bystar:org:menu:global-kbd-help ()
  "Display a  help"
  (interactive)
  (describe-bindings [(f11)])
  )

(defun bx:platform:select-frame ()
  "Based on User Environment Display, select a frame."
  (interactive)
  (other-frame 1)
  )

;; (dailyNews)
(defun dailyNews ()
  (interactive)

  (setq commandLine (concat 
		     "~/BUE/bin/privWebMarks.sh  -i dailyNews"))

  (bx:platform:select-frame)
  (lsip-run-command 
   commandLine
   "localhost"
   (user-login-name)
   "nopasswd")
  )



(defun org-agenda-main-bx ()
  (interactive)
  (custom-set-variables
   '(org-agenda-files (quote (
			      "~/org/captures.org"
			      "~/org/events/main.org"
			      "~/org/events/family.org"
			      ))))
  )

(org-agenda-main-bx)

(defun org-agenda-my-diaries-bx ()
  (interactive)
  (custom-set-variables
   '(org-agenda-files (quote (
			      "~/org/events/main.org"
			      "~/org/events/family.org"
			      ))))
  )

;;; (org-agenda-all-diaries-bx)
(defun org-agenda-all-diaries-bx ()
  (interactive)
  (setq org-agenda-files (file-expand-wildcards "~/org/events/*.org"))
  )



;;
;; Taken From The Web
;;
;; refile only within the current buffer
(defun my/org-refile-within-current-buffer ()
  "Move the entry at point to another heading in the current buffer."
  (interactive)
  (let ((org-refile-targets '((nil :maxlevel . 5))))
    (org-refile)))



;;; 
;;; TODO: Where Should This Be Invoked
;;;

(bx:org:capture:templates-setup)
(bx:org:refile:setup)
(define-key global-map "\C-cc" 'org-capture)


;; (defun bx:org:run-me (file-name)
;;   ""
;;   (lsip-local-run-command file-name)
;;   (split-window-below)
;;   (other-window 1)
;;   (blee:bnsm:results-here)
;;   )


(cl-defun bx:org:panel:current ()
  (interactive)
  (let ((fileBuffer))
    (when (file-exists-p "./Panel.org")
      (setq fileBuffer (get-file-buffer "./Panel.org"))
      (message "fileBuffer -- %s" fileBuffer)
      (if fileBuffer
	  (switch-to-buffer fileBuffer)
	(progn
	  (find-file "./Panel.org")
	  (org-dblock-update-buffer-bx)
	  (delete-other-windows)
	  (org-shifttab)
	  )
	)
      (return-from bx:org:panel:current)
      )
    (when (file-exists-p "./commonPanel.org")
      (find-file "./commonPanel.org")
      (return-from bx:org:panel:current)
      )
    (when (file-exists-p "./_selectedIim")
      (let (
	    (let:iim (fv:read-as-string "./_selectedIim"))
	    )
	(lsip-local-run-command-here (format "%s -i gotoPanel" let:iim))
	))
    (message "Missing ./Panel.org or ./commonPanel.org or ./_selectedIim")
    )
  )


(cl-defun bx:org:panel:load-actions ()
  (interactive)
  (when (file-exists-p "./PanelActions.el")
    (load-file "./PanelActions.el")
    (return-from bx:org:panel:load-actions)    
    )
  (message "Missing ./PanelActions.el -- Loading skipped")
    )

(defun bx:org:panel:selectedIim ()
  (interactive)
  (if (file-exists-p "./_selectedIim")
      (shell-command-to-string 
       (format "echo -n $( cat ./_selectedIim)" ))
    (format "missingIim")
    ))

(defun bx:org:run-me ()
  ""
  (save-buffer)
  (lsip-local-run-command-here buffer-file-name)
  ;;(split-window-below)
  ;;(other-window 1)
  ;;(blee:bnsm:results-here)
  )

(defun bx:org:run-me-eml ()
  ""
  (save-buffer)
  (lsip-local-run-command-here (format "%s | iimToEmlVisit" buffer-file-name))
  ;;(split-window-below)
  ;;(other-window 1)
  ;;(blee:bnsm:results-here)
  )

;;; (bx:org:insert:iim-line nil)
(defun bx:org:insert:iim-line ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (
	(subjectStr)
	(fileNameNonDirectory)
	)
    
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (setq fileNameNonDirectory (file-name-nondirectory subjectStr))
    
    (insert
     (format "\
**      IIM               ::   [[elisp:(lsip-local-run-command \"%s\")][%s]]       [[elisp:(blee:visit-as-content-list \"%s\")][Visit Content]]"
		    subjectStr fileNameNonDirectory subjectStr))
    ))  

;;; (bx:org:insert:icmPkg-line)
(defun bx:org:insert:icmPkg-line ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (
	(subjectStr)
	(fileNameNonDirectory)
	(fileNameSansExt)	
	)
    
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (setq fileNameNonDirectory (file-name-nondirectory subjectStr))
    (setq fileNameSansExt (file-name-sans-extension fileNameNonDirectory))    
    
    (insert
     (format "\
 [[elisp:(lsip-local-run-command \"%s\")][%s]]     ||   [[elisp:(blee:visit-as-content-list \"%s\")][Content]] || [[elisp:(blee:file-goto-contents \"%s-Panel.org\")][Panel]]   [[elisp:(org-show-subtree)][|=]]   [[elisp:(org-cycle)][| ]]"
		    subjectStr fileNameNonDirectory subjectStr fileNameSansExt))
    ))  



;;; (bx:org:insert:bleePanel nil)
(defun bx:org:insert:bleePanel ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (
	(subjectStr)
	(fileNameNonDirectory)
	)
    
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (setq fileNameNonDirectory (file-name-nondirectory subjectStr))
    
    (insert
     (format "\
[[elisp:(blee:bnsm:panel-goto \"%s\")][%s]]"
		    subjectStr fileNameNonDirectory))
    ))


;;; (bx:org:insert:iim-line nil)
(defun bx:org:insert:entry:rfcPrimary ()
  "Converts the region into a Primary RFC Entry"
  (interactive)

  (let (
	(subjectStr)
	(rfcNuConnonicalForm)
	(rfcNuUrlComponent)
	)
    
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (setq rfcNuConnonicalForm subjectStr)

    ;;(downcase (replace-regexp-in-string "-" "" "RFC-821"))
    (setq rfcNuUrlComponent (downcase (replace-regexp-in-string "-" "" subjectStr)))
    
    (insert
     (format "\
**  [[elisp:(org-cycle)][| ]]  [[https://www.rfc-editor.org/rfc/%s.txt][<<%s>>]]   :: RFC-XX LABEL     | obsolete | [[https://www.rfc-editor.org/info/%s][%s]]  | 20XX | RFC-XX Short Name  [[elisp:(org-cycle)][| ]]
***  Full Title       ::  RFC-XX Full Title
***  Assigned Ports   ::  [[PortNuXX]]
***  See Also         ::  [[RFC-XX]]
***  Functional Group ::  [[Message Transfer XX]]
***  Comments         ::  Describe-XX
"
		    rfcNuUrlComponent rfcNuConnonicalForm rfcNuUrlComponent rfcNuConnonicalForm))
    ))


(defun org-top-overview ()
  ""
  (org-shifttab)
  (beginning-of-buffer)
  (delete-other-windows)
  )

(defun blee:org:overview ()
  ""
  (org-shifttab)
  )



(provide 'apps-org-menu)
