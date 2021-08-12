;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (modes:flyspell:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:flyspell:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:flyspell:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'modes:flyspell:menu|update-hook)
  )

(defun modes:flyspell:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:flyspell:menu|define :active nil)
;; (popup-menu (symbol-value (modes:flyspell:menu|define)))
;;
(defun modes:flyspell:menu|define (&rest <namedArgs)
  "Returns modes:flyspell:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:flyspell:menu
      nil
      (format "On-the-fly spell checking -- flyspell-mode (buffer-local) is %s" (bcf:mode|status flyspell-mode))
      `(
	,(format "On-the-fly spell checking -- flyspell-mode (buffer-local) is %s" (bcf:mode|status flyspell-mode))
	:help "Flyspell (flyspell-mode) local minor mode menu"
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
     modes:flyspell:menu nil
     (modes:flyspell:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:flyspell:menu nil
     (modes:flyspell:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:flyspell:menu nil
     (modes:flyspell:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:flyspell:menu nil
     (modes:flyspell:menuItem:describe|define)
     (s-- 6))

    'modes:flyspell:menu
    ))



(defun modes:flyspell:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] flyspell-mode" (bcf:mode|status flyspell-mode))
      (flyspell-mode +1)
      :help "Enable -- (flyspell-mode +1)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] flyspell-mode" (bcf:mode|status flyspell-mode))
      (flyspell-mode -1)
      :help "Disable -- (flyspell-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] flyspell-mode" (bcf:mode|status flyspell-mode))
      (call-interactively 'flyspell-mode)
      :help "Toggle -- (call-interactively 'flyspell-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'flyspell-mode' minor-mode"
      (describe-minor-mode 'flyspell-mode)
      :help "Describe -- (describe-minor-mode 'flyspell-mode)"
      :active t
      :visible t
      ]
     )))


(provide 'modes-menu-flyspell)
