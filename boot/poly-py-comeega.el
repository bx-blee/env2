;;; poly-py-comeega.el --- Blee Native Package: poly-py-comeega  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'polymode)

(define-hostmode poly-python-hostmode
  :mode 'python-mode
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

(define-polymode poly-python-mode
  :hostmode 'poly-python-hostmode
  :innermodes '(poly-org-comeega-innermode))

(add-to-list 'auto-mode-alist '("\\.py\\'" . poly-python-mode))

(provide 'poly-py-comeega)
;;; poly-py-comeega.el ends here
