;;;
;;;

(require 'easymenu)
(require 'comeega)

;;(require 'web-search)

;;;
;;; Global Menu
;;;

;; (bx:atpoint:global-menu)
(defun bx:atpoint:global-menu ()
  (easy-menu-define 
    bx:atpoint:menu 
    nil 
    "Global AT-POINT Menu"
    '("Complete/Action At Point"
      "---"
      ["Describe Environment" bx-notyet t]
      "---"
      ["Complete Abbrev" bx-notyet t]
      "---"
      ("Tags"
       ["Complete Tag" (complete-tag) t]
       ["Find Tag" (find-tag-default) t]
       ["Tags Loop Continue" (tags-loop-continue) t]
       ["Find Tag Other Window" (find-tag-other-window) t]
       ) 
      "---"
      ("File"
       ["Visit" bookmark-jump t]
       ["Visit Other Window" bookmark-set t]
       ["Play Media" bookmark-set t]
       ["Pdf Viewer" bookmark-set t]
       ) 
      "---"
      ["AtPoint Complete  <F12> Keyboard  Help" blee:atpoint:complete:kbd-help t]
      ["AtPoint Action <F1>  Keyboard  Help" blee:atpoint:action:kbd-help t]
      ["Complete/Process and Atpoint Help" blee:atpoint:help t]
      ))
  )

;; Done in blee-menu-top.el 
;;(easy-menu-add-item nil '("Blee") 'bx:atpoint:menu "Blee Help")

;;;find-file-other-window

(defun bx:mark-current-word (&optional arg allow-extend)
  "Put point at beginning of current word, set mark at end."
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
           (or (and (eq last-command this-command) (mark t))
               (region-active-p)))
      (set-mark
       (save-excursion
         (when (< (mark) (point))
           (setq arg (- arg)))
         (goto-char (mark))
         (forward-word arg)
         (point)))
    (let ((wbounds (bounds-of-thing-at-point 'word)))
      (unless (consp wbounds)
        (error "No word at point"))
      (if (>= arg 0)
          (goto-char (car wbounds))
        (goto-char (cdr wbounds)))
      (push-mark (save-excursion
                   (forward-word arg)
                   (point)))
      (activate-mark))))


(defun word-man ()
  ""
  (interactive)
  (bx:mark-current-word)
  (let (curWord)
    (if (region-active-p)
        (progn
          (setq curWord (buffer-substring (region-beginning) (region-end)))
          (deactivate-mark)
          )
    (read-from-minibuffer "EH_problem: ")
    )
    ;;;
    (manual-entry curWord)
    )
  )

;;
(defun tts-word ()
  ""
  (interactive)
  (bx:mark-current-word)
  (call-interactively 'festival-say-region)
  (deactivate-mark)  
  )


;;;
;;; (tts-region)
;;; (tts-region nil)
;;; (tts-region "echo Hello World")
(defun tts-regionOLD ()
  ""
  (interactive)
  
  (let (subjectStr)
    (if selection
        (setq subjectStr selection)
      (progn
        (if (region-active-p)
            (progn
              (message (format "%s %s" (region-beginning) (region-end)))
              (setq subjectStr (buffer-substring (region-beginning) (region-end)))
              (message (format "1-- %s" subjectStr))
              ;;(festival-say-region)         
              )
          (setq subjectStr (read-from-minibuffer "Input: "))
          )
        )
      )
    (message (format "2--%s" subjectStr))    
    (festival-say-string (format "2--%s" subjectStr))    
    (if yas-selected-text
        (insert yas-selected-text)
      )
    (festival-say-string subjectStr)
    (message (format "3--%s" subjectStr))        
    )
  )


;;;
;;; (tts-region)
(defun tts-region ()
  ""
  (interactive)
  (if (region-active-p)
      (call-interactively 'festival-say-region)
    )
  )
  

;;;
;;; (lookup-region-google)
;;; (lookup-region-google nil)
;;; (lookup-region-google "echo Hello World")
(defun lookup-region-google ()
  ""
  (interactive)
  (if (region-active-p)
      (progn
        (search-in-google 1)
        (deactivate-mark)
        )
    )
  )

;; 
(defun lookup-word-wikipedia ()
  ""
  (interactive)
  (bx:mark-current-word)
  (search-in-wikipedia 1)
  (deactivate-mark)  
  )


;; 
(defun lookup-word-dehkhoda ()
  ""
  (interactive)
  (bx:mark-current-word)
  (search-in-dehkhoda 1)
  )

;; 
(defun lookup-word-google ()
  ""
  (interactive)
  (bx:mark-current-word)
  (search-in-google 1)
  )

;; 
(defun lookup-word-en-fa ()
  ""
  (interactive)
  (bx:mark-current-word)
  (search-in-dict-en-fa 1)
  )

;; 
(defun lookup-word-fa-en ()
  ""
  (interactive)
  (bx:mark-current-word)
  (search-in-dict-fa-en 1)
  )



;; (blee:atpoint:complete:global-kbd)
(defun blee:atpoint:complete:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f12)] nil)

  (define-key global-map [(f12) (f12) ] 'blee:ppmm:org-mode-toggle)   ;;; f12 o (org) --- f12 n (native)  --- f12 p (poly)
  (define-key global-map [(f12) (l)  ]  'blee:ppmm:org-mode-content-list)
  (define-key global-map [(f12) (o)  ]  'org-shifttab)
  (define-key global-map [(f12) (t)  ]  'bx:complete-tag)
  (define-key global-map [(f12) (c)  ]  'completion-at-point)
  (define-key global-map [(f12) (a)  ]  'complete-abbrev)
  (define-key global-map [(f12) (d)  ]  'complete-dabbrev)
  (define-key global-map [(f12) (i)  ]  'complete-insert)
  ;;
  (define-key global-map [(f12) (\1)  ]  'delete-other-windows)
  (define-key global-map [(f12) (\2)  ]  'split-window-below)
  (define-key global-map [(f12) (\3)  ]  'split-window-right)
  (define-key global-map [(f12) (\5)  ]  'make-frame-command)
  ;;
  (define-key global-map [(f12) (s)  ]  nil)
  ;;
  (define-key global-map [(f12) (s) (g) ]  'search-in-google)
  (define-key global-map [(f12) (s) (d) ]  'search-in-dehkhoda)
  (define-key global-map [(f12) (s) (w) ]  'search-in-wikipedia)
  ;;
  (define-key global-map [(f12) (s) (e) ]  nil)   ;;; English-To-xx
  (define-key global-map [(f12) (s) (e) (f) ]  'search-in-dict-en-fa)
  ;;
  (define-key global-map [(f12) (s) (f) ]  nil)   ;;; Farsi-To-xx
  (define-key global-map [(f12) (s) (f) (e) ]  'search-in-dict-fa-en)

  ;;
  (define-key global-map [(f12) (w) (g) ]  'lookup-word-google)
  (define-key global-map [(f12) (w) (d) ]  'lookup-word-dehkhoda)
  (define-key global-map [(f12) (w) (w) ]  'lookup-word-wikipedia)
  ;;
  (define-key global-map [(f12) (w) (e) ]  nil)   ;;; English-To-xx
  (define-key global-map [(f12) (w) (e) (f) ]  'lookup-word-en-fa)
  ;;
  (define-key global-map [(f12) (w) (f) ]  nil)   ;;; Farsi-To-xx
  (define-key global-map [(f12) (w) (f) (e) ]  'lookup-word-fa-en)
  ;;
  ;; Folding Facilities
  ;;
  (define-key global-map [(f12) (f) ]  nil)   ;;; Folding / Outline
  (define-key global-map [(f12) (f) (f) ]  'org-shifttab)       ;;; Toggle
  (define-key global-map [(f12) (f) (o) ]  'org-shifttab)     ;;; Overview
  (define-key global-map [(f12) (f) (c) ]  'org-content)        ;;; Content
  (define-key global-map [(f12) (f) (a) ]  'show-all)         ;;; Show All
;;;
  (blee:comeega-globalKbd|set)
  )


;; 
(defun bx:fold:content ()
  ""
  (interactive)
  (org-content)
  )


;; (blee:atpoint:kbd-help)
(defun bx:complete-tag ()
  "Display a  help"
  (interactive)
  (complete-tag)
  )


;; (blee:atpoint:kbd-help)
(defun blee:atpoint:complete:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-function 'blee:atpoint:complete:kbd-desc)
  )


;; (blee:atpoint:kbd-desc)
(defun blee:atpoint:complete:kbd-desc ()
  "
                ByStar Libre Emacs Environment (BLEE)
        AtPoint  <F12> (complete) Kbd Prefix
 
The following basic commands are globally available.

                 Complete AtPoint
  ---------------------------------------
  <f12><f12>            Complete Tag
  \\[completion-at-point]       completion-at-point
complete-abbrev
complete-dabbrev
complete-insert


"
  (interactive)
  )



;; (blee:atpoint:action:global-kbd)
(defun blee:atpoint:action:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f1)] nil)

  (define-key global-map [(f1) (f1)] 'find-file-at-point)
  (define-key global-map [(f1) (o)]  'find-file-at-point-other-window-bx)
  (define-key global-map [(f1) (r)]  'bue:visit-url-at-remote-firefoxObsoleted)
  (define-key global-map [(f1) (v)]  'bx:browser:visit-url-at-video-server)
  (define-key global-map [(f1) (a)]  'bx:browser:visit-url-at-audio-server)

  (define-key global-map [(f1) (t) ]  nil)
  (define-key global-map [(f1) (t) (t)]  'find-tag)
  (define-key global-map [(f1) (t) (n) ]  'tags-loop-continue)
  (define-key global-map [(f1) (t) (o) ]  'find-tag-other-window)
)

;; (blee:atpoint:kbd-help)
(defun blee:atpoint:action:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-function 'blee:atpoint:complete:kbd-desc)
  )


;; (blee:atpoint:kbd-desc)
(defun blee:atpoint:action:kbd-desc ()
  "
                ByStar Libre Emacs Environment (BLEE)
        AtPoint   <F1> (action) Kbd Prefix
 
The following basic commands are globally available.


                Action AtPoint
  ---------------------------------------
  <f1><f1>              find-file-at-point
  \\[bue:visit-url-at-remote-firefox]   Send URL to Remote Browser
\\[find-tag]
\\[tags-loop-continue]
\\[find-tag-other-window]

"
  (interactive)
  )



;; (blee:atpoint:help)
(defun blee:atpoint:help ()
  ""
  (interactive)
  (with-output-to-temp-buffer (help-buffer)
    ;;;(print standard-output) ;; example
    ;;(save-excursion
      (switch-to-buffer (help-buffer))
      ;;(toggle-read-only)
      (goto-char (point-max))
      (insert "
blee:atpoint:help

Someday, someone should write real text for help, 
For now, there are these lispish notes.
\n")
    
      (goto-char (point-max))
      (insert "bx:atpoint:bilang-par:\n")
      (pp-eval-expression '(symbol-plist 'bx:atpoint:bilang-par))
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (insert "bx:atpoint:lang-par:\n")
      (pp-eval-expression '(symbol-plist 'bx:atpoint:lang-par))
      (insert-buffer "*Pp Eval Output*")

      (kill-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (insert "And Now for something different \n")
      (goto-char (point-min))
      ;;)
    ))

(defun find-file-at-point-other-window-bx ()
  ""
  (interactive)
  (save-excursion
  (let ((cur-buf (current-buffer))
        (file-buf)
        )
    (find-file-at-point)
    (setq file-buf (current-buffer))
    (other-window 1)
    (switch-to-buffer file-buf)
    (other-window 1)
    (switch-to-buffer cur-buf)
  )))


(provide 'bx-atpoint-menu)
