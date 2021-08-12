;;;
;;;

(require 'easymenu)

;;;
;;; Global BIDI Menu
;;;

;; (blee:blee:menu)
;; (bystar:bidi-global:menu)
(defun bystar:bidi-global:menu ()
  (easy-menu-define 
    bidi-menu 
    nil 
    "Global BIDI Menu"
    '("Bi-Directional -- BIDI"
      "---"
      ["يک طرفه -- reordering off" bidi-display-reordering-off t]
      ["دو طرفه -- reordering on" bidi-display-reordering-on t]
      ["کدام طرف؟ --  current reordering show" bidi-display-reordering-show t]
      "---"
      ["چپ به راست -- paragraph left-to-right" bidi-paragraph-direction-left-to-right t]
      ["راست به چپ -- paragraph right-to-left" bidi-paragraph-direction-right-to-left t]
      ["خودبه خود -- paragraph auto-detect" bidi-paragraph-direction-auto-detect t]
      ["کدام جهت؟ -- current paragraph direction" bidi-paragraph-direction-current t]
       ))
  )


;; (bidi-display-reordering-on)
(defun bidi-display-reordering-on ()
  (interactive)
  (setq bidi-display-reordering t)
  (recenter)
  )

;; (bidi-display-reordering-off)
(defun bidi-display-reordering-off ()
  (interactive)
  (setq bidi-display-reordering nil)
  (recenter)
  )

;; (bidi-display-reordering-show)
(defun bidi-display-reordering-show ()
  (interactive)
  (describe-variable 'bidi-display-reordering)
  )


;; (bidi-paragraph-direction-right-to-left)
(defun bidi-paragraph-direction-right-to-left ()
  (interactive)
  (setq bidi-paragraph-direction 'right-to-left)
  (recenter)
  )

;; (bidi-paragraph-direction-left-to-right)
(defun bidi-paragraph-direction-left-to-right ()
  (interactive)
  (setq bidi-paragraph-direction 'left-to-right)
  (recenter)
  )


;; (bidi-paragraph-direction-auto-detect)
(defun bidi-paragraph-direction-auto-detect ()
  (interactive)
  (setq bidi-paragraph-direction nil)
  (recenter)
  )

;; (bidi-paragraph-direction-current)
(defun bidi-paragraph-direction-current ()
  (interactive)
  (describe-variable 'bidi-paragraph-direction)
  ;;(current-bidi-paragraph-direction)
  )



(provide 'bystar-bidi-menu)
