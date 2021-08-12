;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-

(defvar orgCmntEnd nil "Org Comment End")

(defun orgCmntBegin (<comment <commentEnd))


(orgCmntBegin "
* Module Name: bcf-general
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
* Module Overview:   -- General bcf (Blee Common Facilities) not part of bcf: name space
* Initial Release Date: [2021-02-09 Tue 22:32]
* Current Release: ver-0.2 -- 
* Style and Conventions: Blee derivative style.
* Scope: Facilities, used in Blee which are general enough not to justify bcf: prefix.
* Features:
** get-arg (same as plist-get-or-default) facilitates named arguments processing
" orgCmntEnd)

(require 's)

;; (s-- 3)
(defun s-- (<nuOfDashes)
  (s-repeat <nuOfDashes "-"))


(defun get-arg (<namedArgs <argName <default)
  "Get the value of <argName keyword symbol from <namedArgs plist or get <default.
See also: plist-get-or-default (<keywordPlist <keywordSymb <default)
"
  (let (
	($result (or (plist-get <namedArgs <argName) nil))
	)
    (unless (plist-member <namedArgs <argName)
      (setq $result <default))
    $result
    ))

;; (getArgTest :active "ZZ")
;; (defun getArgTest (&rest <namedArgs) (message "%s" (get-arg <namedArgs :active nil)))


;; could have been a defalias for get-arg, but docstr is better with duplication.
;;
(defun plist-get-or-default (<keywordPlist <keywordSymb <default)
  "Get the value of <keywordSymb from <keywordPlist plist or get <default.
See also: get-arg (<namedArgs <argName <default)
"
  (let (
	($result (or (plist-get <keywordPlist <keywordSymb) nil))
	)
    (unless (plist-member <keywordPlist <keywordSymb)
      (setq $result <default))
    $result
    ))


(defun call-stack ()
  "Return the current call stack frames.
Needed for compile-time-function-name.
"
  (let ((frames)
        (frame)
        (index 5))
    (while (setq frame (backtrace-frame index))
      (push frame frames)
      (incf index))
    (remove-if-not 'car frames)))

(defmacro compile-time-function-name ()
  "Get the name of calling function at expansion time.
Uses call-stack.
"
  (symbol-name
   (cadadr
    (third
     (find-if (lambda (frame) (ignore-errors (equal (car (third frame)) 'defalias)))
              (reverse (call-stack)))))))


;;(defun my-test-function ()  (message "This function is named '%s'" (compile-time-function-name)))
;; (my-test-function)

(provide 'bcf-general)

