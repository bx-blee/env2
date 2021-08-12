;;; mohsen-menu.el

(defconst mohsen-menu-fsf-emacs-p (null (string-match "XEmacs" emacs-version))
  "t if emacs is FSF, nil otherwise.")

;; emacs19f needs Lucid-style menu emulation
(if mohsen-menu-fsf-emacs-p
    (require 'lmenu))


;;; ---------------------------------------------------------------
;;; Mohsen menu
;;; ---------------------------------------------------------------
(defconst mohsen-menu
  '("Mohsen"
    ["Help" (message "Not yet implemented.") t]
    ))


(defun mohsen-menu-install ()
  "Install `Mohsen' menu."
  (interactive)
  (cond (mohsen-menu-fsf-emacs-p
	 (add-menu nil "Mohsen" (cdr mohsen-menu) "Tools"))
	(t
	 (if current-menubar
	     (let ((assn (assoc "Mohsen" current-menubar)))
	       (cond (assn
		      (setcdr assn (cdr mohsen-menu)))
		     (t
		      (add-menu nil "Mohsen" (cdr mohsen-menu) "Tools"))))))))

;;; ---------------------------------------------------------------
;;; Put the Mohsen menu in the menubar
;;; ---------------------------------------------------------------

(cond (mohsen-menu-fsf-emacs-p
       (mohsen-menu-install))
      ((and (not mohsen-menu-fsf-emacs-p)
	    (eq window-system 'x))
       (mohsen-menu-install)
       (if (null (member 'mohsen-menu-install activate-menubar-hook))
	   (add-hook 'activate-menubar-hook 'mohsen-menu-install))))


;;; -----------------------------------------------------------------
(provide 'mohsen-menu)  
