;; 
;; 
;; 

;;;------------------------------------------------
;;;  EPE -- Effective Physical Environment 
;;;------------------------------------------------

(setq epe:screen:size-type "wide")

(defun epe:screen:size:set ( size-type )
  "Set screen size to wide"
  (interactive (list
		(completing-read "Screen Size Type: " 
				 '( ("wide") ("basic"))  nil)))
  (setq epe:screen:size-type size-type)

  (when (string= "wide" epe:screen:size-type)
    (bystar:mail:display:frame-wide))

  (when (string= "basic" epe:screen:size-type)
    (bystar:mail:display:frame-basic))

  (message (format "epe:screen:size-type set to %s" size-type))
)



(provide 'epe-lib)
