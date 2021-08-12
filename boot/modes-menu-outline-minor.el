;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (modes:outline-minor:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:outline-minor:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:outline-minor:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'modes:outline-minor:menu|update-hook)
  )

(defun modes:outline-minor:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:outline-minor:menu|define :active nil)
;; (popup-menu (symbol-value (modes:outline-minor:menu|define)))
;;
(defun modes:outline-minor:menu|define (&rest <namedArgs)
  "Returns modes:outline-minor:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:outline-minor:menu
      nil
      (format "Outline-Minor -- outline-minor-mode (buffer-local) is %s" (bcf:mode|status outline-minor-mode))
      `(
	,(format "Outline-Minor -- outline-minor-mode (buffer-local) is %s" (bcf:mode|status outline-minor-mode))
	:help "Outline-Minor (outline-minor-mode) local minor mode menu"
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
     modes:outline-minor:menu nil
     (modes:outline-minor:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:outline-minor:menu nil
     (modes:outline-minor:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:outline-minor:menu nil
     (modes:outline-minor:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:outline-minor:menu nil
     (modes:outline-minor:menuItem:describe|define)
     (s-- 6))

    'modes:outline-minor:menu
    ))



(defun modes:outline-minor:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] outline-minor-mode" (bcf:mode|status outline-minor-mode))
      (outline-minor-mode +1)
      :help "Enable -- (outline-minor-mode +1)"
      :active t
      :visible t
      ]
     )))

(defun modes:outline-minor:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] outline-minor-mode" (bcf:mode|status outline-minor-mode))
      (outline-minor-mode -1)
      :help "Disable -- (outline-minor-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:outline-minor:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] outline-minor-mode" (bcf:mode|status outline-minor-mode))
      (call-interactively 'outline-minor-mode)
      :help "Toggle -- (call-interactively 'outline-minor-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:outline-minor:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'outline-minor-mode' minor-mode"
      (describe-minor-mode 'outline-minor-mode)
      :help "Describe -- (describe-minor-mode 'outline-minor-mode)"
      :active t
      :visible t
      ]
     )))


(provide 'modes-menu-outline-minor)
