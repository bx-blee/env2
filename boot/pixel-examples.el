;;;
;;; [2021-02-19 Fri]
;;; These are good examples of display time pixcel positioning.
;;; To be absrobed in panel dblocks left side aligning.
;;;


(defun ex1 ()
  (interactive)
  (let (width-1 width-2 (start (point)))
    (insert (propertize "| loooooong |\n| world |"
			'line-prefix "     "))
    (goto-char start)
    (search-forward "|")
    (let ((start (point)))
      (search-forward "|")
      (setq width-1 (car (window-text-pixel-size
                          nil (1+ start) (- (point) 2)))))
    (search-forward "|")
    (let ((start (point)))
      (search-forward "|")
      (setq width-2 (car (window-text-pixel-size
                          nil (1+ start) (- (point) 2)))))
    (let ((col-width (+ 2 (max width-1 width-2)))
          cell-start)
      (goto-char start)
      (search-forward "|")
      (setq cell-start (car (window-text-pixel-size
                             nil (line-beginning-position) (point))))
      (search-forward "|")
      (put-text-property (- (point) 2) (1- (point))
			 'display
			 `(space :align-to (,(+ cell-start col-width))))
      (search-forward "|")
      (setq cell-start (car (window-text-pixel-size
                             nil (line-beginning-position) (point))))
      (search-forward "|")
      (put-text-property (- (point) 2) (1- (point))
			 'display
			 `(space :align-to (,(+ cell-start col-width))))))
)


(defun ex2 ()
  (interactive)

(let ((width))
  (insert "*woome*")
  (setq width (car (window-text-pixel-size
                    nil (line-beginning-position) (point))))
  (put-text-property (line-beginning-position) (point)
                     'line-prefix "   ")
  (message "true width: %d returned width: %d"
           width (car (window-text-pixel-size
                       nil (line-beginning-position) (point))))))
