;;;
;;;

(require 'easymenu)

;;;
;;;
;;;

(defun bxo:listSubMenuDef ()
  ""
  (interactive)
  (easy-menu-define bxo:listSubMenu
    nil
    "Doc String??" 
    (append
     '("Dynamic Listing Of This Container's BxOs")
     (mapcar (lambda (x)
	       (vector x
		       `(lambda () (interactive)
			  (find-file (expand-file-name (format "~%s/panel/_nodeBase_/fullUsagePanel-en.org" ,x))) t)))
	     (bxosList
	      )))))

;; (bxosList)
(defun  bxosList ()
  ""
  (split-string
   (shell-command-to-string 
    (format "bxoReports.sh list")
    )))

;; Usage:  Dynamic installation of this menu happens in blee-menu-blee.el
;; through:
;; (require 'bxo-list-menu)
;; (bxo:listSubMenuDef)
;; (bxo:listSubMenuDef-update)
;; (add-hook 'menu-bar-update-hook 'bxo:listSubMenuDef-update)
;; Where: bxo:listSubMenuDef-update is:
;; (defun bxo:listSubMenuDef-update ()
;;  (easy-menu-add-item blee-menu-global '() 'bxo:listSubMenu "Blee Help")
;;  )

;; See http://kitchingroup.cheme.cmu.edu/blog/2014/08/20/Creating-a-dynamic-menu-for-Emacs/
;; For an example of "Creating a dynamic menu for Emacs"


(provide 'bxo-list-menu)
