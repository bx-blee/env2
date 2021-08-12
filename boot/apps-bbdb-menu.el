;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:bbdb:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:bbdb:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:bbdb:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:bbdb:menu|update-hook)
  )

(defun apps:bbdb:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:bbdb:menu|define :active nil)
;; (popup-menu (symbol-value (apps:bbdb:menu|define)))
;;
(defun apps:bbdb:menu|define (&rest <namedArgs)
  "Returns apps:bbdb:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:bbdb:menu
      nil
      (format "Contacts (BBDB) Menu")
      `(
	,(format "Contacts (BBDB) Menu")
	:help "Contacts (BBDB) Menu"
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
     apps:bbdb:menu nil
     (apps:bbdb:menuItem:name-search|define)
     (s-- 3))

    (easy-menu-add-item
     apps:bbdb:menu nil
     (apps:bbdb:menuItem:phone-number-search|define)
     (s-- 4))

    (easy-menu-add-item
     apps:bbdb:menu nil
     (apps:bbdb:menuItem:create-entry|define)
     (s-- 5))

    ;; (easy-menu-add-item
    ;;  apps:bbdb:menu nil
    ;;  (apps:bbdb:menuItem:describe|define)
    ;;  (s-- 6))

    'apps:bbdb:menu
    ))



(defun apps:bbdb:menuItem:name-search|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Name Search")
      (bbdbOneWin)
      :help "Name Search -- (bbdbOneMenu)"
      :active t
      :visible t
      ]
     )))

(defun apps:bbdb:menuItem:phone-number-search|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Phone Number Search")
      (bbdb-phones)
      :help "Phone Number Search -- (bbdb-phones)"
      :active t
      :visible t
      ]
     )))

(defun apps:bbdb:menuItem:create-entry|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Create Entry")
      (call-interactively 'bbdb-create)
      :help "Create Entry -- (bbdb-create)"
      :active t
      :visible t
      ]
     )))

(defun apps:bbdb:menuItem:describe|define ()
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


(defun bbdbOneWin ()
  "bbdb one window"
  (interactive)
  (call-interactively 'bbdb)
  (switch-to-buffer (get-buffer "*BBDB*"))
  (delete-other-windows)
  )


(provide 'apps-bbdb-menu)
