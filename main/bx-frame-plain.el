(require 'battery)
(require 'timeclock)

(defvar popup-info-frame)

(defun popup-info-string ()
  (format "%s\n%s\n%s\n%s"
          (format-time-string "%H:%M %Y-%m-%d" (current-time))
	  (format "ByStar")
          ;; (battery-format battery-echo-area-format (funcall
          ;;                                           battery-status-function))
          (timeclock-status-string)
          (shell-command-to-string "nmcli -p dev")
	  ))

(defun flash-info ()
  (interactive)
  (popup-info)
  (sit-for 5)
  (popup-delete-frame)
  )


(defun popup-info ()
  (interactive)
  (popup-info--1 "*popup status*"))

(defun popup-delete-frame ()
  (interactive)
  (let (popup-info-frame)
    (switch-to-buffer "*popup status*")
    (setq popup-info-frame (selected-frame))
    (delete-frame popup-info-frame)
    )
  )


(defun popup-info--1 (bufname)
  (save-excursion
  (with-current-buffer (get-buffer-create bufname)
    (make-local-variable 'popup-info-frame)
    (if (and (boundp 'popup-info-frame)
             popup-info-frame
             (member popup-info-frame (frame-list)))
        (select-frame popup-info-frame)
      (let ((default-frame-alist '((minibuffer . nil)
				   (font . "Monospace 16")
                                   (width . 80)
				   (height . 10)
                                   (border-width . 0)
                                   (menu-bar-lines . 0)
                                   (tool-bar-lines . 0)
                                   (unsplittable . t)
                                   (left-fringe . 0))))
        (switch-to-buffer-other-frame bufname)
        (setq popup-info-frame (selected-frame))))
    (erase-buffer)
    (setq mode-line-format nil)
    (redraw-modeline)
    (insert (popup-info-string))
    (insert-text-button "xyz" :type 'my-button)
    )))

(defun myfun (button)
  (message (format "Button ZZZ [%s]" (button-label button))))

(define-button-type 'my-button
  'action 'myfun
  'follow-link t
  'help-echo "Click button")


