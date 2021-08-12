;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

(defvaralias 'flyspell-prog-mode 'flyspell-mode)

;; (modes:flyspell-prog:menu:plugin|install modes:menu:global (s-- 6))
(defun modes:flyspell-prog:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (modes:flyspell-prog:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'modes:flyspell-prog:menu|update-hook)
  )

(defun modes:flyspell-prog:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (modes:flyspell-prog:menu|define :active nil)
;; (popup-menu (symbol-value (modes:flyspell-prog:menu|define)))
;;
(defun modes:flyspell-prog:menu|define (&rest <namedArgs)
  "Returns modes:flyspell-prog:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      modes:flyspell-prog:menu
      nil
      (format "flyspell comments in progs -- flyspell-prog-mode (buffer-local) is %s" (bcf:mode|status flyspell-prog-mode))
      `(
	,(format "flyspell comments in progs -- flyspell-prog-mode (buffer-local) is %s" (bcf:mode|status flyspell-prog-mode))
	:help "flyspell comments in progs (flyspell-prog-mode) local minor mode menu"
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
     modes:flyspell-prog:menu nil
     (modes:flyspell-prog:menuItem:enable|define)
     (s-- 3))

    (easy-menu-add-item
     modes:flyspell-prog:menu nil
     (modes:flyspell-prog:menuItem:disable|define)
     (s-- 4))

    (easy-menu-add-item
     modes:flyspell-prog:menu nil
     (modes:flyspell-prog:menuItem:toggle|define)
     (s-- 5))

    (easy-menu-add-item
     modes:flyspell-prog:menu nil
     (modes:flyspell-prog:menuItem:describe|define)
     (s-- 6))

    'modes:flyspell-prog:menu
    ))



(defun modes:flyspell-prog:menuItem:enable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Enable the [%s] flyspell-prog-mode" (bcf:mode|status flyspell-prog-mode))
      (flyspell-prog-mode +1)
      :help "Enable -- (flyspell-prog-mode +1)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell-prog:menuItem:disable|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Disable the [%s] flyspell-prog-mode" (bcf:mode|status flyspell-prog-mode))
      (flyspell-prog-mode -1)
      :help "Disable -- (flyspell-prog-mode -1)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell-prog:menuItem:toggle|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Toggle the [%s] flyspell-prog-mode" (bcf:mode|status flyspell-prog-mode))
      (call-interactively 'flyspell-prog-mode)
      :help "Toggle -- (call-interactively 'flyspell-prog-mode)"
      :active t
      :visible t
      ]
     )))

(defun modes:flyspell-prog:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "Describe the 'flyspell-prog-mode' minor-mode"
      (describe-minor-mode 'flyspell-prog-mode)
      :help "Describe -- (describe-minor-mode 'flyspell-prog-mode)"
      :active t
      :visible t
      ]
     )))


(provide 'modes-menu-flyspell-prog)
