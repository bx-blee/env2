;;;
;;; neda-mime-ue.el
;;;
;;; Process MIME type/subtype: application/x-unsafe-elisp
;;; works with tm-vm and with vanilla vm
;;;
;;; by Pean Lim <pean@neda.com>
;;;
;;; $Id: neda-mime-ue.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

;;; Handlers for the application/x-unsafe-elisp MIME type.
;;; currently supports:
;;;   - VM 6.33 
;;;   - tm-vm.el version 8.10

(defvar nm-xue-buffer-name " x-unsafe-elisp"
  "Buffer containing application/x-unsafe-elisp to be evaluated.")

;;; ---------------------------------------------------------------------
;;; VM Support
;;; ---------------------------------------------------------------------

;; copy-and-edit job on `vm-mime-send-body-to-file'

(defun nm-xue-return-body-as-string (layout) 
  (if (not (vectorp layout))
      (setq layout (vm-extent-property layout 'vm-mime-layout)))
  (let ((work-buffer nil))
    (save-excursion
      (unwind-protect
	  (progn
	    (setq work-buffer (generate-new-buffer " *vm-work*"))
	    (buffer-disable-undo work-buffer)
	    (set-buffer work-buffer)
	    (vm-mime-insert-mime-body layout)
	    (vm-mime-transfer-decode-region layout (point-min) (point-max))
	    (buffer-substring (point-min) (point-max)))
	(and work-buffer (kill-buffer work-buffer))))))


(defun vm-mime-display-internal-application/x-unsafe-elisp (layout)
  (if (vectorp layout)
      (let ((buffer-read-only nil)
	    (description (vm-mm-layout-description layout)))
	(vm-mime-insert-button
	 (format "%-35.35s [%s to evaluate (dangerous!)]"
		 (vm-mime-layout-description layout)
		 (if (vm-mouse-support-possible-here-p)
		     "Click mouse-2"
		   "Press RETURN"))
	 (function
	  (lambda (layout)
	    (save-excursion
	      (vm-mime-display-internal-application/x-unsafe-elisp layout))))
	 layout nil))
    (goto-char (vm-extent-start-position layout))
    (setq layout (vm-extent-property layout 'vm-mime-layout))
    (nm-xue-doit (nm-xue-return-body-as-string layout)))
  t)

(fset 'vm-mime-display-button-application/x-unsafe-elisp
      'vm-mime-display-internal-application/x-unsafe-elisp)

;; add application/x-usafe-elisp to vm-mime-internal-content-types
(cond ((and (consp vm-mime-internal-content-types)
	    (null (member "application/x-unsafe-elisp" vm-mime-internal-content-types)))
       (setq vm-mime-internal-content-types (cons "application/x-unsafe-elisp" vm-mime-internal-content-types)))
      ((null vm-mime-internal-content-types)
       ;; not required because nil means never display internally
       ;; t => always display internally if possible
       t))

;;; ---------------------------------------------------------------------
;;; tm-vm support
;;; ---------------------------------------------------------------------

(require 'tl-atype)

(defun mime/decode-application/x-unsafe-elisp (beg end cal)
  (goto-char beg)
  (re-search-forward "^$")
  (nm-xue-doit (buffer-string (+ (match-end 0) 1) end)))

(eval-after-load "tm-vm"
		 '(set-atype 'mime/content-decoding-condition
			     '((type . "application/x-unsafe-elisp")
			       (method . mime/decode-application/x-unsafe-elisp))))

;;; ---------------------------------------------------------------------
;;; nm-xue-doit
;;; ---------------------------------------------------------------------

(defun nm-xue-doit (string &optional no-confirm-p)
  "Evaluate STRING as one or more lisp expressions.
If NO-CONFIRM-P is nil, ask user for confirmation."
    (save-window-excursion
    (let ((curr-buf (current-buffer))
	  (elisp-buf (get-buffer-create nm-xue-buffer-name))
	  (elisp-result-buf (get-buffer-create (format "%s *eval results*" nm-xue-buffer-name))))
      (switch-to-buffer elisp-buf)
      (erase-buffer)
      (insert string)
      (goto-char (point-min))
      (ding) (ding)
      (cond ((or no-confirm-p
		 (y-or-n-p (format "Warning--evaluating %s dangerous!  Proceed? "
				   (buffer-name elisp-buf))))
	     (set-buffer elisp-result-buf)
	     (goto-char (point-max))
	     (insert (format "--- %s evaluation at %s ---"
			     nm-xue-buffer-name
			     (current-time-string)))
	     (eval-buffer elisp-buf elisp-result-buf)
	     (goto-char (point-max))
	     (message "Buffer %s evaluated." (buffer-name elisp-buf))
	     )
	    (t
	     (message "Abort.  Buffer %s left unevaluated." (buffer-name elisp-buf))
	     (sit-for 3)))
      )))


;;; ---------------------------------------------------------------------
;;; Hook this MIME Content-Type into MIME-Edit (tm-edit.el)
;;; ---------------------------------------------------------------------

(defun mime-editor/insert-x-unsafe-elisp ()
  "Insert some (unsafe) elisp code."
  (interactive)
  (insert (mime-create-tag "application/x-unsafe-elisp" "7bit"))
  (insert "\n")
  )

;; splice into mime-editor/menu-list after the entry for "Insert Text"
(defun mime-editor/menu-list-insert (new-elt menu-list insert-after)
  (cond ((null menu-list)
	 nil)
	((eq insert-after (car (car menu-list)))
	 (cons new-elt menu-list))
	(t 
	 (cons (car menu-list)
	       (mime-editor/menu-list-insert new-elt (cdr menu-list) insert-after)))))

(eval-after-load "tm-edit" 
'(progn

   ;; add to MIME-Edit menu
   (or (assoc 'x-unsafe-elisp mime-editor/menu-list) ; add item just once
       (setq mime-editor/menu-list (mime-editor/menu-list-insert
				    '(x-unsafe-elisp "Insert Unsafe Elisp" mime-editor/insert-x-unsafe-elisp)
				    mime-editor/menu-list
				    'text)))
	     
   ;; add to keymap
   (define-key mime-editor/mime-map "\C-l" 'mime-editor/insert-x-unsafe-elisp)
   ))

;;; ---------------------------------------------------------------------
(provide 'neda-mime-ue)

