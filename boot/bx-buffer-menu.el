;;;
;;;

(require 'easymenu)

;;;
;;;
;;;
;;; (bx:buffer:menu:define)
(defun bx:buffer:menu:define ()
  (easy-menu-define
    bx:buffer:menu:definition
    nil
    "Global Buffer Menu"
    '("Buffer Menu"
      "---"
      ["Show Trailing Whitespace" (bx:buffer:show-trailing-whitespace) t]
      ["Don't Show Trailing Whitespace" (bx:buffer:show-trailing-whitespace-not) t]
      ["Delete Trailing Whitespace" (bx:buffer:delete-trailing-whitespace) t]
      "---"
      ))
  )

;; (easy-menu-add-item nil '("Blee") 'bx:buffer:menu:definition "Blee Help")

;;
(defun bx:buffer:show-trailing-whitespace ()
  (interactive)
  (setq show-trailing-whitespace t)
  )

(defun bx:buffer:show-trailing-whitespace-not ()
  (interactive)
  (setq show-trailing-whitespace nil)
  )

(defun bx:buffer:delete-trailing-whitespace ()
  (interactive)
  (delete-trailing-whitespace)
  )


(provide 'bx-buffer-menu)
