;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (boot-setup:),  [[elisp:(org-cycle)][| ]]
* 
")

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
")
;;;#+END:



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
* Emacs and Blee type defvars
")

(defvar *emacs-type* "fsf"
  "Historic -- but kept for future resurrections -- used to distinguish lucid emacs etc")

(defvar blee:emacs:type "fsf"
  "We are assuming that other than fsf emacs types could exist -- used to distinguish lucid emacs etc")


(defvar *eoe-emacs-type* (intern (format "%df" emacs-major-version))
  "Historic -- A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")

(defvar blee:emacs:id (intern (format "%df" emacs-major-version))
  "A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-emacs"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-emacs)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; major-mode: emacs-lisp-mode
;;; end:



