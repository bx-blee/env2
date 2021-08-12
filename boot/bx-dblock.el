;;; -*- Mode: Emacs-Lisp -*-

(message "Bx DBLOCK LOADING")

(require 'bx-dblock-lib)
(require 'bgx-org-dblock)

(bx:dblock:all-defaults-set)

(provide 'bx-dblock)
