;;;
;;;

(require 'easymenu)

(require 'blee-menu-dev)

;;;
;;;
;;;
;;; (bystar:platform:menu:define)
(defun bystar:platform:menu:define ()
  (easy-menu-define 
    bystar:platform:menu:definition 
  nil 
  "Global ByStar Platformh Menu"
  '("Developers Menu"
    ["debug-on-error t" (setq debug-on-error t) t]
    ["debug-on-error nil" (setq debug-on-error nil) t]
    "---"
    ["Shell" shell t]
    ["Processes as Dired" proced t]
    "---"
    ["Add Development Menu" (blee:dev:menu:define) t]
    "---"
    ["ByStar Platform Help" bx-platform-menu-help t]
    ))
)

;;(easy-menu-add-item nil '("Blee") 'bystar:platform:menu:definition "Blee Help")

;;(setq debug-on-error nil)
;;(setq debug-on-error t)

;; 
(defun bx-platform-menu-help ()
  (interactive)
  (message "bx-platform-menu-help NOTYET")
  )


(provide 'bystar-platform-menu)
