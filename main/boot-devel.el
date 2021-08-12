
;;(setq debug-on-error t)
;;(setq debug-on-error nil)



;;
;; Printing
;;

(setq printer-name "lpr1")
;;; (pr-show-lpr-setup)
;;;(setq lpr-switches  '("-2P -t -Plpr1"))
(setq lpr-command "mpage")
(setq lpr-switches  '("-2P" "-Plpr1"))

(setq a2ps-switches '("-1" "-s2"))

;;
;; Info
;;

(setq Info-directory-list nil)
(setq Info-directory-list 
      (append Info-directory-list
	      (list
	       (expand-file-name "/usr/share/info"))))

;;; NOTYET Added for emacs25f in 10/2016
(load-file (concat (file-name-as-directory (blee:env:eoe:base-obtain)) "lisp/sys/dressups.el"))
;;;(load-file "/opt/public/neweoe/lisp/sys/dressups.el")

;; set the font for all faces currently defined see doc for variable
;; `eoe-font' and `eoe-font-candidates' for more info.
;; (if (member window-system '(x win32))
;;     (eoe-set-font eoe-font))

;(eoe-set-font "10x20")



(defun notyet-linux ()
  "To Be Abosrbed Elsewhere Later"
  (interactive)

;; (if (not (= emacs-major-version 25))
;;     ;;;(load-file "/opt/public/neweoe/lisp/esfiles/bbdb-filters-site.el")
;;     (load-file (concat (file-name-as-directory (blee:env:eoe:base-obtain)) "lisp/esfiles/bbdb-filters-site.el"))
;;   )

(eoe-maybe-load-file "/usr/devenv/bbdbNames/MailingsGened/msend-contents-load.el")

(custom-set-variables
 '(load-home-init-file t t)
 '(gnuserv-program (concat exec-directory "/gnuserv")))

(custom-set-faces
 '(info-xref ((t (:foreground "yellow"))))
 '(info-node ((t (:foreground "white"))))
 '(hyper-apropos-heading ((t (:foreground "white"))))
 '(gnus-summary-high-ancient-face ((((class color) (background dark)) (:foreground "SkyBlue"))))
 '(dired-face-directory ((t nil)))
 '(hyper-apropos-warning ((t (:foreground "red"))))
 '(message-headers ((t nil)))
 '(gnus-group-news-1-face ((((class color) (background dark)) (:foreground "PaleTurquoise"))))
 '(bbdb-field-name ((t (:foreground "yellow" :size "16"))) t)
 '(gnus-group-mail-2-face ((((class color) (background dark)) (:foreground "aquamarine2"))))
 '(gnus-summary-high-read-face ((((class color) (background dark)) (:foreground "PaleGreen"))))
 '(man-bold ((t (:foreground "yellow"))))
 '(message-header-subject-face ((((class color) (background light)) (:foreground "yellow"))))
 '(gnus-group-mail-3-face ((((class color) (background dark)) (:foreground "aquamarine3"))))
 '(man-italic ((t (:foreground "red"))))
 '(dict-word-entry-face ((t nil)))
 '(gnus-group-news-3-face ((((class color) (background dark)) nil)))
 '(gui-element ((t nil)) t)
 '(gnus-group-news-2-face ((((class color) (background dark)) (:foreground "turquoise"))))
 '(hyper-apropos-section-heading ((t (:foreground "white"))))
 '(gnus-group-mail-1-face ((((class color) (background dark)) (:foreground "aquamarine1"))))
 '(man-heading ((t (:foreground "white"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Pink"))))
 '(man-xref ((t (:foreground "orange"))))
 '(gnus-summary-high-ticked-face ((((class color) (background dark)) (:foreground "pink"))))
 '(gnus-group-news-5-face ((((class color) (background dark)) nil)))
 '(gnus-emphasis-bold ((t nil)))
 '(gnus-emphasis-underline-bold-italic ((t nil)))
 '(gnus-group-news-low-face ((((class color) (background dark)) (:foreground "DarkTurquoise"))))
 '(shell-input ((t (:foreground "white" :size "16" :bold nil))) t)
 '(bold ((t (:foreground "yellow" :size "16" :bold nil))) t)
 '(bold-italic ((t (:foreground "white" :size "16"))) t)
 '(gnus-emphasis-underline-bold ((t nil)))
 '(gnus-group-mail-low-face ((((class color) (background dark)) (:foreground "aquamarine4"))))
 '(message-header-cc-face ((((class color) (background dark)) (:foreground "green4"))))
 '(message-header-newsgroups-face ((((class color) (background dark)) (:foreground "yellow"))))
 '(gnus-group-news-4-face ((((class color) (background dark)) nil)))
 '(custom-button-face ((t nil)))
 '(shell-prompt ((t (:foreground "yellow" :size "16" :family "lucida" :bold nil :italic nil))) t)
 '(custom-variable-button-face ((t nil)))
 '(italic ((t (:foreground "orange" :size "16"))) t)
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "yellow"))))
 '(hyper-apropos-major-heading ((t (:foreground "yellow"))))
 '(widget-button-face ((t nil)))
 '(gnus-summary-high-unread-face ((t nil)))
 '(message-url ((t (:foreground "white"))))
 '(gnus-emphasis-bold-italic ((t nil)))
 '(message-header-to-face ((((class color) (background dark)) (:foreground "green2"))))
 '(gnus-group-news-6-face ((((class color) (background dark)) nil)))
 ;;;'(bbdb-company ((t (:foreground ""))) t))

(eoe-set-font "10x20")
))

(defun notyet-win-nt ()
  "To Be Abosrbed Elsewhere Later"
  (interactive)
  )

(defun notyet-cygwin32 ()
  "To Be Abosrbed Elsewhere Later"
  (interactive)

(custom-set-variables
 '(load-home-init-file t t)
 '(gnuserv-program (concat exec-directory "/gnuserv")))

 (custom-set-faces
 '(default ((t (:size "14pt" :family "Courier New"))) t)
 '(info-xref ((t (:foreground "yellow"))))
 '(info-node ((t (:foreground "white"))))
 '(hyper-apropos-heading ((t (:foreground "white"))))
 '(gnus-summary-high-ancient-face ((((class color) (background dark)) (:foreground "SkyBlue"))))
 '(dired-face-directory ((t nil)))
 '(hyper-apropos-warning ((t (:foreground "red"))))
 '(message-headers ((t nil)))
 '(gnus-group-news-1-face ((((class color) (background dark)) (:foreground "PaleTurquoise"))))
 '(bbdb-field-name ((t (:foreground "yellow" :size "16"))) t)
 '(gnus-group-mail-2-face ((((class color) (background dark)) (:foreground "aquamarine2"))))
 '(gnus-summary-high-read-face ((((class color) (background dark)) (:foreground "PaleGreen"))))
 '(man-bold ((t (:foreground "yellow"))))
 '(message-header-subject-face ((((class color) (background light)) (:foreground "yellow"))))
 '(gnus-group-mail-3-face ((((class color) (background dark)) (:foreground "aquamarine3"))))
 '(man-italic ((t (:foreground "red"))))
 '(dict-word-entry-face ((t nil)))
 '(gnus-group-news-3-face ((((class color) (background dark)) nil)))
 '(gui-element ((t nil)) t)
 '(gnus-group-news-2-face ((((class color) (background dark)) (:foreground "turquoise"))))
 '(hyper-apropos-section-heading ((t (:foreground "white"))))
 '(gnus-group-mail-1-face ((((class color) (background dark)) (:foreground "aquamarine1"))))
 '(man-heading ((t (:foreground "white"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "Pink"))))
 '(man-xref ((t (:foreground "orange"))))
 '(gnus-summary-high-ticked-face ((((class color) (background dark)) (:foreground "pink"))))
 '(gnus-group-news-5-face ((((class color) (background dark)) nil)))
 '(gnus-emphasis-bold ((t nil)))
 '(gnus-emphasis-underline-bold-italic ((t nil)))
 '(gnus-group-news-low-face ((((class color) (background dark)) (:foreground "DarkTurquoise"))))
 '(shell-input ((t (:foreground "white" :bold nil :italic nil))) t)
 '(bold ((t (:foreground "yellow"))) t)
 '(bold-italic ((t (:foreground "white"))) t)
 '(gnus-emphasis-underline-bold ((t nil)))
 '(gnus-group-mail-low-face ((((class color) (background dark)) (:foreground "aquamarine4"))))
 '(message-header-cc-face ((((class color) (background dark)) (:foreground "green4"))))
 '(message-header-newsgroups-face ((((class color) (background dark)) (:foreground "yellow"))))
 '(gnus-group-news-4-face ((((class color) (background dark)) nil)))
 '(custom-button-face ((t nil)))
 '(shell-prompt ((t (:foreground "yellow" :bold nil :italic nil))) t)
 '(custom-variable-button-face ((t nil)))
 '(italic ((t (:foreground "orange" :size "16"))) t)
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "yellow"))))
 '(hyper-apropos-major-heading ((t (:foreground "yellow"))))
 '(widget-button-face ((t nil)))
 '(gnus-summary-high-unread-face ((t nil)))
 '(message-url ((t (:foreground "white"))))
 '(gnus-emphasis-bold-italic ((t nil)))
 '(message-header-to-face ((((class color) (background dark)) (:foreground "green2"))))
 '(gnus-group-news-6-face ((((class color) (background dark)) nil)))
 '(bbdb-company ((t (:foreground ""))) t))
)

;; Ready For Cleaning


(cond ((eq system-type 'windows-nt)
       (notyet-win-nt)
       )
      ((eq system-type 'cygwin32)
       (notyet-cygwin32)
       )
      (t
       (notyet-linux)
       ))

(message "Finished notYetExtras.el")

