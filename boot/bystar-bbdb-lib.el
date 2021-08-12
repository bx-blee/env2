;;; bbdb-site.el

;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/bbdb/lisp")

(require 'bbdb)
(require 'bbdb-com)

(require 'bbdb-gnus)
;;(require 'bbdb-hooks)

;;(require 'bbdb-xemacs)

;;(bbdb-initialize 'gnus 'message 'w3)
(bbdb-initialize 'gnus 'message)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;;f(add-hook 'gnus-startup-hook 'gnus-visual-hook)

(add-hook 'message-setup-hook 'bbdb-mail-aliases)
(add-hook 'mail-setup-hook 'bbdb-mail-aliases)


;;(add-hook 'gnus-article-mode-hook 'bbdb/gnus-show-sender)   ;; emacs24 testing
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(add-hook 'message-mode-hook      '(lambda ()
				     (local-set-key [f9] 'bbdb-complete-name)
				     (auto-fill-mode 1)
				     ))
(bbdb-initialize 'gnus 'message)
;;(setq bbdb-offer-save 'always)
;;(setq       bbdb-always-add-addresses nil)
;;(setq      bbdb-new-nets-always-primary 'never)
;;(setq     bbdb-pop-up-target-lines 9)
;;;(setq       bbdb/mail-auto-create-p t)
    
;;; ----------
;;; setup BBDB's GNUS interface
;;; ----------
;;; There is also GNUS's BBDB interface setup in gnus-site.el

;;; NEWS (GNUS) READING INTERFACE
(when (< emacs-major-version 27)
  (autoload 'bbdb/gnus-lines-and-from "bbdb-gnus")
  )
;(setq gnus-optional-headers 'bbdb/gnus-lines-and-from) ; doesn't exist in 19.15's GNUS
;(or (member 'bbdb-insinuate-gnus gnus-startup-hook)
 ;   (setq gnus-startup-hook 'bbdb-insinuate-gnus))
(setq bbdb/gnus-header-prefer-real-names t)



;; My own Messages
(setq bbdb-user-mail-names (format "%s@*neda.com" (user-login-name)))
;;;(setq bbdb-user-mail-names "mohsen")


;;; Customization Parameters
(setq bbdb-default-area-code 425)
(setq bbdb-north-american-phone-numbers-p nil)

;; Automatic Displaying
;;(setq bbdb-use-pop-up nil)
(setq bbdb-use-pop-up t)
;;(setq bbdb-use-pop-up 'horiz)

(setq bbdb-electric-p nil)             ;; So you can keep bbdb buffers

;; Automatic Entry into BBDB
(setq bbdb-offer-save t)
(setq bbdb-always-add-addresses nil)  ;; results in asking
;;(setq bbdb-always-add-addresses 'never)
;;(setq bbdb-quiet-about-name-mismatches t)
(setq bbdb-quiet-about-name-mismatches nil)
(setq bbdb-new-nets-always-primary 'never) ;; The messages address goes end of list
(setq bbdb/mail-auto-create-p nil)
;;(setq bbdb/mail-auto-create-p t)

;;; Customization Hooks (1.5.2)

;;; Predefined Hooks (1.5.3)
(setq bbdb-change-hook 'bbdb-timestamp-hook)
(setq bbdb-create-hook 'bbdb-creation-date-hook)





(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bystar:bbdb:faces:background-dark) [[elisp:(org-cycle)][| ]]
")

(defun bystar:bbdb:faces:background-dark ()
  ""
  (interactive)
  (custom-set-faces '(bbdb-company ((((class color) (background dark)) (:foreground "pink" :bold t)))))
  (custom-set-faces '(bbdb-name ((((class color) (background dark)) (:foreground "red" :bold t)))))
  )

(bystar:bbdb:faces:background-dark)


;;;(bystar:bbdb:search-here "mohsen banan")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bystar:bbdb:search-here string) [[elisp:(org-cycle)][| ]]
  ")

(defun bystar:bbdb:search-here (string)
  ""
  (interactive)
  (bbdb string nil)
  (switch-to-buffer (get-buffer "*BBDB*"))
  (delete-other-windows))

;;;(bystar:bbdb:search-other "mohsen banan")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bystar:bbdb:search-other string) [[elisp:(org-cycle)][| ]]
  ")

(defun bystar:bbdb:search-other (string)
  ""
  (interactive)
  (bbdb string nil)
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bbdb-vcard-import-bystar:bbdb:search-other string) [[elisp:(org-cycle)][| ]]
  ")

(defun bbdb-vcard-import-bystar:bbdb:search-other (string)
  ""
  (interactive)
  (bbdb string nil)
  )

;;; (call-interactively 'bbdb-vcard-import-directories)
;;; (bbdb-vcard-import-directories "~/tmp")
;;; (bbdb-vcard-import-directories '("~/tmp" "~/lisp"))
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bbdb-vcard-import-directories vcards-directories) [[elisp:(org-cycle)][| ]]
  ")

(defun bbdb-vcard-import-directories (vcards-directories)
  "Import vCards from VCARD-DIRECTORY into BBDB.
This is primarily intended for elisp usage, but can also be used interactively."
  (interactive "FvCard directory (or wildcard): ")
  (let (vcards-directories-list)
    (when (stringp vcards-directories)
      (setq vcards-directories-list (file-expand-wildcards vcards-directories)))
    (when (listp vcards-directories)
      (setq vcards-directories-list vcards-directories))
    (let (vcards-directory)
      (dolist (vcards-directory vcards-directories-list)
	(message vcards-directory)
	(bbdb-vcard-import-files (directory-files vcards-directory))	
	))))

;;; (call-interactively 'bbdb-vcard-import-files)
;;; (bbdb-vcard-import-files "~/tmp/*.vcf")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bbdb-vcard-import-files vcard-files) [[elisp:(org-cycle)][| ]]
  ")

(defun bbdb-vcard-import-files (vcard-files)
  "Import vCards from VCARD-FILES into BBDB.
This is primarily intended for elisp usage, but can also be used interactively."
  (interactive "FvCard file (or wildcard): ")
  (let (vcard-files-list)
    (when (stringp vcard-files)
      (setq vcard-files-list (file-expand-wildcards vcard-files)))
    (when (listp vcard-files)
      (setq vcard-files-list vcard-files))
    (let (vcard-file)
      (dolist (vcard-file vcard-files-list)
	(message vcard-file)
	(bbdb-vcard-import-file vcard-file)
	))))


(provide 'bystar-bbdb-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
