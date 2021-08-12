;;; 19-compat.el

(require 'eoe)

;;; This file contains lisp code that improves the compatibility of
;;; emacs lisp code written in for some other emacs version

(cond ((= emacs-major-version 19)
       (progn
	 ;; add things that improve compatibility of non 19 packages within
	 ;; this progn
	 
	 ;; full-copy-sparse-keymap is an obsolete function (even in emacs 18.5x)
	 ;; it is superceded by copy-keymap
	 ;;
	 (or (fboundp 'full-copy-sparse-keymap)
	     (fset 'full-copy-sparse-keymap (symbol-function 'copy-keymap)))

	 )
       (provide '19-compat))
      (t nil))				; no-op for all other *eoe-emacs-type*
