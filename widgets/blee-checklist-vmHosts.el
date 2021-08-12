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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee:checklist:vmHosts"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message blee:checklist:vmHosts [[elisp:(org-cycle)][| ]]
")

(message "blee:checklist:vmHosts")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'cl)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Defenitions   :: Definitions [[elisp:(org-cycle)][| ]]
")



(defvar blee:checklist:vmHosts:buffer-name "*blee:checklist:vmHosts*"
  "*Name of the buffer")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")


;;
;;(blee:checklist:vmHosts:offer)
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:vmHosts:offer) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:vmHosts:offer (buf var)
  ""
  (interactive)
  (switch-to-buffer blee:checklist:vmHosts:buffer-name)
  (blee:widget:mode)
  (let* ((inhibit-read-only t))
    (erase-buffer)
    (remove-overlays)
    ;;
    (widget-insert "\n\n")
    (widget-insert "[[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]]")
    (widget-insert "\n\n")
    (blee:checklist:vmHosts:checklist buf var)
    (widget-setup)
    (use-local-map blee:widget:mode-map)
    )
  )


(buffer-name)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:vmHosts:checklist) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:vmHosts:checklist (buf var)
  ""
    (widget-insert "\
               *VM Hosts CheckList Selection*  /List Of KVM IpAddrs or Names/
")  
    (widget-insert "[[elisp:(blee:checklist:vmHosts:visit-source)][Visit Source]]")  
    (widget-insert "\n")
    ;; checklist
    (widget-insert "\n\n")
    (setq blee:widget:result nil)
    (widget-create 'checklist
		   :notify (lambda (wid &rest ignore)
			     (message "The value is %S" (widget-value wid))
			     (setq blee:widget:result (widget-value wid))
			     )
		   '(item "198.62.92.184 -- bac0034")
		   '(item "localhost")		   
		   )
    (widget-insert "\n\n")
    (widget-insert (format "[[elisp:(blee:widget:done \"%s\" '%s)][Done]]" buf var))
    )

(defun blee:widget:done (buf var)
  ""
  (kill-buffer)
  (switch-to-buffer buf)
  (with-temp-buffer
    (insert (format "(setq %s blee:widget:result)" var))
    (eval-buffer))
  ;; Temporary
  (vmHostNameFromCheckListResult  blee:widget:result)
  )


(defun vmHostNameFromCheckListResult (list)
  ""
  (let ((vmHostNames))
    (mapc (lambda (x)
	    (add-to-list 'vmHostNames (car (split-string x))))
	  list)
    (mapconcat 'identity vmHostNames " ")
    ))

  ;;;(setq blv:selectedVmHost (car (split-string (car list))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:ip:define) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:kvmHost:define ()
  ""
  (interactive)
  (let ((objAndComments '(
			  ("198.62.92.184" "bacs0034.by-star.net")
			  ("localhost" "127.0.0.1")			  
			  )))
    (easy-menu-define
      blee:menu-sel:kvmHost:name
      nil
      "" 
      (append
       '("KVM Host Selection Menu -- blv:selectedIpAddr"
	 ["Visit KVM Selection List" (blee:checklist:kvmHost:visit-source) t]
	 "---"
	 )
       (mapcar (lambda (x)
		 (vector (format "%s \t\t  %s" (car x) (car (cdr x)))
			 `(lambda ()
			    (interactive)
			    (let ((obj))
			      (setq obj  (car ',x))
			      (setq blv:selectedKvmHost obj)
			      )
			      t)
			      ))
	       objAndComments
	       )))))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:ip:popupMenu) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-sel:kvmHost:popupMenu ()
  ""
  (blee:menu-sel:kvmHost:define)
  (popup-menu blee:menu-sel:kvmHost:name)
  )

  

;; (blee:checklist:vmHosts:visit-source)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:vmHosts:visit-source) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:vmHosts:visit-source ()
  (interactive)
  (with-selected-window
      (display-buffer
       (find-file-noselect (find-library-name "blee-checklist-vmHosts")))
    (imenu (symbol-name 'blee:checklist:vmHosts:checklist))
    (recenter 1)))

(defun blee:checklist:kvmHost:visit-source ()
  (interactive)
  (with-selected-window
      (display-buffer
       (find-file-noselect (find-library-name "blee-checklist-vmHosts")))
    (imenu (symbol-name 'blee:menu-sel:kvmHost:define))
    (recenter 1)))


;; (blee:checklist:vmHosts:checklistProblemed)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:checklist:vmHosts:checklistProblemed) [[elisp:(org-cycle)][| ]]
")

(defun blee:checklist:vmHosts:checklistProblemed ()
  ""
  (let ((objAndComments '(
			  ("198.62.92.15" "Bx Router")
			  ("8.8.8.8"      "Google Well Known Addr")
			  )))

      ;;;(message (format "%s" (car obj)))

    (widget-insert "\
            *Org Mode*  /Highlighting/ Works Well.
")  
    (widget-insert "\n")
    ;; checklist
    (widget-insert "Checklist is used for multiple choices from a list.\n")
    (dolist (obj objAndComments)
      ;;(widget-create 'checklist
      (widget-create 'checkbox	     
		     :notify (lambda (wid &rest ignore)
			       (message "The value is %S" (widget-value wid)))
		     
      ;(widget-insert (format "  %s\n" (car obj)))
		     `(item ,(format "  %s" (car obj)))
		     )
      
      )
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee:checklist:vmHosts
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-checklist-vmHosts)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
