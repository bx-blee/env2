;;; -*- Mode: Emacs-Lisp; -*-
;;; SCCS: @(#)sexp-ext.el	1.2 3/17/92
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Module Description:
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;

(setq sexp-begin-pattern "%@@")

(defun sexp-do-buffer ()
  "Go Through the whole buffer"
  (interactive)
  (let* ((sexp))
    (goto-char (point-min))
    (while (re-search-forward sexp-begin-pattern nil t)
      ;;(backward-char 1)
      (let ((sexp-start (point))
            (sexp-begin-loc (match-beginning 0))
	    )
	(forward-sexp)
        (setq sexp (buffer-substring sexp-start (point)))
	;;;(message "sexp is:  %s" sexp)
	(kill-region sexp-begin-loc (point))
	(sexp-perform sexp) 
        )
      )
    )
  )

(defun sexp-perform (sexp)
  "Process a SEXP"
  (let ((result (condition-case nil
                    (eval-expression (car (read-from-string sexp)))

                  (error
                   (beep)
                   (message "Bad sexp at line %d: %s"
                            (save-excursion
                              (save-restriction
                                (narrow-to-region 1 (point))
                                (goto-char (point-min))
                                (let ((lines 1))
                                  (while (re-search-forward "\n\\|\^M" nil t)
                                    (setq lines (1+ lines)))
                                  lines)))
                            sexp)
                   (sleep-for 2)))))
    (if (stringp result)
        result
      )))





