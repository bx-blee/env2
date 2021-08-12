;; 
;; bystar-all.el
;; 

(defun bystar-all ()
  "bystar setting for all"
  (interactive)
  (setq bystarAcctsList '())
  (require 'bystar-this-acct)
  (add-to-list 'bystarAcctsList  'bystar-this-acct)
)
  
(provide 'bystar-all)  
