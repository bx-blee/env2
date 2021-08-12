;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:calc:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:calc:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:calc:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:calc:menu|update-hook)
  )

(defun apps:calc:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:calc:menu|define :active nil)
;; (popup-menu (symbol-value (apps:calc:menu|define)))
;;
(defun apps:calc:menu|define (&rest <namedArgs)
  "Returns apps:calc:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:calc:menu
      nil
      (format "Calculator Menu")
      `(
	,(format "Calculator Menu")
	:help "calculator menu"
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
     apps:calc:menu nil
     (apps:calc:menuItem:basic-rpn|define)
     (s-- 3))

    (easy-menu-add-item
     apps:calc:menu nil
     (apps:calc:menuItem:keypad|define)
     (s-- 4))

    (easy-menu-add-item
     apps:calc:menu nil
     (apps:calc:menuItem:simple|define)
     (s-- 5))

    (easy-menu-add-item
     apps:calc:menu nil
     (apps:calc:menuItem:describe|define)
     (s-- 6))

    'apps:calc:menu
    ))



(defun apps:calc:menuItem:basic-rpn|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Basic RPN Calculator")
      (calc)
      :help "Basic RPN Calculator -- (calc)"
      :active t
      :visible t
      ]
     )))

(defun apps:calc:menuItem:keypad|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "RPN Keypad Calculator")
      (calc-keypad)
      :help "RPN Keypad Calculator -- (calc-keypad)"
      :active t
      :visible t
      ]
     )))

(defun apps:calc:menuItem:simple|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Simple Calculator")
      (calculator)
      :help "Simple Calculator -- (calculator)"
      :active t
      :visible t
      ]
     )))

(defun apps:calc:menuItem:describe|define ()
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


(provide 'apps-calc-menu)
