;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:inmail:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:inmail:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:inmail:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:inmail:menu|update-hook)
  )

(defun apps:inmail:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:inmail:menu|define :active nil)
;; (popup-menu (symbol-value (apps:inmail:menu|define)))
;;
(defun apps:inmail:menu|define (&rest <namedArgs)
  "Returns apps:inmail:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:inmail:menu
      nil
      (format "Incoming Mail (INMAIL) Menu")
      `(
	,(format "Incoming Mail (INMAIL) Menu")
	:help "Incoming Mail (INMAIL) Menu -- Gnus, Check For Newmail"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (easy-menu-add-item
     apps:inmail:menu nil
     (apps:inmail:menuItem:gnus:read-news|define)
     (s-- 3))

    ;; (easy-menu-add-item
    ;;  apps:inmail:menu nil
    ;;  (apps:inmail:menuItem:describe|define)
    ;;  (s-- 6))

    'apps:inmail:menu
    ))


(defun apps:inmail:menuItem:gnus:read-news|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Gnus Read Network News At Level 9")
      (gnus)
      :help "Gnus Read Network News At Level 9 -- or specified level -- (gnus)"
      :active t
      :visible t
      ]
     )))

(defun apps:inmail:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "On-Line Help"
      (find-file-at-point "https://www.gnu.org/software/emacs/manual/html_node/calc/index.html")
      :help "On-Line Help -- (visit web info)"
      :active t
      :visible t
      ]
     )))

(provide 'apps-inmail-menu)
