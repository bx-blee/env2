;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-

;;; bgx: Blee General eXtenstion
;;; Suffix bgx:dblock:    dblock extensions


(defun bgx:org-dblock:named/forward (<nameOfDblock)
  "Go forward to <nameOfDblock."
  (interactive "sName Of Dblock: ")  
  (let* (
	 ($point)
	 )
    (setq $point (search-forward <nameOfDblock nil t))
    (when $point
      (org-beginning-of-dblock)
      )
    $point
    ))


(defun bgx:org-dblock:named/eliminateForward (<nameOfDblock)
  "Go forward to <nameOfDblock."
  (interactive "sName Of Dblock: ")
  (let* (
	 ($point)
	 )
    (setq $point (bgx:org-dblock:named/forward <nameOfDblock))
    (when $point
      (org-dblock-bx-blank-this)
      (kill-line 2)
      )))

(defun bgx:org-dblock:named/updateAll (<nameOfDblock)
  "Update all dblocks named <nameOfDblock."
  (interactive)
  (goto-char (point-min))
  (save-excursion
    (while (search-forward name-of-dblock nil t)
      (save-excursion
	(org-dblock-update)
	)
      )))

(defun bgx:org-dblock:named/updateForward (<nameOfDblock)
  "Update forward dblock named <nameOfDblock."
  (interactive)
  (bgx:org-dblock:named|forward <nameOfDblock)
  (org-dblock-update)
  )

(provide 'bgx-org-dblock)
