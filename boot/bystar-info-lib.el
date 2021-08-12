;; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:info:all-defaults-set)
;;
;; bystar:info  

;;; requires
;;; ########

(require 'info)


;; (bystar:info:all-defaults-set)
(defun bystar:info:all-defaults-set ()
  ""
  (interactive)

;;; -----------------------------------------------------------------
;;; Info -- more info directories
;;; -----------------------------------------------------------------

;(if (= emacs-major-version 20)
;    (message "NOTYET, IGNORE")
;  (progn

;    (setq Info-directory-list
;      (append Info-directory-list
;	      ;; add latex info
;	      (list "/usr/curenv/info"
;		    "/opt/public/sde/info"
;		    "/opt/public/latex2e-95/info")
;	      ))
;    ))


  (message "bystar:info:defaults-set -- Done." )
  )


(provide 'bystar-info-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
