;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Top-Level Booting Of Blee [[elisp:(org-cycle)][| ]]
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


;;; -----------------------------------------------------------------
;;; BLEE  -- ByStar Libre-Halaal Emacs Environment
;;; -----------------------------------------------------------------

(setq debug-on-error t) 

;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(defvar blee:gc-cons-threshold--orig gc-cons-threshold)
(setq gc-cons-threshold (* 100 1024 1024)) ;100 MB before garbage collection



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Load boot-setup.el [[elisp:(org-cycle)][| ]]
")

;;; (blee:env:here-directory)
(defun blee:env:here-directory ()
  "Eg /bisos/blee/env/boot"
  (file-name-directory
   (directory-file-name
     (if buffer-file-name
	 buffer-file-name
       load-file-name)
     ))
  )


(load-file  (expand-file-name (concat (blee:env:here-directory)
				      "blee-version.el")))

(load-file  (expand-file-name (concat (blee:env:here-directory)
				      "blee-bases.el")))

(load-file  (expand-file-name (concat (blee:env:here-directory)
				      "blee-elpa-packages.el")))

;; (load-file  (expand-file-name (concat (blee:env:here-directory)
;; 				      "compile-time-function-name.el")))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Boot Components Of Blee [[elisp:(org-cycle)][| ]]
")

;;;
;;; NOTYET, This does not belong here
;;;
(message "Emacs version: %s %d.%d  -- Blee-Emacs Type: %s"
	 *emacs-type* emacs-major-version emacs-minor-version *eoe-emacs-type*)

(defvar blee:boot:common
  (expand-file-name (concat (blee:env:here-directory) "boot-common.el"))
  "Common part of Blee boot.")

(defvar blee:boot:typed
  (expand-file-name (concat (blee:env:here-directory) (format "/boot-%s.el" *eoe-emacs-type*)))
  "Emacs-version and type specific part of Blee boot.")

(defvar blee:boot:devel
  (expand-file-name (concat (blee:env:here-directory) "/boot-devel.el"))  
  "Development and extras experimentation part of Blee boot.")

(lambda () " org-mode
* file:/libre/ByStar/InitialTemplates/activeDocs/blee/bleeActivities/fullUsagePanel-en.org::BleeBootProcess
")

(when (file-exists-p blee:boot:common)
  (load blee:boot:common)
  (boot:common|main-init)
  )


(when (file-exists-p blee:boot:typed) (load blee:boot:typed))
;;(when (file-exists-p blee:boot:devel) (load blee:boot:devel))

(when blee:gc-cons-threshold--orig
  (run-with-idle-timer 5 nil (lambda () (setq gc-cons-threshold blee:gc-cons-threshold--orig))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
