;;; From bxCheckbox.el --- Some recipes for creating widgets

;;; Code:

(eval-when-compile
  (require 'cl))
(require 'info)
(require 'tree-widget)

(defvar bxCheckbox-buffer-name "*BxCheckbox Demo*"
  "*Name of the widget demo buffer")

(defvar bxCheckbox-list
  '(
    ("Choice" bxCheckbox-choice)
    )
  "A list of pages to show.")

(defvar bxCheckbox-current nil
  "Current page in `bxCheckbox-list'.")

(defvar bxCheckbox-form nil
  "A table for lookup widget created in current buffer.")

(defvar bxCheckbox-anchors nil
  "A table for lookup markers created in current buffer.")

(defvar bxCheckbox-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map widget-keymap)
    ;; this command may be helpful for debug
    (define-key map "r" 'bxCheckbox-reflesh)
    (define-key map "\C-c\C-s" 'bxCheckbox-show-source)
    map)
  "Keymap to use in *Widget Demo* buffer.")


;;{{{  Helper functions
(defun bxCheckbox-menu-goto ()
  (interactive)
  (bxCheckbox-goto (symbol-name last-command-event)))

(defun bxCheckbox-form-create (id widget)
  (if (assoc id bxCheckbox-form)
      (error "identifier %S is used!" id)
    (push (cons id widget) bxCheckbox-form)))

(defun bxCheckbox-form-add (id widget)
  (let ((old (assoc id bxCheckbox-form)))
    (if old
        (setcdr old widget)
      (push (cons id widget) bxCheckbox-form))))

(defun bxCheckbox-form-get (id)
  (cdr (assoc id bxCheckbox-form)))

(defun bxCheckbox-create-anchor (anchor)
  (push (cons anchor (point-marker)) bxCheckbox-anchors))


;;{{{  Commands
;;;###autoload 
(defun bxCheckbox ()
  "Show widget demo."
  (interactive)
  (switch-to-buffer bxCheckbox-buffer-name)
  (bxCheckbox-goto "Choice"))

;;;(define-derived-mode bxCheckbox-mode nil "WDemo"
(define-derived-mode bxCheckbox-mode org-mode "WDemo"
  "Widget demo.
\\{bxCheckbox-mode-map}"
  (make-local-variable 'bxCheckbox-form)
  (make-local-variable 'bxCheckbox-anchors))

(defun bxCheckbox-goto (link)
  (interactive
   (list (completing-read "Goto: " bxCheckbox-list nil t)))
  (switch-to-buffer bxCheckbox-buffer-name)
  (bxCheckbox-mode)
  (setq link (split-string link "#"))
  (let* ((inhibit-read-only t)
         (name (car link))
         (anchor (cadr link))va
         (page (assoc name bxCheckbox-list)))
    (erase-buffer)
    (remove-overlays)
    (setq bxCheckbox-current name)
    ;;
    (widget-insert "\n\n ")
    (widget-insert
     (propertize
      (or (plist-get page :header) (car page))
      'face 'info-title-1))
    (widget-insert "\n\n")
    (widget-insert "[[elisp:(kill-buffer)][Quit]]")
    (widget-insert "\n\n")    
    (funcall (cadr page))
    ;; if there is an anchor, jump to the anchor
    (if (and anchor
             (setq anchor (assoc-default anchor bxCheckbox-anchors)))
        (goto-char anchor)
      (goto-char (point-min)))
    (widget-setup)
    (use-local-map bxCheckbox-mode-map)))

(defun bxCheckbox-reflesh ()
  (interactive)
  (bxCheckbox-goto bxCheckbox-current))

(defun bxCheckbox-show-source ()
  (interactive)
  (let ((page (assoc bxCheckbox-current bxCheckbox-list)))
    (with-selected-window
        (display-buffer
         (find-file-noselect (find-library-name "bxCheckbox")))
      (imenu (symbol-name (cadr page)))
      (recenter 1))))
;;}}}

(defun bxCheckbox-choice ()
  ;; menu choice
  (widget-insert "\
            *Org Mode*  /Highlighting/ Works Well.
")  
  (widget-insert "Here is a menu choice. The label is set by :tag, and the default item is\n"
                 "the child item that :value match the :value of the menu choice.\n")
  (bxCheckbox-form-create
   'menu-choice
   (widget-create 'menu-choice
                  :tag "Menu choices"
                  :button-face 'custom-button
                  :notify (lambda (wid &rest ignore)
                            (message "Current value: %S" (widget-value wid)))
                  :value 'const-variable
                  '(push-button :tag "button"
                                :format "%[%t%]\n"
                                :notify (lambda (wid &rest ignore)
                                          (message "button activate"))
                                "This is button")
                  '(item :tag "item" :value "This is item")
                  '(choice-item :tag "choice" "This is choice item")
                  '(const :tag "const" const-variable)
                  '(editable-field :menu-tag "editable field" "text")))
  ;; toggle
  (widget-insert "\nToggle is used for switch a flag: ")
  (widget-create 'toggle
                 :on "turn on"
                 :off "turn off"
                 :notify (lambda (wid &rest ignore)
                           (message (concat "turn the option "
                                            (if (widget-value wid) "on" "off"))))
                 t)
  ;; check box
  (widget-insert "\nCheck box is like toggle: ")
  (widget-create 'checkbox
                 :format "%[%v%] Option\n"
                 :notify (lambda (wid &rest ignore)
                           (message (concat "Option "
                                            (if (widget-value wid)
                                            "selected" "unselected"))))
                 t)
  ;; radio button
  (widget-insert "\nRadio button is used for select one from a list.\n")
  (widget-create 'radio-button-choice
                 :value "One"
                 :notify (lambda (wid &rest ignore)
                           (message "You select %S %s"
                                    (widget-type wid)
                                    (widget-value wid)))
                 '(item "One")
                 '(item "Two")
                 '(item "Three"))
  (widget-insert "\n")
  ;; checklist
  (bxCheckbox-create-anchor "checklist")
  (widget-insert "Checklist is used for multiple choices from a list.\n")
  (widget-create 'checklist
                 :notify (lambda (wid &rest ignore)
                           (message "The value is %S" (widget-value wid)))
                 '(item "one")
                 '(item "two")
                 '(item "three")))

(provide 'bxCheckbox)
;;; bxCheckbox.el ends here
