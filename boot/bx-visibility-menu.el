;;;
;;;

(require 'easymenu)

;;;
;;; Global Menu
;;;

;; (bx:visibility:global-menu)
(defun bx:visibility:global-menu ()
  (easy-menu-define
    bx:visibility:menu
    nil
    "Global VISIBILITY Menu"
    '("Frame, Window and Buffer"
      ("Bookmarks"
       ["bookmark Jump" bookmark-jump t]
       ["bookmark Set" bookmark-set t]
       ["bookmark Delete" bookmark-delete t]
       ["bookmark Edit" edit-bookmarks t]
       )
      "---"
      ["Toggle Folding Mode" folding-mode t]
      "---"
      ("Outline"
       ["bookmark Jump" bookmark-jump t]
       ["bookmark Set" bookmark-set t]
       )
      "---"
      ("Other Window"
       ["bookmark Jump" bookmark-jump t]
       ["bookmark Set" bookmark-set t]
       )
      "---"
      ["Visibility This <F7> Keyboard  Help" blee:visibility:this:kbd-help t]
      ["Visibility Other <F8> Keyboard  Help" blee:visibility:other:kbd-help t]
      ["Abbrevs and Visibility Help" blee:visibility:help t]
      ))
  )

;; Done in blee-menu-top.el
;;(easy-menu-add-item nil '("Blee") 'bx:visibility:menu "Blee Help")

(setq bookmark-default-file "~/BUE/emacs/bookmarks.bmk")
(setq bookmark-save-flag 1)		; How many mods between saves

;;;scroll-other-window
;;;scroll-other-window-down


;;;
;;; Notyet Perhaps we need to split this into Window (goto) and Buffer (here)
;;;  Shell goes to Window -- folding goes to buffer
;;;
;; (blee:window:this:global-kbd)
(defun blee:window:this:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f7)] nil)

  ;;; Broken into (1) Window Jumpers -- (2) Buffer Processors

  ;;;  WINDOW JUMPERS BEGIN

  (define-key global-map [(f7) (f7) ] 'shell)
  (define-key global-map [(f7) (\0)  ] 'goto-shell-with-cd)
  (define-key global-map [(f7) (\1)  ] 'bxi:shell1)
  (define-key global-map [(f7) (\2)  ] 'bxi:shell2)
  (define-key global-map [(f7) (\3)  ] 'bxi:shell3)
  (define-key global-map [(f7) (\4)  ] 'bxi:shell4)
  (define-key global-map [(f7) (\5)  ] 'bxi:shell5)
  (define-key global-map [(f7) (\6)  ] 'bxi:shell6)
  (define-key global-map [(f7) (\7)  ] 'bxi:shell7)
  (define-key global-map [(f7) (\8)  ] 'bxi:shell8)
  (define-key global-map [(f7) (\9)  ] 'bxi:shell9)

  (define-key global-map [(f7) (=)  ] 'blee:bnsm:results-here)

    ;;;  Menu, Panel.org, proc.sh visit
  (define-key global-map [(f7) (x)] 'comintPlus-sendInput)
  (define-key global-map [(f7) (e)] 'comintPlus-editInput)


  ;;;  Recent File
  (define-key global-map [(f7) (r)] 'my-open-recent-file)

  ;;;  Buffers
  (define-key global-map [(f7) (b)] nil)
  (define-key global-map [(f7) (b) (b)] 'iswitchb-buffer)

  ;;;  Bookmark -- Jump to favorites
  (define-key global-map [(f7) (g)] nil)
  (define-key global-map [(f7) (g) (f)] 'bookmark-jump)
  (define-key global-map [(f7) (g) (s)] 'bookmark-set)

  ;;;  Buffer's Major Mode Programming Language
  (define-key global-map [(f7) (n)] nil)
  (define-key global-map [(f7) (n) (n)] 'findObjectPlaceHolder) ;;; Emacs 25 xref-find-definitions

  ;;;  Lisp Helpers
  (define-key global-map [(f7) (l)] nil)
  (define-key global-map [(f7) (l) (l)] 'find-function)
  (define-key global-map [(f7) (l) (f)] 'find-function)
  (define-key global-map [(f7) (l) (d)] 'blee:dblock:find-function)
  (define-key global-map [(f7) (l) (v)] 'find-variable)

  ;;; Find Information/Description On Stuff
  (define-key global-map [(f7) (f)] nil)
  (define-key global-map [(f7) (f) (f)] 'describe-function)
  (define-key global-map [(f7) (f) (v)] 'describe-variable)

  ;;; END WINDOW JUMPERS

  ;;; BEGIN BUFFER PROCESSORS

  ;;;  Dynamic Block
  (define-key global-map [(f7) (d)] nil)
  (define-key global-map [(f7) (d) (d)] 'org-dblock-update)
  (define-key global-map [(f7) (d) (b)] 'org-dblock-update-buffer-bx)
  (define-key global-map [(f7) (d) (u)] 'org-dblock-bx-blank-this)     ;;; u= undo this dblock
  (define-key global-map [(f7) (d) (c)] 'org-dblock-bx-blank-buffer)   ;;; c= clean dblock buffer

  ;;;  White Spaces and Invisible Characters
  (define-key global-map [(f7) (w)] nil)
  (define-key global-map [(f7) (w) (w)] 'whitespace-mode)
  (define-key global-map [(f7) (w) (s)] 'show-trailing-whitespace-set)
  (define-key global-map [(f7) (w) (u)] 'show-trailing-whitespace-unset)
  (define-key global-map [(f7) (w) (d)] 'delete-trailing-whitespace)
  (define-key global-map [(f7) (w) (l)] 'indicate-empty-lines-set)
  (define-key global-map [(f7) (w) (n)] 'indicate-empty-lines-unset)


  ;; ;;;  Folding Mode Has Been Obsoleted
  ;; (define-key global-map [(f7) (f)] nil)
  ;; (define-key global-map [(f7) (f) (f)] 'folding-mode)
  ;; (define-key global-map [(f7) (f) (s)] 'folding-show-current-subtree)
  ;; (define-key global-map [(f7) (f) (h)] 'folding-hide-current-subtree)
  ;; (define-key global-map [(f7) (f) (o)] 'folding-open-buffer)    ;; (Open) Unfold Entire Buffer
  ;; (define-key global-map [(f7) (f) (c)] 'folding-whole-buffer)   ;; (Close) ReFold Entire Buffer


  
  ;;;  Printing
  (define-key global-map [(f7) (p)] nil)
  ;;; (define-key global-map [(f7) (p) (p)] 'pr-ps-fast-fire)
  (define-key global-map [(f7) (p) (p)] 'pr-ps-buffer-preview-bx-1)
  (define-key global-map [(f7) (p) (i)] 'pr-interface)
  (define-key global-map [(f7) (p) (b)] 'pr-ps-buffer-print)
  (define-key global-map [(f7) (p) (r)] 'pr-ps-region-print)
  (define-key global-map [(f7) (p) (v)] 'pr-ps-buffer-preview)

  ;;;  printing preView
  (define-key global-map [(f7) (v)] nil)
  (define-key global-map [(f7) (v) (v)] 'pr-ps-buffer-preview-bx-1)
  (define-key global-map [(f7) (v) (i)] 'pr-interface)
  (define-key global-map [(f7) (v) (b)] 'pr-ps-buffer-preview)
  (define-key global-map [(f7) (v) (r)] 'pr-ps-region-preview)

  ;;;  Outline Mode
  (define-key global-map [(f7) (o)] 'outline-mode)

  ;;;  Insert
  (define-key global-map [(f7) (i)] nil)
  (define-key global-map [(f7) (i) (m)] 'bx:finsert:moded-insert)
  (define-key global-map [(f7) (i) (l)] 'bx:finsert:lang-insert)

  ;;;  Sync -- Version Control -- GIT
  (define-key global-map [(f7) (s)] nil)
  (define-key global-map [(f7) (s) (s)] 'magit-status)
  (define-key global-map [(f7) (s) (u)] 'magit-push)     ;;; up, upload
  (define-key global-map [(f7) (s) (d)] 'magit-pull)     ;;; down, download

  ;;;  Sync -- Version Control -- LaTeX, AucTex, RefTeX
  (define-key global-map [(f7) (t)] nil)
  (define-key global-map [(f7) (t) (t)] 'reftex-toc)

  ;;; END BUFFER PROCESSORS

)

;; (blee:window:other:global-kbd)
(defun blee:window:other:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f8)] nil)


  ;;; Broken into (1) Window Jumpers -- (2) Buffer Processors

  ;;;  WINDOW JUMPERS BEGIN

  (define-key global-map [(f8) (f8)] 'other-window)
  (define-key global-map [(f8) (\0)] 'delete-window)
  (define-key global-map [(f8) (\1)] 'delete-other-windows)
  (define-key global-map [(f8) (\2)] 'split-window-vertically)
  (define-key global-map [(f8) (\3)] 'split-window-horizontally)

  (define-key global-map [(f8) (s)] nil)
  (define-key global-map [(f8) (s) (s)] 'bxi:otherw:shell)
  (define-key global-map [(f8) (s) (\0)] 'bxi:otherw:shell)
  (define-key global-map [(f8) (s) (\1)] 'bxi:otherw:shell1)

  (define-key global-map [(f8) (k)] 'kill-buffer)
  ;;; (define-key global-map [(f8) (k)] 'delete-window) ;;; Sort out which one is better

  ;;; BEGIN FRAME PROCESSORS
  ;;; Go To Other Frames

  (define-key global-map [(f8) (f)] nil)
  (define-key global-map [(f8) (f) (f)] 'other-frame)
  (define-key global-map [(f8) (f) (\1)] 'other-frame)
  (define-key global-map [(f8) (f) (\2)] 'bxi:other-frame-2)
  (define-key global-map [(f8) (f) (s)] 'frame-save-to-register)
  (define-key global-map [(f8) (f) (r)] 'frame-restore-from-register)
  (define-key global-map [(f8) (f) (c)] 'frame-create)
  (define-key global-map [(f8) (f) (d)] 'frame-delete)

  ;;; END FRAME PROCESSORS
)

(defun show-trailing-whitespace-set ()
  ""
  (interactive)
  (setq show-trailing-whitespace t)
  )

(defun show-trailing-whitespace-unset ()
  ""
  (interactive)
  (setq show-trailing-whitespace nil)
  )

(defun indicate-empty-lines-set ()
  ""
  (interactive)
  (setq indicate-empty-lines t)
  )

(defun indicate-empty-lines-unset ()
  ""
  (interactive)
  (setq indicate-empty-lines nil)
  )




(defun bxi:other-frame-2 ()
  "Shell1"
  (interactive)
  (other-frame 2)
  )


(defun bxi:otherw:shell ()
  "Shell1"
  (interactive)
  (other-window 1)
  (shell)
  )


(defun bxi:otherw:shell1 ()
  "Shell1"
  (interactive)
  (other-window 1)
  (shell 1)
  )


(defun bxi:shell1 ()
  "Shell1"
  (interactive)
  (shell 1)
  )

(defun bxi:shell2 ()
  "Shell2"
  (interactive)
  (shell 2)
  )

(defun bxi:shell3 ()
  "Shell3"
  (interactive)
  (shell 3)
  )

(defun bxi:shell4 ()
  "Shell4"
  (interactive)
  (shell 4)
  )

(defun bxi:shell5 ()
  "Shell5"
  (interactive)
  (shell 5)
  )

(defun bxi:shell6 ()
  "Shell6"
  (interactive)
  (shell 6)
  )

(defun bxi:shell7 ()
  "Shell7"
  (interactive)
  (shell 7)
  )

(defun bxi:shell8 ()
  "Shell8"
  (interactive)
  (shell 8)
  )

(defun bxi:shell9 ()
  "Shell9"
  (interactive)
  (shell 9)
  )

(defun pr-ps-buffer-preview-bx-1 ()
  "One Up"
  (interactive)
  (pr-ps-buffer-preview 1)
  )



;; (blee:visibility:this:kbd-help)
(defun blee:visibility:this:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-function 'blee:visibility:this:kbd-desc)
  )

;; (blee:visibility:this:kbd-desc)
(defun blee:visibility:this:kbd-desc ()
  "
       ByStar Libre Emacs Environment (BLEE)
             <F7> and <F8> Kbd Prefix

The following basic commands are globally available.

            <F7> This Frame, Window, Buffer
  -------------------------------------------
  <f7><f7>		shell
  \\[bxi:shell1]  	shell 1
  ...
  \\[bxi:shell9]  	shell 9

  ;;;  Recent File
\\[my-open-recent-file]

  ;;;  Buffers
\\[iswitchb-buffer]

  ;;;  Bookmark -- Favorites
\\[bookmark-jump]
\\[bookmark-set]

  ;;; BEGIN BUFFER PROCESSORS

  ;;;  Dynamic Block
\\[org-dblock-update]
\\[org-dblock-update-buffer-bx]

  ;;;  Folding Mode
\\[folding]

  ;;;  Outline Mode
\\[outline-mode]

  ;;;  Insert
\\[bx:finsert:moded-insert]
\\[bx:finsert:lang-insert]

  ;;; BEGIN FRAME PROCESSORS

\\[other-frame]
\\[bxi:other-frame-2]

                HELP
  ---------------------------------------
  \\[blee:visibility:this:kbd-desc]	Describe KBD Input Method
  \\[blee:visibility:this:help]		Module's Help
"
  (interactive)
  )


;; (blee:visibility:other:kbd-help)
(defun blee:visibility:other:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-function 'blee:visibility:other:kbd-desc)
  )

;; (blee:visibility:other:kbd-desc)
(defun blee:visibility:other:kbd-desc ()
  "
       ByStar Libre Emacs Environment (BLEE)
              <F8> Kbd Prefix

The following basic commands are globally available.

            <F8> Other Frame, Window, Buffer
  -------------------------------------------
  <f8><f8>		other

                HELP
  ---------------------------------------
  \\[blee:visibility:other:kbd-desc]	Describe KBD Input Method
  \\[blee:visibility:other:help]		Module's Help
"
  (interactive)
  )


;; (blee:visibility:help)
(defun blee:visibility:help ()
  ""
  (interactive)
  (with-output-to-temp-buffer (help-buffer)
    ;;;(print standard-output) ;; example
    ;;(save-excursion
      (switch-to-buffer (help-buffer))
      ;;(toggle-read-only)
      (goto-char (point-max))
      (insert "
blee:visibility:help

Someday, someone should write real text for help,
For now, there are these lispish notes.
\n")

      (goto-char (point-max))
      (insert "bx:visibility:bilang-par:\n")
      (pp-eval-expression '(symbol-plist 'bx:visibility:bilang-par))
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (insert "bx:visibility:lang-par:\n")
      (pp-eval-expression '(symbol-plist 'bx:visibility:lang-par))
      (insert-buffer "*Pp Eval Output*")

      (kill-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (insert "And Now for something different \n")
      (goto-char (point-min))
      ;;)
      ))


(defun comintPlus-editInput (arg)
  (interactive "p")
  (setq debug-on-error t)
  (comint-kill-whole-line 0)
  (end-of-buffer)
  (yank)
  )


(defun comintPlus-sendInput (arg)
  (interactive "p")
  (setq debug-on-error t)
  (comint-kill-whole-line 0)
  (end-of-buffer)
  (yank)
  ;;(comint-send-input t)
  (comint-send-input)
  )



(provide 'bx-visibility-menu)
