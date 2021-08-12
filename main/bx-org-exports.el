;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; (replace-string "moduleName" "bx-org-exports")

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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "bx-org-exports"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message bx-org-exports [[elisp:(org-cycle)][| ]]
")

(message "bx-org-exports")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (moduleHook) [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun bx:org:portNu-fixup ()
  "Convert All sections to their dblocks" 
  (interactive)
  (goto-char (point-min))  
  (replace-regexp "\\(\\[\\[TCP Port \\)\\(.*\\)\\(]]\\)" "[[TCP Port \\2][TCP Port \\2]]" nil (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)) nil)
  (goto-char (point-min))  
  (replace-regexp "\\(\\[\\[UDP Port \\)\\(.*\\)\\(]]\\)" "[[UDP Port \\2][UDP Port \\2]]" nil (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)) nil)
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "bx-org-exports"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide bx-org-exports [[elisp:(org-cycle)][| ]]
")

(provide 'bx-org-exports)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
