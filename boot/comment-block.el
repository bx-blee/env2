;;; comment-block.el -- Elisp Block Comments. -*- Mode: Emacs-Lisp; lexical-binding: t; -*-
;;
;; Copyright (C) 2021-2022 Mohsen BANAN - http://mohsen.1.banan.byname.net/contact
;;
;; Author: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Maintainer: Mohsen BANAN <emacs@mohsen.1.banan.byname.net>
;; Created: February 03, 2022
;; Keywords: languages lisp
;; Homepage: https://github.com/bx-blee/comment-block
;; Package-Requires: ((emacs "24.3"))
;; Package-Requires: 0.1
;;
;; This file is not part of GNU Emacs.
;; This file is part of Blee (ByStar Libre-Halaal Emacs Environment).
;;
;; This is Libre-Halaal Software intended to perpetually remain Libre-Halaal.
;; See http://mohsen.1.banan.byname.net/PLPC/120033 for details.
;; _Copyleft_: GNU AFFERO GENERAL PUBLIC LICENSE --- [[file:../LICENSE]]
;;
;;; Commentary:
;;
;;  This is a very simple way of allowing for string based multi-line comments
;;  in elisp.
;;
;;  Emacs Lisp doesn't have multiline comments.
;;
;;  Emacs lisp has multiline string literals, but they're delimited simply by
;;  "...", so you can't use them to make a block of code inert if that block
;;  contains ordinary string literals. Given that limitation, if you were to
;;  include a comment as a string in your code, It would be good if could make
;;  it clear that we are looking at a comment, not a string. This is what we do
;;  here: (cmnt-begin "Some Comment" cmnt-end).
;;
;;  With polymode, we now can include org-mdoe text inside of our elisp code.
;;  This is the inverse of literate programming. We call it:
;;  COMEEGA (Collaborative Org-Mode Enhanced Emacs Generalized Authorship).
;;  To accommodate COMEEGA, we also provide  orgCmntBegin/orgCmntEnd.
;;  These trigger org-mode regions in your polymode elisp code.
;;  See the comeega package for details.
;;
;;  All of this is just a temporary band-aid solution that needs to be properly
;;  addressed in elisp.
;;
;;  - Scheme has #| some comment |#  --- Which is great!
;;  - Common Lisp has by each character macro read model, on top of which we can do
;;    the equivalent of here-documents --- Which is great!
;;
;;  But AFAIK, there is no clean solution for block comments in elisp.
;;  Anybody listening? Or am I missing something?
;;  My wish list includes: addition of macro character read model to elisp.
;;
;;  So, in the meantime, we can have this.
;;
;;  Imagine this: We could standardize on the "Commentary:" and all of the above
;;  being in sub org-mode with all kinds of links to other modules in
;;  poly-emacs-lisp-mode. And all of our doc-strings could be in rich org-mode.
;;  See comeega examples for details.
;;
;;; Code:


(defvar cmnt-end nil "Elisp Comment End.")

(defun cmnt-begin (comment commentEnd))

(cmnt-begin "
This is an example of multi-line comment (but not in org-mode).
Example usage is:
(elCmntBegin \"multi-line comment comes here.\" elCmntEnd)

I wish elisp had a here-document facility. Like common-lisp.
Anybody listening?
" cmnt-end)

(defvar orgCmntEnd nil "Elisp Org Comment End.")

(defun orgCmntBegin (comment commentEnd))

(orgCmntBegin "
*  This is an example of multi-line comment in *org-mode* format.
** Here is an example of a link [[http://www.by-star.net]]

* orgCmntBegin/End is used in _COMEEGA_
(Collaborative Org-Mode Enhanced Emacs Generalized Authorship)

Which in turn allows us to switch between
comeega:poly-emacs-lisp-mode or emacs-lisp-mode and org-mode. So,
if you are reading this in comeega:poly-emacs-lisp-mode, right
here you would be org-mode not emacs-lisp-mode.

It is '(orgCmntBegin' and 'orgCmntEnd)' that trigger org-mode in
comeega:poly-emacs-lisp-mode.
" orgCmntEnd)


(provide 'comment-block)
;;; comment-block.el ends here
