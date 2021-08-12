;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:tempo:all-defaults-set)
;;
;; bystar:tempo 

;;;------------------------------------------------
;;;  Tempo 
;;;------------------------------------------------
;;;
;;;  Best of Bread Selection:
;;;   looked at various templating systems including
;;;   msf-abbrev.el 
;;;
;;;   Decided on a layered approach of
;;;     abbrev + dabbrev + tempo + tempo-snippets.el 
;;;
;;;  
;;; TODO -- 
;;;  



;; (bystar:tempo:all-defaults-set)
(defun bystar:tempo:all-defaults-set ()
  ""
  (interactive)
  (bystar:tempo:all-defaults-other)
  )

;; (bystar:tempo:all-defaults-other)
(defun bystar:tempo:all-defaults-other ()
  ""
  (interactive)

  (bystar:abbrev:init)

  (bystar:dabbrev:init)

  (bystar:tempo:init)

  (bystar:tempo-snippet:init)
  
  (setq-default abbrev-mode t)
 
  (require 'bystar-tempo-menu)

  (bystar:tempo:load-templates)
  )


;; (bystar:tempo:load-templates)
(defun bystar:tempo:load-templates ()
  ""
  (interactive)
  (load-file "~/lisp/tempo/bux-tempo-misc.el")
  (load-file "~/lisp/tempo/bx:tempo-mtmplt:elisp.el")
  (load-file "~/lisp/tempo/bx:tempo-mtmplt:latex.el")
  )



;; (bystar:abbrev:init)
(defun bystar:abbrev:init ()
  ""
  (interactive)
  
  (setq-default abbrev-mode t)
  (setq save-abbrevs nil)  ;;; do not bug me about saving my abbreviations
  )


;; (bystar:dabbrev:init)
(defun bystar:dabbrev:init ()
  ""
  (interactive)

(setq dabbrev-check-all-buffers nil)

(setq dabbrev-abbrev-skip-leading-regexp "[=*]")
(setq dabbrev-abbrev-skip-leading-regexp "[^ ]*[<>=*]")


;; (setq dabbrev-always-check-other-buffers t)
;; (setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
;; (add-hook 'emacs-lisp-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) nil)
;;          (set (make-local-variable 'dabbrev-case-replace) nil)))
;; (add-hook 'c-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) nil)
;;          (set (make-local-variable 'dabbrev-case-replace) nil)))
;; (add-hook 'text-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) t)
;;          (set (make-local-variable 'dabbrev-case-replace) t)))


  )

;; (bystar:tempo:init)
(defun bystar:tempo:init ()
  ""
  (interactive)

  (load-library "tempo")
  ;;;(require 'tempo)

  ;;; (setq tempo-interactive t)  ;; Over ridden in tempo-snippets
  ;;; (setq tempo-interactive nil)  ;; Over ridden in tempo-snippets

  ;;(bystar:tempo:set-point)
  )

;; (bystar:tempo:set-point)
(defun bystar:tempo:set-point ()
  ""
 (defvar tempo-initial-pos nil
   "Initial position in template after expansion")


 (defadvice tempo-insert( around tempo-insert-pos act )
   "Define initial position."
   (if (eq element '~)
         (setq tempo-initial-pos (point-marker))
     ad-do-it))

 (defadvice tempo-insert-template( around tempo-insert-template-pos act )
   "Set initial position when defined. ChristophConrad"
   (setq tempo-initial-pos nil)
   ad-do-it
   (if tempo-initial-pos
       (progn
         (put template 'no-self-insert t)
         (goto-char tempo-initial-pos))
    (put template 'no-self-insert nil)))
 )

;; (bystar:tempo-snippet:set-point)
(defun bystar:tempo-snippet:set-point ()
  ""
 (defvar tempo-initial-pos nil
   "Initial position in template after expansion")


 (defadvice tempo-snippets-insert-form( around tempo-insert-pos act )
   "Define initial position."
   (if (eq element '~)
         (setq tempo-initial-pos (point-marker))
     ad-do-it))

 (defadvice tempo-snippets-insert-template( around tempo-insert-template-pos act )
   "Set initial position when defined. ChristophConrad"
   (setq tempo-initial-pos nil)
   ad-do-it
   (if tempo-initial-pos
       (progn
         (put template 'no-self-insert t)
         (goto-char tempo-initial-pos))
    (put template 'no-self-insert nil)))
 )


;; (bystar:tempo-snippet:init)
(defun bystar:tempo-snippet:init ()
  ""
  (interactive)

  (require 'tempo-snippets)

  (bystar:tempo-snippet:tab-key)

  ;; (fset 'expand-tempo-tag-alias 'expand-tempo-tag)
  ;; (put 'expand-tempo-tag 'no-self-insert t)

  ;; (add-hook 'abbrev-expand-functions 'expand-tempo-tag)

  ;;;(bystar:tempo-snippet:set-point)
  )

;; 
(defun bystar:tempo-snippet:tab-key ()
  ""
  (interactive)

  (defvar tempo-snippets-source-map (make-sparse-keymap))
  (define-key tempo-snippets-source-map (kbd "<tab>") 'tempo-snippets-next-field)
  (define-key tempo-snippets-source-map (kbd "<backtab>") 'tempo-snippets-previous-field)
  (define-key tempo-snippets-source-map (kbd "C-m") 'tempo-snippets-clear-latest)
  

   (defadvice tempo-snippets-finish-source (before clear-post-overlay (o) act)
     (delete-overlay (overlay-get o 'tempo-snippets-post)))
  
   (defadvice tempo-snippets-insert-source (after install-custom-map act)
     (let ((overlay (car tempo-snippets-sources)))
       (overlay-put overlay 'keymap tempo-snippets-source-map)
       (overlay-put overlay 'tempo-snippets-post (point))))
  
   (defadvice tempo-snippets-insert-template (after install-post-map act)
     (dolist (s tempo-snippets-sources)
       (let ((pos (overlay-get s 'tempo-snippets-post)))
         (when (integerp pos)
           (let ((o (make-overlay pos (1+ pos))))
             (overlay-put o 'keymap tempo-snippets-source-map)
             (overlay-put s 'tempo-snippets-post o)))))
     ad-return-value)
  )



(defun tempo-complete (prompt completions match-required
                         &optional save-name no-insert)
    "Do whatever `tempo-insert-prompt' does, but use completing-read."
    (interactive)
    (flet ((read-string (prompt)
             (completing-read prompt completions match-required)))
      (tempo-snippets-insert-prompt prompt save-name no-insert)))

(defun expand-tempo-tag (expand-function)
    "Expand the tempo-tag before point by calling the template."
    (let (match templ)
      (undo-boundary)
      (if (dolist (tags tempo-local-tags)
            (when (setq match (tempo-find-match-string (or (cdr tags)
                                                           tempo-match-finder)))
              (when (setq templ (assoc (car match) (symbol-value (car tags))))
                (delete-region (cdr match) (point))
                (funcall (cdr templ))
                (return t))))
          ;; Return a function with 'no-self-insert to stop input.
          'expand-tempo-tag-alias
        (funcall expand-function))))


;;;
;;; File Insertions
;;;

;;; (bx:finsert:moded-insert)
(defun bx:finsert:moded-insert ( )
  "Moded Insert"
  (interactive)

  (setq bx:dir-major-mode major-mode)
  
  (when (string-equal major-mode "shellscript-mode")
    (setq bx:dir-major-mode "sh-mode"))

  (let (
	(moded-dir (concat (expand-file-name "~/BUE/inserts/moded/") 
			  (format "%s" bx:dir-major-mode))
		  )
	(file-to-insert)
	)

    (if (file-accessible-directory-p moded-dir)
	(progn
	  (setq file-to-insert 
		(read-file-name "Moded Insert File: " (concat moded-dir "/")))
	  (insert-file file-to-insert)
	  )
      (message (format "Missing %s" moded-dir))
      )
    ))

;;; (bx:finsert:bx-moded-insert)
(defun bx:finsert:bx-moded-insert ( )
  "Moded Insert"
  (interactive)

  (setq bx:dir-major-mode major-mode)
  
  (when (string-equal major-mode "shellscript-mode")
    (setq bx:dir-major-mode "sh-mode"))

  (let (
	(moded-dir (concat (expand-file-name "~/BUE/inserts/moded/") 
			  (format "%s/bx" bx:dir-major-mode))
		  )
	(file-to-insert)
	)

    (if (file-accessible-directory-p moded-dir)
	(progn
	  (setq file-to-insert 
		(read-file-name "Moded Insert File: " (concat moded-dir "/")))
	  (insert-file file-to-insert)
	  )
      (message (format "Missing %s" moded-dir))
      )
    ))

;;; (bx:finsert:moded-visit)
(defun bx:finsert:moded-visit ( )
  "Moded Insert"
  (interactive)

  (setq bx:dir-major-mode major-mode)
  
  (when (string-equal major-mode "shellscript-mode")
    (setq bx:dir-major-mode "sh-mode"))

  (let (
	(moded-dir (concat (expand-file-name "~/BUE/inserts/moded/") 
			  (format "%s" bx:dir-major-mode))
		  )
	)

    (if (file-accessible-directory-p moded-dir)
	(progn
	  (find-file moded-dir)
	  )
      (message (format "Missing %s" moded-dir))
      )
    ))

;;; (bx:finsert:lang-insert)
(defun bx:finsert:lang-insert ( )
  "M17n Insert"
  (interactive)
  (let (
	(m17n-dir (concat (expand-file-name "~/BUE/inserts/m17n/") 
			  (format "far")))
	(file-to-insert)
	)

    (if (file-accessible-directory-p m17n-dir)
	(progn
	  (setq file-to-insert 
		(read-file-name "Lang Insert File: " (concat m17n-dir "/")))
	  (insert-file file-to-insert)
	  )
      )))

(provide 'bystar-tempo-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:

