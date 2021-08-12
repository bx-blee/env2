;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar TEMPO LOADING")

(when (not (string-equal opRunDistFamily "MAEMO"))
  (require 'bystar-tempo-lib)
  (bystar:tempo:all-defaults-set)
  )

(provide 'bystar-tempo)
