;; Time-stamp: <2018-02-20 14:49:15 kmodi>
;; Emacs 27.x: http://git.savannah.gnu.org/cgit/emacs.git/commit/?id=24acb31c04b4048b85311d794e600ecd7ce60d3b

;; (setq package-user-dir (let ((elpa-dir-name (format "elpa_%s" emacs-major-version))) ;default = ~/.emacs.d/elpa/
;;                          (file-name-as-directory (expand-file-name elpa-dir-name user-emacs-directory))))


(defun $blee:emacs|early-init ()
  "Package initialization happens after this but before init.el
The variables determined here are local in scope, 
they will be determined globally later."
  (let (
	($blee:emacs:type "fsf")
	($blee:emacs:id (intern (format "%df" emacs-major-version)))
	)
    (setq package-user-dir
	  (file-name-as-directory 
	   (expand-file-name
	    (format "/bisos/blee/%s/elpa" $blee:emacs:id))))
    )
  )
	  
($blee:emacs|early-init)




