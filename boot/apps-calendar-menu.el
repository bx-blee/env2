;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:calendar:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:calendar:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:calendar:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:calendar:menu|update-hook)
  )

(defun apps:calendar:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;;
;;; (apps:calendar:menu|define)
;;; (popup-menu (symbol-value (apps:calendar:menu|define)))
;;;
(defun apps:calendar:menu|define (&rest <namedArgs)
  "Returns apps:calc:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)
  
  (easy-menu-define 
    apps:calendar:menu
    nil 
    "Calendar Menu"
  '("Blee Calendar"
    ["Calendar" calendar t]
    ["CFW Diary" (cfw:open-diary-calendar) t]
    ["CFW Org" (cfw:open-org-calendar) t]
    ["CFW Calendar Buffer" (cfw:open-calendar-buffer) t]
    ["CFW ICal" (cfw:open-ical-calendar) t]
    ["CFW Refresh" (cfw:refresh-calendar-buffer) t]    
    ["CFW Git" (cfw:git-open-calendar) t]              
    "---"
    ("Diary Menu"
     ["Diary Insert" (bx:diary:insert-today) t]
     ["Diary Today" (diary 1) t]
     ["Diary Week" (diary 7) t]
     ["Diary Month" (diary 31) t]
     ["Diary Year" (diary 365) t]
     ["Diary Mail Entries" (diary-mail-entries) t]
     )
    "---"
    ("Appointments Menu"
     ["Appointments Check" (progn 
			     (call-interactively 'appt-check)
			     (call-interactively 'appt-check)) t]
     ["Enable Appointments+Diary Check" (progn 
			     (appt-activate 1) 
			     (call-interactively 'appt-check)
			     (call-interactively 'appt-check)) t]
     ["Notice Within 10 mintes" (setq appt-display-duration 10) t]
     ["Notice Within 30 mintes" (setq appt-display-duration 30) t]
     "---"
     ["Disable Checking Of Appointments" (appt-activate 0) t]
     ) 
    "---"
    ("Org-Agenda Menu"
     ["Org-Agenda Buffer" (bx:org:agenda:projs-all) t]
     )
    "---"
    ["ByStar Calendar Help" bystar:org:doc:howto:all-help t]
    ))
  'apps:calendar:menu
  ))



(provide 'apps-calendar-menu)
