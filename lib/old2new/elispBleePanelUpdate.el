;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : seedElisp.sh,v 1.6 2013-12-03 22:47:34 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun main ()
""
    ;; NOTYET, if no outFile, then ioOverwriteSetup
    ;; if outFile, then ioFilterSetup
 (ioOverwriteSetup)
 ;;(ioFilterSetup)
 (bufferWork)
 (save-buffer)
 (save-buffers-kill-emacs)
)

;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : seedElisp.sh,v 1.6 2013-12-03 22:47:34 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(setq debug-on-error t)

(defun ioFilterSetup ()
""
 (interactive)
 (let (start end)

   (find-file outFile)
   (insert-file-contents inFile)
   )
 )

(defun ioOverwriteSetup ()
""
 (interactive)
 (let (start end)

   (find-file inFile)
   )
 )

;;; -*- Mode: Emacs-Lisp; -*-
;;;  RCS: : seedElisp.sh,v 1.6 2013-12-03 22:47:34 lsipusr Exp $
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;(setq debug-on-error t)
;;;

(defun bufferWork ()
""
 (interactive)
 (blee-foldToPipe)
 ;;(latex-cite-convert)
 )

(defun blee-foldToPipe ()
  (interactive)
  (goto-char (point-min))
  (show-all)   ;; in org-mode in case it is in overview mode
  (while (not (eobp))
    (blee-foldToPipeLine)
    (forward-line)
    )

  ;;(pipeToPlusMinus)
  ;;(plusMinusToPipe)

  (goto-char (point-min))
  )

(defun blee-foldToPipeLine ()
  (interactive)
  (let (start-point end-point end-of-this-line)
    (org-end-of-line)
    (setq end-of-this-line (point))

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\* " end-of-this-line t)
      (message "First Level ==")
      (if (re-search-forward ".*Fold." end-of-this-line t)
	  (progn
	    (message "First Level Fold==")
	    (if (re-search-forward ".*======" end-of-this-line t)
		(progn
		;;;(setq end-point (match-beginning 0))
		  (setq end-point (point))
		  (delete-region start-point end-point)
		;;;(insert "*  [[elisp:(org-cycle)][| ]]  Subject       ::")
		  (insert "*  [[elisp:(org-cycle)][| ]]  [BACS]        ::")
		  (org-end-of-line)
		  (insert " [[elisp:(org-cycle)][| ]]")
		  )
	      (message "First Level Missed =======")
	      )
	    )
	)
      )

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\* " end-of-this-line t)
      (message "First Level ##")
      (if (re-search-forward ".*  ################    " end-of-this-line t)
	  (progn
		;;;(setq end-point (match-beginning 0))
	    (setq end-point (point))
	    (delete-region start-point end-point)
		;;;(insert "*  [[elisp:(org-cycle)][| ]]  Subject       ::")
	    (insert "*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]")
	    (org-end-of-line)
	    )
	)
      )

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\* " end-of-this-line t)
      (message "First Level ##")
      (if (re-search-forward ".*  ################" end-of-this-line t)
	  (progn
		;;;(setq end-point (match-beginning 0))
	    (setq end-point (point))
	    (delete-region start-point end-point)
		;;;(insert "*  [[elisp:(org-cycle)][| ]]  Subject       ::")
	    (insert "*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]")
	    (org-end-of-line)
	    )
	)
      )
    
    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\*\\* " end-of-this-line t)
      (message "Second Level")
      (if (re-search-forward ".*Fold." end-of-this-line t)
	  (if (re-search-forward "====" end-of-this-line t)
	      (progn
		;;;(setq end-point (match-beginning 0))
		(setq end-point (point))
		(delete-region start-point end-point)
		(insert "**  [[elisp:(org-cycle)][| ]]  Subject      ::")
		(org-end-of-line)
		(insert " [[elisp:(org-cycle)][| ]]")
		)
	    )
	)
      )

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\*\\*\\* " end-of-this-line t)
      (message "Third Level")
      (if (re-search-forward ".*Fold." end-of-this-line t)
	  (if (re-search-forward "==" end-of-this-line t)
	      (progn
		;;;(setq end-point (match-beginning 0))
		(setq end-point (point))
		(delete-region start-point end-point)
		(insert "***  [[elisp:(org-cycle)][| ]]  Subject     ::")
		(org-end-of-line)
		(insert " [[elisp:(org-cycle)][| ]]")
		)
	    )
	)
      )

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\*\\*\\*\\* " end-of-this-line t)
      (message "Fourth Level")
      (if (re-search-forward ".*Fold." end-of-this-line t)
	  (if (re-search-forward "=" end-of-this-line t)
	      (progn
		;;;(setq end-point (match-beginning 0))
		(setq end-point (point))
		(delete-region start-point end-point)
		(insert "****  [[elisp:(org-cycle)][| ]]  Subject    ::")
		(org-end-of-line)
		(insert " [[elisp:(org-cycle)][| ]]")
		)
	    )
	)
      )

    (org-beginning-of-line)
    (setq start-point (point))
    (when (re-search-forward "^\\*\\*\\*\\*\\* " end-of-this-line t)
      (message "Fifth Level")
      )

    ;;(message "Not Not")
    )
  )


(defun plusMinusToPipe ()
""
 (interactive)
 (goto-char (point-min))
 (show-all)   ;; in org-mode in case it is in overview mode
 (replace-string 
  "[[elisp:(org-cycle)][+-]]" 
  "[[elisp:(org-cycle)][| ]]"
  nil
  nil
  nil
  )
 )


(defun pipeToPlusMinus ()
""
 (interactive)
 (goto-char (point-min))

 (replace-string 
  "[[elisp:(org-cycle)][| ]]" 
  "[[elisp:(org-cycle)][+-]]"
  nil
  nil
  nil
  )
 )

(define-key global-map [(f7) (y)] 'blee-foldToPipeLine)
(define-key global-map [(f7) (z)] 'blee-foldToPipe)


