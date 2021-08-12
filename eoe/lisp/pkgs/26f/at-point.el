;;;
;;; at-point.el
;;;

(defconst at-point-fsf-emacs-p (null (string-match "XEmacs" emacs-version))
  "t if emacs is FSF, nil otherwise.")

;; emacs19f needs Lucid-style menu emulation
(if at-point-fsf-emacs-p
    (require 'lmenu))

(require 'bbdb-mb)
(require 'w3)
(require 'browse-url)


;;; ---------------------------------------------------------------
;;; @Point menu
;;; ---------------------------------------------------------------


(defconst at-point-menu
  '("@Point"
    ["Complete Email Address (BBDB)" (bbdb-complete-address) t]
    ["Complete File Name" (comint-dynamic-complete-as-filename) t]
    ["Complete Lisp Symbol" (lisp-complete-symbol) t]
    ["Complete Name (BBDB)" (bbdb-complete-name-only) t]
    ["Complete Shell Command" (shell-dynamic-complete-as-command) t]
    ["Complete Shell Environment Variable" (shell-dynamic-complete-as-environment-variable) t]
    ["Complete Tag" (tag-complete-symbol) t]
    ["Complete URL (w3)" (w3-complete-link) t]
    ["Complete Word (English)" (ispell-complete-word) t]
    "-----"
    ["Describe Lisp Function" (describe-function (intern (at-point-get-sexp))) t]
    ["Describe Lisp Variable" (describe-variable (intern (at-point-get-sexp))) t]
    "-----"
    ["Lookup Email Address (BBDB)" (bbdb (at-point-get-sexp) nil) t]
    ["Lookup Name (BBDB)" (bbdb (at-point-get-sexp) nil) t]
    ["Lookup Name (nslookup -type=any)" (shell-command (format "nslookup -type=any %s" (at-point-get-non-whitespace))) t]
    ["Lookup Word (Dictionary)" (webster (at-point-get-sexp)) t]
    ["Lookup Word (Thesarus)" (at-point-notyet) nil]
    "-----"
    ["Visit File" (find-file (at-point-get-non-whitespace)) t]
    ["Visit File (Read Only)" (find-file-read-only (at-point-get-sexp)) t]
    ["Visit Man Page (UNIX)" (manual-entry (at-point-get-sexp)) t]
    ["Visit Phone Number (dial it)" (at-point-notyet) nil]
    ["Visit Tag" (find-tag-other-window (at-point-get-sexp)) t]
    ["Visit URL (Netscape)" (browse-url-netscape (url-get-url-at-point)) t]
    ["Visit URL (w3)" (w3-fetch (url-get-url-at-point)) t]
    ))


(defun at-point-update-menu ()
  "Install `@Point' menu."
  (interactive)
  (cond (at-point-fsf-emacs-p
	 (add-menu nil "@Point" (cdr at-point-menu) "Tools"))
	(t
	 (if current-menubar
	     (let ((assn (assoc "@Point" current-menubar)))
	       (cond (assn
		      (setcdr assn (cdr at-point-menu)))
		     (t
		      (add-menu nil "@Point" (cdr at-point-menu) "Tools"))))))))

;;; ---------------------------------------------------------------
;;; helper functions
;;; ---------------------------------------------------------------

(defun at-point-get-sexp ()
  "If region is defined return that as a string, else return s-expression."
  (save-excursion
    (let (p1 p2 chunk)
      (cond ((mark)			; region specified
	     (setq p1 (point))
	     (setq p2 (mark)))
	    (t
	     (backward-sexp 1)
	     (setq p1 (point))
	     (forward-sexp 1)
	     (setq p2 (point))))
      (setq chunk (buffer-substring p1 p2))
      (message "@Point using [%s]..." chunk)
      (sit-for .5)
      chunk)))


(defun at-point-get-non-whitespace ()
  "If region is defined return that as a string, else return leftmost non-whitespace text."
  (save-excursion
    (let (p1 p2 chunk)
      (cond ((mark)			; region specified
	     (setq p1 (point))
	     (setq p2 (mark)))
	    (t
	     (re-search-backward "\\S-")
	     (if (re-search-backward "\\s-" nil t)
		 (forward-char 1)
	       (goto-char (point-min)))
	     (setq p1 (point))
	     (if (re-search-forward "\\s-" nil t)
		 (backward-char 1)
	       (goto-char (point-max)))
	     (setq p2 (point))))
      (setq chunk (buffer-substring p1 p2))
      (message "@Point using [%s]..." chunk)
      (sit-for .5)
      chunk)))


(defun at-point-notyet ()
  (message "Not yet implemented.")
  (ding))

;;; ---------------------------------------------------------------
;;; Put the menu in the menubar
;;; ---------------------------------------------------------------

(cond (at-point-fsf-emacs-p
       (at-point-update-menu))
      ((and (not at-point-fsf-emacs-p)
	    (eq window-system 'x))
       (at-point-update-menu)
       (if (null (member 'at-point-update-menu activate-menubar-hook))
	   (add-hook 'activate-menubar-hook 'at-point-update-menu))))


;;; ---------------------------------------------------------------
(provide 'at-point)
