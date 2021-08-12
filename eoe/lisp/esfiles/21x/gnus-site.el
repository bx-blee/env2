;;; -*- Mode: Emacs-Lisp -*-

;;; gnus-site.el
;;;
;;; site-wide customizations/patches for GNUS

;;; NOTE* We assume that the mail user agent is VM

(setq gnus-use-sendmail nil)
(setq gnus-use-vm t)

;;; GNUS setup
(progn
  (progn 
    (setq gnus-use-sendmail nil)
    (setq gnus-use-vm t)
    (setq gnus-use-sc t)
    (setq gnus-use-bbdb t))
  ;; now load gnus-setup
  (require 'gnus-setup))

;;; User sophistication
(setq gnus-novice-user t)		; 'cos GNUS has changed *a lot*

;;; News server
(setq gnus-select-method `(nntp ,eoe-nntp-server))

;;; Identity
(setq gnus-local-domain "neda.com")
(setq gnus-local-organization "Neda Communications, Inc., Bellevue, WA")

;;; Saving articles configuration
(setq gnus-default-article-saver 'gnus-summary-save-in-vm)
(setq gnus-article-save-directory (expand-file-name "~/VM/News"))
(setq gnus-save-all-headers t)
(setq gnus-use-long-file-name t)
(setq gnus-prompt-before-saving t)	; default is 'always

;;; Reading
(setq gnus-large-newsgroup 100)
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-hierarchically)

;;; Defuncted Variables

;(setq gnus-author-copy (expand-file-name "~/VM/News/mohsen.out")) ; defunct (see 'gnus-message-archive-method)
;(setq gnus-mail-reply-method 'gnus-mail-reply-using-mail) ; defunct
;(setq gnus-mail-forward-method 'gnus-mail-forward-using-mail) ; defunct
;(setq gnus-mail-other-window-method 'gnus-mail-other-window-using-mail) ; defunct
;(setq gnus-use-generic-from t) ; defunct

