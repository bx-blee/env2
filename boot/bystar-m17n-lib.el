;; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:m17n:all-defaults-set)
;;
;; bystar:m17n 

;;;------------------------------------------------
;;;  M17n 
;;;------------------------------------------------

;;(require 'quail-persian-isiri9147)
;;(require 'quail-persian-translit)

;;;  It should really be post 24.2.50.1 
(if (emacs-version< 24 2)
    (progn
      (load-file "~/lisp/lang-persian.el")
      )
  )

(if (emacs-version< 24 3)
    (progn
      (load-file "~/lisp/persian.el")
      )
  )

(require 'bystar-m17n-menu)

;; (bystar:m17n:all-defaults-set)
(defun bystar:m17n:all-defaults-set ()
  ""
  (interactive)

  (setq-default bidi-display-reordering t)

  ;; ./farsiMenuBar.elsi.el

  ;; NOTYET, kbd Activations come here

  (message "bystar:m17n:defaults-set -- Done." )
  )



(provide 'bystar-m17n-lib)
