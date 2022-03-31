;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)
(require 'mcdt-if)

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



;;
;; (browsers:menuItem:at-point-url:selected-if|define)
(defun apps:outmail:menuItem:selected|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Selected Outmailer:  %s"
	       mcdt:compose:fashion)
      (mcdt:compose-mail/selected)
      :help "With Selected Fashion, compose-mail"
      :active t
      :visible t
      ]
     )))


;;
;; [[elisp:(popup-menu (symbol-value (browsers:menu:help|define)))][This Menu]]
;; (popup-menu (symbol-value (apps:outmail:menu:select|define)))
;;
(defun apps:outmail:menu:select|define (&rest <namedArgs)
  "Returns org-roam-server:menu.
:active and :visible can be specified as <namedArgs.
"
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    ;; (setq $:browsers:menu:browse-url:at-point:active <active)
    (setq $:browsers:menu:browse-url:at-point:visible <visible)

    (easy-menu-define
      browsers:menu:browse-url:at-point
      nil
      "Menu For Configuration Of browse-url-browser-function"
      `("Select Outmailer"
	:help "Show And Set Relevant Parameters"
	:visible $:browsers:menu:browse-url:at-point:visible
	:active ,<active
	,(s-- 3)
	[
	,(format "**selected fashion = %s**" mcdt:compose:fashion)
	  (describe-variable 'mcdt:compose:fashion)
	  :help "Describe current value of browse-url-browser-function"
	  :active t
	  :visible t
	  ]
	,(s-- 4)
	 [
	  "Basic"
	  (mcdt:compose:fashion/setup mcdt:compose:fashion::basic)
	  :help "Select basic composition fashion."
	  :active t
	  :visible t
	  :style radio
	  :selected ,(eq  mcdt:compose:fashion mcdt:compose:fashion::basic)
	  ]
	 [
	  "OrgMsg"
	  (mcdt:compose:fashion/setup mcdt:compose:fashion::orgMsg)
	  :help "Select orgMsg composition fashion."
	  :active t
	  :visible t
	  :style radio
	  :selected ,(eq mcdt:compose:fashion mcdt:compose:fashion::orgMsg)
	  ]
	 [
	  "LaTeX"
	  (mcdt:compose:fashion/setup  mcdt:compose:fashion::latex)
	  :help "Select latex composition fashion."
	  :active t
	  :visible t
	  :style radio
	  :selected ,(eq mcdt:compose:fashion mcdt:compose:fashion::latex)
	  ]
	 ,(s-- 5)
	 ,(s-- 6)
	 ,(s-- 7)
	 ,(s-- 8)
	 ))

	 (easy-menu-add-item
	  browsers:menu:browse-url:at-point
	  nil
	  (browsers:menu:browse-url:at-point:with-function|define)
	  (s-- 6))

	 (easy-menu-add-item
	  browsers:menu:browse-url:at-point
	  nil
	  (browsers:menu:help|define)
	  (s-- 7))

         (easy-menu-add-item
          browsers:menu:browse-url:at-point
          nil
          (bx:menu:panelAndHelp|define
           "/bisos/git/auth/bxRepos/blee-binders/bisos-core/sync/_nodeBase_"
           $thisFuncName
           (intern (symbol-name (gensym))))
          (s-- 8))

    'browsers:menu:browse-url:at-point
    ))




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
