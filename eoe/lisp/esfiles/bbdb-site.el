;;; bbdb-site.el

(require 'bbdb-com)
(require 'bbdb-gnus)

;;; ----------
;;; setup BBDB's GNUS interface
;;; ----------
;;; There is also GNUS's BBDB interface setup in gnus-site.el

;;; NEWS (GNUS) READING INTERFACE
(autoload 'bbdb/gnus-lines-and-from "bbdb-gnus")
;(setq gnus-optional-headers 'bbdb/gnus-lines-and-from) ; doesn't exist in 19.15's GNUS
;(or (member 'bbdb-insinuate-gnus gnus-startup-hook)
 ;   (setq gnus-startup-hook 'bbdb-insinuate-gnus))
(setq bbdb/gnus-header-prefer-real-names t)


;;; --------
;;; VM setup
;;; --------
(require 'bbdb-vm)
(setq bbdb-send-mail-style 'vm)
(bbdb-insinuate-vm)

;; M-TAB is used by some windows managers (e.g., Motif), so provide
;; an alternative binding for bbdb-complete-name
(define-key vm-mail-mode-map [(control meta tab)] 'bbdb-complete-name)

;; ---------------------------------------------------------------------

;; My own Messages
(setq bbdb-user-mail-names (format "%s@*neda.com" (user-login-name)))
;;;(setq bbdb-user-mail-names "mohsen")

;;; MAIL ALIASES INTERFACE
(cond ((eq *eoe-emacs-type* '19f)
       (require 'mailabbrev))
      ((eq *eoe-emacs-type* '19f)
       (require 'mail-abbrevs)))
(setq mail-alias-separator-string ",\n    ")

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

;; BBDB Printing Interface
(require 'bbdb-print)

(setq bbdb-print-file-name "~/bbdb-print/bbdb.tex")
(setq bbdb-print-format-file-name "bbdb-print.tex")
(setq bbdb-print-elide '(aka mail-alias nic nic-updated)) ;;  List of fields NOT to print
(setq bbdb-print-require '(and name (or address phone)))

(setq bbdb-print-no-bare-names t)       ;;If nonnil, `bare names' will not be printed.

;;; Describe Variable to see what means what
(setq bbdb-print-alist '((columns . 2)
			 (separator . 2)
			 (phone-on-first-line . "^[ \t]*$")
			 (ps-fonts . nil)
			 (font-size . 10)
			 (quad-hsize . "3.15in")
			 (quad-vsize . "4.5in")))

;;;(setq bbdb-print-elide '(net aka mail-alias nic nic-updated)) ;;  List of fields NOT to print
;;;(setq bbdb-print-alist '((columns . quad)
;;;			   (separator . 2)
;;;			   (phone-on-first-line . "^[ \t]*$")
;;;			   (ps-fonts . nil)
;;;			   (font-size . 6)
;;;			   (quad-hsize . "3.15in")
;;;			   (quad-vsize . "4.5in")))

;;; BDBD Supercite (Attribution)
;; NOTYET, 21x does not like bbdb-supercite
;(load "bbdb-supercite")

;;; BDBD WWW (w3)
;;;(load "bbdb-www")


;; BBDB Filters
;; NOTYET, can't figure this
;;(load-file "/opt/public/eoe/lisp/esfiles/bbdb-filters-site.el")
;;(require 'bbdb-filters-site)
(load "bbdb-filters-site")


;; NOTYET, conditional load this for nt environment
(load-file "/usr/devenv/doc/nedaComRecs/Content/msend-contents-load.el")


