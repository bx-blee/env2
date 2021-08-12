;; eoe-user-params.el
;;

(defun eoe-user-init ()
  "eoe setting for the user"
  (interactive)
  
  (personality-originator-home)

  ;; Only one of byname or email should be specified
  (eoe-profile-byname-originator-home)

  (bbdb-actions-params)
)

(defun bbdb-actions-params ()
  "bbdb actions params"
  (interactive)

  ;;  "The output directory")
  (setq bbdb-a-output-file "~/bbdbGens/texOutputFiles/")
  )

;(setq gnus-select-method `(nntp ,"news.bllvu1.wa.home.com"))
;(setq gnus-select-method `(nntp ,"netnews.attbi.com"))

;;(gnus-user-params)
(defun gnus-user-params ()
  "bbdb actions params"

  (message "GNUS USER Parameters")
  (sleep-for 2)
  
  (setq gnus-use-sendmail nil)
  (setq gnus-use-vm t)

  ;; GNUS setup

  (setq gnus-use-sendmail nil)
  (setq gnus-use-vm t)
  (setq gnus-use-sc t)
  (setq gnus-use-bbdb t)

  ;; now load gnus-setup
  (when (<= emacs-major-version 24)   ;;;; NOTYET 2019 For emacs 25, What happened to gnus-setup
    (require 'gnus-setup))

  ;; User sophistication
  (setq gnus-novice-user t)		; 'cos GNUS has changed *a lot*

  ;; News server
  ;;(setq gnus-select-method `(nntp ,eoe-nntp-server))
  ;(setq gnus-select-method `(nntp ,"news.bllvu1.wa.home.com"))
  ;;(setq gnus-select-method `(nntp ,"netnews.attbi.com"))

  ;; Identity
  (setq gnus-local-domain "neda.com")
  (setq gnus-local-organization "Neda Communications, Inc., Bellevue, WA")

  ;; Saving articles configuration
  (setq gnus-default-article-saver 'gnus-summary-save-in-vm)
  (setq gnus-article-save-directory (expand-file-name "~/VM/News"))
  (setq gnus-save-all-headers t)
  (setq gnus-use-long-file-name t)
  (setq gnus-prompt-before-saving t)	; default is 'always

  ;; Reading
  (setq gnus-large-newsgroup 100)
  (setq gnus-subscribe-newsgroup-method 'gnus-subscribe-hierarchically)

  ;; Defuncted Variables

  ;;(setq gnus-author-copy (expand-file-name "~/VM/News/mohsen.out")) ; defunct (see 'gnus-message-archive-method)
  ;;(setq gnus-mail-reply-method 'gnus-mail-reply-using-mail) ; defunct
  ;;(setq gnus-mail-forward-method 'gnus-mail-forward-using-mail) ; defunct
  ;;(setq gnus-mail-other-window-method 'gnus-mail-other-window-using-mail) ; defunct
  ;;(setq gnus-use-generic-from t) ; defunct
  )


(provide 'eoe-user-params)  

