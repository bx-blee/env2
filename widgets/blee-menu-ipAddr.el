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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "menu-sel-ip"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message menu-sel-ip [[elisp:(org-cycle)][| ]]
")

(message "menu-sel-ip")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'f)


(defvar blv:selectedIpAddr  ""
  "")
(make-variable-buffer-local 'blv:selectedIpAddr)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: blee:menu-sel-ip:all-defaults-set [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel-ip:init) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel-ip:init()
  ""
  (interactive)
  
  ;;(blee:visitFilesMenuDef)  ;; Should not be initialized before (set-buffer "*LSIP* localhost")
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:ip:define) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:ip:define ()
  ""
  (interactive)
  (let ((objAndComments '(
			  ("198.62.92.15" "Bx Router")
			  ("8.8.8.8"      "Google Well Known Addr")
			  )))
    (easy-menu-define
      blee:menu-sel:ip:name
      nil
      "" 
      (append
       '("IP Addr Selection Menu -- blv:selectedIpAddr"
	 ["Edit IP Addr Selection List" (find-file "~/lisp/menu/sel-ip.el") t]
	 "---"
	 )
       (mapcar (lambda (x)
		 (vector (format "%s \t\t  %s" (car x) (car (cdr x)))
			 `(lambda ()
			    (interactive)
			    (let ((obj))
			      (setq obj  (car ',x))
			      (setq blv:selectedIpAddr obj)
			      )
			      t)
			      ))
	       objAndComments
	       )))))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:ip:popupMenu) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:ip:popupMenu ()
  ""
  (blee:menu-sel:ip:define)
  (popup-menu blee:menu-sel:ip:name)
  )


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:menu-sel:ip:popupMenu)][Popup Select IP-Addr Menu]]  | 
")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "menu-sel-ip"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-menu-ipAddr)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
