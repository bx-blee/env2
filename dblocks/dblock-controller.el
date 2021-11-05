;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)


;;;
;;;  OBSOLETED -- Being Replaced By dblock-governor.el
;;;

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
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")

(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- IIM Bash Dblock Processors --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "Module Name"
(lambda () "*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message Module Name [[elisp:(org-cycle)][| ]]
")

(message "NOTYET, module name needs to be auto-generated")
;;;#+END:

;;;#+BEGIN: bx:dblock:lisp:requires :disabledP "false"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires       :: Requires [[elisp:(org-cycle)][| ]]
")
;;;#+END:


(require 'bx-lcnt-lib)


(defun bx:dblock:controller:enforce (@control &rest @args)
  "Based on @control perhpas run @paramsDescFunc, return a variant of @control as $control

NOTYET, Support for fVar  needs to be added, support for more funcs, args should become named args.
"
  (let (
        (@paramsDescFunc (or (plist-get @args :paramsDescFunc) nil))
        ;;
        ($control nil)
        )
    
    (when (and
           (not (equal @control "hide"))
           (not (equal @control "release"))
           )
      (when @paramsDescFunc
        (funcall @paramsDescFunc)
        )
      )

    (setq $control @control)    
    (when (equal @control "hide")
      (setq $control "disabled")
      )
    (when (equal @control "release")
      (setq $control "enabled")
      )
    
    $control
    )
  )


(defun bx:dblock:controller:options ()
  "Returns A string that include possible control values."
  ":control \"enabled|disabled|hide|release|fVar\""
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iim-bash"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-controller)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


