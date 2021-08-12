;;; 
;;; RCS: $Id: ndmt-dired-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

;;;
;;; dired menu generating function
;;;
(defun ndmt-dired-menu (host-sexpr)
  `("Dired"
    ["results/bin" (ndmt-dired-curenvbase-relative "results/bin") t]
    ["results/arch/<arch>/bin" (ndmt-dired-arch-relative ,host-sexpr "bin") t]
    "-----"
    ["results/systems/<node>" (ndmt-dired-system-relative ,host-sexpr "") t]
    ["results/systems/<node>/bin" (ndmt-dired-system-relative ,host-sexpr "bin") t]
    ["results/systems/<node>/config" (ndmt-dired-system-relative ,host-sexpr "config") t]
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; "DIRED" Sub Menu

(defun ndmt-dired-curenvbase-relative (rel-path)
  (ndmt-visit-file (ndmt-curenvbase-full-path rel-path)
		   (ndmt-host)
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-dired-arch-relative (system rel-path)
  (ndmt-visit-file (ndmt-arch-full-path system rel-path)
		   system
		   (ndmt-user)
		   (ndmt-password)))


(defun ndmt-dired-system-relative (system rel-path)
  (ndmt-visit-file (ndmt-system-full-path system rel-path)
		   system
		   (ndmt-user)
		   (ndmt-password)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-dired-lucid)
