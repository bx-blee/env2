;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string  "blee-general-lib" "blee-lib-general")  (replace-string "moduleTag:" "fp:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (fp:), for handelling File_Var [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-lib-general"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-lib-general [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: blee-lib-general")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'subr-x)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: fp:main-init [[elisp:(org-cycle)][| ]]
")

(defgroup
  blee
  nil
 "Blee (ByStar Libre-Halaal Emacs Environment)."
 :group 'extensions
 :link '(emacs-commentary-link :tag "Commentary" "blee.el")
 :link '(emacs-library-link :tag "Lisp File" "blee.el")
 )

(defcustom
  blee:dev:mode?
  nil
  "Predicate -- Blee Development Mode -- local auth git packages."
  :type 'boolean
  :group 'blee)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:main-init) [[elisp:(org-cycle)][| ]]
")

(defun fp:main-init ()
  "Desc:"
  nil
  )


;;;
;;;  (s-pad-right 15 "=" "")
;;;  (str:leftAdjustToLength 15 " " "")
;;;  (str:leftAdjustToLength 15 " " "1234567890")
;;;  (str:leftAdjustToLength 15 " " "12345678901234567890")
;;;
(defalias 's-leftToLen 'str:leftAdjustToLength)
(defalias 'str:leftFitToLength 'str:leftAdjustToLength)
(defun str:leftAdjustToLength (fieldLength padding inStr)
  "Returns a left adjusted string that fits well in fieldLength."
  (if (< (length inStr) fieldLength)
      (s-pad-right fieldLength padding inStr)
    (s-left fieldLength inStr)
    ))
	
;;       (insert (s-center 102 "Hello World"))
;; (insert (centeredString "Hello World" 102))

(defun centeredStringReplacedBy:s-center (string fieldLength)
  ""
  (let (
	(suroundLength)
	)
    (if (< (length string) fieldLength)
	(setq suroundLength (/ (- fieldLength (length string)) 2))
      (setq suroundLength 0)
      )
    
    (format "%s%s%s"
	    ;; --? -- is " "
	    (make-string suroundLength
			 ? )
	    string
	    (make-string (+ suroundLength (% (- fieldLength (length string)) 2))
			 ? )	    
	    )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  General Purpose     :: bx: Common Facilities [[elisp:(org-cycle)][| ]]
")

(defun bx:load-file:ifOneExists (file)
  "load the FILE if one exists"
  (if (and (file-exists-p file)
	   (file-readable-p file))
      (load-file file)))


(defun bx:file-string (file)
    "Read the contents of a file and return as a string."
    (with-current-buffer (find-file-noselect file)
      (buffer-string)))

(defun file-string-bx (file)
  (bx:file-string file)
  )

(defun bx:buf-fname ()
  "Meant to be short for use in org files."
  (file-name-nondirectory buffer-file-name))

;;; (bx:emacs24.5p)
(defun bx:emacs24.5p ()
  (if (equal emacs-major-version 24)
      (if (equal emacs-minor-version 5)
	  t
	)
    nil)
  )

;;; (bx:bbdbV3p)
(defun bx:bbdbV3p ()
  (if (equal bbdb-version "2.36")
      nil
    t)
  )

(defun occur-non-ascii ()
  "Find any non-ascii characters in the current buffer."
  (interactive)
  (occur "[^[:ascii:]]"))

 
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:eval-string string) [[elisp:(org-cycle)][| ]]
  ")

;;;

(defun blee:eval-string  (string)
  "Given STRING, eval it."
  (eval (car (read-from-string (format "(progn %s)" string)))))


;;; (bx:find-files-in-mode (list "./bodyArticleEnFa.tex") "(org-mode)")
;;;
(defun bx:find-files-in-mode (@filesList @modeAsString)
  "Open each @filesList in @modeAsString"
  (save-excursion  
    (mapcar '(lambda (@eachFile)
	       (find-file @eachFile)
	       (blee:eval-string @modeAsString)
	       )
	    @filesList
	    )
    )
  )

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

;; (my-test-function)
;;(defun my-test-function ()  (message "This function is named '%s'" (compile-time-function-name)))



(defun b:insert-file-contents|forward (<fileName)
  "insert-file-contents and move point forward to after insertion."
  (let* (
         ($gotVal (insert-file-contents <fileName))
         ($charsInserted (second $gotVal))
         )
    (forward-char $charsInserted)))

(defun b:insert-file-contents|noExtraLine%% (<fileName)
  "insert-file-contents and move point forward to after insertion."
  (let* (
         (fileAsString)
         )
    (setq fileAsString (get-string-from-file (format "%s" <fileName)))
    (s-chomp fileAsString)
    (s-chomp fileAsString)
    (s-chop-suffixes '("\n" "\r")  fileAsString)  
    (insert fileAsString)
    ))

(defun b:insert-file-contents|noExtraLine2%% (<fileName)
  "insert-file-contents and move point forward to after insertion."
  
  (loop-for-each $each  (reverse (cdr (reverse (b:file:read|nuOfLines <fileName 1000))))
    (insert $each)
    (insert "\n")
    ))


(defun b:insert-file-contents|noExtraLine (<fileName)
  "insert-file-contents and move point forward to after insertion."
  (insert 
    (with-temp-buffer
      (insert-file-contents <fileName)
      (goto-char (point-max))
      (delete-char -1)
      (buffer-string))
    ))
      


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-lib-general"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-lib-general)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
