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
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee:checklist:begin"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message blee:checklist:begin [[elisp:(org-cycle)][| ]]
")

(message "blee:checklist:begin")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'cl)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Defenitions    :: Definitions [[elisp:(org-cycle)][| ]]
")



(defvar blee:checklist:begin:buffer-name "*blee:checklist:begin*"
  "*Name of the buffer")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:begin:offer) [[elisp:(org-cycle)][| ]]
")

;;
;;(blee:checklist:begin:offer)
;;
(defun blee:checklist:begin:offer ()
  ""
  (interactive)
  (switch-to-buffer blee:checklist:begin:buffer-name)
  (blee:widget:mode)
  (let* ((inhibit-read-only t))
    (erase-buffer)
    (remove-overlays)
    ;;
    (widget-insert "\n\n")
    (widget-insert "[[elisp:(kill-buffer)][Quit]] || [[elisp:(blee:checklist:begin:-show-source)][Show Source]] ")
    (widget-insert "\n\n")
    (blee:checklist:begin:checklist)
    (widget-setup)
    (use-local-map blee:widget:mode-map)
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:begin:checklist) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:begin:checklist ()
  (widget-insert "\
            *Org Mode*  /Highlighting/ Works Well.
")  
  ;; radio button
  (widget-insert "\nRadio button is used for select one from a list.\n")
  (widget-create 'radio-button-choice
                 :value "One"
                 :notify (lambda (wid &rest ignore)
                           (message "You select %S %s"
                                    (widget-type wid)
                                    (widget-value wid)))
                 '(item "One")
                 '(item "Two")
                 '(item "Three"))
  (widget-insert "\n")
  ;; checklist
  (widget-insert "Checklist is used for multiple choices from a list.\n")
  (widget-create 'checklist
                 :notify (lambda (wid &rest ignore)
                           (message "The value is %S" (widget-value wid)))
                 '(item "one")
                 '(item "two")
                 '(item "three")))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:begin:-show-source) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:begin:-show-source ()
  (interactive)
  (with-selected-window
      (display-buffer
       (find-file-noselect (find-library-name "blee-checkbox")))
    (imenu (symbol-name ('blee:checklist:begin:-show-source)))
    (recenter 1)))



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee:checklist:begin"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee:checklist:begin)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
