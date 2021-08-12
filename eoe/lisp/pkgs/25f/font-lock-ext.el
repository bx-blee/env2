;;; font-lock-ext.el

(defvar font-lock-maximum-size-alternatives
  (circularize (list (/ font-lock-maximum-size 2)
		     font-lock-maximum-size ; default
		     (* font-lock-maximum-size 2)
		     (* font-lock-maximum-size 4)
		     (/ font-lock-maximum-size 4)))
  "A circular list of possible settings for variable `font-lock-maximum-size'.")

;; save away the default value of font-lock-maximum-size in the plist of 
;; font-lock-maximum-size
(if (null (get 'font-lock-maximum-size 'default-value))
    (put 'font-lock-maximum-size 'default-value font-lock-maximum-size))

(defun font-lock-maximum-size-cycle ()
  "Switch to the next value in the circular list `font-lock-maximum-size-alternatives'." 
  (interactive)
    (let ((cur-val (car font-lock-maximum-size-alternatives))
	  (new-val (car (cdr font-lock-maximum-size-alternatives)))
	  (def-val (get 'font-lock-maximum-size 'default-value)))
      
      (setq font-lock-maximum-size-alternatives (cdr font-lock-maximum-size-alternatives))
      (setq font-lock-maximum-size new-val)
      (message "`font-lock-maximum-size' changed from %s%s to %s%s."
	       cur-val (if (eq cur-val def-val) " (the default)" "")
	       new-val (if (eq new-val def-val) " (the default)" ""))
      new-val))

;;; -----------------------------------------------------------------
(provide 'font-lock-ext)
