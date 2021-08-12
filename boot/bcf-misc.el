;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(defvar orgCmntEnd nil "Org Comment End")

(defun orgCmntBegin (<comment <commentEnd))

(orgCmntBegin "
**  orgCmntBegin. Permits us to include * at the beginning of line as a comment.
Which in turn alows us to switch between emacs-major mode and org-mode for COMEEGA.
Example usage is: 
(orgCmntBegin \"multi-line comment comes here.\" orgCmntEnd)

I wish elisp had a here-document facility. Like common-lisp.
Anybody listening?
" orgCmntEnd)

(orgCmntBegin "
* Module Name: bcf-misc 
* Authors: Mohsen Banan
** Mohsen Banan contact: http://mohsen.1.banan.byname.net/contact
** Mohsen Banan email: emacs آت mohsen.1.banan.byname.net
* Copying And Usage: This is a Libre-Halaal polyexistential (software).
** See: [[http://www.halaalsoftware.org/][Libre-Halaal Software]]
** See: [[http://mohsen.1.banan.byname.net/PLPC/120033][Nature Of Polyexistentials]]
* A Blee Derivative: A part of Blee which can be used outside of Blee
** About Blee: ByStar Libre-Halaal Emacs Environment
" orgCmntEnd)

(orgCmntBegin "
* Module Overview:   -- Misc bcf (Blee Common Facilities) using bcf: name space
* Initial Release Date: [2021-02-09 Tue 22:32]
* Current Release: ver-0.2 -- 
* Style and Conventions: Blee derivative style.
* Scope: Facilities, used in Blee which are general enough not to justify bcf: prefix.
* Features:
** get-arg (same as plist-get-or-default) facilitates named arguments processing
" orgCmntEnd)



;; (bcf:var/localized 'org-roam-directory)
(defun bcf:var/localized (<varName)
  "Return the value of <varName. Buffer or directory local vars are accounted for."
  (let (($varValue))
    (save-excursion
      (set-buffer (current-buffer))
      (setq $varValue (eval <varName))
      )
    $varValue
    ))

;;
;; (bcf:browser:default|visit-urls (list "http://www.by-star.net" "http://www.neda.com"))
;;
(defun bcf:browser:default|visit-urls (<urls)
  "Using the default browser (browse-url-browser-function), visit <urls."
  (mapcar (lambda (<each)
	    (funcall browse-url-browser-function
		     <each)
	    )
	  <urls)
  (format "Last Executed: %S" (current-time-string)))


;; (bcf:mode|status whitespace-mode)
(defun bcf:mode|status (<modeVar)
  (if <modeVar
      "enabled"
    "disabled"
    ))

(provide 'bcf-misc)

