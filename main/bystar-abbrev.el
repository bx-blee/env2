;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar ABBREV LOADING")

(require 'cc-mode)
(require 'perl-mode)
(require 'cperl-mode)
(require 'sh-script)
(require 'shell)

(require 'bystar-abbrev-lib)

(bystar:abbrev:all-defaults-set)

(provide 'bystar-abbrev)
