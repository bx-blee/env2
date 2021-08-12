;;;
;;;

(require 'easymenu)

;;;
;;; Global BIDI Menu
;;;

;; (blee:blee:menu)
;; (bystar:bidi-global:menu)
(defun bystar:bidi-global:menu ()
  (interactive)
  (let (
	($thisFuncName (compile-time-function-name))
	)
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
	"---"
	["Visibility  -- Hide Bidi Markers" (blee:bidi:markers/hide) t]
	["Visibility  -- Show Bidi Markers" (blee:bidi:markers/show) t]
	"---"	
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]
	)
      )
  ))


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

(defun blee:bidi:markers/hide ()
  "Visibility  -- Hide Bidi Markers"
  (interactive)

  (unless standard-display-table
    (setq standard-display-table (make-display-table))
    )

  (when (aref standard-display-table #x202a)
    (aset standard-display-table #x202a nil))

  (when (aref standard-display-table #x202b)
    (aset standard-display-table #x202b nil))

  (when (aref standard-display-table #x202c)  
    (aset standard-display-table #x202c nil))

  (when (aref standard-display-table #x200e)    
    (aset standard-display-table #x200e nil))

  (when (aref standard-display-table #x200f)
    (aset standard-display-table #x200f nil))

  (when (aref standard-display-table #x200c)
    (aset standard-display-table #x200c nil))

  (redraw-display)
  )

(defun blee:bidi:markers/show ()
  "Visibility  -- Show Bidi Markers"
  (interactive)

  (unless standard-display-table
    (setq standard-display-table (make-display-table))
    )

  (unless (aref standard-display-table #x202a)
    (aset standard-display-table #x202a (vector (make-glyph-code #x22c9 'escape-glyph))))

  (unless (aref standard-display-table #x202b)
    (aset standard-display-table #x202b (vector (make-glyph-code #x22ca 'escape-glyph))))

  (unless (aref standard-display-table #x202c)  
    (aset standard-display-table #x202c (vector (make-glyph-code #x22c8 'escape-glyph))))

  (unless (aref standard-display-table #x200e)    
    (aset standard-display-table #x200e (vector (make-glyph-code #x222b 'escape-glyph))))

  (unless (aref standard-display-table #x200f)
    (aset standard-display-table #x200f (vector (make-glyph-code #x222c 'escape-glyph))))

  (unless (aref standard-display-table #x200c)
    (aset standard-display-table #x200c (vector (make-glyph-code #x222c 'escape-glyph))))

  (redraw-display)
  )


(provide 'bystar-bidi-menu)
