;; 
;; bystar-mail-lib.el
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:w3m:all-defaults-set)
;;
;; bystar:w3m               -- Gnus++, --Gnus

;;; requires
;;; ########

(require 'w3m)


;; (bystar:w3m:all-defaults-set)
(defun bystar:w3m:all-defaults-set ()
  ""
  (interactive)


;;;------------------------------------------------
;;;  W3m 
;;;------------------------------------------------



(setq w3m-key-binding 'info)
(setq w3m-search-default-engine "google")
(setq w3m-fill-column 100)
(setq w3m-use-cookies t)

; Select a better coding system to display umlauts correctly
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(add-hook 'w3m-mode-hook
          '(lambda()
             (define-key w3m-mode-map [?w] 'w3m-copy-link)
             (define-key w3m-mode-map [(meta ?c)] 'w3m-print-current-url)))
;(setq w3m-async-exec nil)

;(eval-after-load "w3m"
; '(progn
;    (unless w3m-icon-directory
;      (setq w3m-icon-directory (concat emacs-site-lisp-directory "w3m/icons")))

;    ;; w3m-minor-mode-map is active when showing html articles in gnus
;    ;; w3m-minor-mode-map is not active, when 
;mm-inline-text-html-with-w3m-keymap is nil
;    (define-key w3m-minor-mode-map "\C-m" 'w3m-view-url-with-external-browser)
;    (define-key w3m-minor-mode-map [mouse-2] 
;'w3m-view-url-with-external-browser)

    (require 'w3m-search)
    (add-to-list 'w3m-search-engine-alist
                 '("emacs-wiki" 
"http://www.emacswiki.org/cgi-bin/wiki.pl?search=%s"))
    (add-to-list 'w3m-search-engine-alist
                 '("leo" "http://dict.leo.org/?search=%s"))

    ;; Make the previous search engine the default for the next search.
    (defadvice w3m-search (after change-default activate)
      (let ((engine (nth 1 minibuffer-history)))
        (when (assoc engine w3m-search-engine-alist)
          (setq w3m-search-default-engine engine))))


  (message "bystar:w3m:defaults-set -- Done." )
  )


(provide 'bystar-w3m-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
