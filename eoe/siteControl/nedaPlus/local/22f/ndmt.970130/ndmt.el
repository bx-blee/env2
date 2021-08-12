;;; 
;;; RCS: $Id: ndmt.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(require 'fshell)

(defvar *ndmt-version* "$Revision: 1.1 $")

(defvar *ndmt-buffer-name-prefix* "*NDMT*")

(require 'ndmt-basic-lucid)
(require 'ndmt-lsm-mts-lucid)
(require 'ndmt-lsm-ua-lucid)
(require 'ndmt-fax-lucid)
(require 'ndmt-pager-lucid)
(require 'ndmt-ivr-lucid)
(require 'ndmt-gnats-lucid)
(require 'ndmt-usenet-lucid)
;;; Network Terminal Server
(require 'ndmt-nts-lucid)
(require 'ndmt-www-lucid)


(defun ndmt ()
  (interactive)

  ;; goto NDMT buffer
  (switch-to-buffer (ndmt-main-buffer))

  ;; setup NDMT buffer's menubar
  (set-buffer-menubar default-menubar)
  (ndmt-install-menus)

  ;; set curenvbase
  (message (format "CURENVBASE is: %s" (ndmt-curenvbase)))
  )


(defun ndmt-curenvbase ()
  (cond (*ndmt-curenvbase* 
	 *ndmt-curenvbase*)
	(t (let ((env_curenvbase (getenv "CURENVBASE")))
	     (setq *ndmt-curenvbase*
		   (cond (env_curenvbase
			  (message "Using environment's CURENVBASE: (%s)" env_curenvbase)
			  env_curenvbase)
			 (t (message "Setting CURENVBASE to default: (%s)" *ndmt-default-curenvbase*)
			    *ndmt-default-curenvbase*)))
	     (ndmt-basic-update-curenvbase-in-subprocesses)
	     *ndmt-curenvbase*
	     ))))

(defun ndmt-version ()
  (interactive)
  (message "NDMT Version %s" *ndmt-version*))


(defun ndmt-install-menus ()
  (interactive)
  (ndmt-basic-install-menubar)
  (ndmt-lsm-mts-install-menubar)
  (ndmt-lsm-ua-install-menubar)
  (ndmt-ivr-install-menubar)
  (ndmt-fax-install-menubar)
  (ndmt-pager-install-menubar)
  (ndmt-usenet-install-menubar)
  (ndmt-nts-install-menubar)
  (ndmt-gnats-install-menubar)
  (ndmt-maybe-add-remove-menus-button)
  (delete-menu-item '("Add NDMT Menus"))
  )


(defun ndmt-uninstall-menus ()
  (interactive)
  (delete-menu-item '("NDMT"))
  (delete-menu-item '("LSM-MTS"))
  (delete-menu-item '("LSM-UA"))
  (delete-menu-item '("IVR"))
  (delete-menu-item '("FAX"))
  (delete-menu-item '("PAGER"))
  (delete-menu-item '("USENET"))
  (delete-menu-item '("NTS"))
  (delete-menu-item '("GNATS"))
  (ndmt-maybe-add-add-menus-button)
  )


(defun ndmt-maybe-add-add-menus-button ()
  (if (null (assoc "NDMT" current-menubar))
      (progn
	(add-menu-button nil
			 ["Add NDMT Menus"
			  (progn (delete-menu-item '("Add NDMT Menus"))
				 (ndmt-install-menus))
			  t]
			 "Help"))))


(defun ndmt-maybe-add-remove-menus-button ()
  (if (assoc "NDMT" current-menubar)
      (add-menu-button nil
		       ["Remove NDMT Menus"
			(progn
			  (delete-menu-item '("Remove NDMT Menus"))
			  (ndmt-uninstall-menus))
			t]
		       "Help")))


;; install NDMT button in default menubar
(add-menu-button '("Apps") ["-----" nil nil]
		 (aref (car (cdr (assoc "Apps" default-menubar))) 0))
(add-menu-button '("Apps") ["Add NDMT Menus" (ndmt-install-menus) t]
		 (aref (car (cdr (assoc "Apps" default-menubar))) 0))
(add-menu-button '("Apps") ["Neda Domain Mgmt. Tool (NDMT)" ndmt t]
		 (aref (car (cdr (assoc "Apps" default-menubar))) 0)) 
(ndmt-maybe-add-add-menus-button)


(provide 'ndmt)