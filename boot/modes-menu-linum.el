;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (modes:linum:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:linum:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:linum:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'modes:linum:menu|update-hook)
  )

(defun modes:linum:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:linum:menu|define :active nil)
;; (popup-menu (symbol-value (modes:linum:menu|define)))
;;
(defun modes:linum:menu|define (&rest <namedArgs)
  "Returns modes:linum:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:linum:menu
      nil
      (format "Line Numbers -- linum-mode (buffer-local) is %s" (bcf:mode|status linum-mode))
      `(
	,(format "Line Numbers -- linum-mode (buffer-local) is %s" (bcf:mode|status linum-mode))
	:help "Line Numbers (linum-mode) local minor mode menu"
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
     modes:linum:menu nil
     (modes:linum:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:linum:menu nil
     (modes:linum:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:linum:menu nil
     (modes:linum:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:linum:menu nil
     (modes:linum:menuItem:describe|define)
     (s-- 6))

    'modes:linum:menu
    ))



(defun modes:linum:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] linum-mode" (bcf:mode|status linum-mode))
      (linum-mode +1)
      :help "Enable -- (linum-mode +1)"
      :active t
      :visible t
      ]
     )))

(defun modes:linum:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] linum-mode" (bcf:mode|status linum-mode))
      (linum-mode -1)
      :help "Disable -- (linum-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:linum:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] linum-mode" (bcf:mode|status linum-mode))
      (call-interactively 'linum-mode)
      :help "Toggle -- (call-interactively 'linum-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:linum:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'linum-mode' minor-mode"
      (describe-minor-mode 'linum-mode)
      :help "Describe -- (describe-minor-mode 'linum-mode)"
      :active t
      :visible t
      ]
     )))


(provide 'modes-menu-linum)
