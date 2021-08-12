;;;
;;;

(require 'easymenu)

;;;
;;;
;;;
(defun bystar:contact:menu:define ()
  (easy-menu-define 
    bystar:contact:menu:definition 
  nil 
  "Global ByStar Contact Menu"
  '("ByStar Contacts"
    ["Name Search" bbdbOneWin t]
    ["Phone Number Search"   bbdb-phones t]
    "---"
    ["Create Entry" bbdb-create t]
    "---"
   "---"
    ("Communications Records Menu"
     ["Individual"   bbdb-phones t]
     ["Group"   bbdb-phones t]
     )
    "---"
    ["ByStar Contact Help" bystar:org:doc:howto:all-help t]
    ))
  )


;;; (easy-menu-add-item nil '("Blee") 'bystar:contact:menu:definition  "Blee Help")

;; 
(defun bx-contact-menu-help ()
  (interactive)
  (message "bx-contact-menu-help NOTYET")
  )

(defun bbdbOneWin ()
  "bbdb one window"
  (interactive)
  (call-interactively 'bbdb)
  (switch-to-buffer (get-buffer "*BBDB*"))
  (delete-other-windows)
  )

(provide 'bystar-contact-menu)
