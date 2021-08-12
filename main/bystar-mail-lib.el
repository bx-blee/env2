;;; -*- Mode: Emacs-Lisp; -*-
;;; Rcs: $Id: bystar-mail-lib.el,v 1.42 2017-07-26 05:21:01 lsipusr Exp $

(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Vis]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][1 Win]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]]

####+END:
")

(lambda () "
*      ================
*      ================ CONTENTS-LIST ================
*      ================ *[Info]* General TODO List
")


;;
;; bystar:acct:current-show
;;
;; bystar:mail:config-show
;;
;;  TOP LEVEL Entry Point: (bystar:mail:all-defaults-set)
;;
;; bystar:mail               -- Gnus++, --Gnus
;; bystar:mail:ua:           -- General User Agent, Msg Display, ...
;; bystar:mail:addr:         -- Cononaical Addresses and Default Addresses
;; bystar:mail:send:         -- envelope/from + submit-ua
;; bystar:mail:send:menu     --
;; bystar:mail:compose:      -- Origination + Reply
;; bystar:mail:rcv:imap:
;; bystar:mail:rcv:split:
;; bystar:mail:rcv:spam:
;; bystar:mail:deliver:      -- EMSD Later
;; bystar:mail:group:        -- Per Group Customization -- gnus-parameters, gnus-posting-styles
;; bystar:mail:disposition:  -- Archiving,
;; bystar:mail:display:
;; bystar:mail:display:article:
;; bystar:mail:display:summary:
;; bystar:mail:display:group:
;; bystar:mail:bbdb:
;; bystar:mail:gnupg:
;; bystar:mail:mc:  -- Message Crypting -- mc -- mailcrypt
;; bystar:mail:menu:
;;
;; bystar:nntp:
;;
;; bystar:mail:send:orig-envelope-local-part-set
;; bystar:mail:send:orig-envelope-fqma-set
;; bystar:mail:send:orig-from-local-part-set
;; bystar:mail:send:orig-from-fqma-set
;;
;; bystar:mail:send:submit-ua-qmail
;; bystar:mail:send:submit-ua-smtp
;; bystar:mail:send:submit-ua-smtp-auth
;; bystar:mail:send:submit-ua-smtp-auth-tls
;; bystar:mail:send:submit-ua-autoselect
;;
;; bystar:mail:rcv:imap-primary
;; bystar:mail:rcv:imap-extra
;;
;; bystar:mail:compose:desktop
;;


(lambda () "
*      ================ Requires
")

(require 'mailcap)

(require 'gnus-score)
(require 'gnus-cite)


;;;
;;; bbdb-gnus is loaded in bystar-bbdb-lib.el
;;;

;; (when (not (string-equal opRunDistGeneration "1404"))
;;   (require 'bbdb-gnus)  
;;   )

;;(require 'gnus-xmas)
(require 'spam)
(require 'pgg)
;;(require 'bbdb-pgp)
;;(require 'mailcrypt)  ;; apt-get

(require 'smtpmail)

(require 'msend-lib)

(require 'epe-lib)


;;;
;;; TODO, NOTYET, look at archiving
;;;

;; (setq nnmail-expiry-wait 2)
;; (setq nnmail-resplit-incoming t)
;; (setq user-mail-address "user1@example.com")
;; (setq mail-host-address "example.com")
;; (setq gnus-message-archive-group "nnimap+user1:INBOX.Sent")
;; (setq gnus-outgoing-message-group "nnimap+user1:INBOX.Sent")


(lambda () "
*      ================ bystar:mail:all-defaults-set
")


;; (bystar:mail:all-defaults-set)
(defun bystar:mail:all-defaults-set ()
  ""
  (interactive)

  ;;(bystar:mail:colors) ;; Obsoleted

  (bystar:mail:addr:canonicals-set)            ;; bynameForm, bynumberForm,

  (bystar:mail:addr:defaults-set)              ;; default from,env,ephemera

  (bystar:mail:ua:defaults-set)                ;; General preps -- bbdb selection

  (bystar:mail:send:defaults-set)              ;; qmail-inject preps

  ;;(bystar:mail:send:submit-ua-qmail)
  (bystar:mail:send:submit-ua-smtp-auth)
  ;;(bystar:mail:send:submit-ua-smtp-auth-ssl)

  (bystar:nntp:defaults-set)                   ;; No News Servers

  (bystar:mail:rcv:imap-defaults-set)          ;; nnimap+bystar.nu

  (bystar:mail:groups:parameters-defaults-set) ;; per-group params

  (bystar:mail:display:article:html-renderer)  ;; Send to Browser

  (bystar:mail:groups:posting-defaults-set)    ;; per-group from/bcc selection

  (when (string= "wide" epe:screen:size-type)
    (bystar:mail:display:frame-wide))

  (when (string= "basic" epe:screen:size-type)
    (bystar:mail:display:frame-basic))

  (bystar:mail:faces:background-dark)

  (bystar:mail:rcv:split:defaults-set)

  ;;; (require 'offlineimap)
  ;;; (add-hook 'gnus-before-startup-hook 'offlineimap)

  (bystar:mail:compose:spellcheck:enable-flyspell)

  (message "bystar:mail:ua:defaults-set -- Done." )
  )


(lambda () "
*      ================ message-send-hook s
")


;;; (bystar:mail:compose:spellcheck:enable-ispell)
(defun bystar:mail:compose:spellcheck:enable-ispell ()
  ""
  (interactive)
  (add-hook 'message-send-hook 'ispell-message)
  )

(lambda () "
** Delete Below Begin
")

;; ;;; (bystar:spellcheck:enable-org-link-minor-mode)
;; (defun bystar:spellcheck:enable-org-link-minor-mode ()
;;   ""
;;   (interactive)
;;   (org-link-minor-mode 1)
;;   )

;; ;;; (bystar:spellcheck:disable-org-link-minor-mode)
;; (defun bystar:spellcheck:disable-org-link-minor-mode ()
;;   ""
;;   (interactive)
;;   (org-link-minor-mode 0)
;;   )

;; ;;; (bystar:spellcheck:toggle-org-link-minor-mode)
;; (defun bystar:spellcheck:toggle-org-link-minor-mode ()
;;   ""
;;   (interactive)
;;   (call-interactively 'org-link-minor-mode)
;;   )

(lambda () "
** Delete Above
")



;;; (bystar:spellcheck:enable-outline-minor-mode)
(defun bystar:spellcheck:enable-outline-minor-mode ()
  ""
  (interactive)
  (outline-minor-mode 1)
  )

;;; (bystar:spellcheck:disable-outline-minor-mode)
(defun bystar:spellcheck:disable-outline-minor-mode ()
  ""
  (interactive)
  (outline-minor-mode 0)
  )

;;; (bystar:spellcheck:toggle-outline-minor-mode)
(defun bystar:spellcheck:toggle-outline-minor-mode ()
  ""
  (interactive)
  (call-interactively 'outline-minor-mode)
  )


;;; (bystar:spellcheck:enable-flyspell-mode)
(defun bystar:spellcheck:enable-flyspell-mode ()
  ""
  (interactive)
  (flyspell-mode 1)
  )

;;; (bystar:spellcheck:disable-flyspell-mode)
(defun bystar:spellcheck:disable-flyspell-mode ()
  ""
  (interactive)
  (flyspell-mode 0)
  )

;;; (bystar:spellcheck:toggle-flyspell-mode)
(defun bystar:spellcheck:toggle-flyspell-mode ()
  ""
  (interactive)
  (call-interactively 'flyspell-mode)
  )


;;; (bystar:mail:compose:spellcheck:enable-flyspell)
(defun bystar:mail:compose:spellcheck:enable-flyspell ()
  ""
  (interactive)
  (add-hook 'message-setup-hook 'bystar:spellcheck:enable-flyspell-mode)
  )
   

(lambda () "
*      ================ bystar:mail:display:frame-wide
")


;;;
;;; To Be Sorted Begin
;;;

(defun bystar:mail:display:frame-wide ()
  "On a Wide Frame"
  (interactive)

  (gnus-add-configuration
   '(summary
     (horizontal 1.0
		 (vertical 0.6 (summary 1.0 point))
		 (vertical 1.0 (group 1.0)))))

  (gnus-add-configuration
   '(article
     (horizontal 1.0
		 (vertical 0.6 (summary 0.25 point) (article 1.0) )
		 (vertical 1.0  ("*BBDB*" 1.0) (score-trace 0.1)))))
  )


(defun bystar:mail:display:frame-basic ()
  "On a Basic Frame"
  (interactive)

  (gnus-add-configuration
   '(summary
     (horizontal 1.0
		 (vertical 1.0 (summary 1.0 point)))))

  (gnus-add-configuration
   '(article
     (horizontal 1.0
		 (vertical 1.0 (summary 0.3 point) (article 1.0) ))))
  )



(lambda () "
*      ================ bystar:mail:config-show
")

(defvar bystar-gnus-profile-buffer "*BYSTAR-GNUS PROFILE*" "BYSTAR-GNUS PROFILE buffer name.")
;; (setq bystar-gnus-profile-buffer "*BYSTAR-GNUS PROFILE*")

;; (bystar:mail:config-show)
(defun bystar:mail:config-show ()
  "Set up a buffer for showing BYSTAR-ACCT PROFILE"
  (interactive)
  (let ((buffer-name (generate-new-buffer-name bystar-gnus-profile-buffer)))
    (switch-to-buffer buffer-name)
    (insert "BYSTAR-ACCT PROFILE\n")
    (insert "============================================\n")
    (insert (format "bystar-cp_LastName:\t %s\n" bystar-cp_LastName))
    (insert "============================================\n")
    ))



(lambda () "
*      ================ bystar:mail:addr:canonicals-set
")

;;
(defun bystar:mail:addr:canonicals-set ()
  ""
  (interactive)

  (bystar:acct:canonicals-set)

  ;; bystar:mail:addr:default-lpma  -- Local Part Mail Address
  ;; bystar:mail:addr:default-dpma  -- Domain Part Mail Address
  ;; bystar:mail:addr:default-fqma  -- Fully Qualified Mail Address
  ;; bystar:mail:addr:default-name  -- Name, comment part of address

  ;; bystar:mail:addr:byname-shortform-lpma  -- first.last
  ;; bystar:mail:addr:byname-shortform-dpma  -- Base domain (eg byname.net)
  ;; bystar:mail:addr:byname-shortform-fqma  -- Base domain (eg byname.net)

  ;; bystar:mail:addr:bynumber-form-lpma     -- main
  ;; bystar:mail:addr:bynumber-form-dpma     -- Base domain (eg bynumber.net)
  ;; bystar:mail:addr:bynumber-form-fqma     -- Base domain (eg bynumber.net)

  ;; bystar:mail:base-service-name

  (setq bystar:mail:base-service-name (concat "bystar." bystar-cp_acctNu))

  (when (string= "BYNAME" (upcase bystar-cp_ServiceType))
    (progn
      (setq bystar:mail:addr:default-lpma  "main")
      (setq bystar:mail:addr:default-dpma  bystar-cp_acctMainBaseDomain)
      (setq bystar:mail:addr:default-fqma (concat bystar:mail:addr:default-lpma "@" bystar:mail:addr:default-dpma))
      (setq bystar:mail:addr:default-name (concat bystar-cp_FirstName " " bystar-cp_LastName))

      (setq bystar:mail:addr:byname-shortform-lpma (concat bystar-cp_FirstName "." bystar-cp_LastName))
      (setq bystar:mail:addr:byname-shortform-dpma bystar-cp_factoryBaseDomain)
      (setq bystar:mail:addr:byname-shortform-fqma (concat bystar:mail:addr:byname-shortform-lpma "@" bystar:mail:addr:byname-shortform-dpma))

      (setq bystar:mail:addr:bynumber-form-lpma "main")
      (setq bystar:mail:addr:bynumber-form-dpma bystar-cp_acctBynumberBaseDomain)
      (setq bystar:mail:addr:bynumber-form-fqma (concat bystar:mail:addr:bynumber-form-lpma "@" bystar:mail:addr:bynumber-form-dpma))
      ))

  (when (string= "BYSMB" (upcase bystar-cp_ServiceType))
    (progn
      (setq bystar:mail:addr:default-lpma  "main")
      (setq bystar:mail:addr:default-dpma  bystar-cp_acctMainBaseDomain)
      (setq bystar:mail:addr:default-fqma (concat bystar:mail:addr:default-lpma "@" bystar:mail:addr:default-dpma))
      (setq bystar:mail:addr:default-name (concat "BySMB" " " bystar-cp_acctMainBaseDomain))

      (setq bystar:mail:addr:byname-shortform-lpma nil)
      (setq bystar:mail:addr:byname-shortform-dpma nil)
      (setq bystar:mail:addr:byname-shortform-fqma nil)

      (setq bystar:mail:addr:bynumber-form-lpma "main")
      (setq bystar:mail:addr:bynumber-form-dpma bystar-cp_acctBynumberBaseDomain)
      (setq bystar:mail:addr:bynumber-form-fqma (concat bystar:mail:addr:bynumber-form-lpma "@" bystar:mail:addr:bynumber-form-dpma))
      ))
  )

;;; (bystar:mail:rcv:split:defaults-set)
(defun bystar:mail:rcv:split:defaults-set ()
  ""
  (interactive)

  ;;; (setq nnimap-split-inbox '("nnimap+bystar.20000:INBOX.test"))

  ;;;(setq nnimap-inbox "INBOX.test")

  (setq nnimap-split-inbox nil)
  (add-to-list 'nnimap-split-inbox "INBOX.test")
  ;;(add-to-list 'nnimap-split-inbox "INBOX.friend")

  (setq nnimap-split-predicate "UNDELETED")

  (setq nnimap-split-crosspost nil)

  (setq nnimap-split-methods
       '(("mail.mine" "^From:.*")
         ("mail.mine" "^Subject:.*FYI.*")
         ("mail.mine" "")))



  ;;; (setq nnimap-split-rule '(("bystar.20000" ("INBOX.test" nnimap-split-fancy))))

  ;; (setq nnimap-split-rule nil)
  ;; (add-to-list 'nnimap-split-rule
  ;; 	       (list bystar:mail:base-service-name
  ;; 		     (list "INBOX.test" 'nnimap-split-fancy)))

  ;; (setq nnimap-split-fancy
  ;;     '(|
  ;; 	("Subject" ".*" "INBOX.fyi")
  ;; 	"INBOX.exception"))

  )





(defun junkYard:bystar:mail:rcv:split:defaults-set ()
  ""
  (interactive)
  ;;;; (setq nnimap-split-rule '(("Example" ("INBOX" nnimap-split-fancy)))


  (setq nnimap-split-rule 'nnimap-split-fancy)



  (setq nnimap-split-fancy
      '(|
	(any "auser@example\\.com" "INBOX.fyi")
	("subject" ".*" "INBOX.fyi")
	("from" "MAILER-DAEMON@example\\.com"
	 "INBOX.fyi")
	(any "myaddr@example.com" "INBOX.fyi")
	"INBOX.fyi"))



(setq nnimap-split-rule
                '(("bystar.20000:INBOX.fyi"
                   ".*")))


 (setq nnimap-split-rule
                '(("INBOX.fyi"
                   "^Sender: owner-nnimap@vic20.globalcom.se")
                  ("INBOX.fyi"    "^Subject:.*FYI.*")
                  ("INBOX.fyi" "")))

  (setq nnimap-split-rule
                '(("bystar.20000:INBOX.fyi"
                   "^Sender: owner-nnimap@vic20.globalcom.se")
                  ("bystar.20000:INBOX.fyi"    "^Subject:.*FYI.*")
                  ("bystar.20000:INBOX.fyi" "")))



  )


(lambda () "
*      ================ bystar:mail:addr:defaults-set
")



(defun bystar:mail:addr:defaults-set ()
  ""
  (interactive)

  (bystar:mail:addr:canonicals-set)

  (when (not (eq bystar:ue:form-factor 'handset))
    (setq bystar:mail:addr:ephemera-envelope-local-part
	  (shell-command-to-string
	   ( format "/bin/echo -n $( /opt/public/osmt/bin/bystarMailAddrManage.sh -h -v -n showRun -p bystarUid=%s -i ephemeraGetCurrentLocalPart envelope )" bystar-cp_acctUid) )))

  (when (eq bystar:ue:form-factor 'handset)
    (setq bystar:mail:addr:ephemera-envelope-local-part "envelope201009"))

  (setq bystar:mail:addr:ephemera-envelope-fqma
	(concat bystar:mail:addr:ephemera-envelope-local-part "@" bystar:mail:addr:default-dpma))


  (when (not (eq bystar:ue:form-factor 'handset))
    (setq bystar:mail:addr:ephemera-generic-local-part
	  (shell-command-to-string
	   ( format "/bin/echo -n $( /opt/public/osmt/bin/bystarMailAddrManage.sh -h -v -n showRun -p bystarUid=%s -i ephemeraGetCurrentLocalPart e )" bystar-cp_acctUid) )))

  (when (eq bystar:ue:form-factor 'handset)
    (setq bystar:mail:addr:ephemera-generic-local-part "e201009"))


  (setq bystar:mail:addr:ephemera-generic-fqma
	(concat bystar:mail:addr:ephemera-generic-local-part "@" bystar:mail:addr:default-dpma))

  (setq bystar:mail:addr:default-envelope-local-part
	bystar:mail:addr:ephemera-envelope-local-part)

  (setq bystar:mail:addr:default-envelope-fqma
	bystar:mail:addr:ephemera-envelope-fqma)

  (setq bystar:mail:addr:default-from-local-part "main")

  (setq bystar:mail:addr:default-from-fqma
	(concat bystar:mail:addr:default-from-local-part "@" bystar:mail:addr:default-dpma))


  (message "bystar:mail:addr:defaults-set -- Done." )
  )

(defun bystar:mail:disposition:defaults-set ()
  ""
  (interactive)

  ;; Reading, Formatting, Processing

  ;;; Reading
  (setq gnus-large-newsgroup 100)
  (setq gnus-subscribe-newsgroup-method 'gnus-subscribe-hierarchically)

   ;;; Saving articles configuration
  (setq gnus-default-article-saver 'gnus-summary-save-in-file)
  (setq gnus-article-save-directory (expand-file-name "~/News"))
  (setq gnus-save-all-headers t)
  (setq gnus-use-long-file-name t)
  (setq gnus-prompt-before-saving t)	; default is 'always

  (message "bystar:mail:disposition:defaults-set -- Done." )
  )

;; (bystar:mail:display:article:html-renderer
(defun bystar:mail:display:article:html-renderer ()
  "NOTYET, needs sorting of composition vs render vs hook"
  (interactive)


    (setq mm-content-transfer-encoding-defaults
      '(("text/x-patch" 8bit)
	("text/.*" qp-or-base64)
	("message/rfc822" 8bit)
	("application/emacs-lisp" 8bit)
	("application/x-patch" 8bit)
	("application/pdf" base64)
	(".*" qp-or-base64)))

;;(setq gnus-summary-line-format ":%U%R %B %s %-60=|%4L |%-20,20f |%&user-date; \n")
;; lrm added before |
(setq gnus-summary-line-format ":%U%R %B %s %-60=\u200E|%4L |%-20,20f\u200E|%&user-date; \n")

;;
;; NOTYET, needs cleaning
;;
;(setq mm-text-html-renderer 'links)   ;; This is then later over riden with 'pipe-to-mozilla in mm-extensions.el
;(setq mm-text-html-renderer 'lynx)
;(setq mm-text-html-renderer 'html2text)
;(setq mm-text-html-renderer 'w3m)

;;(setq mm-text-html-renderer-alist nil)

;; mm-text-html-renderer-alist
(add-to-list 'mm-text-html-renderer-alist
	     '(true-w3m mm-inline-render-with-stdin
			nil "w3m" "-T" "text/html"))

;;; NOTYET, Causes problems in SQUEEZE emacs24
;; (add-to-list 'mm-text-html-washer-alist
;; 	     '(true-w3m mm-inline-wash-with-stdin
;; 			nil "w3m" "-T" "text/html"))

(add-to-list 'mm-text-html-renderer-alist
	     '(pipe-to-mozilla mm-inline-render-with-stdin
			nil "/opt/public/osmt/bin/lcaMozillaAdmin.sh" "-i" "stdin" "text/html"))

;;; NOTYET, Causes problems in SQUEEZE emacs24
;; (add-to-list 'mm-text-html-washer-alist
;; 	     '(pipe-to-mozilla mm-inline-wash-with-stdin
;; 			nil "/opt/public/osmt/bin/lcaMozillaAdmin.sh" "-i" "stdin" "text/html"))

;(add-to-list 'mm-text-html-renderer-alist
;	     '(mhonarc-and-w3m  mhonarc-save-and-feed nil "" "" "" ""))

(add-to-list 'mm-text-html-renderer-alist
	     '(mhonarc-and-w3m  mm-inline-text-html-render-with-w3m-standalone))

;; (add-to-list 'mm-text-html-renderer-alist
;; 	     `(mhonarc-and-w3m mm-inline-render-with-stdin
;;    			nil "/opt/public/osmt/bin/bueMailManage.sh" "-i" "msgHtmlProc" ,(concat "~/mhonarc/var/input" "/msg"))


;(setq mm-text-html-renderer 'pipe-to-mozilla)
(setq mm-text-html-renderer 'mhonarc-and-w3m)
;;(setq mm-text-html-renderer 'nil)

(defun my-gnus-summary-view-html-alternative ()
      "Display the HTML part of the current multipart/alternative MIME message
    in mozilla."
      (interactive)
      (setq browser-hook-is-controlled t)
      (save-current-buffer
        (gnus-summary-show-article)
        (set-buffer gnus-article-buffer)
        (let ((file (make-temp-file "html-message-" nil ".html"))
              (handle (nth 3 (assq 1 gnus-article-mime-handle-alist))))
          (mm-save-part-to-file handle file)
          ;;(browse-url-mozilla (concat "file://" file)))))
	  (browse-url (concat "file://" file)))))

(add-hook 'message-mode-hook
	  (lambda ()
	    (setq fill-column 50)
	    (turn-on-auto-fill)))

)

;;(add-hook 'message-mode-hook 'org-link-minor-mode)
;;;(add-hook 'message-mode-hook 'bystar:spellcheck:enable-org-link-minor-mode)

(setq mm-attachment-override-types '("image/.*"))

;; Don't start a browser for text/html only mails
    (setq mm-automatic-display
          '("text/plain" "text/html" "text/enriched" "text/richtext"
            "image/.*" "message/delivery-status" "multipart/.*" "message/rfc822"
            "text/x-patch" "application/pgp-signature" "application/emacs-lisp"))

(add-to-list 'mm-inline-media-tests
          '("application/msword" mm-inline-text identity))
    (add-to-list 'mm-automatic-external-display "application/msword")
    (add-to-list 'mm-automatic-external-display "text/html")
    (add-to-list 'mm-automatic-external-display "html")
    (add-to-list 'mm-attachment-override-types "application/msword")
    (add-to-list 'mm-automatic-display "application/msword")
    (add-to-list 'mm-automatic-display "text/html")

(defun mhonarc-save-and-feed (handle)
  ""
   (mm-inline-text-html-render-with-w3m-standalone handle)
   )

(defun mm-inline-text-html-render-with-w3m-standalone (handle)
  (let ((source (mm-get-part handle))
	(cs (mail-content-type-get (mm-handle-type handle) 'charset)))
    (unless (and cs
		 (setq cs (mm-charset-to-coding-system cs))
		 (not (eq cs 'ascii)))
      (setq cs 'iso-8859-1)) ;; the default

    (mm-insert-inline
     handle
     (mm-with-unibyte-buffer
       (insert source)
       (let ((coding-system-for-write 'binary)
	     (coding-system-for-read 'binary))

	 (call-process-region
	  (point-min) (point-max)
	  "w3m" t t nil "-dump" "-T" "text/html"
	  "-I" (symbol-name cs) "-O" (symbol-name cs))
	 )
       (decode-coding-string (buffer-string) cs)))
    ))




;;(setq gnus-article-prepare-hook nil)
(add-hook 'gnus-article-prepare-hook 'bue:gnus-article-copy-mhonarc-to-browser)

(setq browser-hook-is-controlled nil)

(defun bue:gnus-article-copy-mhonarc-to-browser ()
  (interactive)
  (if (eq browser-hook-is-controlled nil)
      (save-excursion
	(gnus-summary-copy-article 1 "nndraft:drafts")
	(lsip-run-command
	 (format "/opt/public/osmt/bin/bueMailManage.sh -h -v -n showRun -p ri=any:mailFolders -p bystarUid=%s -i msgHtmlHook" bystar:acct:uid-name)
	 "localhost"
	 "lsipusr"
	 "nopasswd")
	)
    (setq browser-hook-is-controlled nil)
    )
  ;; Prior to 24.1 this was not necessary
  (gnus-article-show-summary)

  ;;(gnus-select-frame-set-input-focus (selected-frame))
  )



(defun mhonarcFileName (NEWSGROUP HEADERS &rest LAST-FILE)
  ""
  (interactive)
  (setq tName (make-temp-name "mhonarc"))
  (concat "~/mhonarc/var/input" "/msg")
   )

(defun mhonarcFileName2 (NEWSGROUP HEADERS &rest LAST-FILE)
  ""
  (interactive)
  (setq tName (make-temp-name "mhonarc"))
  (concat "~/mhonarc/var/input" "/header")
   )

(defun mhonarcFileName3 (NEWSGROUP HEADERS &rest LAST-FILE)
  ""
  (interactive)
  (setq tName (make-temp-name "mhonarc"))
  (concat "~/mhonarc/var/input" "/body")
   )



(defun bystar:mail:display:group:defaults-set ()
  ""
  (interactive)
   )


(defun bystar:mail:display:summary:defaults-set ()
  ""
  (interactive)
   )



(defun bystar:mail:display:article:defaults-set ()
  ""
  (interactive)

;;; visual
;;; ######

(setq gnus-treat-emphasize t
      gnus-treat-buttonize t
      gnus-treat-buttonize-head 'head
      gnus-treat-unsplit-urls 'last
      gnus-treat-leading-whitespace 'head
      gnus-treat-highlight-citation t
      gnus-treat-highlight-signature t
      gnus-treat-date-lapsed 'head
      gnus-treat-strip-trailing-blank-lines t
      gnus-treat-strip-cr t
      gnus-treat-overstrike nil
      gnus-treat-display-x-face t
      gnus-treat-display-face t
      gnus-treat-display-smileys nil
      gnus-treat-x-pgp-sig 'head)

(setq gnus-visible-headers
      (mapconcat 'regexp-quote
                 '("From:" "Newsgroups:" "Subject:" "Date:"
                   "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                   "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                   "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                   "X-Attachments" "X-Diagnostic")
                 "\\|"))

(setq gnus-group-sort-groups
      '(gnus-sort-by-rank gnus-sort-by-alphabet))

(setq gnus-group-line-format "%P  %(%~(pad-right 50)G%) unread: %-4N\n"
      gnus-topic-line-format "%i[ %0{%(%n (new: %a)%)%} ]\n")

   )

(defun bystar:mail:display:article:defaults-set ()
  ""
  (interactive)

;;; summary and article buffer
;;; ##########################

(setq gnus-visible-headers
      (mapconcat 'regexp-quote
                 '("From:" "Newsgroups:" "Subject:" "Date:"
                   "Organization:" "To:" "Cc:" "Followup-To" "Gnus-Warnings:"
                   "X-Sent:" "X-URL:" "User-Agent:" "X-Newsreader:"
                   "X-Mailer:" "Reply-To:" "X-Spam:" "X-Spam-Status:" "X-Now-Playing"
                   "X-Attachments" "X-Diagnostic")
                 "\\|"))

(setq gnus-group-line-format "%P  %(%~(pad-right 50)G%) unread: %-4N\n"
      gnus-summary-line-format "%U%R %d %*%5L%I %(%z%[%-23,23f%]%) %s\n"
      gnus-topic-line-format "%i[ %0{%(%n (new: %a)%)%} ]\n")

(setq gnus-auto-select-first t
      gnus-auto-select-next t
      gnus-fetch-old-headers 200

      gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date))

      gnus-article-sort-functions
      '((not gnus-article-sort-by-date))

      gnus-show-mime t
      gnus-show-mime-method 'gnus-article-preview-mime-message
      gnus-buttonized-mime-types '(".*/.*")
      message-forward-before-signature nil
      mm-inline-large-images nil
      gnus-article-date-lapsed-new-header t

      gnus-inews-mark-gcc-as-read t
      gnus-gcc-mark-as-read t)


   )



(defun bystar:mail:display:summary:defaults-set ()
  ""
  (interactive)
  )


(defun bystar:mail:scoring:defaults-set ()
  ""
  (interactive)


(lambda () "
*      ================ scoring
")


(setq gnus-use-scoring t
      gnus-save-score t
      gnus-summary-expunge-below -20
      gnus-score-followup-thread 10
      gnus-score-followup-article 10
      bbdb/gnus-score-default 5
      gnus-score-thread-simplify t
      gnus-use-adaptive-scoring nil)

(setq gnus-score-find-score-files-function
      '(gnus-score-find-bnews bbdb/gnus-score))

   )


(lambda () "
*      ================ bystar:mail:bbdb
")


(defun bystar:mail:bbdb:defaults-set ()
  ""
  (interactive)

  (bbdb-initialize 'gnus 'message)
  (setq bbdb/gnus-summary-prefer-real-names t
	bbdb/gnus-summary-prefer-bbdb-data t
	bbdb-completion-type 'primary-or-name
	bbdb-use-pop-up nil
	bbdb/pgp-default-action nil)

  (setq bbdb-auto-notes-alist
	(quote (("Subject" (".*" last-subj 0 t))
              ("Organisation" (".*" organisation 0 t))
              ("Organization" (".*" organisation 0 t))
              ("X-Newsreader" (".*" mailer 0 t))
              ("X-Mailer" (".*" mailer 0 t))
              ("User-Agent" (".*" mailer 0 t))
              ("X-URL" (".*" url 0 t)))))
)


(lambda () "
*      ================ bystar:mail:gnupg -- PGP
")


(defun bystar:mail:gnupg:defaults-set ()
  ""
  (interactive)

  (mc-setversion "gpg")
  (setq mc-passwd-timeout 600
	gpg-default-key-id "FD866533"
	mm-verify-option 'known
	mm-decrypt-option 'known)

  (setq mml2015-use 'pgg)
  (setq pgg-scheme 'gpg
	pgg-cache-passphrase t
	pgg-passphrase-cache-expiry 1800
	pgg-gpg-user-id "FD866533")

  (setq mml-default-sign-method "pgpmime")

   )

(defun bystar:mail:hooksNOTYET:defaults-set ()
  ""
  (interactive)

  ;; All Hooks in one place is not a good idea.
  ;; devide them through out capabilities.

;;; hooks
;;; #####

  ;; (add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)
  ;; (add-hook 'message-mode-hook 'mc-install-write-mode)
  ;; (add-hook 'news-reply-mode-hook 'mc-install-write-mode)
  ;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  ;; (add-hook 'message-setup-hook 'bbdb-define-all-aliases)
  ;; (add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
  ;; (add-hook 'message-header-setup-hook 'message-sort-headers)
  ;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
  ;; (remove-hook 'gnus-mark-article-hook 'gnus-summary-mark-read-and-unread-as-read)
  ;; (add-hook 'gnus-mark-article-hook 'gnus-summary-mark-unread-as-read)

  ;; ;;;(add-hook 'message-mode-hook 'turn-on-orgstruct) Obsoleted By outshine and outorg
  
  ;; (add-hook 'message-mode-hook 'org-link-minor-mode)

  ;; (gnus-start-date-timer)
  )

(lambda () "
*      ================ bystar:mail:ua:defaults-set
")


;; (bystar:mail:ua:defaults-set)
(defun bystar:mail:ua:defaults-set ()
  ""
  (interactive)

   ;;; Identity
  (setq gnus-local-domain "bystar:mail:addr:default-dpma")
  (setq gnus-local-organization "ByStar Federation of Autonomous Libre Services -- http://www.by-star.net")
  (setq user-mail-address bystar:mail:addr:default-fqma)
  (setq user-full-name bystar:mail:addr:default-name)


  ;;(setq mail-user-agent 'message-user-agent) -- NOTYET, What is the best choice, really
  (setq mail-user-agent 'gnus-user-agent)

  (setq gnus-use-sendmail nil)
  (setq gnus-use-vm nil)
  (setq gnus-use-sc t)
  (setq gnus-use-bbdb t)
  ;; now load gnus-setup
  (when (<= emacs-major-version 24)   ;;;;  gnus-setup was part of emacs 24 Gnus
    (require 'gnus-setup))

  (unless (<= emacs-major-version 24)   ;;;; 2019 For emacs 25, we are using a repalcement -- perhaps not necessary
    (when (< emacs-major-version 27)
    (require 'gnus-setup-replacement)))
  
   ;;; User sophistication
  (setq gnus-novice-user t)		; 'cos GNUS has changed *a lot*

  (require 'mailing-from-base)

  (message "bystar:mail:ua:defaults-set -- Done." )
  )


;; (bystar:nntp:defaults-set)
(defun bystar:nntp:defaults-set ()
  ""
  (interactive)

  (setq gnus-nntp-server nil)

  (setq gnus-select-method '(nnfolder ""))


  (message "bystar:mail:addr:defaults-set -- Done." )
  )

(lambda () "
*      ================ bystar:mail:send:defaults-set
")


;; (bystar:mail:send:defaults-set)
(defun bystar:mail:send:defaults-set ()
  ""
  (setq debug-on-error t)
  (interactive)

  ;;(bystar:mail:addr:defaults-set)

  ;;(setq message-default-headers (concat "Reply-To: " bystar:mail:addr:default-fqma "\n"))

  ;;(setq gnus-message-archive-group "mail.mine")
  ;;(setq gnus-message-archive-method '(nnml "mail.mine"))
  (setq gnus-outgoing-message-group "nnml:mail.mine")



  (bystar:mail:send:orig-envelope-fqma-set bystar:mail:addr:default-envelope-fqma)
  (bystar:mail:send:orig-from-fqma-set bystar:mail:addr:default-from-fqma)


  (when (eq bystar:ue:form-factor 'handset)
    (bystar:mail:send:submit-ua-smtp-auth))

  (when (eq bystar:ue:form-factor 'laptop)
    (bystar:mail:send:submit-ua-smtp-auth-ssl))

  (when (eq bystar:ue:form-factor 'desktop)
    (progn
      (bystar:mail:send:submit-ua-smtp-auth-ssl)
      ;;(bystar:mail:send:submit-ua-qmail)
      ))

  (when (eq bystar:ue:form-factor 'testing)
    (progn
      (bystar:mail:send:marme-outMail)
      ))

;;(setq message-generate-headers-first t)
;;(setq mime-editor/split-message nil)

  (message "bystar:mail:addr:defaults-set -- Done." )
  )



(lambda () "
*      ================ bystar:mail:send:marme-outMail
")

;; (bystar:mail:send:marme-outMail)
(defun bystar:mail:send:marme-outMail ()
  ""
  (interactive)

  (setq message-send-mail-function 'message-send-mail-with-qmail)
  (setq message-qmail-inject-program "env")

  ;; Envelop Setting
  ;; QMAILINJECT=i -- lets qmail-inject write the message-id
  ;; Envelop addr writen by -f
  (setq message-qmail-inject-args
	(list
	 "-"
	 "QMAILINJECT=i"
	 "qmail-inject"
	 "-f"
	 (format "%s" bystar:mail:addr:ephemera-envelope-fqma)
	 )
	)
  )


(lambda () "
*      ================ bystar:mail:send:submit-ua-qmail
")

;; (bystar:mail:send:submit-ua-qmail)
(defun bystar:mail:send:submit-ua-qmail ()
  ""
  (interactive)

  (setq message-send-mail-function 'message-send-mail-with-qmail)
  (setq message-qmail-inject-program "env")

  ;; Envelop Setting
  ;; QMAILINJECT=i -- lets qmail-inject write the message-id
  ;; Envelop addr writen by -f
  (setq message-qmail-inject-args
	(list
	 "-"
	 "QMAILINJECT=i"
	 "qmail-inject"
	 "-f"
	 (format "%s" bystar:mail:addr:ephemera-envelope-fqma)
	 )
	)
  )


(lambda () "
*      ================ bystar:mail:send:submit-ua-qmail
")



;; (bystar:mail:send:submit-ua-smtp-tmo)
(defun bystar:mail:send:submit-ua-smtp-tmo ()
  ""
  (interactive)

  (setq smtpmail-queue-mail nil)
  (setq smtpmail-debug-info t)
  (setq smtpmail-smtp-service 25)
  (setq smtpmail-auth-supported nil)
  (setq message-sendmail-f-is-evil t)
  (setq mail-envelope-from "mohsen.banan1@t-mobile.com")

  (setq message-send-mail-function 'smtpmail-send-it)
  (setq send-mail-function 'smtpmail-send-it)

  (setq smtpmail-smtp-server "mail.t-mobile.com")
  (setq smtp-server "mail.t-mobile.com")
  (setq smtpmail-local-domain "t-mobile.com")
  (setq smtp-local-domain "t-mobile.com")
  )


;; (bystar:mail:send:submit-ua-smtp-auth)
(defun bystar:mail:send:submit-ua-smtp-auth ()
  ""
  (interactive)

  (setq smtpmail-queue-mail nil)
  (setq smtpmail-debug-info t)
  (setq smtpmail-smtp-service 587)
  (setq smtpmail-auth-supported '(login))
  (setq message-sendmail-f-is-evil t)
  (setq mail-envelope-from bystar:mail:addr:default-envelope-fqma)

  (setq message-send-mail-function 'smtpmail-send-it)
  (setq send-mail-function 'smtpmail-send-it)

  (setq smtpmail-smtp-server (concat "smtp." bystar:mail:addr:default-dpma))
  (setq smtp-server (concat "smtp." bystar:mail:addr:default-dpma))   ;;; Needed for some emacs24 -- NOTYET
  (setq smtpmail-local-domain bystar:mail:addr:default-dpma)
  (setq smtp-local-domain bystar:mail:addr:default-dpma)  ;;; goes with smtp-server

  (setq smtpmail-auth-credentials "~/.authinfo")

;;;   (setq smtpmail-auth-credentials
;;;         `((
;;; 	   ,smtpmail-smtp-server
;;;            587
;;; 	   ,bystar:acct:uid-name
;;; 	   ,bystar:acct:passwd-decrypted
;;; 	   )
;;; 	  ))

  (setq smtpmail-starttls-credentials nil)
   )


(lambda () "x
*      ================ bystar:mail:send:submit-ua-smtp-auth-ssl
")


;; (bystar:mail:send:submit-ua-smtp-auth-ssl)
(defun bystar:mail:send:submit-ua-smtp-auth-ssl ()
  "Port 465 does ssl only and
  smtpmail-starttls-credentials -- so this does not work"
  (interactive)


  (setq smtpmail-queue-mail nil)
  (setq smtpmail-debug-info t)
  (setq smtpmail-debug-verb t)
  (setq smtpmail-smtp-service 465)
  (setq message-sendmail-f-is-evil t)
  (setq mail-envelope-from bystar:mail:addr:default-envelope-fqma)

  (setq message-send-mail-function 'smtpmail-send-it)
  (setq send-mail-function 'smtpmail-send-it)


  (setq smtpmail-smtp-server (concat "smtp." bystar:mail:addr:default-dpma))
  (setq smtpmail-local-domain bystar:mail:addr:default-dpma)

  (setq smtpmail-auth-credentials "~/.authinfo")

;;;   (setq smtpmail-auth-credentials
;;;         `((
;;; 	   ,smtpmail-smtp-server
;;;            465
;;; 	   ,bystar:acct:uid-name
;;; 	   ,bystar:acct:passwd-decrypted
;;; 	   )
;;; 	  ))

  (setq starttls-use-gnutls t)

  (setq smtpmail-starttls-credentials
        `((
	   ,smtpmail-smtp-server
           465
	   nil
	   nil
	   )
	  ))
  )

;;
;;
(defun bystar:mail:send:submit-ua-smtp-auth-tls-example ()
  ""
  (interactive)

  (setq smtpmail-queue-mail nil
        smtpmail-debug-info t
        smtpmail-smtp-service 587
        message-sendmail-f-is-evil t
        mail-envelope-from "eric@knauel.org"

        message-send-mail-function 'smtpmail-send-it
        send-mail-function 'smtpmail-send-it

        smtpmail-smtp-server "abbruchco.de"
        smtpmail-local-domain "knauel.org")

  ;; A hack. Somehow LOGIN doesn't seem to work
  ;; with abbruchco.de...
  (setq smtpmail-auth-supported '(cram-md5))

  (defvar ejk-knauel-org-password nil)

  (setq ejk-knauel-org-password
        (let ((password-file (expand-file-name "~/.gnupg/password.knauel.org")))
          (if (file-exists-p password-file)
              (with-temp-buffer
                (insert-file-contents password-file)
                (buffer-string)))))

  (setq smtpmail-auth-credentials
        `(("abbruchco.de"
           587 "eric@knauel.org" ,ejk-knauel-org-password)))

  (setq smtpmail-starttls-credentials
        `(("abbruchco.de" 587
           ,(expand-file-name "~/.gnupg/ssl/self-signed.key")
           ,(expand-file-name "~/.gnupg/ssl/self-signed.cert"))))
  )


(lambda () "
*      ================ bystar:mail:rcv:imap-defaults-set
")


; (bystar:mail:rcv:imap-defaults-show)
(defun bystar:mail:rcv:imap-defaults-show ()
  ""
  (interactive)
  (describe-variable 'gnus-secondary-select-methods)
  )


; (bystar:mail:rcv:imap-defaults-set)
(defun bystar:mail:rcv:imap-defaults-set ()
  ""
  (interactive)

  (setq gnus-secondary-select-methods '())

  (when (not (eq bystar:ue:form-factor 'handset))
    (bystar:mail:rcv:imap-ssl-service-add))

  (when (eq bystar:ue:form-factor 'handset)
    (bystar:mail:rcv:imap-service-add))

  )

; (bystar:mail:rcv:imap-service-add)
(defun bystar:mail:rcv:imap-service-add ()
  ""
  (interactive)

  (when (bystar:mail:mode:residentMsMta-p)
    (add-to-list 'gnus-secondary-select-methods
		 (list 'nnimap bystar:mail:base-service-name
		       (list 'nnimap-address "localhost")
		       (list 'nnimap-server-port 143)
		       (list 'nnimap-stream 'network)
		       (list 'nnimap-list-pattern (list "INBOX" "INBOX.*" ))))
    )

  (when (bystar:mail:mode:remoteMs-p)   
    (add-to-list 'gnus-secondary-select-methods
		 (list 'nnimap bystar:mail:base-service-name
		       (list 'nnimap-address (concat "imap." bystar-cp_acctMainBaseDomain))
		       (list 'nnimap-list-pattern (list "INBOX" "INBOX.*" ))))
    )
  )

; (bystar:mail:rcv:imap-ssl-service-add)
(defun bystar:mail:rcv:imap-ssl-service-add ()
  ""
  (interactive)

  (when (bystar:mail:mode:residentMsMta-p)
    (add-to-list 'gnus-secondary-select-methods
		 (list 'nnimap bystar:mail:base-service-name
		       (list 'nnimap-address "localhost")
		       (list 'nnimap-server-port 143)
		       (list 'nnimap-stream 'network)
		       (list 'nnimap-list-pattern (list "INBOX" "INBOX.*" ))))
    )

  (when (bystar:mail:mode:remoteMs-p)  
    (add-to-list 'gnus-secondary-select-methods
		 (list 'nnimap bystar:mail:base-service-name
		       (list 'nnimap-address (concat "imap." bystar-cp_acctMainBaseDomain))
		       (list 'nnimap-server-port 993)
		       (list 'nnimap-stream 'ssl)
		       (list 'nnimap-list-pattern (list "INBOX" "INBOX.*" ))))
    )

  ;; (nnimap-authenticator login))

  )


; (bystar:mail:groups:defaults-set)
(defun bystar:mail:groups:defaults-set ()
  ""
  (interactive)


  )

;;(gnus-group-unsubscribe-group "nntp+news.gmane.org:gmane.emacs.bidi")

; (gnus-group-name-change-level:bx "nntp+news.gmane.org:gmane.emacs.bidi" 6)
(defun gnus-group-name-change-level:bx (group-name level)
  ""
  (interactive)

  (gnus-group-change-level
   (gnus-group-entry group-name)
   level
   )
  )


; (bx:gnus-group-name-change-level ".fyi" 2)
(defun bx:gnus-group-name-change-level (group-prefix level)
  ""
  (interactive)

  (gnus-group-change-level
   (gnus-group-entry (concat "nnimap+bystar." bystar-cp_acctNu ":INBOX" group-prefix))
   level
   )
  )

; (bx:gnus-group-name-change-level-list '(".fyi" ".form") 2)
(defun bx:gnus-group-name-change-level-list (group-prefix-list level)
  ""
  (interactive)

  (mapcar '(lambda (arg)
	     (bx:gnus-group-name-change-level arg level))
	  group-prefix-list)
  )


; (bystar:mail:groups:level:all-set)
(defun bystar:mail:groups:level:all-set ()
  ""
  (interactive)

  (bystar:mail:groups:level:1-set)
  (bystar:mail:groups:level:2-set)
  (bystar:mail:groups:level:3-set)
  (bystar:mail:groups:level:4-set)
  ;(bystar:mail:groups:level:5-set)
  (bystar:mail:groups:level:6-set)
  (bystar:mail:groups:level:7-set)
  )

; (bystar:mail:groups:level:1-set)
(defun bystar:mail:groups:level:1-set ()
  "BFDM Gnus Level 1 -- Urgent / Very Important"
  (interactive)

  (let (
	(level-1-list '(
".urgent"
".text"
".exception"
""
".form"
".activism"
".desk"
".family"
".friend"
".personal"
".job"
".school"
)
		    ))
    (bx:gnus-group-name-change-level-list level-1-list 1)
    ))


; (bystar:mail:groups:level:2-set)
(defun bystar:mail:groups:level:2-set ()
  "BFDM Gnus Level 2 -- Important"
  (interactive)

  (let (
	(level-2-list '(
".envelope.old"
".forsale"
".mobile"
".null"
".test"
".web"
".confirmation"
".envelope.current"
".indirect"
".system"
)
		      ))
    (bx:gnus-group-name-change-level-list level-2-list 2)
    ))

; (bystar:mail:groups:level:3-set)
(defun bystar:mail:groups:level:3-set ()
  "BFDM Gnus Level 3 -- Less Important"
  (interactive)

  (let (
	(level-3-list '(
".fyi"
".weblog"
".AlmostJunk"
".Sent"
".bookmark"
".fax"
".vendor"
".public"
".record"
)
		      ))
    (bx:gnus-group-name-change-level-list level-3-list 3)
    ))

; (bystar:mail:groups:level:4-set)
(defun bystar:mail:groups:level:4-set ()
  "BFDM Gnus Level 4 -- -- Subscribed Mailing Lists"
  (interactive)

  (let (
	(level-4-list '(
".LIST.org-freeprotocols.rim-6219694"
".LIST.general"
".LIST.net-payk.iran-news"
".LIST.org-emsd.announce"
".LIST.org-emsd.interest"
".LIST.org-esro.announce"
".LIST.org-esro.esro-spec"
".LIST.org-esro.interest"
".LIST.org-freeprotocols.announce"
".LIST.org-freeprotocols.interest"
".LIST.org-gslug.general"
".LIST.org-leapforum.announce"
".LIST.org-sasag.general"
".LIST.org-seattleplone.general"
".LIST.org-vorde.announce"
".LIST.records"
".lists.misc"
".LIST.net-payk.pnw-iranians.mmaInbox"
".LIST.org-emsd.emsd-spec"
".LIST.org-ietf.announce"
".LIST.org-ietf.discussion"
".LIST.org-leapforum.interest"
".LIST.org-vorde.interest"
".LIST.org-emsd"
".LIST.org-sasag"
".lists"
".LIST"
".LIST.edu-gulf2000"
".LIST.net-payk.pnw-iranians"
".LIST.org-freeprotocols"
".LIST.org-gslug"
".LIST.org-seattleplone"
".LIST.org-vorde"
)
		      ))
    (bx:gnus-group-name-change-level-list level-4-list 4)
    ))



; (bystar:mail:groups:level:5-set)
(defun bystar:mail:groups:level:5-set ()
  "BFDM Gnus Level 5 -- GMANE / News Groups"
  (interactive)

  (let (
	(level-5-list '(
"nntp+news.gmane.org:gmane.comp.misc.persiancomputing"
"nntp+news.gmane.org:gmane.emacs.announce"
"nntp+news.gmane.org:gmane.emacs.bbdb.announce"
"nntp+news.gmane.org:gmane.emacs.bbdb.user"
"nntp+news.gmane.org:gmane.emacs.bidi"
"nntp+news.gmane.org:gmane.emacs.blogging"
"nntp+news.gmane.org:gmane.emacs.cvs"
"nntp+news.gmane.org:gmane.emacs.devel"
"nntp+news.gmane.org:gmane.emacs.gnus.announce"
"nntp+news.gmane.org:gmane.emacs.gnus.general"
"nntp+news.gmane.org:gmane.emacs.gnus.patches"
"nntp+news.gmane.org:gmane.emacs.gnus.user"
"nntp+news.gmane.org:gmane.emacs.orgmode"
"nntp+news.gmane.org:gmane.emacs.remember.general"
"nntp+news.gmane.org:gmane.emacs.sources"
"nntp+news.gmane.org:gmane.ietf.x509"
"nntp+news.gmane.org:gmane.linux.debian.freedombox.user"
"nntp+news.gmane.org:gmane.linux.debian.jobs"
"nntp+news.gmane.org:gmane.linux.debian.packages.emacs.devel"
"nntp+news.gmane.org:gmane.linux.debian.user.announce"
"nntp+news.gmane.org:gmane.linux.debian.user.isp"
"nntp+news.gmane.org:gmane.org.comp.autonomous.discuss"
"nntp+news.gmane.org:gwene.us.autonomo"
)
		      ))

    (mapcar '(lambda (arg)
	       (gnus-group-name-change-level:bx arg 5))
	    level-5-list)
    )
  )



; (bystar:mail:groups:level:6-set)
(defun bystar:mail:groups:level:6-set ()
  "BFDM Gnus Level 6 -- -- Subscribed Mailing Lists"
  (interactive)

  (let (
	(level-6-list '(
".spam.detected.rare"
".spam.detected.usual"
".training.spam"
".training.ham"
)
		      ))
    (bx:gnus-group-name-change-level-list level-6-list 6)
    ))



; (bystar:mail:groups:level:7-set)
(defun bystar:mail:groups:level:7-set ()
  "BFDM Gnus Level 7 -- Static Archives"
  (interactive)

  (let (
	(level-7-list '(
)
		      ))
    (bx:gnus-group-name-change-level-list level-7-list 7)
    ))


(lambda () "
*      ================ bystar:mail:groups:posting-defaults-set
")



; (bystar:mail:groups:posting-defaults-set)
(defun bystar:mail:groups:posting-defaults-set ()
  ""
  (interactive)

  (setq gnus-posting-styles
      '(
	(".*"
	 ;;(signature "Peace and happiness")
	 (organization "ByStar Federation of Autonomous Libre Services -- http://www.by-star.net")
	 ;;(eval (message "here here 23"))
	 )

	(".*INBOX$"
         (from (concat bystar:acct:full-name  " <office" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "office" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.desk$"
         (from (concat bystar:acct:full-name  " <desk" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "desk" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.job$"
         (from (concat bystar:acct:full-name  " <job" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "job" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.friend$"
         (from (concat bystar:acct:full-name  " <friend" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "friend" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.family$"
         (from (concat bystar:acct:full-name  " <family" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "family" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.fyi$"
         (from (concat bystar:acct:full-name  " <fyi" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "fyi" "@" bystar:mail:addr:default-dpma))
	 )


	(".*INBOX.form$"
         (from (concat bystar:acct:full-name  " <form" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "form" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.vendors$"
         (from (concat bystar:acct:full-name  " <vendors" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "vendors" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.text$"
         (from (concat bystar:acct:full-name  " <text" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "text" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.test$"
         (from (concat bystar:acct:full-name  " <test" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "test" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.urgent$"
         (from (concat bystar:acct:full-name  " <urgent" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "urgent" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.personal$"
         (from (concat bystar:acct:full-name  " <personal" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "personal" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.mobile$"
         (from (concat bystar:acct:full-name  " <mobile" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "mobile" "@" bystar:mail:addr:default-dpma))
	 )

	(".*INBOX.test$"
         (from (concat bystar:acct:full-name  " <test" "@" bystar:mail:addr:default-dpma ">"))
         (bcc (concat "test" "@" bystar:mail:addr:default-dpma))
	 )

	 ))
  )



;;(bystar:mail:groups:parameters-defaults-set)
(defun bystar:mail:groups:parameters-defaults-set ()
  ""
  (interactive)

  (setq gnus-parameters
	`(
	(,(concat "nnimap\\+bystar\\." bystar-cp_acctNu ":INBOX\\.spam\\.detected\\.rare")
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX")
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX.training.ham"))
	 (spam-contents gnus-group-spam-classification-spam))

	(,(concat "nnimap\\+bystar\\." bystar-cp_acctNu ":INBOX\\.spam\\.detected\\.often")
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX")
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX.training.ham"))
	 (spam-contents gnus-group-spam-classification-spam))

	(,(concat "nnimap\\+bystar\\." bystar-cp_acctNu ":INBOX\\.spam\\.detected\\.usual")
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX")
	  ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX.training.ham"))
	 (spam-contents gnus-group-spam-classification-spam))

	(,(concat "nnimap\\+bystar\\." bystar-cp_acctNu  ":\\(INBOX\\|other-folders\\)")
	 (spam-process-destination . ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX.training.spam"))
	 (spam-contents gnus-group-spam-classification-ham))

	(,(concat "nnimap\\+bystar\\." bystar-cp_acctNu  "INBOX\\.form")
	 (spam-process-destination . ,(concat "nnimap+bystar." bystar-cp_acctNu ":INBOX.training.spam"))
	 (spam-contents gnus-group-spam-classification-ham))
	))

	;;(gnus-registry-initialize)
	(spam-initialize)

	)

(defun bystar:mail:groups:parameters-to-list-defaults-set ()
  ""
  (interactive)
    (setq gnus-parameter-to-list-alist
          '(("mail.emacs.bbdb" . "bbdb-info@lists.sourceforge.net")
            ("mail.emacs.bidi" . "emacs-bidi@gnu.org")
            ("mail.emacs.devel" . "emacs-devel@gnu.org")))
    )

(defun bystar:mail:groups:parameters-expirable-defaults-set ()
  ""
  (interactive)
    (setq gnus-total-expirable-newsgroups
          (regexp-opt '("mail.emacs.devel"
                        "mail.emacs.sent"
                        "mail.news.sent"
                        "mail.xemacs.design"
                        "mail.frieden.jetzt"
                        "mail.spam.duplicates"
                        "mail.spam.filtered"
                        "mail.baeckeranlage")))
    )



(setq byname-mailAddrs-basic
      '(
	("personal")
	("office")
	("urgent")
	("mobile")
	("main")
	("envelope")
	("fax")
	("assistant")
	("vendors")
	("tmp")
	))

;(mapcar '(lambda (addrs)
;	   (insert (car addrs)))
;	byname-mailAddrs-basic-completions)


(setq byname-mailBoxs-basic
      '(
	("mbox.public")
	("mbox.personal")
	("mbox.office")
	("mbox.urgent")
	("mbox.mobile")
	("mbox.main")
	("mbox.envelope")
	("mbox.fax")
	("mbox.assistant")
	("mbox.vendors")
	("mbox.tmp")
	))


(lambda () "
*      ================ bystar:mail:send:
")


;; (bystar:mail:send:orig-envelope-local-part-set)
(defun bystar:mail:send:orig-envelope-local-part-set (localPart)
  "Set envelope as localPart@first.last.X.byname"
  (interactive (list
		(completing-read "Local Part: "
				 byname-mailAddrs-basic
				 nil
				 nil
				 "envelope")))
  ;(msend-originator-envelope-addr (concat localPart "@" byname-dp-domain))
  ;(msend-compose-setup)
  (message (concat "Envelope Set To:  " localPart "@" byname-dp-domain))
  )

;; (bystar:mail:send:orig-envelope-fqma-set)
;; (bystar:mail:send:orig-envelope-fqma-set "here@example.com")
;; (bystar:mail:send:orig-envelope-fqma-set bystar:mail:addr:ephemera-envelope-fqma)
(defun bystar:mail:send:orig-envelope-fqma-set (fqma)
  ""
  (interactive "sEnvelope Fully Qualified Mail Addr (fqma): ")
  (msend-originator-envelope-addr fqma)
  (msend-compose-setup)
  (message (concat "Envelope Set To:  " fqma))
  )


;; (bystar:mail:send:orig-from-fqma-set)
;; (bystar:mail:send:orig-from-fqma-set "here@example.com")
;; (bystar:mail:send:orig-from-fqma-set bystar:mail:addr:ephemera-from-fqma)
(defun bystar:mail:send:orig-from-fqma-set (fqma)
  ""
  (interactive "sFrom Fully Qualified Mail Addr (fqma): ")
  (msend-originator-from-line fqma)
  (msend-compose-setup)
  (message (concat "From Set To:  " fqma))
  )

;;; (bystar:mail:compose:from "ddeesskk")
(defun bystar:mail:compose:from (localPart)
  "Given LOCALPART set from line and other relevant lines"
  (interactive (list
		(completing-read "Local Part: "
				 byname-mailAddrs-basic
				 nil
				 nil
				 "from")))
  (let (
	(from (concat bystar:acct:full-name  (format " <%s" localPart) "@" bystar:mail:addr:default-dpma ">"))
	(bcc (concat localPart "@" bystar:mail:addr:default-dpma))
	)

    (bystar:mail:send:orig-from-fqma-set from)
    (msend-compose-setup)

    (msend-compose-mail)
    (message-goto-bcc)
    (insert (format "%s" bcc))
    (message-goto-to)
    )
  )

;;; (bystar:mail:compose:alt:from "ddeesskk")
(defun bystar:mail:compose:alt:from (localPart)
  "Given LOCALPART set from line and other relevant lines"
  (interactive (list
		(completing-read "Enter A Local Part: "
				 byname-mailAddrs-basic
				 nil
				 nil
				 "from")))
  (let (
	(from (concat bystar:acct:full-name-alt  (format " <%s" localPart) "@" bystar:mail:addr:default-dpma ">"))
	(bcc (concat localPart "@" bystar:mail:addr:default-dpma))
	)

    (bystar:mail:send:orig-from-fqma-set from)
    (msend-compose-setup)

    (msend-compose-mail)
    (message-goto-bcc)
    (insert (format "%s" bcc))
    (message-goto-to)
    )
  )

;;; (bystar:mail:compose:alt:from-toBbdb "family" "Maryam Shafaei-Banan")
(defun bystar:mail:compose:alt:from-toBbdb (&optional from-local-part to-bbdb-regexp) 
  "Given LOCALPART and TO-BBDB-REGEXP set from line and other relevant lines"
  (interactive)
    
  (if (eq from-local-part nil)
      (setq from-local-part (completing-read "Enter Local Part Of From Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))

  (if (eq to-bbdb-regexp nil)
      (setq to-bbdb-regexp  (completing-read "Enter bbdb regexp for To Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))

  (bystar:mail:compose:alt:from from-local-part)
  
  (message-goto-to)
  (insert (format "%s" to-bbdb-regexp))
  (message-tab)
  (message-goto-subject)
  )


;;; (bystar:mail:compose:from-toBbdb "family" "Maryam Shafaei-Banan")
(defun bystar:mail:compose:from-toBbdb (&optional from-local-part to-bbdb-regexp) 
  "Given LOCALPART and TO-BBDB-REGEXP set from line and other relevant lines"
  (interactive)
    
  (if (eq from-local-part nil)
      (setq from-local-part (completing-read "Enter Local Part Of From Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))

  (if (eq to-bbdb-regexp nil)
      (setq to-bbdb-regexp  (completing-read "Enter bbdb regexp for To Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))
    
  (bystar:mail:compose:from from-local-part)

  (message-goto-to)
  (insert (format "%s" to-bbdb-regexp))
  (message-tab)
  (message-goto-subject)
  )

;;; (bystar:mail:compose:from-toAddr "family" "4255039426@vtext.com")
(defun bystar:mail:compose:from-toAddr (&optional from-local-part to-addr) 
  "Given LOCALPART and TO-ADDR set from line and other relevant lines"
  (interactive)
    
  (if (eq from-local-part nil)
      (setq from-local-part (completing-read "Enter Local Part Of From Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))

  (if (eq to-addr nil)
      (setq to-addr  (completing-read "Enter bbdb regexp for To Line: "
					     byname-mailAddrs-basic
					     nil
					     nil
					     "from")))
    
  (bystar:mail:compose:from from-local-part)

  (message-goto-to)
  (insert (format "%s" to-addr))
  (message-goto-subject)
  )





(defun bystar:mail:compose:from-office ()
  ""
  (interactive)
  (bystar:mail:compose:from "office")
  )

(defun bystar:mail:compose:from-desk ()
  ""
  (interactive)
  (bystar:mail:compose:from "desk")
  )

(defun bystar:mail:compose:from-friend ()
  ""
  (interactive)
  (bystar:mail:compose:from "friend")
  )

(defun bystar:mail:compose:from-friend ()
  ""
  (interactive)
  (bystar:mail:compose:from "family")
  )


(defun bystar:mail:compose:from-test ()
  ""
  (interactive)

  (let (
	(from (concat bystar:acct:full-name  " <test" "@" bystar:mail:addr:default-dpma ">"))
	)

    (bystar:mail:send:orig-from-fqma-set from)
    (msend-compose-setup)

    (msend-compose-mail)

  (message-goto-to)
  (insert "test@mohsen.banan.1.byname.net")

  (message-goto-subject)
  (insert "Test Message -- Ignorable")

  (message-goto-body)
  (insert "

Test Message -- Ignorable
Generated on xx by xx user agent, host, ids

")
  )
  )

;;;;


(defun bystar:mail:compose:alt:from-office ()
  ""
  (interactive)
  (bystar:mail:compose:alt:from "office")
  )

(defun bystar:mail:compose:alt:from-desk ()
  ""
  (interactive)
  (bystar:mail:compose:alt:from "desk")
  )

(defun bystar:mail:compose:alt:from-friend ()
  ""
  (interactive)
  (bystar:mail:compose:alt:from "friend")
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Code         ::      /bystar:mail:mode:/  residentMsMta|remoteMs  [[elisp:(org-cycle)][| ]]
")

(defvar bystar:mail:mode:variable "residentMsMta" "Used by bystar:mail:mode: set/get/-p")

;;;(setq bystar:mail:mode:variable "residentMsMta")
(setq bystar:mail:mode:variable "remoteMs")

;;; (bystar:mail:mode:set "residentMsMta")
;;; (bystar:mail:mode:set "remoteMs")
(defun bystar:mail:mode:set (mailMode)
  ""
  (interactive)
  (setq bystar:mail:mode:variable mailMode)
  )

;;; (bystar:mail:mode:get)
(defun bystar:mail:mode:get ()
  ""
  (interactive)
  (message bystar:mail:mode:variable)
  )

;;; (bystar:mail:mode:remoteMs-p)
(defun bystar:mail:mode:remoteMs-p ()
  ""
  (interactive)
  (string= (bystar:mail:mode:get) "remoteMs")
  )

;;; (bystar:mail:mode:residentMsMta-p)
(defun bystar:mail:mode:residentMsMta-p ()
  ""
  (interactive)
  (string= (bystar:mail:mode:get) "residentMsMta")
  )



(lambda () "
*      ================ Provide
")

(provide 'bystar-mail-lib)


(lambda () "
*      ================ Junk Yard
")


(defun bystar:mail:groups:parameters-defaults-setOld ()
  ""
  (interactive)

  (setq gnus-parameters
	'(
	("nnimap\\+bystar\\..*:INBOX\\.spam\\.detected\\.rare"
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination "nnimap+bystar.20000:INBOX" "nnimap+bystar.20000:INBOX.training.ham")
	 (spam-contents gnus-group-spam-classification-spam))

	("nnimap\\+bystar\\..*:INBOX\\.spam\\.detected\\.often"
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination "nnimap+bystar.20000:INBOX" "nnimap+bystar.20000:INBOX.training.ham")
	 (spam-contents gnus-group-spam-classification-spam))

	("nnimap\\+bystar\\..*:INBOX\\.spam\\.detected\\.usual"
	 (gnus-article-sort-functions '(gnus-article-sort-by-chars))
	 (ham-process-destination "nnimap+bystar.20000:INBOX" "nnimap+bystar.20000:INBOX.training.ham")
	 (spam-contents gnus-group-spam-classification-spam))

	("nnimap\\+bystar\\..*:\\(INBOX\\|other-folders\\)"
	 (spam-process-destination  "nnimap+bystar.20000:INBOX.training.spam")
	 (spam-contents gnus-group-spam-classification-ham))

	("nnimap\\+bystar\\..*:INBOX\\.form"
	 (spam-process-destination  "nnimap+bystar.20000:INBOX.training.spam")
	 (spam-contents gnus-group-spam-classification-ham))
	))
	;;(gnus-registry-initialize)
	(spam-initialize)
	)

;;; (bystar:mail:faces:background-dark)
(defun bystar:mail:faces:background-dark ()
  ""
  (interactive)

;;;
;;; Group Mode -- Newsgroup Face
;;;  delivered (red, firebrick, orange, yellow, purple3, turquoise, pink, white)
;;;  empty ( green1, green6, aquamarine1, aquamarine4)
;;;

(custom-set-faces '(gnus-group-news-1 ((((class color) (background dark)) (:foreground "red" :bold t)))))
(custom-set-faces '(gnus-group-news-1-empty ((((class color) (background dark)) (:foreground "green1" :bold t)))))
(custom-set-faces '(gnus-group-news-2 ((((class color) (background dark)) (:foreground "firebrick" :bold t)))))
(custom-set-faces '(gnus-group-news-2-empty ((((class color) (background dark)) (:foreground "green2" :bold t)))))
(custom-set-faces '(gnus-group-news-3 ((((class color) (background dark)) (:foreground "orange" :bold t)))))
(custom-set-faces '(gnus-group-news-3-empty ((((class color) (background dark)) (:foreground "green3" :bold t)))))
(custom-set-faces '(gnus-group-news-4 ((((class color) (background dark)) (:foreground "yellow" :bold t)))))
(custom-set-faces '(gnus-group-news-4-empty ((((class color) (background dark)) (:foreground "green4" :bold t)))))
(custom-set-faces '(gnus-group-news-5 ((((class color) (background dark)) (:foreground "purple3" :bold t)))))
(custom-set-faces '(gnus-group-news-5-empty ((((class color) (background dark)) (:foreground "green5" :bold t)))))
(custom-set-faces '(gnus-group-news-6 ((((class color) (background dark)) (:foreground "turquoise" :bold t)))))
(custom-set-faces '(gnus-group-news-6-empty ((((class color) (background dark)) (:foreground "green6" :bold t)))))
(custom-set-faces '(gnus-group-news-low ((((class color) (background dark)) (:foreground "pink" :bold t)))))
(custom-set-faces '(gnus-group-news-low-empty ((((class color) (background dark)) (:foreground "green" :bold t)))))

;;;
;;; Group Mode -- Mailgroup Face
;;;  delivered (red, firebrick, orange, yellow, purple3, turquoise, pink, white)
;;;  empty ( green1, green6, aquamarine1, aquamarine4)
;;;

(custom-set-faces '(gnus-group-mail-1 ((((class color) (background dark)) (:foreground "red" :bold t)))))
(custom-set-faces '(gnus-group-mail-1-empty ((((class color) (background dark)) (:foreground "green1" :bold t)))))
(custom-set-faces '(gnus-group-mail-2 ((((class color) (background dark)) (:foreground "firebrick" :bold t)))))
(custom-set-faces '(gnus-group-mail-2-empty ((((class color) (background dark)) (:foreground "green2" :bold t)))))
(custom-set-faces '(gnus-group-mail-3 ((((class color) (background dark)) (:foreground "orange" :bold t)))))
(custom-set-faces '(gnus-group-mail-3-empty ((((class color) (background dark)) (:foreground "green3" :bold t)))))
(custom-set-faces '(gnus-group-mail-low ((((class color) (background dark)) (:foreground "yellow" :bold t)))))
(custom-set-faces '(gnus-group-mail-low-empty ((((class color) (background dark)) (:foreground "green4" :bold t)))))

;;;
;;; Article Mode -- Reading
;;;

(custom-set-faces  '(gnus-header-name ((((class color) (background dark)) (:foreground "orange" :background "black" :bold t)))))
(custom-set-faces  '(gnus-header-content ((((class color) (background dark)) (:foreground "white" :bold)))))
(custom-set-faces  '(gnus-header-from ((((class color) (background dark)) (:bold t :foreground "red")))))
;;(custom-set-faces  '(gnus-header-to ((((class color) (background dark)) (:bold t :foreground "red")))))   ;;; Not Working
;;(custom-set-faces  '(gnus-header-cc ((((class color) (background dark)) (:bold t :foreground "red")))))   ;;; Not Working
(custom-set-faces  '(gnus-header-subject ((((class color) (background dark)) (:bold t :foreground "DarkGreen")))))
(custom-set-faces  '(gnus-header-newsgroups ((((class color) (background dark)) (:underline t :foreground "DarkGreen" :italic t)))))

;;;
;;; Mail Sending
;;;

(custom-set-faces  '(message-header-cc ((((class color) (background dark)) (:foreground "orange")))))
(custom-set-faces  '(message-header-newsgroups ((((class color) (background dark)) (:foreground "yellow")))))
(custom-set-faces  '(message-header-subject ((((class color) (background dark)) (:foreground "yellow")))))
(custom-set-faces  '(message-header-to ((((class color) (background dark)) (:foreground "red")))))


  )



(defun  byname-msg-originator (localPart)
  "Set originator as localPart@first.last.X.byname"
  (interactive (list
		(completing-read "Local Part: "
				 byname-mailAddrs-basic
				 nil
				 nil
				 "")))
  (byname-msg-envelope "envelope")
  (msend-originator-from-line (concat localPart "@" byname-dp-domain))
  (msend-compose-setup)
  (message (concat "From Set To:  " localPart "@" byname-dp-domain))
  )

(defun message-attach-all-files-from-folder(&optional disposition dir-to-attach)
  "create the mml code to attach all files found in a given directory"
  (interactive)
    
  (if (eq disposition nil)
      (setq disposition (completing-read "Enter default disposition to use: " '(("attachment" 1) ("inline" 2)) nil t)))
    
  (if (eq dir-to-attach nil)
      (setq dir-to-attach (read-directory-name "Select a folder to attach: ")))
    
  (if (not (string-match "/$" dir-to-attach))
      (setq dir-to-attach (concat dir-to-attach "/")))
    
  (dolist (file (directory-files dir-to-attach))
    (when (and (not (string= "." file)) (not (string= ".." file)))
      (let (full-file-path mime-type)
	(setq full-file-path (concat dir-to-attach file))
	(if (file-readable-p full-file-path)
	    (if (file-directory-p full-file-path)
		(message-attach-all-files-from-folder disposition full-file-path)
    
	      (setq mime-type (substring (shell-command-to-string (concat "file --mime-type --brief " (shell-quote-argument (expand-file-name full-file-path)))) 0 -1))
	      (insert-string (concat "<#part type=\"" mime-type "\" filename=\"" full-file-path "\" disposition=" disposition ">\n"))
	      )
	  )
	)
      )
    )
  )



(defun example-code-save-article ()
	 ;(save-excursion
	   (setq keep1 gnus-mail-save-name)
	    (setq gnus-mail-save-name 'mhonarcFileName)
	    (setq gnus-file-save-name 'mhonarcFileName2)
	    (setq gnus-prompt-before-saving nil)
	    ;(switch-to-buffer gnus-save-article-buffer)
	    ;(gnus-summary-save-article-mail)
	    ;(gnus-summary-display-buttonized nil)
	    ;(gnus-summary-write-to-file t)
	    ;(setq gnus-file-save-name 'mhonarcFileName3)
	    ;(gnus-summary-write-article-body-file)
	    ;(gnus-summary-show-raw-article)
	    ;(write-file "/tmp/t2")
	    ;)

  ;(setq debug-on-error nil)
  ;(setq tName (make-temp-name "mhonarc"))
  ;(setq tFile (concat "/tmp/" tName))
  ;(setq gnus-article-save-directory "~/mhonarc/var")
  ;(setq gnus-article-archive-name "22")

  ;; (mm-inline-render-with-stdin
  ;;  HANDLE
  ;;  nil "/opt/public/osmt/bin/bueMailManage.sh" "-i" "msgHtmlProc" (concat "~/mhonarc/var/input" "/msg"))

  ;(gnus-summary-save-in-pipe)
  ;(gnus-article-hide-headers)
	    )


(lambda () "
*      ================ /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

