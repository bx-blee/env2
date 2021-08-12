;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")

(message "Bystar User Env Finished Loading")



(funcall  '(lambda () "
**     *MaGit*
"
	     ;;(require 'setup-global-magit)
	     (require 'magit)	     
	     ))


;;;#+BEGINNOT: blee:pkg:adopt :eanble :org-level 2 pkgName
;; (funcall  '(lambda () "
;; **  [[elisp:(org-cycle)][| ]]  Adopted Component   ::      *Dired* [[elisp:(org-cycle)][| ]]
	
;; "
;; 	     (require 'bac-dired)
;; 	     ))
;;;#+END:


(setq debug-on-error nil)
;;(setq debug-on-error t)

;;;
;;; This is being reloaded -- Don't understand why but it is necessary.
;;;
(load "bystar-calendar-lib")

(message "Bystar User Env Finished Loading")


(lambda () "
#+STARTUP: showall
"
)


;;; local variables:
;;; major-mode: emacs-lisp-mode
;;; folded-file: nil
;;; byte-compile-dynamic: t
;;; end:



