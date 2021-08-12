;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]   Description :: Name Spaces, Groupings *Info and Xrefs*  <<Xref-Here->>  [[elisp:(org-cycle)][| ]]
**  
**  [[elisp:(blee:bnsm:panel-goto "/bisos/panels/blee/model/bleeOrgPanel")][@ *bleeOrgPanel* @]]         --- blee-org-panel high-level design
**  [[elisp:(blee:bnsm:panel-goto "/bisos/panels/blee/model/bleeDblocks")][@ *bleeDblocks* @]]          --- blee-panel dblock design
** 
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message [[elisp:(org-cycle)][| ]]
")

(message "ByStar Library LOADING")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")

;;(require 'load-dir)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: (bx:dblock:all-defaults-set) [[elisp:(org-cycle)][| ]]
")


;;
;;  TOP LEVEL Entry Point: (bx:dblock:all-defaults-set)
;;
;; bx:dblock 

;;;------------------------------------------------
;;;  Dblock 
;;;------------------------------------------------

;; (bx:dblock:all-defaults-set)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bx:panel:dblock:all-defaults-set) [[elisp:(org-cycle)][| ]]
")

(defun bx:panel:dblock:all-defaults-set ()
  "NOTYET, duplicated just for now."
  (interactive)

  ;; (org-dblock-mode-comment-mode-hook-bx)
  ;; ;;;(load-file "~/lisp/dblock/dblock-elisp-misc.el")
  ;; (require 'dblock-lcnt-latex-front)
  ;; (require 'dblock-lcnt-latex-body)
  ;; (require 'dblock-lcnt-latex)
  ;; (require 'dblock-lcnt-latex-pres)
  ;; (require 'dblock-lcnt-latex-panel)
  ;; (require 'dblock-lcnt-pres-panel)    
  ;; (require 'dblock-lcnt-bash)
  ;; (require 'dblock-iim-bash)
  ;; (require 'dblock-iim-python)
  ;; (require 'iim-python)    
  ;; (require 'dblock-ploneProc-bash)
  ;; (require 'dblock-org-general)
  ;; (require 'dblock-org-bnsm)
  ;; (require 'dblock-global)
  ;; (require 'dblock-global-run-results)
  ;; (require 'dblock-emacs-lisp)
  ;; (require 'dblock-org-iims)
  ;; (require 'dblock-iims-panel) 
  (message "bx:dblock:defaults-set -- Done." )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Segment        :: defvar-local Definitions [[elisp:(org-cycle)][| ]]
")


(defvar-local ~selectedSubject "noSubject"
  "Used In Blee Panel Buffers. Specifies the Selected Subject.
To be renamed to ~bx:panel:cmnd:selectedSubject
various facilities provide for setting ~bx:panel:cmnd:selectedSubject.
Various facilities provide for use of ~bx:panel:cmnd:selectedSubject.
Valid values: any string."
  )

(defvar-local ~primaryMajorMode 'org-mode
  "Used In Blee Panel Buffers. Native mode of this buffer.
The primary mode for COMEEGA files.
Valid values: any major-mode."
  )

(defvar-local ~blee:panelUpdater nil
  "Used In Blee Panel Buffers. Should dblocks of this panel be updated upon entry.
To be renamed as ~bx:panel:updateOnEntry?
Valid values: nil|t"
  )

(defvar-local ~blee:dblockEnabler nil
  "Used In Blee Panel Buffers. Should dblocks of this panel be updated upon entry?
To be renamed as ~bx:panel:dblock:lockOverWrite?
Valid values: nil|t"
  )

(defvar-local ~blee:dblockController "interactive"
  "Used In Blee Panel Buffers. How should the dblock be updated.
To be renamed as ~bx:panel:dblock:updateController
Valid values: interactive | blank | update
When interactive, dblock is updated normally but warnings are issued when locked.
When blank: Unless locked, the dblock becomes blank.
When update, dblock is updated normally but logs are issued when locked."
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")


(provide 'blee-org-panel)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
