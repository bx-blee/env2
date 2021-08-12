;;; bbdb-site.el

(add-to-list 'load-path "/usr/share/emacs/site-lisp/bbdb/lisp")

(require 'bbdb)
(require 'bbdb-com)

(when (not (bx:emacs24.5p))
  (when (< emacs-major-version 27)
    (require 'bbdb-gnus)
    (require 'bbdb-hooks)
  ))

(when (bx:emacs24.5p)
  (when (not (string-equal opRunDistGeneration "1404"))
    (require 'bbdb-gnus)
    (require 'bbdb-hooks)      
    ))



;;(require 'bbdb-xemacs)

;;(bbdb-initialize 'gnus 'message 'w3)
(bbdb-initialize 'gnus 'message)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;;f(add-hook 'gnus-startup-hook 'gnus-visual-hook)

(when (bx:bbdbV3p)
  (add-hook 'message-setup-hook 'bbdb-mail-aliases)
  (add-hook 'mail-setup-hook 'bbdb-mail-aliases)
  )

(when (not (bx:bbdbV3p))
  (add-hook 'message-setup-hook 'bbdb-define-all-aliases)
  (add-hook 'mail-setup-hook 'bbdb-define-all-aliases)
  )


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
(setq bbdb-file "~/.bbdb")
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



;;; BBDB Printing Interface
;(require 'bbdb-print)

;(setq bbdb-print-file-name "~/bbdb-print/bbdb.tex")
;(setq bbdb-print-format-file-name "bbdb-print.tex")
;(setq bbdb-print-elide '(aka mail-alias nic nic-updated)) ;;  List of fields NOT to print
;(setq bbdb-print-require '(and name (or address phone)))

;(setq bbdb-print-no-bare-names t)       ;;If nonnil, `bare names' will not be printed.

;;;; Describe Variable to see what means what
;(setq bbdb-print-alist '((columns . 2)
;			 (separator . 2)
;			 (phone-on-first-line . "^[ \t]*$")
;			 (ps-fonts . nil)
;			 (font-size . 10)
;			 (quad-hsize . "3.15in")
;			 (quad-vsize . "4.5in")))

;;;;(setq bbdb-print-elide '(net aka mail-alias nic nic-updated)) ;;  List of fields NOT to print
;;;;(setq bbdb-print-alist '((columns . quad)
;;;;			   (separator . 2)
;;;;			   (phone-on-first-line . "^[ \t]*$")
;;;;			   (ps-fonts . nil)
;;;;			   (font-size . 6)
;;;;			   (quad-hsize . "3.15in")
;;;;			   (quad-vsize . "4.5in")))

;;;; BDBD Supercite (Attribution)
;;; NOTYET, 21x does not like bbdb-supercite
;;(load "bbdb-supercite")

;;;; BDBD WWW (w3)
;;;;(load "bbdb-www")


;;; BBDB Filters
;;; NOTYET, can't figure this
;(load-file "/opt/public/eoe/lisp/esfiles/bbdb-filters-site.el")
(eoe-require 'bbdb-filters-site)
;;;(load "bbdb-filters-site")

;(load-file "/usr/devenv/doc/nedaComRecs/Content/msend-contents-load.el")


(if (equal (bbdb-version) "2.36")
    (progn 
      (load "~/lisp/trebb-bbdb-vcard-fc2394f/vcard.el")
      (load "~/lisp/trebb-bbdb-vcard-fc2394f/bbdb-vcard.el")
      )
  (progn
    (require 'bbdb-vcard-export)
    (require 'bbdb-vcard)
    )
  )
    



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


;;;(bystar:bbdb:search-here "maryam shafaei")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bystar:bbdb:search-here string) [[elisp:(org-cycle)][| ]]
  ")

(defun bystar:bbdb:search-here (string)
  ""
  (interactive)
  (bbdb string nil)
  (switch-to-buffer (get-buffer "*BBDB*"))
  (delete-other-windows))

;;;(bystar:bbdb:search-other "maryam shafaei")
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
;;; (bbdb-vcard-import-directories "/de/bx/nne/mb-tmo/tmoVcards/20161025-preped")
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
;;; (bbdb-vcard-import-files "/de/bx/nne/mb-tmo/tmoVcards/20161025-preped/*.vcf")
;;; (bbdb-vcard-import-files '("~/tmp/Alejandro Aguirre.vcf" "~/tmp/Joshua Bye.vcf"))
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
