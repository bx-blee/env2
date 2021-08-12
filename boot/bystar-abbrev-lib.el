;; 
;; bystar-mail-lib.el
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:abbrev:all-defaults-set)
;;
;; bystar:abbrev 

;;;------------------------------------------------
;;;  Abbrev 
;;;------------------------------------------------

;;; TODO -- 
;;;   Look into abbrev-stream.el 
;;;  

;; (bystar:abbrev:all-defaults-set)
(defun bystar:abbrev:all-defaults-set ()
  ""
  (interactive)

;; 
  
;;-------------------------------------------
 ;; ensure abbrev mode is always on
 (setq-default abbrev-mode t)
 ;; do not bug me about saving my abbreviations
 (setq save-abbrevs nil)
 ;; load up abbrevs for these modes
 (require 'msf-abbrev)
 (setq msf-abbrev-verbose t) ;; optional
 (setq msf-abbrev-root "/libre/common/bue/emacs/templates/moded-abbrevs")
 (global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
 (global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
 (msf-abbrev-load)
)


(provide 'bystar-abbrev-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:

