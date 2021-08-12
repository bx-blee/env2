;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

(require 'blee-lib-widget)

;;;
;;; Global Blee Menu
;;;

(defun bystar:active:menu ()
  (easy-menu-define 
    active-menu 
    nil 
    "Active Menu"
    ["About Me" my-menu-help t]
    ))


(defun blee:menu:keyboard ()
  (easy-menu-define 
    bystar:menu:keyboard:definition 
    nil 
    "Global ByStar Keyboard Menu"
    '("Blee Keyboard -- kbd New"
      ["Kbd:      F1+ -- With At Point" (describe-bindings [(f1)]) t]
      ["Kbd:      F2+ -- Read Mail" (describe-bindings [(f2)]) t]
      ["Kbd:      F3+ -- Send Mail" (describe-bindings [(f3)]) t]
      ["Kbd:      F4+ -- Address Book" (describe-bindings [(f4)]) t]
      ["Kbd:      F5  -- Complete" (describe-key [(f5)]) t]
      ["Kbd:      F6+ -- Language Selection / Dict" (describe-bindings [(f6)]) t]
      ["Kbd:      F7+ -- Shell / Folding " (describe-bindings [(f7)]) t]
      ["Kbd:      F8+ -- Other /  Windows / Frames" (describe-bindings [(f8)]) t]
      ["Kbd:      F9  -- Decrease" (describe-key [(f9)]) t]
      ["Kbd:     F10  -- Increase" (describe-key [(f10)]) t]
      ["Kbd:     F11+ -- Org Mode / Calendar" (describe-bindings [(f11)]) t]
      ["Kbd:     F12+ -- Complete" (describe-bindings [(f12)]) t]
      ["Kbd:  INSERT+ -- Tempo Insert" (describe-bindings [(insert)]) t]
      ["Kbd:   PAUSE+ -- Music" (describe-bindings [(pause)]) t]
      )
    ))



;; (blee:blee:menu)
(defun blee:blee:menu ()
  (easy-menu-define
    blee-menu-global
    global-map
    "Global Blee Menu"
    '("Blee"
      ["Blee Top Activities Panel" bx:bnsm:top:panel-blee t]
      "---"
      ("Blee Help"
       ["Help: Blee Overview" blee:blee:menu:overview-help t]
       "---"
       ["Pointer: ByStar Usage Model" blee:pointer:plpc-xxx t]
       ["Pointer: BLEE (released)" blee:pointer:plpc-xxx t]
       "---"
       ["RevDoc: How-Tos Introduction" blee:blee:doc:howto:introduction-help t]
       ["RevDoc: How-Tos Bug Reports and Todos" blee:blee:doc:howto:bugs-and-todos-help t]
       ["RevDoc: How-Tos New Feature Ideas" blee:blee:doc:howto:ideas-help t]
       "---"
       ["RevDoc:Process: Update All How-Tos And Visit" blee:blee:doc:howto:build-all-doc-modules-and-visit t]
       ["RevDoc:Process: Generate Local PDF How-Tos" blee:blee:doc:howto:full-build t]
       ["RevDoc:Process: Web Publish Development How-Tos" blee:blee:doc:howto:web-publish t]
       )
       ))

  ;; Music -- bystar-emms-menu.el
  (bystar:emms-global:menu)

  ;; Writer's Work Bench -- bystar-langtool-menu.el
  (bystar:langtool-global:menu)

  ;; Programmer's Work Bench -- bystar-progtools-menu.el
  (bystar:progtools-global:menu)

  ;; Multi-Langualization -- bystar-m17n-menu.el
  (bystar:m17n-global:menu)
  (easy-menu-add-item nil '("Blee") 'm17n-menu "Blee Help")

  ;; Navigation Menu
  (blee:menu-sel:navigation:define)
  (easy-menu-add-item nil '("Blee") 'blee:menu-sel:navigation:menu "Blee Help")

  ;; Blee Org-Mode Extensions
  (blee:menu-sel:outline:define)
  (easy-menu-add-item nil '("Blee") 'blee:menu-sel:outline:menu "Blee Help")
  
(when (not (string-equal opRunDistFamily "MAEMO"))
  (bystar:bidi-global:menu)
  (easy-menu-add-item nil '("Blee") 'bidi-menu "Blee Help")
)

;; (when (not (string-equal opRunDistFamily "MAEMO"))
;;   (bystar:tempo-global:menu)
;;   (easy-menu-add-item nil '("Blee") 'bystar:tempo:menu "Blee Help")
;;   )

  ;;; bx-atpoint-menu.el
  (require 'bx-atpoint-menu)
  (bx:atpoint:global-menu)
  (easy-menu-add-item nil '("Blee") 'bx:atpoint:menu "Blee Help")

  ;;; bx-visibility-menu.el
  (require 'bx-visibility-menu)
  (bx:visibility:global-menu)
  (easy-menu-add-item nil '("Blee") 'bx:visibility:menu "Blee Help")

  ;;; bystar-browser-menu.el
  (require 'bystar-browser-menu)
  (bystar:browser:menu:define)
  (easy-menu-add-item nil '("Blee") 'bystar:browser:menu:definition "Blee Help")

  ;; ;;; bystar-mail-menu.el
  (require 'bystar-mail-menu)
  ;; (bystar:mail:send:menu:define)
  ;; (easy-menu-add-item nil '("Blee") 'bystar:mail:send:menu:definition "Blee Help")

  ;; (bystar:mail:menu:define)
  ;; (easy-menu-add-item nil '("Blee") 'bystar:mail:menu:definition "Blee Help")

  (require 'bystar-org-menu)
  ;; (bystar:org:menu:define)
  ;; (easy-menu-add-item nil '("Blee") 'bystar:org:menu:definition "Blee Help")

  ;;; MUSIC Begin
  ;;(easy-menu-add-item nil '("tools") 'emms-global-menu)
  (easy-menu-add-item nil '("Blee") 'emms-global-menu "Blee Help")

  (bystar:emms-mode:menu)
  ;;; MUSIC End

  ;;; LANGTOOL Begin
  (easy-menu-add-item nil '("Blee") 'langtool-global-menu "Blee Help")

  ;; Programmer's Work Bench -- bystar-progtools-menu.el
  (easy-menu-add-item nil '("Blee") 'progtools-global-menu "Blee Help")

  ;;;(bystar:emms-mode:menu)
  ;;; MUSIC End

  (require 'bystar-sync-menu)
  (bystar:sync:menu:define)
  (easy-menu-add-item nil '("Blee") 'bystar:sync:menu:definition "Blee Help")

  (require 'bystar-minor-menu)
  (bystar:minor:menu:define)
  (easy-menu-add-item nil '("Blee") 'bystar:minor:menu:definition "Blee Help")

  (require 'bx-buffer-menu)
  (bx:buffer:menu:define)
  (easy-menu-add-item nil '("Blee") 'bx:buffer:menu:definition "Blee Help")

  (require 'bxo-list-menu)
  (bxo:listSubMenuDef)
  (bxo:listSubMenuDef-update)
  (add-hook 'menu-bar-update-hook 'bxo:listSubMenuDef-update)

(require 'bystar-platform-menu)
(bystar:platform:menu:define)
(easy-menu-add-item nil '("Blee") 'bystar:platform:menu:definition "Blee Help")


(blee:menu:keyboard)
(easy-menu-add-item nil '("Blee") 'bystar:menu:keyboard:definition "Blee Help")

  ;;; Now let's put in the separators
  ;;; Each seperator is different -- otherwise it does not work
  ;;;

  (easy-menu-add-item nil '("Blee") '("--single-dashed-line") "ByStar Send Mail")
  (easy-menu-add-item nil '("Blee") '("--single-line") "Blee Calendar")
  (easy-menu-add-item nil '("Blee") '("--double-dashed-line") "ByStar Synchronization")
  (easy-menu-add-item nil '("Blee") '("--double-line") "Developers Menu")
  (easy-menu-add-item nil '("Blee") '("--shadow-etched-in") "Blee Help")
)

;; (defun update-my-file-menu ()
;;   (easy-menu-add-item jrk-menu '() (get-menu)))

(defun bxo:listSubMenuDef-update ()
  ;;(easy-menu-add-item nil '("Blee") 'bxo:listSubMenu "Blee Help")
  ;; (bxo:listSubMenuDef) ;; Inefficient for now.
  (easy-menu-add-item blee-menu-global '() 'bxo:listSubMenu "Blee Help")
  )

;; (blee:blee:menu:overview-help)
(defun blee:blee:menu:overview-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:overview-desc)
  )

;; (bx-describe-f3)
(defun bx-describe-f3 ()
  ""
  (interactive)
  (describe-bindings [(f3)])
  )


(provide 'blee-menu-blee)

