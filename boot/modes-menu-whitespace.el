;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (modes:whitespace:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:whitespace:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimiter <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:whitespace:menu|define :active t)
   <menuDelimiter
   )

  ;;(add-hook 'menu-bar-update-hook 'modes:whitespace:menu|update-hook)
  )

(defun modes:whitespace:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:whitespace:menu|define :active nil)
;; (popup-menu (symbol-value (modes:whitespace:menu|define)))
;;
(defun modes:whitespace:menu|define (&rest <namedArgs)
  "Returns modes:whitespace:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:whitespace:menu
      nil
      (format "White Spaces -- whitespace-mode (buffer-local) is %s" (bcf:mode|status whitespace-mode))
      `(
	,(format "White Spaces -- whitespace-mode (buffer-local) is %s" (bcf:mode|status whitespace-mode))
	:help "White Spaces (whitespace-mode) local minor mode menu"
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
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:describe|define)
     (s-- 6))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:show-trailing|define)
     (s-- 7))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:show-trailing-not|define)
     (s-- 8))

    (easy-menu-add-item
     modes:whitespace:menu nil
     (modes:whitespace:menuItem:delete-trailing|define)
     (s-- 9))

    'modes:whitespace:menu
    ))



(defun modes:whitespace:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] whitespace-mode" (bcf:mode|status whitespace-mode))
      (whitespace-mode +1)
      :help "Enable -- (whitespace-mode +1)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] whitespace-mode" (bcf:mode|status whitespace-mode))
      (whitespace-mode -1)
      :help "Disable -- (whitespace-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] whitespace-mode" (bcf:mode|status whitespace-mode))
      (call-interactively 'whitespace-mode)
      :help "Toggle -- (call-interactively 'whitespace-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'whitespace-mode' minor-mode"
      (describe-minor-mode 'whitespace-mode)
      :help "Describe -- (describe-minor-mode 'whitespace-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:show-trailing|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Show Trailing Whitespaces"
      (setq show-trailing-whitespace t)
      :help "Show Trailing Whitespaces -- (setq show-trailing-whitespace t)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:show-trailing-not|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Don't Show Trailing Whitespaces"
      (setq show-trailing-whitespace nil)
      :help "Don't Show Trailing Whitespaces -- (setq show-trailing-whitespace nil)"
      :active t
      :visible t
      ]
     )))

(defun modes:whitespace:menuItem:delete-trailing|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Delete Trailing Whitespaces"
      (delete-trailing-whitespace)
      :help "Delete Trailing Whitespaces -- (delete-trailing-whitespace)"
      :active t
      :visible t
      ]
     )))



(provide 'modes-menu-whitespace)
