;;;
;;;

(require 'easymenu)

;;;
;;; Global Handset Menu
;;;
(easy-menu-define 
  handset-menu-global
  global-map 
  "Global Handset Menu"
  '("Handset"
    ["C-C C-C" ctlCctlC t]
    "---"
    ("At Point"
     ["Find File at Point" find-file-at-point t]
     ["BBDB Complete Name" bbdb-complete-name-only t]
     ) 
    "---"
    ("Window"
     ["1 Window" delete-other-windows t]
     ["Split Horizontally" split-window-horizontally t]
     ["Split Vertically" split-window-vertically t]
     ) 
    "---"
    ["Handset Help" handset-menu-help t]
    ))



;; 
(defun handset-menu-help ()
  (interactive)
  (message "handset-menu-help NOTYET")
  )


;; (bystar:handset:menu:global-kbd-n810)  
(defun bystar:handset:menu:global-kbd-n810 ()
  ""
  ;;(interactive)
  (define-key global-map [(f6)] nil)

  (define-key global-map [(f6) (f6) ] 'delete-other-windows)

  ;;;
  ;;;
  (define-key global-map [(f6) (c)] 'ctlCctlC)
  (define-key global-map [(f6) (b)] 'switch-to-buffer)
  (define-key global-map [(f6) (o)] 'other-window)
  (define-key global-map [(f6) (v)] 'split-window-vertically)
  (define-key global-map [(f6) (k)] 'kill-buffer)
  (define-key global-map [(f6) (s)] 'save-buffer)
  (define-key global-map [(f6) (f)] 'find-file)

  ;;;
  ;;; Help
  ;;;
  (define-key global-map [(f6) (\?)  ] 'bystar:org:menu:global-kbd-help)
  (define-key global-map [(f6) (h)  ] 'bystar:org:menu:global-kbd-help)
  )


(fset 'ctlCctlC
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("" 0 "%d")) arg)))

     ;; (define-key global-map
     ;;   [menu-bar mobile pipe]
     ;;   '("Insert |" . insertPipe))

     ;; (define-key global-map
     ;;   [menu-bar mobile tab]
     ;;   '("Insert TAB" . insertTab))


(defun insertPipe ()
  "insertPipe"
  (interactive)
  (insert "|"))

(defun insertTab ()
  "insertTAB"
  (interactive)
  (insert "<tab>"))

(provide 'handset-menu-top)

