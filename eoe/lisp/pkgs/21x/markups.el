;

(defalias 'latex-index-word
  (read-kbd-macro "ESC b ESC d C-y \\index{ C-y }"))

(defalias 'latex-index-region
  (read-kbd-macro "C-w C-y \\index{ C-y }"))

;;(define-key global-map [(f11)] 'latex-index-word)
(define-key global-map [(f1)] 'latex-index-word)

;;(define-key global-map [(f12)] 'latex-index-region)
(define-key global-map [(f6)] 'latex-index-region)