;;;
;;;

(require 'easymenu)

;;;
;;; Global Dev Menu
;;;


;; (blee:dev:menu:define)
(defun blee:dev:menu:define ()
  (easy-menu-define 
    blee:dev:menu:definition
    global-map 
    "Global Dev Menu"
    '("Dev"
      ("ByStar Central Information Base"
       ["Locate An Account (by info)" notyet t]
       ["Locate An Account (by number)" notyet t]
       ["List Accounts on BACS" notyet t]
       )
      "---"
      ("Update Platform"
       ["Full Update" bystar:mail:howto:mamm-model-help t]
       )
      "---"
      ("Backup"
       ["Backup Entire Platform" bystar:mail:howto:mamm-model-help t]
       ["Backup Platform Account" bystar:mail:howto:gnus-overview-help t]
       )
      "---"
      ("This Platform Accounts"
       ["List Accounts" bystar:mail:howto:mamm-model-help t]
       ["Recreate Account" bystar:mail:howto:gnus-overview-help t]
       )
      "---"
      ("BUE Account"
       ["List Accounts" bystar:mail:howto:mamm-model-help t]
       )
      "---"
      ("Create New Account (Permanent)"
       ["ByName" bystar:mail:howto:mamm-model-help t]
       ["BySmb" bystar:mail:howto:mamm-model-help t]
       )
      "---"
      ("Create New Account (Ephemera)"
       ["ByName" bystar:mail:howto:mamm-model-help t]
       ["BySmb" bystar:mail:howto:mamm-model-help t]
       )
      "---"
      ("Apparent / Shadow"
       ["List Shadows" bystar:mail:howto:mamm-model-help t]
       ["Shadow Platform Account" bystar:mail:howto:mamm-model-help t]
       ["Deactivate Shadow Platform Account" bystar:mail:howto:mamm-model-help t]
       )
      "---"
      ["Remove This Menu"  blee:dev:menu:remove t]
      "---"
      ["Developers Documentation" bystar:mail:send:menu:global-help t]
      ))
  )

(defun blee:dev:menu:remove ( )
  " "
  (interactive)
  (easy-menu-remove-item global-map '("menu-bar") "Dev")
  )

;; 
(defun dev-menu-help ()
  (interactive)
  (message "dev-menu-help NOTYET")
  )

(provide 'blee-menu-dev)


