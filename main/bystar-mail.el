;;; -*- Mode: Emacs-Lisp -*-

;;; gnus-site.el
;;;
;;; site-wide customizations/patches for GNUS

(message "GNUS ALL LOADING")

;;(sleep-for 2)

;; Get mail


(require 'nnimap)

(require 'bystar-acct-lib)

(require 'bystar-mail-lib)

(require 'bystar-mail-out-lib)

(bystar:mail:all-defaults-set)
