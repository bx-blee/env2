;;;
;;;

;;; 
;;; Different Types of Menus 
;;;

(require 'bx-lib)

(setq blee:ppmm:mode-stack (list nil))

;;
(defun blee:ppmm:init ()
  "initialize the stack"
  (interactive)
  (setq blee:ppmm:mode-stack (list nil))
  )

(defun blee:ppmm:org-mode-toggle ()
  "If org-mode, pop and switch to that.
If Other than org-mode, push, switch-to-org
"
  (interactive)
  (if (string-equal "org-mode" major-mode)
      (progn
	(blee:ppmm:mode-pop)
	(move-beginning-of-line 1)
	)
    (progn
      (blee:ppmm:mode-push major-mode)
      (org-mode)
      (move-beginning-of-line 1)      
      )
    )
  )	  

(defun blee:ppmm:org-mode-content-list-24fProblem ()
  "If org-mode, pop switch to that.
If Other than org-mode, push, switch-to-org
"
  (interactive)
  (let (
	(major-mode-str (message "%s" major-mode))
	)
    (setq bidi-paragraph-direction 'left-to-right)
    (if (string-equal "org-mode" major-mode)
	(progn
	  (org-shifttab)
	  (move-beginning-of-line 1)	
	  )
      (progn
	(blee:ppmm:mode-push major-mode)
	(org-mode)
	(blee:ppmm:org-mode-content-list)
	(recenter-top-bottom)
	(move-beginning-of-line 1)	      
	)
      )
    )
  )	  


(defun blee:ppmm:org-mode-content-list ()
  "If org-mode, pop switch to that.
If Other than org-mode, push, switch-to-org
"
  (interactive)
  (setq bidi-paragraph-direction 'left-to-right)
  (if (string-equal "org-mode" major-mode)
      (progn
	(goto-char (point-min))
	(if 
	    (search-forward 
	     "CONTENTS-LIST" 
	     nil 
	     'NO-ERROR) ;; t
	    (progn
	      (beginning-of-line 1)
	      (org-shifttab)
	      )
	  (progn
	    (goto-char (point-min))
	    )
	  )
	)
    (progn
      (blee:ppmm:mode-push major-mode)
      (org-mode)
      (blee:ppmm:org-mode-content-list)
      (recenter-top-bottom)
      )
    )
  )	  


;;;  (setq blee:ppmm:mode-stack (list nil))
;;;  (blee:ppmm:mode-push 'emacs-lisp-mode)
(defun blee:ppmm:mode-push (mode)
  "Given mode,  push mode on stack"
  (interactive)
  (push mode (car blee:ppmm:mode-stack))
  )

;;; (blee:ppmm:mode-pop)
(defun blee:ppmm:mode-pop ()
  "pop path on stack, visit menu-file
If the file is opened not in its natural major mode, but org-mode instead,
the pop will fail, in which case we'll do normal-mode to recover.
"
  (interactive)
  (let (
	($poped (pop (car blee:ppmm:mode-stack)))
	)
    (when $poped
	(call-interactively $poped)
	)
    (when (not $poped)
      (message "Alert:: No mode to pop")
      (normal-mode)
      )
    )
  )

(defun blee:ppmm:mode-stack-get ()
  "pop path on stack, visit menu-file
If the file is opened not in its natural major mode, but org-mode instead,
the pop will fail, in which case we'll do normal-mode to recover.
"
  blee:ppmm:mode-stack
  )

;;(provide 'blee-ppmm)
(provide 'push-pop-major-modes)


