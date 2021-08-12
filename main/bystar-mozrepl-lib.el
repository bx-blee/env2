;;; -*- Mode: Emacs-Lisp -*-
;;; RcsId="$Id: bystar-mozrepl-lib.el,v 1.2 2010-09-21 22:31:53 lsipusr Exp $"
;;; 
;;; Description:  Control Firefox from Emacs
;;; Keywords: mozrepl firefox browser

;;;
;;;  TOP LEVEL Entry Point: (bystar:mozrepl:all-defaults-set)
;;; bystar:mozrepl  

;;{{{  GPL:
;;; Copyright (C) 1997 -- 2010, Mohsen BANAN -- Neda Communications, Inc.
;;; All Rights Reserved.
;;;
;;; This is Libre Software and is subject to the Libre Software and Services License.
;;; See http://www.libreservices.org/libreSoftwareAndServicesLicense
;;;
;;}}}

;;{{{  Introduction:

;;; MozRepl provides a read-eval-print loop into Firefox
;;; This module provides convenient functions for driving MozRepl
;;; See http://repo.hyperstruct.net/mozlab

;;}}}

;;{{{  Required modules

(require 'browse-url)
(require 'moz)
(load "espresso.el")
;;(require 'espresso-mode)
;;}}}

;;{{{ Customizations:

;;}}}

;;{{{ Code-General:

;; (bystar:mozrepl:all-defaults-set)
(defun bystar:mozrepl:all-defaults-set ()
  ""
  ;;(interactive)

  (message "bystar:mozrepl:defaults-set -- Done." )
  )

;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;;     (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;;     (defun javascript-custom-setup ()
;;       (moz-minor-mode 1))

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)


(defun espresso-custom-setup ()
  (moz-minor-mode 1))

(add-hook 'espresso-mode-hook 'espresso-custom-setup)

  ;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
  
  ;; (add-hook 'js2-mode-hook 'js2-custom-setup)
  ;; (defun js2-custom-setup ()
  ;;   (moz-minor-mode 1))

;;; Usage
;; Run M-x moz-reload-mode to switch moz-reload on/off in the
;; current buffer.
;; When active, every change in the buffer triggers Firefox
;; to reload its current page.

(define-minor-mode moz-reload-mode
  "Moz Reload Minor Mode"
  nil " Reload" nil
  (if moz-reload-mode
      ;; Edit hook buffer-locally.
      (add-hook 'post-command-hook 'moz-reload nil t)
    (remove-hook 'post-command-hook 'moz-reload t))
  )

(defun moz-reload ()
  (when (buffer-modified-p)
    (save-buffer)
    (moz-firefox-reload)))


(defun moz-firefox-reload ()
  (comint-send-string (inferior-moz-process) "BrowserReload();"))

(defun auto-reload-firefox-on-after-save-hook ()         
          (add-hook 'after-save-hook
                       '(lambda ()
                          (interactive)
                          (comint-send-string (inferior-moz-process)
                                              "setTimeout(BrowserReload(), \"1000\");"))
                       'append 'local)) ; buffer-local

;; Example - you may want to add hooks for your own modes.
;; I also add this to python-mode when doing django development.
(add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
(add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook)


;;}}}

;;{{{ Code-bystar:moz :

(defun bystar:moz:eval-expression (exp)
  "Send expression to Moz."
  (interactive "sJSEval: ")
  (comint-send-string (inferior-moz-process) exp))

;; (bystar:moz:alert "Emacs Alert -- Be Warned ...")
(defun bystar:moz:alert (alert)
  "Make Firefox used by our repl Go to the specified URL."
  (interactive
   (list
    (read-from-minibuffer "Alert: "
			  "BUE: ")))
  (bystar:moz:eval-expression
   (format "window.alert(\"'%s'\");"
           alert)))

;;  http://www.by-star.net  -- F1 is equivalent of url-goto-focus
;; (bystar:moz:url-goto "http://www.by-star.net")
(defun bystar:moz:url-goto(url)
  "Make Firefox used by our repl Go to the specified URL."
  (interactive
   (list
    (read-from-minibuffer "URL: "
                          (or
                           (browse-url-url-at-point)
                           "http://"))))
  (bystar:moz:eval-expression
   (format "content.location.href='%s'\n"
           url)))

;; (bystar:moz:url-newtab-load "http://www.by-star.net")
(defun bystar:moz:url-newtab-load(url)
  "Make Firefox used by our repl Go to the specified URL."
  (interactive
   (list
    (read-from-minibuffer "URL: "
                          (or
                           (browse-url-url-at-point)
                           "http://"))))
  (bystar:moz:eval-expression
   (format "gBrowser.addTab('%s');\n"
           url)))


;; (bystar:moz:url-newtab-goto "http://www.by-star.net")
(defun bystar:moz:url-newtab-goto(url)
  "Make Firefox used by our repl Go to the specified URL."
  (interactive
   (list
    (read-from-minibuffer "URL: "
                          (or
                           (browse-url-url-at-point)
                           "http://"))))
  (bystar:moz:eval-expression
   (format "gBrowser.selectedTab = gBrowser.addTab('%s');\n"
           url)))



;;{{{ Code:Optional

;; Non-essential features come here.

;;}}}

;;}}}

(provide 'bystar-mozrepl-lib)

;;{{{ end of file

;;; local variables:
;;; folded-file: t
;;; byte-compile-dynamic: t
;;; end:

;;}}}
