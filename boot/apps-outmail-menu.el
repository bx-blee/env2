;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:outmail:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:outmail:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:outmail:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:outmail:menu|update-hook)
  )

(defun apps:outmail:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:outmail:menu|define :active nil)
;; (popup-menu (symbol-value (apps:outmail:menu|define)))
;;
(defun apps:outmail:menu|define (&rest <namedArgs)
  "Returns apps:outmail:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:outmail:menu
      nil
      (format "Outgoing Mail (OUTMAIL) Menu")
      `(
	,(format "Outgoing Mail (OUTMAIL) Menu")
	:help "Outgoing Mail (OUTMAIL) Menu -- Composition, Mailings Setup"
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
     apps:outmail:menu nil
     (apps:outmail:menuItem:mcdt:setup-withCurBuffer|define)
     (s-- 3))

    ;; (easy-menu-add-item
    ;;  apps:outmail:menu nil
    ;;  (apps:outmail:menuItem:describe|define)
    ;;  (s-- 6))

    'apps:outmail:menu
    ))



(defun apps:outmail:menuItem:mcdt:setup-withCurBuffer|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "MCDT Setup With Current Buffer")
      (mcdt:setup/with-curBuffer)
      :help "Mail Composition Distribution and Tracking (MCDT) Setup With Current Buffer -- (mcdt:setup/with-curBuffer)"
      :active t
      :visible t
      ]
     )))

(defun apps:outmail:menuItem:describe|define ()
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

(provide 'apps-outmail-menu)
