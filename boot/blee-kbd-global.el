;;; ensure that the functions we want to invoke with the function keys are
;;; defined

;;
;; TODO:
;;  Don't use meta/alt -- causes problems with gnome captures
;;    Order of use:  
;;       fn                    -- complete or enter
;;       S-fn                  -- New Entry
;;       C-fn                  --
;;       S-C-fn                --
;; 
;;

;;;(require 'eoe)
;;;(require 'basic-ext)
;;;(require 'misc-lim)
;;;(require 'compile-ext)
;;; ;;(require 'bx-bbdb-lib) ; OBSOLETED	for bbdb-complete-name-only
;;;(require 'font-lock-ext)

;;; (eoe-kbd)
(defun eoe-kbd ()
  (interactive)
  (cond ((or (string-equal opRunDistFamily "UBUNTU")
	     (string-equal opRunDistFamily "DEBIAN"))
	 (message "GOT UBUNTU/DEBIAN")
	 (eoe-kbd-basic)
	 )
	((string-equal opRunDistFamily "MAEMO")
	 (message "GOT MAEMO")
	 (eoe-kbd-n810)
	 )
	(t
	 (message "EH_problem")
	 (ding)
	 (sleep-for 1)
	 (message (format "Don't know: %s" opRunDistFamily)))
	)
  )

(defun eoe-kbd-n810()
  (interactive)

  ;; =================
  ;; Top Function keys
  ;; =================
  ;;
  ;; F1
  ;; F2
  ;; F3
  ;; F4 -- (UNDER D-Pad) below updown next to Fn -- Short Cut 
  (require 'bystar-org-menu)
  (bystar:org:menu:global-kbd-n810)
  ;;(global-set-key [(f4)] 'noop)
  ;;(global-set-key [(shift f4)] 'noop)
  ;;(define-key global-map [(control f4)] 'noop)
  ;;(define-key global-map [(meta f4)] 'noop)
  ;; F5
  ;; F6 -- (top edge of device) maximize left top Acknowledge
  (require 'handset-menu-top)
  (bystar:handset:menu:global-kbd-n810)
  ;;(global-set-key [(f6)] 'noop)
  ;;(global-set-key [(shift f6)] 'noop)
  ;;(define-key global-map [(control f6)] 'noop)
  ;;(define-key global-map [(meta f6)] 'noop)
   ;; F7  -- top of the device (+) 
  (global-set-key [(f7)] 'eoe-text-scale-increase)
  (global-set-key [(shift f7)] 'eoe-text-scale-normal)
  (define-key global-map [(control f7)] 'noop)
  (define-key global-map [(meta f7)] 'noop)
  ;; F8 -- -- top of the device (-)
  (global-set-key [(f8)] 'eoe-text-scale-decrease)
  (define-key global-map [(shift f8)] 'noop)
  (define-key global-map [(control f8)] 'noop)
  (define-key global-map [(meta f8)] 'noop)
  ;; F9
  ;; F10
  ;; F11
  ;; F12
  )

;; (eoe-kbd-basic)
(defun eoe-kbd-basic ()
  (interactive)

  ;; =================
  ;; Top Function keys
  ;; =================
  ;;
  ;; F1  -- Visit, Jump To, Go There
  (require 'bx-atpoint-menu)
  (blee:atpoint:action:global-kbd)
  ;;(define-key global-map [(f1)] 'find-file-at-point)
  ;;(define-key global-map [(shift f1)] 'visit-url)
  ;; (define-key global-map [(shift f1)] 'bue:visit-url-at-remote-firefox)
  ;; (define-key global-map [(control f1)] 'noop)
  ;; (define-key global-map [(meta f1)] 'noop)
  ;; F2  -- Mail Reading
  (define-key global-map [(f2)] nil)

  (define-key global-map [(f2) (f2) ] 'gif-screencast-stop)

  (define-key global-map [(f2) (s) ] 'gif-screencast)  ;; Start
  (define-key global-map [(f2) (p) ] 'gif-screencast-toggle-pause) ;; Pause

  ;; (define-key global-map [(f2)] 'gnus)
  ;; (define-key global-map [(shift f2)] 'gnus-level-3)
  ;; (define-key global-map [(control f2)] 'gnus-level-2)
  ;; (define-key global-map [(shift control f2)] 'gnus-level-4)
   ;; F3  -- Mail Sending
  (require 'bystar-mail-menu)
  (bystar:mail:menu:global-kbd)
  (require 'bystar-mail-menu)
  (bystar:mail:send:menu:global-kbd)
  ;; (define-key global-map [(f3)] 'compose-mail)
  ;; (define-key global-map [(shift f3)] 'bue:mail:compose-mail-office)
  ;; (define-key global-map [(control f3)] 'bue:mail:compose-mail-desk)
  ;; (define-key global-map [(shift control f3)] 'bue:mail:compose-mail)
   ;; F4   -- Address Book, Complete, Insert, Visit
  (define-key global-map [(f4)] 'bbdb-complete-name)
  (define-key global-map [(shift f4)] 'bbdb)
  (define-key global-map [(control f4)] nil)
  (define-key global-map [(control f4) (c) ] 'bbdb-create)
  (define-key global-map [(shift control f4)] 'bbdb-complete-address)
   ;; F5   --  Complete, Files, Tags, English Words
  ;;;(define-key global-map [(f5)] 'comint-dynamic-complete)
  (define-key global-map [(f5)] 'comint-dynamic-complete-filename)
  (define-key global-map [remap complete-tag] 'complete-tag)
  (define-key global-map [(shift f5)] 'bash-complete-tag)
  (define-key global-map [(control f5)] 'ispell-complete-word)
  (define-key global-map [(shift control f5)] 'complete-tag)
  ;; F6  -- Language
  (require 'bystar-bidi-menu)
  (require 'bystar-m17n-menu)
  (bystar:m17n-global:keybd)
  ;; F7  -- Shell 
  (require 'bx-visibility-menu)
  (blee:window:this:global-kbd)
  ;; (define-key global-map [(f7)] 'shell)
  ;; (define-key global-map [(shift f7)] 'goto-shell-with-cd)
  ;; (define-key global-map [(control f7)] 'shell3)  ;; Notyet C-3 shell
  ;; (define-key global-map [(shift control f7)] 'sync-cd)
  ;; F8 -- Other
  (require 'bx-visibility-menu)
  (blee:window:other:global-kbd)
  ;; (define-key global-map [(f8)] 'other-window)
  ;; (define-key global-map [(shift f8)] 'delete-other-windows)
  ;; (define-key global-map [(control f8)] 'find-file-other-window)
  ;; (define-key global-map [(meta f8)] 'noop)
  ;; F9  -- Decrease
  (global-set-key [(f9)] 'eoe-text-scale-decrease)
  (define-key global-map [(shift f9)] 'emms-volume-mode-minus)
  (define-key global-map [(control f9)] 'xterm-mouse-mode)
  (define-key global-map [(shift control f9)] 'menu-bar-open)
  ;; F10 -- Increase
  (global-set-key [(f10)] 'eoe-text-scale-increase)
  (define-key global-map [(shift f10)] 'emms-volume-mode-plus)
  (define-key global-map [(control f10)] 'menu-bar-mode)
  (define-key global-map [(shift control f10)] 'noop)
  ;; F11   -- Other
  (require 'bystar-org-menu)
  (bystar:org:menu:global-kbd)
  ;;(define-key global-map [(f11)] 'calendar)
  ;;(define-key global-map [(shift f11)] 'bue:diary-month)
  ;;(define-key global-map [(control f11)] 'bue:diary-edit)
  ;;(define-key global-map [(shift control f11)] 'other-window-at-end)
  ;; F12  -- Org Mode
  (require 'bx-atpoint-menu)
  (blee:atpoint:complete:global-kbd)
  ;; (define-key global-map [(f12)] 'eoe-todo-insert)
  ;; (define-key global-map [(shift f12)] 'eoe-todo-visit)
  ;; (define-key global-map [(control f12)] 'eoe-notes-visit)
  ;; (define-key global-map [(shift control f12)] 'org-remember)
  ;; pause  -- emms
  ;;(define-key global-map [(pause)] 'emms-pause)
  ;;(define-key global-map [(shift pause)] 'emms)
  ;;(define-key global-map [(control pause)] 'emms-show)
  ;;(define-key global-map [(shift control pause)] 'emms-score-toggle)
  ;; insert  -- msf-abbrev
  ;; (require 'bystar-tempo-menu)
  ;; (bystar:tempo-global:keybd)
  ;; (define-key global-map [(insert)] 'msf-abbrev-abbrev-complete)
  ;; (define-key global-map [(shift insert)] 'msf-abbrev-abbrev-choose)
  ;; (define-key global-map [(control insert)] 'expand-abbrev)
  ;; (define-key global-map [(shift control insert)] 'msf-abbrev-define-new-abbrev-this-mode)
  )
  

(defun bash-complete-tag()
  (interactive)
  (complete-tag)
  )


(provide 'blee-kbd-global)

