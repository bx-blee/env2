;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*      Description, Origin, Blee Usage   ::  [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] | 
** 
** Description:: With (compile-time-function-name) any function can dtermine itw own name as a string
** Requirements:: Requires cl-lib.el 
** Origin:: https://emacs.stackexchange.com/questions/2310/can-functions-access-their-name
** Blee Usage:: (blee:ann|this-func (compile-time-function-name)) |
*** Within a menu, you can go to the menu definition. See blee-lib-widget.el as an example.
** Keywords:: this function name self
** E|
")

(require 'cl)
(require 'cl-lib)

(defun call-stack ()
  "Return the current call stack frames."
  (let ((frames)
        (frame)
        (index 5))
    (while (setq frame (backtrace-frame index))
      (push frame frames)
      (incf index))
    (remove-if-not 'car frames)))


(defmacro compile-time-function-name ()
  "Get the name of calling function at expansion time."
  (symbol-name
   (cadadr
    (third
     (find-if (lambda (frame) (ignore-errors (equal (car (third frame)) 'defalias)))
              (reverse (call-stack)))))))


(defun blee:ann|this-func (@thisFunc)
  (message "blee:ann -- invocation of:  %s from %s" 
	   @thisFunc (or load-file-name buffer-file-name)
	   ))


;;;  (my-test-function)
;;; (defun my-test-function ()  (blee:ann|this-func (compile-time-function-name)))
;;;


(provide 'compile-time-function-name)

