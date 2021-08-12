;; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:calc:all-defaults-set)
;;
;; bystar:calc  

;;; requires
;;; ########

(require 'calc)


;; (bystar:calc:all-defaults-set)
(defun bystar:calc:all-defaults-set ()
  ""
  (interactive)


;;; -----------------------------------------------------------------
;;; Calc -- Arbitrary precision calculator
;;; -----------------------------------------------------------------
;(autoload 'calc-dispatch          "calc" "Calculator Options" t)
;(autoload 'full-calc              "calc" "Full-screen Calculator" t)
;(autoload 'full-calc-keypad       "calc" "Full-screen X Calculator" t)
;(autoload 'calc-eval              "calc" "Use Calculator from Lisp")
;(autoload 'defmath                "calc" nil t t)
;(autoload 'calc                   "calc" "Calculator Mode" t)
;(autoload 'quick-calc             "calc" "Quick Calculator" t)
;(autoload 'calc-keypad            "calc" "X windows Calculator" t)
;(autoload 'calc-embedded          "calc" "Use Calc from any buffer" t)
;(autoload 'calc-embedded-activate "calc" "Activate =>'s in buffer" t)
;(autoload 'calc-grab-region       "calc" "Grab region of Calc data" t)
;(autoload 'calc-grab-rectangle    "calc" "Grab rectangle of data" t)


  (message "bystar:calc:defaults-set -- Done." )
  )


(provide 'bystar-calc-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
