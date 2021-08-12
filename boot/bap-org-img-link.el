;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
  
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")

(setq bap:org-img-link:usage:enabled-p t)

;;; (bap:org-img-link:full/update)
(defun bap:org-img-link:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:org-img-link:usage:enabled-p
    (bap:org-img-link:install/update)
    (bap:org-img-link:config/main)    
    )
  )

(defun bap:org-img-link:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (require 'org-img-link)
  )


;;;(bap:org-img-link:config/main)
(defun bap:org-img-link:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (xtn:org:link:img-link/activate)
  )


(provide 'bap-org-img-link)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
