;; 
;; bystar-start.el
;; 

(if (file-directory-p (expand-file-name "~/BUE/elisp"))
    (require 'bystar-all)
  (require 'bystar-all-nobody))


(bystar-all)

;;; 1) Walkthrough 'bystarAcctsList
;;; (funcall (intern "message") "123")
;;;  (symbol-name 'bbdb) opposit of intern

 (let ((bystarAccts bystarAcctsList))
    (while bystarAccts
      (funcall (car bystarAccts))
      ;(message bystar-cp_LastName)
      ;(sleep-for 1)
      ;(ding)
      (setq bystarAccts (cdr bystarAccts))))

    
(defvar bystar-acct-profile-buffer "*BYSTAR-ACCT PROFILE*" "BYSTAR-ACCT PROFILE buffer name.")
;; (setq bystar-acct-profile-buffer "*BYSTAR-ACCT PROFILE*")

(defun bystar-acct:current-show ()
  "Set up a buffer for showing BYSTAR-ACCT PROFILE"
  (interactive)
  (let ((buffer-name (generate-new-buffer-name bystar-gnus-profile-buffer)))
    (switch-to-buffer buffer-name)
    (insert "BYSTAR-ACCT PROFILE\n")
    (insert "============================================\n")
    (insert (format "bystar-cp_LastName:\t %s\n" bystar-cp_LastName))
    (insert "============================================\n")
    ))               
    
(provide 'bystar-start)


;;; Example of only do if file is readable
;; for bystar-all ...
;; 

;; (let ((startup-file "/usr/share/emacs/site-lisp/debian-startup.el"))
;;     (if (and (or (not (fboundp 'debian-startup))
;; 		 (not (boundp  'debian-emacs-flavor)))
;; 	     (file-readable-p startup-file))
;; 	(progn
;; 	  (load-file startup-file)
;; 	  (setq debian-emacs-flavor 'emacs)
;; 	  (debian-startup debian-emacs-flavor)
;; 	  (mapcar '(lambda (f)
;; 		     (and (not (string= (substring f -3) "/.."))
;; 			  (file-directory-p f) 
;; 			  (add-to-list 'load-path f)))
;; 		  (directory-files "/usr/share/emacs/site-lisp" t)))))