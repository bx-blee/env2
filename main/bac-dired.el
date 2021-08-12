;;; -*- Mode: Emacs-Lisp; -*-

;;;#+BEGIN: blee:pkg:adoptionMessage :enable :org-level 2 pkgName
(message "Blee Adopted Pkg: dired Requested")
;;;#+END:

(defun bac:pkg:shouldBeAvailable:dired ()
  t
  )

(defun bac:pkg:shouldBeEnabled:dired ()
  t
  )

;;;#+BEGIN: blee:pkg:makeAvailable :enable :org-level 2 pkgName
(when (bac:pkg:shouldBeAvailable:dired)
  (require 'bac-dired-ext)
  (bac:pkg:makeAvailable:dired)
  )
;;;#+END:

;;;#+BEGIN: blee:pkg:enable  :enable :org-level 2 pkgName
(when (bac:pkg:shouldBeEnabled:dired)
  (bac:pkg:enable:dired)
  )
;;;#+END:

(provide 'bac-dired)
