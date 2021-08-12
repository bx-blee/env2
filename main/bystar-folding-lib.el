;;; -*- Mode: Emacs-Lisp -*-
;;; RcsId="$Id: bystar-folding-lib.el,v 1.3 2011-01-27 05:46:31 lsipusr Exp $"
;;; 
;;; Description:  Control Firefox from Emacs
;;; Keywords: folding firefox browser

;;;
;;;  TOP LEVEL Entry Point: (bystar:folding:all-defaults-set)
;;; bystar:folding  

;;{{{  GPL:
;;; Copyright (C) 1997 -- 2010, Mohsen BANAN -- Neda Communications, Inc.
;;; All Rights Reserved.
;;;
;;; This is Libre Software and is subject to the Libre Software and Services License.
;;; See http://www.libreservices.org/libreSoftwareAndServicesLicense
;;;
;;}}}

;;{{{  Introduction:

;;; Folding provides a read-eval-print loop into Firefox
;;; This module provides convenient functions for driving Folding
;;; See http://repo.hyperstruct.net/mozlab

;;}}}

;;{{{  Required modules

(require 'folding)
;;}}}

;;{{{ Customizations:

;;}}}

;;{{{ Code:

;; (bystar:folding:all-defaults-set)
(defun bystar:folding:all-defaults-set ()
  ""
  ;;(interactive)


;;
          (autoload 'folding-mode          "folding" "Folding mode" t)
          (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
          (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
;;
;;      But if you always use folding, then perhaps you want more
;;      traditional installation. Here Folding mode starts
;;      automatically when you load a folded file.
;;
;;          ;; (setq folding-default-keys-function
;;          ;;      'folding-bind-backward-compatible-keys)
;;
          (if (load "folding" 'nomessage 'noerror)
              (folding-mode-add-find-file-hook))
;;


  (message "bystar:folding:all-defaults-set -- Done." )
  )


;;}}}

(provide 'bystar-folding-lib)

;;{{{ end of file

;;; folded-file: t

;;; local variables:
;;; byte-compile-dynamic: t
;;; end:

;;}}}
