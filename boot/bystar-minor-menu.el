;;;
;;;

(require 'easymenu)

;;;
;;;
;;;
;;; (bystar:minor:menu:define)
(defun bystar:minor:menu:define ()
  (easy-menu-define 
    bystar:minor:menu:definition 
    nil 
    "Global ByStar Minor Modes Menu"
    '("ByStar Minor Modes"
      "---"
      ["FlySpell Mode Enable" (bystar:spellcheck:enable-flyspell-mode) t]
      ["FlySpell Mode Disable" (bystar:spellcheck:disable-flyspell-mode) t]
      ["FlySpell Mode Toggle" (bystar:spellcheck:toggle-flyspell-mode) t]
      "---"
      ["Outline-Minor Mode Enable" (bystar:spellcheck:enable-outline-minor-mode) t]
      ["Outline-Minor Mode Disable" (bystar:spellcheck:disable-outline-minor-mode) t]
      ["Outline-Minor Mode Toggle" (bystar:spellcheck:toggle-outline-minor-mode) t]
      "---"
      ["Snippets (yas) Mode Enable" (yas-minor-mode +1) t]
      ["Snippets (yas) Mode Disable" (yas-minor-mode -1) t]
      ["Snippets (yas) Mode Toggle" (yas-minor-mode) t]
      "---"
      ["auto-complete Mode Enable" (auto-complete-mode +1) t]
      ["auto-complete Mode Disable" (auto-complete-mode -1) t]
      ["auto-complete Mode Toggle" (auto-complete-mode) t]
      "---"
      ["Line Numbers (linum) Mode Enable" (linum-mode +1) t]
      ["Line Numbers (linum) Mode Disable" (linum-mode -1) t]
      ["Line Numbers (linum) Mode Toggle" (call-interactively 'linum-mode) t]
      "---"
      ["White Spaces (whitespaces) Mode Toggle" (call-interactively 'whitespace-mode) t]
      ["Show Trailing White Spaces" (call-interactively 'bx:buffer:show-trailing-whitespace) t]
      ["Don't Show Trailing White Spaces" (call-interactively 'bx:buffer:show-trailing-whitespace-not) t]            
      "---"
      ["Highlight Indentation Mode" (call-interactively 'highlight-indentation-mode) t]
      ["Highlight Indentation Current Column Mode" (call-interactively 'highlight-indentation-current-column-mode) t]
      "---"
      ["Tabbar Mode" (call-interactively 'tabbar-mode) t]
      ["Tabbar Local Mode" (call-interactively 'tabbar-local-mode) t]
      ;;"---"
      ;;["Fill-Column-Indicator" (call-interactively 'fci-mode) t]
      "---"
      ))
  )

;; (easy-menu-add-item nil '("Blee") 'bystar:minor:menu:definition "Blee Help")

;; 
(defun bx-minor-menu-help ()
  (interactive)
  (message "bx-minor-menu-help NOTYET")
  )



(defun bx:cvs-update:BPA ()
  "Minor Mode Bystar Platform Account"
  (interactive)
  ;;
  (cvs-update (expand-file-name "~/") t)
  )


(defun bx:cvs-update:BASA ()
  "Minor Mode BystarUid (ByStar Autonomous Service Account)"
  (interactive)
  ;;
  (cvs-update 
   (bystar:acct:bue-base-dir)
   ;;(concat (expand-file-name "~/") "bystar/accounts/" bystar-cp_acctUid "/LUE")
   t 
   )
  )


(defun bx:cvs-update:platform-full ()
  ""
  (interactive)
  (message "NOTYET"))



(provide 'bystar-minor-menu)
