;;; -*- Mode: Emacs-Lisp -*-

;;; This file contains emacs lisp code used to support the
;;; infrastructure of the Emacs Office Environment (eoe).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Define 'eoe-load' and 'eoe-require' so that besides loading a
;;; library (call it foo) will also subsequently attempt to load a
;;; related file foo-site.el if one exists.  This xxx-site library
;;; file is used to contain site-wide initializations and/or patches
;;; to the library.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; eoe-load

(defun eoe-load (file &optional missing-ok nomessage nosuffix)
  "just like load, except tries to load \"FILE-site\" if one exists."
  (prog1 (load file missing-ok nomessage nosuffix)
    (eoe-maybe-load-aux file)))

;;; eoe-require

(defun eoe-require (feature &optional filename)
  "just like require, except tries to load \"FEATURE-site\" or optionally
\"FILENAME-site\" if one exists."
  (prog1 
      (if filename 
	  (require feature filename)
	(require feature))
    ;; now see if the 'eoe-site-file-load-attempted property is present
    (cond ((member 'eoe-site-file-load-attempted (symbol-plist feature))
	   nil)
	  (t
	   (eoe-maybe-load-aux (or filename feature))
	   (put feature 'eoe-site-file-load-attempted t)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; keyboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eoe-load-keybindings (keybind-style keyboard-type)
  "Attempt to load a keyboard defintion library file of the
following names:

   keyboards/<KEYBIND-STYLE>-<KEYBOARD-TYPE>-<eoe-emacs-type>
   keyboards/<KEYBIND-STYLE>-<KEYBOARD-TYPE>

where: <eoe-emacs-type> is the value of *eoe-emacs-type*"

  (let (filename1 filename2)
    (setq filename1 (format "keyboards/%s-%s-%s"
			    keybind-style keyboard-type *eoe-emacs-type*))
    (setq filename2 (format "keyboards/%s-%s"
			    keybind-style keyboard-type))
    (cond ((load filename1 t)
	   (message "Keybindings file %s loaded." filename1))
	  ((load filename2 t)
	   (message "Keybindings file %s loaded." filename2))
	  (t
	   (ding)
	   (message "Keybindings file %s nor %s not found."
		    filename1 filename2)))))


(defun eoe-describe-key (key)
  "Describe KEY.  KEY is a string, or vector of events.
When called interactively, KEY may also be a menu selection."
  (interactive "kDescribe key: ")
  (let ((defn (key-or-menu-binding key)))
    (if (or (null defn) (integerp defn))
        (message "%s is undefined" (key-description key))
      (with-displaying-help-buffer
       (lambda ()
	 (princ (key-description key)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eoe-maybe-load-file (file)
  "load the FILE if one exists"
  (if (and (file-exists-p file)
	   (file-readable-p file))
      (load-file file)))

(defun eoe-maybe-load-aux (file)
  "load the FILE-site library file in load-path if one exists"
  (condition-case the-error
      (load (format "%s-site" file))
    (file-error nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eoe-baroque-require (library &optional a-library-function)
  "Load LIBRARY if optional argument A-LIBRARY-FUNCTION is not currently 
defined.  If A-LIBRARY-FUNCTION is nil, use LIBRARY as the function name.
Some of the older emacs libraries do not support the features list
so we decide if such a library is already loaded by checking for a
function that is supplied by the library.  This may not work, if the
function has been inadvertently redefined by some other elisp package."
  (if (fboundp (or a-library-function library))
      nil
    (load-library (format "%s" library)))) 
      
	   
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar eoe-pkg-subdirs nil 
  "Scratch global variable used by eoe-get-package-subdirs.")

(defun eoe-get-package-subdirs(dir)
  "Sets value of global variable eoe-pkg-subdirs to nil. 
Loads the file (if exists) dir/PACKAGES.el which should modify the 
value of the scratch global variable eoe-pkg-subdirs.  Returns the
list of eoe-pkg-subdirs."
  (setq eoe-pkg-subdirs nil)
  (eoe-maybe-load-file (format "%s/PACKAGES.el" dir))
  (mapcar '(lambda (subdir-basename)
	     (format "%s/%s" dir subdir-basename))
	  eoe-pkg-subdirs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto-mode-alist utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun eoe-auto-mode-alist-add (file-name-regexp major-mode-fn-name)
  "Add/update the mapping between file-name-regexp and its associated
major mode function."
  (let ((assn (assoc file-name-regexp auto-mode-alist)))
    (cond (assn
	   (setcdr assn major-mode-fn-name))
	  (t 
	   (setq auto-mode-alist
		 (cons (cons file-name-regexp major-mode-fn-name)
		       auto-mode-alist))))))


(provide 'eoe)
