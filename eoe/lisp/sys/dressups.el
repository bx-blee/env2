;;;; -*-Emacs-Lisp-*- 

;;(setq debug-on-error t)
;;(setq debug-on-error nil)

;;; -----------------------------------------------------------------
;;; XEmacs initial fonts and faces setup
;;; -----------------------------------------------------------------
;; eoe uses dark background
(defconst eoe-background-mode 'dark "EOE uses dark background.")

(defun eoe-set-font (std-font)
  "Set all defined faces to use STD-FONT as it's font.
If STD-FONT is not specified or nil, `eoe-font' is used."
  (cond ((eq *eoe-emacs-type* '19x)
	 (mapcar '(lambda (face)
		    (set-face-font face (or std-font eoe-font)))
		 (face-list)))
	((eq *eoe-emacs-type* '21x)
	 (mapcar '(lambda (face)
		    (set-face-font face (or std-font eoe-font)))
		 (face-list)))
	((and (eq *eoe-emacs-type* '19f)
	      (member window-system '(x win32)))
	 (set-default-font (or std-font eoe-font)))))


;(eoe-dressup-font-auto)
(defun eoe-dressup-font-auto ()
  ;; NOTYET, xemacs specific in fsf it is win32
  (setq eoe-font (cond ((eq window-system 'x)
			;"-b&h-lucidatypewriter-medium-r-normal-sans-10-140-75-75-m-60-iso8859-1")
			"-*-Lucidatypewriter-medium-r-*-*-*-160-*-*-*-*-iso8859-*")
			;"10x20")
			;"-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1")
		       ((eq window-system 'mswindows)
			"-*-Fixedsys-normal-r-*-*-13-97-*-*-c-*-*-ansi-"))))

;"EOE does syntax highlighting with colors instead of fonts.  
;Some nice fonts to use as eoe-font for X are:
;  8x13bold  (aka -misc-fixed-bold-r-normal--13-120-75-75-c-80-iso8859-1)
;  10x20     (aka -misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1)
;Some nice fonts to use as eoe-font for Windows are:
; -*-Lucida Console-normal-r-*-*-19-142-*-*-c-*-*-ansi-
; -*-Fixedsys-normal-r-*-*-13-97-*-*-c-*-*-ansi-
;"
;


;;;(eoe-dressup-auto)

(defun eoe-dressup-auto ()
  "Select natural dressup mode"
  ;; 
  (cond
   ((and (string-match "XEmacs" emacs-version)
	 (boundp 'emacs-major-version)
	 (= emacs-major-version 21)
	 (>= emacs-minor-version 1))
    (cond ((eq window-system 'x)
	   (eoe-dressup-font-auto)
	   (eoe-colors-black-and-green-21x-xwin)
	   )
	  ((eq window-system 'mswindows)
	   (eoe-dressup-font-auto)
	   (eoe-colors-black-and-green-21x-win32)
	   )
	  (t
	   (message "UnKnown Window System")
	   ))
    )
   (t
    (message "UnKnown Dress Up")
    )
   )
  )

(defun eoe-colors-black-and-green-21x-win32 ()
  "Dressup: black-and-green-21x-win32."
					;(message "Dressup: black-and-green-21x-win32")
  (eoe-colors-black-and-green-21x-xwin))


(defun eoe-colors-black-and-green-21x-xwin ()
  "Dressup: black-and-green-21x-xwin."
					;(message "Dressup: black-and-green-21x-xwin")
  
  ;; ---------------------
  ;; basic faces overrides
  ;; ---------------------
  (set-face-foreground 'default '((global (nil . "green"))))
  (set-face-background 'default '((global (nil . "black"))))
  (set-face-foreground 'modeline '((global (nil . "black"))))
  (set-face-background 'modeline '((global (nil . "gray"))))
  (custom-set-faces '(bold ((t (:foreground "yellow" :size "16" :bold nil))) t))
  (custom-set-faces '(italic ((t (:foreground "orange" :size "16"))) t))
  (custom-set-faces '(bold-italic ((t (:foreground "white" :size "16"))) t))

  (set-face-foreground 'highlight '((global (nil . "white"))))
  (set-face-background 'highlight '((global (nil . "blue"))))
  (set-face-foreground 'primary-selection '((global (nil . "black"))))
  (set-face-foreground 'secondary-selection '((global (nil . "black"))))
  (set-face-foreground 'isearch '((global (nil . "black"))))
  (set-face-foreground 'zmacs-region '((global (nil . "black"))))
  ;; ------------------------
  ;; list-mode face overrides
  ;; ------------------------
  (set-face-foreground 'list-mode-item-selected '((global (nil . "black"))))

  ;; ---------------------
  ;; comint face overrides
  ;; ---------------------
  (require 'comint-xemacs)
  (set-face-foreground 'comint-input-face '((global (nil . "yellow"))))
  ;; --------------------
  ;; dired face overrides
  ;; --------------------
  (require 'dired)
  (set-face-foreground 'dired-face-permissions '((global (nil . "green"))))
  (set-face-background 'dired-face-permissions '((global (nil . "black"))))
  (set-face-foreground 'dired-face-executable '((global (nil . "palegreen"))))
  (set-face-foreground 'dired-face-directory '((global (nil . "yellow"))))
  (set-face-foreground 'dired-face-boring '((global (nil . "green"))))
  (custom-set-faces  '(dired-face-directory ((t nil))))

  ;; ------------------------
  ;; font-lock face overrides
  ;; ------------------------
  (require 'font-lock)
  (set-face-foreground 'font-lock-variable-name-face '((global (nil . "LightBlue"))))
  ;;(set-face-foreground 'font-lock-function-name-face '((global (nil . "Cyan"))))
  (set-face-foreground 'font-lock-doc-string-face '((global (nil . "Khaki"))))
  (set-face-foreground 'font-lock-string-face '((global (nil . "Khaki"))))
  (set-face-foreground 'font-lock-type-face '((global (nil . "Orange"))))
  (set-face-foreground 'font-lock-keyword-face '((global (nil . "LightGray"))))
  (set-face-foreground 'font-lock-preprocessor-face '((global (nil . "Yellow"))))
  (set-face-foreground 'font-lock-reference-face '((global (nil . "PaleTurquoise"))))
  (custom-set-faces  '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Pink")))))
  (custom-set-faces '(font-lock-comment-face ((((class color) (background light)) (:foreground "yellow")))))
  ;; ----------------------
  ;; message face overrides
  ;; ----------------------
  (require 'message)
  (require 'highlight-headers)
  ;;(set-face-foreground 'message-separator-face '((global (nil . "white"))))
  (set-face-foreground 'message-headers '((global (nil . "yellow"))))
  (set-face-foreground 'message-header-contents '((global (nil . "orange"))))
  ;;(set-face-foreground 'message-header-xheader-face '((global (nil . "green"))))
  ;;(set-face-foreground 'message-header-name-face '((global (nil . "green"))))
  ;;(set-face-foreground 'message-header-cc-face '((global (nil . "green"))))
  (custom-set-faces '(message-header-subject-face ((((class color) (background light)) (:foreground "yellow")))))
  (set-face-foreground 'message-highlighted-header-contents '((global (nil . "white"))))
  (custom-set-faces  '(message-headers ((t nil))))
  (custom-set-faces  '(message-header-to-face ((((class color) (background dark)) (:foreground "green2")))))
  (custom-set-faces  '(message-header-cc-face ((((class color) (background dark)) (:foreground "green4")))))
  (custom-set-faces  '(message-header-newsgroups-face ((((class color) (background dark)) (:foreground "yellow")))))
  (custom-set-faces  '(message-url ((t (:foreground "white")))))

  ;; ---------------
  ;; gui-button-face
  ;; ---------------
  (and (fboundp 'make-face) (make-face 'gui-button-face))
  (set-face-foreground 'gui-button-face "red")
  (set-face-background 'gui-button-face "black")

  (custom-set-faces  '(custom-button-face ((t nil))))
  (custom-set-faces  '(custom-variable-button-face ((t nil))))
  (custom-set-faces  '(widget-button-face ((t nil))))

  ;; -------------------
  ;; gnus face overrides
  ;; -------------------
  (require 'gnus-art)
  ;;(set-face-foreground 'gnus-header-from-face '((global (nil . "SpringGreen"))))
  ;;(set-face-foreground 'gnus-header-subject-face '((global (nil . "white"))))
  ;;(set-face-foreground 'gnus-header-newsgroups-face '((global (nil . "SeaGreen3"))))
  ;;(set-face-foreground 'gnus-header-name-face '((global (nil . "yellow"))))
  ;;(set-face-foreground 'gnus-header-content-face '((global (nil . "orange"))))
  ;;(set-face-foreground 'gnus-summary-selected-face '((global (nil . "yellow"))))
  ;;(set-face-underline-p 'gnus-summary-selected-face nil)



  (custom-set-faces  '(gnus-summary-high-ancient-face ((((class color) (background dark)) (:foreground "SkyBlue")))))
  (custom-set-faces  '(gnus-summary-high-read-face ((((class color) (background dark)) (:foreground "PaleGreen")))))
  (custom-set-faces  '(gnus-summary-high-unread-face ((t nil))))
  (custom-set-faces  '(gnus-summary-high-ticked-face ((((class color) (background dark)) (:foreground "pink")))))

  (custom-set-faces  '(gnus-group-mail-1-face ((((class color) (background dark)) (:foreground "aquamarine1")))))
  (custom-set-faces  '(gnus-group-mail-2-face ((((class color) (background dark)) (:foreground "aquamarine2")))))
  (custom-set-faces  '(gnus-group-mail-3-face ((((class color) (background dark)) (:foreground "aquamarine3")))))
  (custom-set-faces  '(gnus-group-mail-low-face ((((class color) (background dark)) (:foreground "aquamarine4")))))
  (custom-set-faces  '(gnus-group-news-1-face ((((class color) (background dark)) (:foreground "PaleTurquoise")))))
  (custom-set-faces  '(gnus-group-news-2-face ((((class color) (background dark)) (:foreground "turquoise")))))
  (custom-set-faces  '(gnus-group-news-3-face ((((class color) (background dark)) nil))))
  (custom-set-faces  '(gnus-group-news-4-face ((((class color) (background dark)) nil))))
  (custom-set-faces  '(gnus-group-news-5-face ((((class color) (background dark)) nil))))
  (custom-set-faces  '(gnus-group-news-6-face ((((class color) (background dark)) nil))))
  (custom-set-faces  '(gnus-group-news-low-face ((((class color) (background dark)) (:foreground "DarkTurquoise")))))
  (custom-set-faces  '(gnus-emphasis-bold ((t nil))))
  (custom-set-faces  '(gnus-emphasis-underline-bold-italic ((t nil))))
  (custom-set-faces  '(gnus-emphasis-underline-bold ((t nil))))
  (custom-set-faces  '(gnus-emphasis-bold-italic ((t nil))))

  ;; --------------------
  ;; shell face overrides
  ;; --------------------
  (require 'shell)
  ;;
  ;; -------------------------
  ;; shell-font face overrides
  ;; -------------------------
  (require 'shell-font)
  ;(set-face-foreground 'shell-input '((global (nil . "yellow"))))
  ;(set-face-foreground 'shell-prompt '((global (nil . "white"))))
  ;(custom-set-faces  '(shell-prompt ((((class color) (background dark)) (:foreground "yellow")))))
  ;(custom-set-faces  '(shell-prompt ((t nil))))
  ;(custom-set-faces  '(shell-input ((t nil))))

  (custom-set-faces '(shell-input (
        (t (:foreground "white" :size "16" :bold nil))) t))
  (custom-set-faces '(shell-prompt (
        (t (:foreground "yellow" :size "16" :family "lucida" :bold nil :italic nil))) t))


  ;(set-face-font 'shell-input "10x20")
  ;(set-face-font 'shell-prompt "10x20")
  ;(set-face-font 'shell-output "10x20") ;; NOTYET no font changes, just colors
  (set-face-foreground 'shell-output "green")
  (set-face-foreground 'shell-output-face '((global (nil . "white"))))
  (set-face-foreground 'shell-output-2-face '((global (nil . "white"))))
  (set-face-foreground 'shell-output-3-face '((global (nil . "white"))))
  (set-face-foreground 'shell-prompt-face '((global (nil . "white"))))

  ;(custom-set-faces '(shell-prompt ((t (:foreground "white" :italic nil :bold nil))) t)

  ;; --------------------
  ;; dict face overrides
  ;; --------------------
  (custom-set-faces  '(dict-word-entry-face ((t nil))))

  ;; --------------------
  ;; info face overrides
  ;; --------------------
  (custom-set-faces  '(info-xref ((t (:foreground "yellow")))))
  (custom-set-faces  '(info-node ((t (:foreground "white")))))

  ;; --------------------
  ;; bbdb face overrides
  ;; --------------------
  (custom-set-faces '(bbdb-company ((t (:foreground ""))) t))
  (custom-set-faces '(bbdb-field-name ((t (:foreground "yellow" :size "16"))) t))


  ;; ----------------------------
  ;; hyper-apropos face overrides
  ;; ----------------------------
  (custom-set-faces  '(hyper-apropos-heading ((t (:foreground "white")))))
  (custom-set-faces  '(hyper-apropos-section-heading ((t (:foreground "white")))))
  (custom-set-faces  '(hyper-apropos-major-heading ((t (:foreground "yellow")))))
  (custom-set-faces  '(hyper-apropos-warning ((t (:foreground "red")))))

  ;; ------------------
  ;; man face overrides
  ;; ------------------
  (custom-set-faces  '(man-bold ((t (:foreground "yellow")))))
  (custom-set-faces  '(man-heading ((t (:foreground "white")))))
  (custom-set-faces  '(man-xref ((t (:foreground "orange")))))
  (custom-set-faces  '(man-italic ((t (:foreground "red")))))

  ;; -----------------
  ;; gui face override
  ;; -----------------
  (custom-set-faces  '(gui-element ((t nil)) t))

  )



(provide 'dressups)

