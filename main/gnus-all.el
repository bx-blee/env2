;;; -*- Mode: Emacs-Lisp -*-

;;; gnus-site.el
;;;
;;; site-wide customizations/patches for GNUS

(message "GNUS ALL LOADING")

;;(sleep-for 2)

;; Get mail


(require 'nnimap)


;;;
;;; Mail Origination
;;;

(setq mail-host-address "submit.neda.com")          ;; In message-id
(setq user-mail-address "mohsen@neda.com")          ;; From Line
(setq user-full-name "Mohsen Banan")                ;; From Line


;;(setq message-default-headers "Reply-To: Mohsen Banan <mohsen@neda.com>\n")
;;(setq message-default-headers "")

;(setq gnus-message-archive-group "mail.mine")
;(setq gnus-message-archive-method '(nnml "mail.mine"))
(setq gnus-outgoing-message-group "nnml:mail.mine")



(setq mail-user-agent 'message-user-agent)

(setq message-send-mail-function 'message-send-mail-with-qmail)
(setq message-qmail-inject-program "/bin/env")

;; Envelop Setting
;; QMAILINJECT=i -- lets qmail-inject write the message-id
;; Envelop addr wrriten by -f
(setq message-qmail-inject-args  '("-" "QMAILINJECT=i" "/var/qmail/bin/qmail-inject" "-f" "admin@mohsen.banan.1.byname.net"))


(setq gnus-use-sendmail nil)
(setq gnus-use-vm t)

;;; GNUS setup
(progn
  (progn 
    (setq gnus-use-sendmail nil)
    ;;(setq gnus-use-vm t)
    (setq gnus-use-sc t)
    (setq gnus-use-bbdb t))
  ;; now load gnus-setup
  (when (<= emacs-major-version 24)   ;;;; NOTYET 2019 For emacs 25, What happened to gnus-setup
    (require 'gnus-setup)))

;;; User sophistication
(setq gnus-novice-user t)		; 'cos GNUS has changed *a lot*

;;; News server
;(setq gnus-select-method `(nntp ,eoe-nntp-server))

;;; Identity
(setq gnus-local-domain "by-star.net")
(setq gnus-local-organization "By-Star Libre Services")

;;; Saving articles configuration
(setq gnus-default-article-saver 'gnus-summary-save-in-vm)
(setq gnus-article-save-directory (expand-file-name "~/VM/News"))
(setq gnus-save-all-headers t)
(setq gnus-use-long-file-name t)
(setq gnus-prompt-before-saving t)	; default is 'always

;;; Reading
(setq gnus-large-newsgroup 100)
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-hierarchically)



(setq gnus-nntp-server nil)

(setq gnus-select-method '(nnfolder ""))

(setq gnus-secondary-select-methods '())


(setq gnus-secondary-select-methods
  (append
   gnus-secondary-select-methods
   (list
    (list 'nnimap (concat "net.byname." byname-bp-number)
	  (list 'nnimap-address (concat "imap." byname-bp-number ".byname.net"))
	  (list 'nnimap-list-pattern (list "INBOX" "mail/*"))
	  )
    )))
