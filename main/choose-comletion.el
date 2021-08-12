;;;
;;; MB: [2012-09-15 Sat]
;;;
;;; This fixes a bug in completion selection of bbdb complete.
;;; The code is take from simple.el
;;; The lines that have been added are: 
;;;  (if (equal major-mode 'message-mode)
;;;      (message-beginning-of-line)
;;;    )
;;; 
;;;  May be the fix should be with a defadvice or the source of the bug should be 
;;;  resolved.
;;;

(defun choose-completion (&optional event)
  "Choose the completion at point."
  (interactive (list last-nonmenu-event))
  ;; In case this is run via the mouse, give temporary modes such as
  ;; isearch a chance to turn off.
  (if (equal major-mode 'message-mode)
      (message-beginning-of-line)
    )
  (run-hooks 'mouse-leave-buffer-hook)
  (with-current-buffer (window-buffer (posn-window (event-start event)))
    (let ((buffer completion-reference-buffer)
          (base-size completion-base-size)
          (base-position completion-base-position)
          (insert-function completion-list-insert-choice-function)
          (choice
           (save-excursion
             (goto-char (posn-point (event-start event)))
             (let (beg end)
               (cond
                ((and (not (eobp)) (get-text-property (point) 'mouse-face))
                 (setq end (point) beg (1+ (point))))
                ((and (not (bobp))
                      (get-text-property (1- (point)) 'mouse-face))
                 (setq end (1- (point)) beg (point)))
                (t (error "No completion here")))
               (setq beg (previous-single-property-change beg 'mouse-face))
               (setq end (or (next-single-property-change end 'mouse-face)
                             (point-max)))
               (buffer-substring-no-properties beg end)))))

      (unless (buffer-live-p buffer)
        (error "Destination buffer is dead"))
      (quit-window nil (posn-window (event-start event)))

      (with-current-buffer buffer
        (choose-completion-string
         choice buffer
         (or base-position
             (when base-size
               ;; Someone's using old completion code that doesn't know
               ;; about base-position yet.
               (list (+ base-size (field-beginning))))
             ;; If all else fails, just guess.
             (list (choose-completion-guess-base-position choice)))
         insert-function)))))
