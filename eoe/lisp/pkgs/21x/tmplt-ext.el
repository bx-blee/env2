;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS %W% %G%
;;; RCS $Id: tmplt-ext.el,v 1.1.1.1 2007-02-23 22:32:57 mohsen Exp $
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Module Description:
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'template)

(defvar template-moded-directory "~/curenv/insert/"
  "Directory Where forms are")

(defvar template-moded-base-directory "~/curenv/insert/"
  "Directory Where forms are")

(defvar template-local-directory nil
  "Directory Where forms are")

(setq template-moded-directory "/usr/curenv/insert/")
(setq template-moded-base-directory "/usr/curenv/insert/")
;;;(setq template-local-directory "/usr/curenv/insert/")
;;;(setq template-local-directory nil)

(defun template-moded ()
  ""
  (interactive)
  (if (eq template-local-directory nil)
      (template-set-base)
    (setq template-moded-directory template-local-directory)
    )
  (template-command (read-file-name "Forms Name:" template-moded-directory))
  ;;(template-command (list (read-file-name "Forms Name:" template-moded-directory)))
  )

(defun template-moded-overwrite ()
  ""
  (interactive)
  (erase-buffer)

  (if (eq template-local-directory nil)
      (template-set-base)
    (setq template-moded-directory template-local-directory)
    )
  (template-command (read-file-name "Forms Name:" template-moded-directory))
  )

(defun template-set-base ()
  (cond ((equal major-mode 'emacs-lisp-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "emacs-lisp/"))
	 )
	((equal major-mode 'c-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "c/"))
	 )
	((equal major-mode 'c++-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "c++/"))
	 )
	((equal major-mode 'LaTeX-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "tex/"))
	 )
	((equal major-mode 'mh-letter-mode)
	 ;;;(setq template-moded-directory (concat template-moded-base-directory "mh-letter/"))
	 (setq template-moded-directory "~/MH/Insert/")
	 )
	((equal major-mode 'mail-mode)
	 (setq template-moded-directory "~/VM/Insert/")
	 )
	((equal major-mode 'rolo-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "rolo/"))
	 )
	((equal major-mode 'shell-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "csh/"))
	 )
	((equal major-mode 'ksh-mode)
	 (setq template-moded-directory (concat template-moded-base-directory "sh/"))
	 )
	(t
	  (setq template-moded-directory template-moded-base-directory)
	  )
	)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'tmplt-ext)


