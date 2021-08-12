;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (modes:fill-column:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:fill-column:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimiter <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:fill-column:menu|define :active t)
   <menuDelimiter
   )

  ;;(add-hook 'menu-bar-update-hook 'modes:fill-column:menu|update-hook)
  )

(defun modes:fill-column:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:fill-column:menu|define :active nil)
;; (popup-menu (symbol-value (modes:fill-column:menu|define)))
;;
(defun modes:fill-column:menu|define (&rest <namedArgs)
  "Returns modes:fill-column:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:fill-column:menu
      nil
      (format "Fill Column -- fill-column-indicator(buffer-local) is %s" (bcf:mode|status display-fill-column-indicator))
      `(
	,(format "Fill Column -- fill-column-mode (buffer-local) is %s" (bcf:mode|status display-fill-column-indicator))
	:help "Fill Column (fill-column-mode) local minor mode menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	,(s-- 9)
	))

    (easy-menu-add-item
     modes:fill-column:menu nil
     (modes:fill-column:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:fill-column:menu nil
     (modes:fill-column:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:fill-column:menu nil
     (modes:fill-column:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:fill-column:menu nil
     (modes:fill-column:menuItem:describe|define)
     (s-- 6))

    (easy-menu-add-item
     modes:fill-column:menu nil
     (modes:fill-column:menuItem:set-column|define)
     (s-- 7))

    'modes:fill-column:menu
    ))



(defun modes:fill-column:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] fill-column-mode" (bcf:mode|status display-fill-column-indicator))
      (blee:fill-column-indicator/enable)
      :help "Enable -- (blee:fill-column-indicator/enable)"
      :active t
      :visible t
      ]
     )))

(defun modes:fill-column:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] fill-column-mode" (bcf:mode|status display-fill-column-indicator))
      (blee:fill-column-indicator/enable)
      :help "Disable -- (fill-column-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:fill-column:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] fill-column-mode" (bcf:mode|status display-fill-column-indicator))
      (blee:fill-column-indicator/toggle)
      :help "Toggle -- (call-interactively 'fill-column-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:fill-column:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'fill-column-mode' minor-mode"
      (describe-variable 'display-fill-column-indicator)
      :help "Describe -- (describe-minor-mode 'fill-column-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:fill-column:menuItem:set-column|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "set-fill-column"
      (call-interactively 'set-fill-column)
      :help "set-fill-column"
      :active t
      :visible t
      ]
     )))


(provide 'modes-menu-fill-column)
