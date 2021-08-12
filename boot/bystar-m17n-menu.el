;;;
;;;


(require 'bx-lib)
(require 'easymenu)

(setq blee:m17n:supported-languages (list "eng" "fra" "far" "ara" "chi" ))

;;;
;;; Setable/Configurable Parameters
(setq blee:m17n:langs:sp: "Setable Parameters")

(put 'blee:m17n:langs:sp: 'primary 'blee:m17n:language:eng:)
(put 'blee:m17n:langs:sp: 'secondary 'blee:m17n:language:far:)
(put 'blee:m17n:langs:sp: 'current (get 'blee:m17n:langs:sp: 'primary))
(put 'blee:m17n:langs:sp: 'other (get 'blee:m17n:langs:sp: 'secondary))

(put 'blee:m17n:langs:sp: 'spelling-dict "american")
(put 'blee:m17n:langs:sp: 'dict-prim-dict  "local:eng-eng")
(put 'blee:m17n:langs:sp: 'dict-prim-sec  "local:eng-fra")
(put 'blee:m17n:langs:sp: 'dict-prim-thesarus  "local:eng-eng")
(put 'blee:m17n:langs:sp: 'dict-prim-sec-full  "local:eng-eng")
(put 'blee:m17n:langs:sp: 'kbd-prim  "")
(put 'blee:m17n:langs:sp: 'kbd-sec   "local:eng-eng")

;;;
;;; Languages
;;;

;;;
;;; English
;;;
(setq blee:m17n:language:eng: "English Language")
(put 'blee:m17n:language:eng: 'name "english")
(put 'blee:m17n:language:eng: 'name-tag3 "eng")
(put 'blee:m17n:language:eng: 'lang-env-func 'bx-english-env)

;;;
;;; Farsi
;;;
(setq blee:m17n:language:far: "Farsi Language")
(put 'blee:m17n:language:far: 'name "farsi")
(put 'blee:m17n:language:far: 'name-tag3 "far")
(put 'blee:m17n:language:far: 'lang-env-func 'bx-farsi-env)

;;;
;;; French
;;;
(setq blee:m17n:language:fra: "French Language")
(put 'blee:m17n:language:fra: 'name "french")
(put 'blee:m17n:language:fra: 'name-tag3 "fra")
(put 'blee:m17n:language:fra: 'lang-env-func 'bx-french-env)


(defun blee:m17n:langs:current-name-tag3 ()
  ""
  (format "%s" (get (get 'blee:m17n:langs:sp: 'current) 'name-tag3)))

(defun blee:m17n:langs:other-name-tag3 ()
  ""
  (format "%s" (get (get 'blee:m17n:langs:sp: 'other) 'name-tag3)))


(defun blee:m17n:langs:sp:help ()
  ""
  (interactive)
  (bx:symbols-list-value-in-help (list
				  'blee:m17n:langs:sp: 
				  'blee:m17n:language:eng:
				  'blee:m17n:language:fra: 
				  'blee:m17n:language:far:))
  )


;;;
;;; Global Multi-lingualization Menu
;;;

;; (blee:blee:menu)
;; (bystar:m17n-global:menu)
(defun bystar:m17n-global:menu ()
  (easy-menu-define 
    m17n-menu 
    nil 
    "Global M17N Menu"
    '("Language(s) -- M17n"
      "---"
      ["Current Parameters and Status" (blee:m17n:langs:sp:help) t]  
      "---"
      ["Toggle Environment" blee:m17n:toggle-prim-sec t]
      ["Toggle Keyboard" bx-toggle-kbd t]
      "---"
      ["Spell Complete Word" ispell-complete-word t]
      ["Spell Check Word" ispell-word t]
      ["Dictionary Word" dictem-dictionary-define-at-point-bx t]
      ["Thesaurus Word" dictem-thesarus-define-at-point-bx t]
      ["Translate/Interpret Word" dictem-interpret-define-at-point-bx t]
      "---"
      ["يک طرفه -- bidi off" bidi-display-reordering-off t]
      ["دو طرفه -- bidi on" bidi-display-reordering-on t]
      "---"
      ("Globish/English"
       ;;["Select Secondary Language" (blee:m17n:lang-set "eng" "far") t]
       ["Select Secondary Language" (blee:m17n:sec-lang-set "eng") t]
       ["Set Environment" bx-english-env t]
       ["Show Environment" bx-notyet t]
       ["Set Spelling Dictionary" bx-notyet t]
       ["Word Dictionaries" bx-notyet t]
       ) 
      "---"
      ("فارسی -- Farsi/Persian"
       ["Select Secondary Language -- انتخاب زبان دوم" bx-notyet t]
       ["Set Environment -- انتخاب محيط" bx-farsi-env t]
       ["Describe Environment -- شرح محيط" bx-notyet t]
       ["Spelling Dictionary -- لقت نامه ديکته" bx-notyet t]
       ["Set Word Dictionaries -- لقت نامها" bx-notyet t]
       ["Farsi Translit Keyboard -- صفحه کليد لاتين-فارسى" bx-farsi-translit-kbd t]
       ["Describe Farsi Trasnlit Keyboard -- شرح صفحه کليد لاتين-فارسى"  bx-farsi-translit-kbd-describe t]
       ["Iranian Keyboard -- صفحه کليد ايرانى" bx-notyet t]
       ["Describe Iranian Keyboard --  شرح صفحه کليد ايرانى" bx-notyet t]
       )
      "---"
      ("عربى -- Arabic"
       ["Select Secondary Language -- انتخاب زبان دوم" bx-notyet t]
       ["Set Environment -- انتخاب محيط" bx-arabic-env t]
       ["Describe Environment -- شرح محيط" bx-notyet t]
       ["Spelling Dictionary -- لقت نامه ديکته" bx-notyet t]
       ["Set Word Dictionaries -- لقت نامها" bx-notyet t]
       ["Arabic Keyboard -- صفحه کليد عربى" bx-arabic-kbd t]
       ["Describe Arabic Keyboard --  شرح صفحه کليد عربى" bx-arabic-kbd-describe t]
       )
      "---"
      ("Chinese --中 文"
       ["Spelling Dictionaries" m17n-playlist-current-clear t]
       ["English Dictionaries" m17n-add-directory-tree-bx t]
       )
      "---"
      ("Français -- French"
       ["Spelling Dictionaries" m17n-playlist-current-clear t]
       ["English Dictionaries" m17n-add-directory-tree-bx t]
       )
      "---"
      ("ByStar Music Help/Documentation"
       ["M17N (F6) Keyboard  Help" blee:m17n:kbd-help t]
       ["Language(s) -- M17N Help" blee:m17n:help t]
       ["Help: Music" bystar:music:doc:howto:all-help t]
       )
      ))
  )

;; Done in blee-menu-top.el 
;;(easy-menu-add-item nil '("Blee") 'm17n-menu "Blee Help")

;; describe

;; (bystar:m17n-global:keybd)  -- invoked in translate
(defun bystar:m17n-global:keybd ()
  ""
  ;;(interactive)
  (define-key global-map [(f6)] nil)

  (define-key global-map [(f6) (f6) ] 'blee:m17n:toggle-prim-sec)
  (define-key global-map [(f6) (c)  ] 'ispell-complete-word)
  (define-key global-map [(f6) (=)  ] 'ispell-word)
  (define-key global-map [(f6) (d)  ] 'dictem-dictionary-define-at-point-bx)
  (define-key global-map [(f6) (t)  ] 'dictem-thesarus-define-at-point-bx)
  (define-key global-map [(f6) (i)  ] 'dictem-interpret-define-at-point-bx)

  (define-key global-map [(f6) (p)  ] 'dictem-run-define) ;; Prompt For Dictionary
  (define-key global-map [(f6) (s)  ] 'dictem-run-search)
  (define-key global-map [(f6) (m)  ] 'dictem-run-match)
  (define-key global-map [(f6) (/)  ] 'flip-env-primary-secondary-bx)
  (define-key global-map [(f6) (\\) ] 'flip-kbd-primary-secondary-bx)
  (define-key global-map [(f6) (e)  ] 'describe-environment)
  ;;(define-key global-map [(f6) (\1)  ] 'set-primary-langauge)
  ;;(define-key global-map [(f6) (\2)  ] 'set-secondary-langauge)
  (define-key global-map [(f6) (\1)  ] 'bidi-display-reordering-off)
  (define-key global-map [(f6) (\2)  ] 'bidi-display-reordering-on)
  (define-key global-map [(f6) (k)  ] 'set-input-method)
  (define-key global-map [(f6) (r)  ] 'describe-input-method-bx)  ;; Reference
  (define-key global-map [(f6) (\>)  ] 'bidi-paragraph-left-to-right)
  (define-key global-map [(f6) (\<)  ] 'bidi-paragraph-right-to-left)
  (define-key global-map [(f6) (\?)  ] 'blee:m17n:kbd-desc)
  (define-key global-map [(f6) (h)  ] 'blee:m17n:kbd-help)

  ;; Useless Obsoleted -- (define-key global-map [(f6) (f)  ] 'dictem-full-define-at-point-bx)

 ;;
  (define-key global-map [(f6) (f) (e) ]  'bystar:spellcheck:enable-flyspell-mode)
  (define-key global-map [(f6) (f) (d) ]  'bystar:spellcheck:disable-flyspell-mode)
  (define-key global-map [(f6) (f) (t) ]  'bystar:spellcheck:toggle-flyspell-mode)


 ;;
  (define-key global-map [(f6) (w) (r) ]  'langtool-check)   ;; Buffer or Region
  (define-key global-map [(f6) (w) (q) ]  'langtool-check-done)
  (define-key global-map [(f6) (w) (l) ]  'langtool-switch-default-language)
  (define-key global-map [(f6) (w) (s) ]  'langtool-show-message-at-point)
  (define-key global-map [(f6) (w) (c) ]  'langtool-correct-buffer)

;;
  (define-key global-map [(f6) (D) (b) ]  'diction-buffer)   ;; Buffer
  (define-key global-map [(f6) (D) (r) ]  'diction-region)
  (define-key global-map [(f6) (D) (c) ]  'diction-output-bx)

  ;; (define-key global-map [(control f6)] 'dictem-run-define)
  ;; (define-key global-map [(meta f6)] 'latex-index-words)
)



(defun diction-output-bx ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (switch-to-buffer (get-buffer "*Diction-Output*"))
  )


;; (blee:m17n:kbd-help)
(defun blee:m17n:kbd-help ()
  "Display a  help"
  (interactive)
  (describe-function 'blee:m17n:kbd-desc)
  )

;; (blee:m17n:kbd-desc)
(defun blee:m17n:kbd-desc ()
  "
       ByStar Libre Emacs Environment (BLEE)
               <F6> Kbd Prefix
 
The following basic commands are globally available.

                 SPELL CHECKER
  ---------------------------------------
  <f6><f6>	ispell-word
  \\[ispell-complete-word]	ispell-complete-word


                 DICTIONARY
  ---------------------------------------
  \\[dictem-dictionary-define-at-point-bx]	Dictionary (at point)
  \\[dictem-thesarus-define-at-point-bx]	Thesarus (at point)
  \\[dictem-interpret-define-at-point-bx]	Interpret/Translate to 2nd Lang (at point)
  \\[dictem-full-define-at-point-bx]	Full Definition -- All dictionaries (at point)

  \\[dictem-run-define]	Definition -- Prompt For Everything
  \\[dictem-run-search]	Search -- Prompt For Everything
  \\[dictem-run-match]	Match -- Prompt For Everything


  PRIMARY/SECONDARY LANGUAGE ENVIRONMENTS
  ---------------------------------------
  \\[dictem-thesarus-define-at-point-bx]	(e) - Describe Environment
  \\[dictem-interpret-define-at-point-bx]	(1) - Set Primary Environment
  \\[dictem-full-define-at-point-bx]	(2) - Set Secondary Envieonment
  \\[dictem-full-define-at-point-bx]	Flip Primary-Secondary Environment


              KEYBOARD
  ---------------------------------------
  \\[describe-input-method-bx]	Describe KBD Input Method (r for reference)
  \\[set-input-method]	Set Kbd Input Method -- Prompt For Everything
  \\[dictem-full-define-at-point-bx]	Flip Primary-Secondary Kbd

                HELP
  ---------------------------------------
  \\[blee:m17n:kbd-desc]	Describe KBD Input Method
  \\[blee:m17n:help]	Module's Help


"
  (interactive)
  )


(defun describe-input-method-bx ()
  (interactive)
  (describe-input-method nil)
  )

;; 
(defun m17n-menu-help ()
  (interactive)
  (message "m17n-menu-help NOTYET")
  )

(defun bx-notyet ()
  (interactive)
  (message "bx-notyet NOTYET")
  )


;; (bidi-display-reordering-on)
(defun bidi-display-reordering-on ()
  (interactive)
  (setq bidi-display-reordering t)
  (recenter)
  )

;; (bidi-display-reordering-off)
(defun bidi-display-reordering-off ()
  (interactive)
  (setq bidi-display-reordering nil)
  (recenter)
  )

;; (bidi-paragraph-right-to-left)
(defun bidi-paragraph-right-to-left ()
  (interactive)
  (setq bidi-paragraph-direction 'right-to-left)
  )


;; (bidi-paragraph-left-to-right)
(defun bidi-paragraph-left-to-right ()
  (interactive)
  (setq bidi-paragraph-direction 'left-to-right)
  )

;; 
(defun bx-toggle-kbd ()
  (interactive)
  (toggle-input-method)
  )

;
;; 
(defun bx-farsi-translit-kbd ()
  (interactive)
  (set-input-method 'farsi-transliterate-banan)
  )


;; 
(defun bx-farsi-translit-kbd-describe ()
  (interactive)
  (describe-input-method 'farsi-transliterate-banan)
  )

; 
(defun bx-arabic-kbd ()
  (interactive)
  (set-input-method 'arabic)
  )


;; 
(defun bx-arabic-kbd-describe ()
  (interactive)
  (describe-input-method 'arabic)
  )


(defun blee:m17n:toggle-prim-sec ()
  ""
  (interactive)
  (let (
	(cur-lang (get 'blee:m17n:langs:sp: 'current))
	(prim-lang (get 'blee:m17n:langs:sp: 'primary))
	(sec-lang (get 'blee:m17n:langs:sp: 'secondary))
	(new-cur-lang)
	(new-other-lang)
	)
    (if (equal cur-lang prim-lang)
	(progn
	  (setq new-cur-lang sec-lang)
	  (setq new-other-lang prim-lang)
	  )
      (progn
	(setq new-cur-lang prim-lang)
	(setq new-other-lang sec-lang)
	)
      )
    (put 'blee:m17n:langs:sp: 'current new-cur-lang)
    (put 'blee:m17n:langs:sp: 'other new-other-lang)
    (message (format "%s" new-cur-lang))
    )
  (funcall (get (get 'blee:m17n:langs:sp: 'current) 'lang-env-func))
  )



;; 
(defun bx-english-env ()
  (interactive)
  (set-input-method nil)
  ;;(setq bidi-display-reordering nil)
  (ispell-change-dictionary "american")
  (message "Language Environment Set To: English")
  )

;; 
(defun bx-farsi-env ()
  (interactive)
  ;;(set-input-method 'arabic)
  (set-input-method 'farsi-transliterate-banan)
  (setq bidi-display-reordering t)
  (ispell-change-dictionary "farsi")
  (message "Language Environment Set To: Farsi")
  )

;;;
;;; TO BE CLEANED
;;;


(defun blee:m17n:sec-lang-set (primary-lang)
  "Get Secondary Languages"
  (interactive)

  (setq blee:m17n:langs:sp:lang-primary primary-lang)


  (setq blee:m17n:langs:sp:lang-secondary 
	(get-secondary-language
	 (format "Primary Language=%s -- Secondary Langauge: " blee:m17n:langs:sp:lang-primary)
	 ))

  (blee:m17n:lang-set blee:m17n:langs:sp:lang-primary blee:m17n:langs:sp:lang-secondary)
  )

(defun blee:m17n:lang-set (primary-lang secondary-lang)
  "Set Primary And Secondary Languages"
  (interactive)

  (setq blee:m17n:langs:sp:lang-primary primary-lang)
  (setq blee:m17n:langs:sp:lang-secondary secondary-lang)  

  ;;(message "%s -- %s" blee:m17n:langs:sp:lang-primary blee:m17n:langs:sp:lang-secondary)
  
  (setq bx:m17n:env-set-func  'bx-english-env)
  (funcall bx:m17n:env-set-func)
  )


(provide 'bystar-m17n-menu)
