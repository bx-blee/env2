;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar BBDB LOADING ...")


(when (eq *eoe-emacs-type* '24f)
  (require 'bystar-bbdb-lib)

  (setq bbdb-file "~/.bbdbV6")
  (load "bbdb-append-fix")

  (blee:load-path:add  
   (concat (file-name-as-directory
	    (concat  (file-name-as-directory (blee:env:aPkgs:base-obtain))
		     (symbol-name *eoe-emacs-type*))
	    )
	   "bbdb-ext-20130513.1152")
   )  
  
  (require 'bbdb-ext)
  ;;(add-hook 'bbdb-mode-hook 'bbdb-ext-hook)
  (bbdb-ext-hook)
  )



