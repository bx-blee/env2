;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar DICTEM LOADING")

(when (not (string-equal opRunDistFamily "MAEMO"))
  (require 'bystar-dictem-lib)
  (bystar:dictem:all-defaults-set)
  )


(provide 'bystar-dictem)
