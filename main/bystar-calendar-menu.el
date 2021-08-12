;;;
;;;

(require 'easymenu)

;;;
;;; (bystar:calendar:menu:define)
;;;
(defun bystar:calendar:menu:define ()
  (easy-menu-define 
    bystar:calendar:menu:definition 
  nil 
  "Global ByStar Calendar Menu"
  '("ByStar Calendar"
    ["Calendar" calendar t]
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
    ["ByStar Calendar Help" bystar:org:doc:howto:all-help t]
    ))
  )


;;; (easy-menu-add-item nil '("Blee") 'bystar:calendar:menu:definition "Blee Help")

(defun bx:diary:diary-today ()
  (interactive)
  (diary 1)
  )


(defun bx:diary:diary-week ()
  (interactive)
  (diary 7)
  )


(defun bx:diary:diary-month ()
  (interactive)
  (diary 31)
  )


(defun bx:diary:diary-year ()
  (interactive)
  (diary 365)
  )


(defun bx:diary:insert-today ()
  (interactive)
  (diary-make-entry (current-time-string))
  (beginning-of-line)
  (delete-region (point)
                 (save-excursion
                   (forward-word 1)
                   (point)))
  ;;;(kill-word) ;; does not work
  (delete-char 1)
  (forward-word 2)
  (insert ",")
  (delete-char 9)
  (end-of-line)
  )

(defun bx:diary:visit-to-make-entry ()
  (interactive)
  (diary-make-entry "")
  (beginning-of-line)
  (delete-region (point)
                 (save-excursion
                   (forward-word 1)
                   (point)))
  )

;; 
(defun bx-calendar-menu-help ()
  (interactive)
  (message "bx-calendar-menu-help NOTYET")
  )


(provide 'bystar-calendar-menu)
