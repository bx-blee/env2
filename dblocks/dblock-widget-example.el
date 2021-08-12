

(defun org-dblock-write:bx:dblock:menuChoice (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
    
    (widget-insert "New New! Here is a menu choice. The label is set by :tag, and the default item is\n"
		   "the child item that :value match the :value of the menu choice.\n")    

    (widget-create 'menu-choice
                  :tag "_Menu choices_"
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
                  '(editable-field :menu-tag "editable field" "text"))
    (use-local-map widget-keymap)
    (widget-setup)
    )
  )


(defun org-dblock-write:bx:dblock:menuChoiceOld (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (insert " ZZZZ \n")

    (bxCheckbox-mode)
    
    
    (widget-insert "Here is a menu choice. The label is set by :tag, and the default item is\n"
		   "the child item that :value match the :value of the menu choice.\n")    

;    (bxCheckbox-form-create
;     'menu-choice
     (widget-create 'menu-choice
                  :tag "_Menu choices_"
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
                  '(editable-field :menu-tag "editable field" "text"))
 ;    )
    )
  )
  
;; (defun bxCheckbox-form-create (id widget)
;;   (if (assoc id bxCheckbox-form)
;;       (error "identifier %S is used!" id)
;;     (push (cons id widget) bxCheckbox-form)))

;;;(define-derived-mode bxCheckbox-mode nil "WDemo"
(define-derived-mode bxCheckbox-mode org-mode "WDemo"
  "Widget demo.
\\{bxCheckbox-mode-map}"
  (make-local-variable 'bxCheckbox-form)
  (make-local-variable 'bxCheckbox-anchors))

(defvar bxCheckbox-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map widget-keymap)
    ;; this command may be helpful for debug
    (define-key map "r" 'bxCheckbox-reflesh)
    (define-key map "\C-c\C-s" 'bxCheckbox-show-source)
    map)
  "Keymap to use in *Widget Demo* buffer.")
