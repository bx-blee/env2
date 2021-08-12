;; 
;; this file should set the value of the global variable
;; eoe-pkg-subdirs to a list of strings, one for each subdirectory
;; that contains some elisp package.  e.g., 
;; 
;; (setq eoe-pkg-subdirs '( "bbdbPlus" "auctex" ))
;; 
;;

(cond ((eq *eoe-emacs-type* '18f)
       (message "18f no longer Supported")
      )

      ((or (eq *eoe-emacs-type* '19x)
	   (eq *eoe-emacs-type* '19f))
       (setq eoe-pkg-subdirs '(
			       "bbdb"
			       "bbdbPlus"
			       "bbdb-filters"
			       "gnats"
			       "rcs"
			       "vm"
			       "dict"
			       "babel"
			       ))
       )

      ((eq *eoe-emacs-type* '20f)
       (setq eoe-pkg-subdirs '(
			       "bbdb"
			       "bbdbPlus"
			       "bbdb-filters"
			       "gnats"
			       "rcs"
			       "vm"
			       "dict"
			       "babel"
			       ))
       )

      ((eq *eoe-emacs-type* '21x)
       (setq eoe-pkg-subdirs '(
			       "bbdb-filters-0.51"
			       "dict"
			       "babel"
			       ))
       )
      )

