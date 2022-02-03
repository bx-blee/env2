;;; comment-elisp.el --- Description   -*- Mode: Emacs-Lisp; lexical-binding: t; -*-
;;
;;
;;; Commentary:
;;
;;  This is a very simple way of allowing for multi-line comments in elisp
;;
;;; Code:


(defvar elCmntEnd nil "Elisp Comment End.")

(defun elCmntBegin (<comment <commentEnd))

(elCmntBegin "
This is an example of multi-line comment (but not in org-mode).
Example usage is:
(elCmntBegin \"multi-line comment comes here.\" elCmntEnd)

I wish elisp had a here-document facility. Like common-lisp.
Anybody listening?
" elCmntEnd)


(elCmntBegin " #+begin_org
*  This is an example of multi-line comment in *org-mode* format.
** Here is an example of a link [[http://www.by-star.net]]
Which in turn allows us to switch between comeega:poly-emacs-lisp-mode or emacs-lisp-mode and org-mode.
#+end_org " elCmntEnd)

(provide 'comment-elisp)
;;; comment-elisp.el ends here
