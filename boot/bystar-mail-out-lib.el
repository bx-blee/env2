;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: 
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: bystar-mail-out-lib.el,v 1.1 2014-07-13 23:32:54 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List

*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires
")

(require 'smtpmail)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Module Functions
")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; multiple outgoing accounts ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.mostlymaths.net/2010/12/emacs-30-day-challenge-using-gnus-to.html
;; also see ~/.authinfo
;; (defvar smtp-accounts
;;   '(
;;     (ssl "[ME]@[ME].com" "mail.[ME].com"
;;      26 "[ME]@[ME].com" secret)
;;     ;; (ssl "webdev@[ME].com" "mail.[ME].com"
;;     ;;   26 "webdev@[ME].com" secret)
;;     (ssl "[ME]@gmail.com" "smtp.gmail.com"
;;      587 "[ME]@gmail.com" secret)
;;     (ssl "[ME]@gatech.edu" "mail.gatech.edu"
;;           587 "[ME]@gatech.edu" secret)
;;     ))

;; Now lets configure smtpmail.el with your name and functions to send
;; mail using your smtp accounts by changing the from field

;; (setq send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       mail-from-style nil user-full-name "[ME] S. "
;;       smtpmail-debug-info t smtpmail-debug-verb t)

;; (set-smtp 'smtp "mail.example.com" 25 nil nil)
(defun set-smtp (mech server port user password)
  "Set related SMTP variables for supplied parameters."
  (setq smtpmail-smtp-server server smtpmail-smtp-service port
    smtpmail-auth-credentials (list (list server port user
                          password)) smtpmail-auth-supported (list mech)
                          smtpmail-starttls-credentials nil)
  (message "Setting SMTP server to `%s:%s' for user `%s'."
       server port user))

(defun set-smtp-ssl (server port user password &optional key
                cert)
  "Set related SMTP and SSL variables for supplied parameters."
  (setq starttls-use-gnutls t
    starttls-gnutls-program "gnutls-cli"
    starttls-extra-arguments nil smtpmail-smtp-server server
    smtpmail-smtp-service port
    smtpmail-auth-credentials (list (list server port user
                          password)) smtpmail-starttls-credentials (list (list
                                                  server port key cert)))
  (message
   "Setting SMTP server to `%s:%s' for user `%s'. (SSL
enabled.)" server port user))

;; (defun change-smtp ()
;;   "Change the SMTP server according to the current from line."
;;   (save-excursion
;;     (loop with from = (save-restriction
;;             (message-narrow-to-headers)
;;             (message-fetch-field "from"))
;;       for (auth-mech address . auth-spec) in smtp-accounts
;;       when (string-match address from) do (cond
;;                            ((memq auth-mech '(cram-md5 plain login))
;;                         (return (apply 'set-smtp (cons auth-mech auth-spec))))
;;                            ((eql auth-mech 'ssl)
;;                         (return (apply 'set-smtp-ssl auth-spec)))
;;                            (t (error "Unrecognized SMTP auth. mechanism:
;; `%s'." auth-mech))) finally (error "Cannot infer SMTP information."))))

;; The previous function will complain if you fill the from field with
;; an account not present in smtp-accounts.

;; (defvar %smtpmail-via-smtp (symbol-function 'smtpmail-via-smtp))

;; (defun smtpmail-via-smtp (recipient smtpmail-text-buffer)
;;   (with-current-buffer smtpmail-text-buffer
;;     (change-smtp))
;;   (funcall (symbol-value '%smtpmail-via-smtp) recipient
;;        smtpmail-text-buffer))

;; This wraps send mail via smtp mail, to be able to send multiple
;; messages with smtpmail.

;; Reply-to with same address it was sent to
    ;; (setq gnus-posting-styles
    ;;   '(((header "to" "[ME]@gmail.com")
    ;;      (address "[ME]@gmail.com"))
    ;; ((header "to" "[ME]@gatech.edu")
    ;;      (address "[ME]@gatech.edu"))
    ;; ((header "to" "[ME]@[ME].com")
    ;;      (address "[ME]@[ME].com"))
    ;; ;; ((header "to" "webdev@[ME].com")
    ;;     ;;  (address "webdev@[ME].com"))
    ;; ;; ((header "cc" "webdev@[ME].com")
    ;;     ;;  (address "webdev@[ME].com"))
    ;; ((header "cc" "[ME]@[ME].com")
    ;;      (address "[ME]@[ME].com"))
    ;; ((header "cc" "[ME]@gatech.edu")
    ;;      (address "[ME]@gatech.edu"))
    ;; ((header "cc" "[ME]@gmail.com")
    ;;      (address "[ME]@gmail.com"))))


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bystar-mail-out-lib)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
