;;; poly-elisp-comeega.el --- Blee Native Package: poly-elisp-comeega  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)

(define-hostmode poly-emacs-lisp-hostmode
  :mode 'emacs-lisp-mode
  ;; temporary
  :protect-font-lock t
  :protect-syntax t
  :protect-indent t)

(define-innermode poly-org-comeega-innermode nil
  "Innermode for matching comeega fragments in `org-mode'"
  :mode 'org-mode
  :head-matcher "[ \t]*#\\+begin_org.*\n"
  :tail-matcher "[ \t]*#\\+end_org.*\n"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-emacs-lisp-mode
  :hostmode 'poly-emacs-lisp-hostmode
  :innermodes '(poly-org-comeega-innermode))

(add-to-list 'auto-mode-alist '("\\.el\\'" . poly-emacs-lisp-mode))

(provide 'poly-elisp-comeega)
;;; poly-elisp-comeega.el ends here
