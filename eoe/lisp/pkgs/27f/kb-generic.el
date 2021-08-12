;;;
;;; Function keybind-init will get redefined by the real terminal
;;; code in the term directory.
;;;
(defun keybind-init ()
  (interactive)
  (keybind-local-mods)
  (keybind-swap-delete-and-backspace))


;; use ^H as the rubout character
(defun keybind-swap-delete-and-backspace ()
  (interactive)
  (let ((the-table (make-string 128 0)))
    (let ((i 0))
      (while (< i 128)
	(aset the-table i i)
	(setq i (1+ i))))
    ;; Swap ^H and DEL
    (aset the-table ?\177 ?\^h)
    (aset the-table ?\^h ?\177)
    (setq keyboard-translate-table the-table)))

(defun keybind-local-mods ()
  (interactive)
  ;; re-assign some common keys I like to use
  ;(global-set-key "\C-N" 'next-line)
  (global-set-key "\C-H" 'delete-backward-char)  ; actually reassigning DEL
  )
