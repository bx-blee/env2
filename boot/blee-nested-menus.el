;;;
;;;

;;; 
;;; Different Types of Menus 
;;;


(require 'bx-lib)

(setq blee:bnsm:menu:suported (list "eng" "fra" ))

(setq blee:bnsm:menu-stack (list nil))

;;;
(setq blee:bnsm:menu:current "Current Menu Parameters")

(put 'blee:bnsm:menu:current 'level 1)
(put 'blee:bnsm:menu:current 'back nil)

(defun blee:bnsm:enter ()
  "bnsm enter"
  (interactive)
  (bx:platform:select-frame)
  )

(defun blee:bnsm:exit ()
  "bnsm exit"
  (interactive)
  (message "NOTYET: Exit - Determine platformParams")
  )



(defun blee:bnsm:action-func (action-func)
  "action func"
  (interactive)

  (blee:bnsm:enter)
  (funcall action-func)
  (blee:bnsm:exit)
  )

;;(blee:bnsm:menu-init "~/BUE/activeDocs/
;;
(defun blee:bnsm:top:panel-init (base-dir)
  "Given base-dir, locate menu-file, increase level, push path on stack, visit menu-file"
  (interactive)
  (setq blee:bnsm:menu-stack (list nil))
  (blee:bnsm:panel-goto (expand-file-name base-dir))
  )

(defun blee:bnsm:top:doc-init (base-dir)
  "Given base-dir, locate menu-file, increase level, push path on stack, visit menu-file"
  (interactive)
  (setq blee:bnsm:menu-stack (list nil))
  (blee:bnsm:doc-goto (expand-file-name base-dir))
  )

(defvar bx:simmulate:activeDoc 'none "Valid values are none and n810")

;;; (bx:simulate:n810)
(defun bx:simulate:n810 ()
  (interactive)
  (setq bx:simmulate:activeDoc 'n810)
  )

;;; (bx:simulate:none)
(defun bx:simulate:none ()
  (interactive)
  (setq bx:simmulate:activeDoc 'none)
  )

;;; (bx:determine-menu-tag-name)
(defun bx:determine-menu-tag-name ()
  (block n810
    (if (eq bx:simmulate:activeDoc 'n810)
	(return-from n810 "n810UsagePanel-en.org")
      )
    (when (not (string-equal opRunDistFamily "MAEMO"))
      (return-from n810 "fullUsagePanel-en.org"))
    (return-from n810 "n810UsagePanel-en.org")
    )
  )

(defun blee:bnsm:panel-goto (base-dir)
  "Given base-dir, locate menu-file, increase level, push path on stack, visit menu-file"
  (interactive)
  (if (file-directory-p base-dir)
      (let (
	    (menu-filename (concat base-dir "/" (bx:determine-menu-tag-name)))
	    )
	(push base-dir (car blee:bnsm:menu-stack))
	(find-file menu-filename)
	(org-mode)
	(setq org-confirm-elisp-link-function nil)
	(when (not (string-equal opRunDistFamily "MAEMO"))
	  (when (boundp '~blee:dblockEnabler)
	    (setq-local ~blee:dblockEnabler nil))
	  (when (boundp '~blee:panelUpdater)
	    (when ~blee:panelUpdater
	      (org-dblock-update-buffer-bx)
	      ))
	  (unless (boundp '~blee:panelUpdater)
	    (org-dblock-update-buffer-bx)
	    )
	  (org-shifttab)
	  )
	;;(show-all)
	(delete-other-windows)
	)
    (message (concat "Missing" base-dir "/" "fullUsagePanel-en.org"))
    )
  )

(defun blee:bnsm:doc-goto (base-dir)
  "Given base-dir, locate menu-file, increase level, push path on stack, visit menu-file"
  (interactive)
  (if (file-directory-p base-dir)
      (let ((menu-filename (concat base-dir "/" "activeDoc-en.org")))
	(push base-dir (car blee:bnsm:menu-stack))
	(find-file menu-filename)
	(setq org-confirm-elisp-link-function nil)
	(when (not (string-equal opRunDistFamily "MAEMO"))
	  (org-dblock-update-buffer-bx)
	  )
	(show-all)
	(delete-other-windows)
	)
    (message (concat "Missing" base-dir "/" "activeDoc-en.org"))
    )
  )

(defun blee:bnsm:doc-goto-bxGen (base-dir)
  "Given base-dir, locate menu-file, increase level, push path on stack, visit menu-file"
  (interactive)
  (if (file-directory-p base-dir)
      (let (
	    (menu-filename (concat base-dir "/" "activeDoc-en.org"))
	    (baseDirBxGen (concat  base-dir "/" bxDistGeneration))
	    (menu-filename-bxGen)
	    )
	(setq menu-filename-bxGen (concat  baseDirBxGen "/" "activeDoc-en.org"))
	(push base-dir (car blee:bnsm:menu-stack))
	(find-file menu-filename-bxGen)
	(setq org-confirm-elisp-link-function nil)
	(when (not (string-equal opRunDistFamily "MAEMO"))
	  (org-dblock-update-buffer-bx)
	  )
	(show-all)
	(delete-other-windows)
	)
    (message (concat "Missing" base-dir "/" "activeDoc-en.org"))
    )
  )


(defun blee:bnsm:file-goto (filePath)
  "Given filePath"
  (interactive)
  (if (file-exists-p  filePath)
      (let ((menu-filename filePath))
	(find-file menu-filename)
	(setq org-confirm-elisp-link-function nil)
	(org-dblock-update-buffer-bx)
	(delete-other-windows)
	)
    (message (concat "Missing" filePath))
    )
  )


(defun blee:file-goto-contents (filePath)
  "Given filePath"
  (interactive)
  (if (file-exists-p  filePath)
      (progn
	(find-file filePath)
	(blee:ppmm:org-mode-content-list)
	(delete-other-windows)
	)
    (message (concat "Missing" filePath))
    )
  )


(defun blee:bnsm:menu-back ()
  "pop path on stack, visit menu-file"
  (interactive)
  (pop (car blee:bnsm:menu-stack))
  (blee:bnsm:panel-goto (car (car blee:bnsm:menu-stack)))
  )


(defun blee:bnsm:menu-stack-insert ()
  "pop path on stack, visit menu-file"
  (interactive)
  (let (disp-stack this-item url-string)
    (setq disp-stack (reverse (car blee:bnsm:menu-stack)))
    (dolist (this-item disp-stack)

      (setq url-string (concat "[[elisp:(blee:bnsm:panel-goto " "\"" this-item "\"" ")]" "[" (file-name-nondirectory this-item) "]]"))
      (insert url-string)
      (insert " ")
      )
    )
  )

(provide 'blee-nested-menus)

;;(file-name-nondirectory "/acct/employee/lsipusr/BUE/emacs/menus/lang/en/root")
