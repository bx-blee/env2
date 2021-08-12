;;;
;;;

(require 'easymenu)

;;;
;;; Global Menu
;;;

;; (blee:blee:menu)
;; (bystar:tempo-global:menu)
(defun bystar:tempo-global:menu ()
  (easy-menu-define 
    bystar:tempo:menu 
    nil 
    "Global TEMPO Menu"
    '("Abbreviation and Templates"
      "---"
      ["Describe Environment" bx-notyet t]
      "---"
      ["Complete Abbrev" bx-notyet t]
      "---"
      ("Personal Templates Repository"
       ["Visit Mail Signatures" (find-file (expand-file-name "~/BUE/inserts/moded/message-mode/")) t]
       ["Visit LaTeX Inserts" (find-file (expand-file-name "~/BUE/inserts/moded/LaTeX-mode/")) t]
       "---"
       ["Visit Farsi Inserts" (find-file (expand-file-name "~/BUE/inserts/m17n/far/")) t]
       ) 
      "---"
      ("Moded and Language Inserts"
       ["Moded File Insert" (bx:finsert:moded-insert) t]
       ["Language File Insert" (bx:finsert:lang-insert) t]
       ) 
      "---"
      ("Tempo"
       ["List Available Templates" (blee:tempo:show-tempo-collection) t]
       ["Tempo Complete Tag" (tempo-complete-tag) t]
       ["Tempo Snippets Complete Tag" (tempo-snippets-complete-tag) t]
       ) 
      "---"
      ("Abbrev"
       ["List Abbrevs" (blee:tempo:sec-lang-set "eng") t]
       ) 
      "---"
      ("Dynamic Abbrev"
       ["List Abbrevs" (blee:tempo:sec-lang-set "eng") t]
       ) 
      "---"
      "---"
      ("Insert / Tempo / Abbrev Help"
       ["Kbd: Insert Key Bindings" blee:tempo:kbd-help t]
       "---"
       ["RevDoc: Inserts / Templates / Abbrev / Dblock" bystar:insert:doc:howto:all-help t]
       )
      ))
  )

;; Done in blee-menu-blee.el 
;;(easy-menu-add-item nil '("Blee") 'bystar:tempo:menu "Blee Help")


;; (bystar:tempo-global:keybd)  -- invoked in translate
(defun bystar:tempo-global:keybd ()
  ""
  ;;(interactive)
  (define-key global-map [(insert)] nil)

  (define-key global-map [(insert) (insert) ] 'yas-ido-expand)
  (define-key global-map [(insert) (e) ] 'yas-expand)
  (define-key global-map [(insert) (i) ] 'yas-insert-snippet)

  (define-key global-map [(insert) (c) ] 'yas-ido-expand)
  (define-key global-map [(insert) (m) ] 'bx:finsert:moded-insert)
  (define-key global-map [(insert) (b) ] 'bx:finsert:bx-moded-insert)
  (define-key global-map [(insert) (v) ] 'bx:finsert:moded-visit)
  (define-key global-map [(insert) (l) ] 'bx:finsert:lang-insert)
  (define-key global-map [(insert) (\?)  ] 'blee:tempo:kbd-desc)
  (define-key global-map [(insert) (h)  ] 'blee:tempo:help)
)


;; (blee:tempo:kbd-help)
(defun blee:tempo:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-bindings [(insert)])
  )


;; (blee:tempo:help)
(defun blee:tempo:show-tempo-collection ()
  ""
  (interactive)
  (describe-variable 'tempo-collection)
  )


(provide 'bystar-tempo-menu)
