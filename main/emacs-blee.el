;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "fv-lib")  (replace-string "moduleTag:" "fv:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (moduleTag:), for handelling File_Var [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* /->/ [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][(dblock-func]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]
* /<-/ [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dblock-func)]]  E|
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

;;; -----------------------------------------------------------------
;;; emacs version determination and site-specific EOE load-path setup
;;; -----------------------------------------------------------------


(defun blee:env:base-obtain-based-on-here ()
  "Eg /bisos/blee/env/"
  (file-name-directory
   (directory-file-name
    (file-name-directory
     (if buffer-file-name
	 buffer-file-name
       load-file-name)
     )))
  )

(defvar blee:env:base (blee:env:base-obtain-based-on-here)
  "Base Directory of Blee")

;; (blee:env:base-obtain)
(defun blee:env:base-obtain ()
  "Eg /bisos/blee/env/ -- This function will be invoked frequently, so it uses the obtained variable"
  blee:env:base
  )

(defvar *emacs-type* "fsf"
  "Historic but kept for future resurrections -- used to distinguish lucid emacs etc")

(defvar *eoe-emacs-type* (intern (format "%df" emacs-major-version))
  "major-version+f for fsf-emacs")

(message "Emacs version: %s %d.%d  -- Blee-Emacs Type: %s"
	 *emacs-type* emacs-major-version emacs-minor-version *eoe-emacs-type*)

(defvar blee:boot:common (format "%smain/boot-common.el" (blee:env:base-obtain))
  "Common part of Blee boot.")

(defvar blee:boot:typed (format  "%smain/boot-%s.el" (blee:env:base-obtain) *eoe-emacs-type*)
  "Emacs-version and type specific part of Blee boot.")

(defvar blee:boot:devel (format  "%smain/boot-devel.el" (blee:env:base-obtain))
  "Development and extras experimentation part of Blee boot.")

(lambda () " org-mode
* [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   Blee Boot order: 
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   [[file:~/.emacs]]                                  # Loads blee-emacs.el in the right env
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-blee.el         # Loads everything below in that order
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-setup.el        # Sets up base variables
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-pre-common.el   # Loads common pre (early) packages
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-versioned.el    # Loads version specific packages
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-post-common.el  # Loads common post (late) packages
** [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   file:/bisos/blee/env/main/boot-devel.el        # Loads development (experimental) pkgs
")

(when (file-exists-p blee:boot:common) (load blee:boot:common))
(when (file-exists-p blee:boot:typed) (load blee:boot:typed))
(when (file-exists-p blee:boot:devel) (load blee:boot:devel))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
