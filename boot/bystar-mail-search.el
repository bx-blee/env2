;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar Mail-Search (notmuch, nnir) LOADING")

;;(when (bx:emacs24.5p)
  (require 'notmuch)
  (add-hook 'gnus-group-mode-hook 'lld-notmuch-shortcut)
  (require 'org-gnus)  
;;  )


;;(setq notmuch-init-file "/de/bx/nne/mcm0/var/marme.dev/config/sa-20000/_notmuch-config")

;;
;;https://web.archive.org/web/20160305042051/http://roland.entierement.nu/blog/2010/09/08/gnus-dovecot-offlineimap-search-a-howto.html
;;
;; Gnus, Dovecot, OfflineIMAP, search: a HOWTO

(defun lld-notmuch-shortcut ()
  (define-key gnus-group-mode-map "GG" 'notmuch-search)
  )

(defun lld-notmuch-file-to-group (file)
  "Calculate the Gnus group name from the given file name.
"
  (let ((group (file-name-directory (directory-file-name (file-name-directory file)))))
    (setq group (replace-regexp-in-string ".*/Maildir/" "nnimap+local:" group))
    (setq group (replace-regexp-in-string "/$" "" group))
    (if (string-match ":$" group)
        (concat group "INBOX")
      (replace-regexp-in-string ":\\." ":" group))))

(defun lld-notmuch-goto-message-in-gnus ()
  "Open a summary buffer containing the current notmuch
article."
  (interactive)
  (let ((group (lld-notmuch-file-to-group (notmuch-show-get-filename)))
        (message-id (replace-regexp-in-string
                     "^id:" "" (notmuch-show-get-message-id))))
    (setq message-id (replace-regexp-in-string "\"" "" message-id))
    (if (and group message-id)
        (progn 
    (switch-to-buffer "*Group*")
    (org-gnus-follow-link group message-id))
      (message "Couldn't get relevant infos for switching to Gnus."))))

(define-key notmuch-show-mode-map (kbd "C-c C-c") 'lld-notmuch-goto-message-in-gnus)

(provide 'bystar-mail-search)
