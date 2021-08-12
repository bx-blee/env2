;;;
;;;

(require 'easymenu)

;;;
;;;
;;;
(defun bystar:calc:menu:define ()
  (easy-menu-define 
    bystar:calc:menu:definition 
  nil 
  "Global ByStar Calc Menu"
  '("ByStar Calc"
    ["RPN Calculator" calc t]
    ["RPN Keypad Calculator" calc-keypad t]
    "---"
    ["Simple Calculator" calculator t]
    "---"
    ["ByStar Calculator Help" bystar:org:doc:howto:all-help t]
    ))
  )

;;;(easy-menu-add-item nil '("Blee") 'bystar:calc:menu:definition "Blee Help")

;; 
(defun bx-calc-menu-help ()
  (interactive)
  (message "bx-calc-menu-help NOTYET")
  )


(provide 'bystar-calc-menu)
