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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "menu-sel-domain"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message menu-sel-domain [[elisp:(org-cycle)][| ]]
")

(message "menu-sel-domain")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'f)


(defvar blv:selectedDomain  ""
  "")
(make-variable-buffer-local 'blv:selectedDomain)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: blee:menu-sel-domain:all-defaults-set [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel-domain:init) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel-domain:init()
  ""
  (interactive)
  
  ;;(blee:visitFilesMenuDef)  ;; Should not be initialized before (set-buffer "*LSIP* localhost")
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:domain:define) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:domain:define ()
  ""
  (interactive)
  (let ((objAndComments '(
			  ("www.neda.com" "Bx Router")
			  ("www.google.com"      "Google Well Known Addr")
			  )))
    (easy-menu-define
      blee:menu-sel:domain:name
      nil
      "" 
      (append
       '("Domain Selection Menu -- blv:selectedDomain"
	 ["Edit Domain Selection List" (find-file "~/lisp/menu/sel-domain.el") t]
	 "---"
	 )
       (mapcar (lambda (x)
		 (vector (format "%s \t\t  %s" (car x) (car (cdr x)))
			 `(lambda ()
			    (interactive)
			    (let ((obj))
			      (setq obj  (car ',x))
			      (setq blv:selectedDomain obj)
			      )
			      t)
			      ))
	       objAndComments
	       )))))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:domain:popupMenu) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:domain:popupMenu ()
  ""
  (blee:menu-sel:domain:define)
  (popup-menu blee:menu-sel:domain:name)
  )


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:menu-sel:domain:popupMenu)][Popup Select Domain Menu]]  | 
")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "menu-sel-domain"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-menu-domain)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
