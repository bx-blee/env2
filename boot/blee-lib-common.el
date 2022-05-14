;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "blee-general-lib" "blee-lib-common")  (replace-string "moduleTag:" "fp:")

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


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defmacro     :: (blee:msg "msg %s" (datestamp)) [[elisp:(org-cycle)][| ]]
")

;;
;; (macroexpand-all (blee:msg "hello %s" (datestamp))
;;
(defmacro blee:msg (formatStr &rest rest)
  `(message (concat "BXM# file=%s -- %s ::" ,formatStr)
	    (buffer-file-name)
	    (what-line)
	    ,@rest)
  )

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-lib-common"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-lib-common [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: blee-lib-common")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'subr-x)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: blee:common:main-init  [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:common:main-init) [[elisp:(org-cycle)][| ]]
")

(defun blee:common:main-init ()
  "Desc:"
  nil
  )




(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:server-running-ensure) [[elisp:(org-cycle)][| ]]
")

;;; (bx:server-running-ensure)
(defun bx:server-running-ensure ()
  ""
  (if (not (server-running-p))
      (server-start)
    ))


(defun blee:server:ensure ()
  (interactive)  
  (unless (server-running-p)
    (server-force-delete)    
    (server-start)
    )
  )


;;;
;;; (boundp 'junk44)
;;; (blee:var:initialize 'junk44 "junk44Value")
;;;
;;;
(defun blee:var:initialize (varName varValue)
  (unless (boundp varName) (set varName varValue))
  )


(defun blee:visit-as-content-list (fileName)
  "find-file and switch to org-mode and content-list"
  (interactive)
  (find-file fileName)
  (blee:ppmm:org-mode-content-list)
  )


   
;; (blee:fn:dir:*-relevant "/etc")
;; (blee:fn:dir:*-relevant "/opt/public/osmt/sysConfigInput/iimBash/commonControl/wrapper")
;; (blee:fn:dir:*-relevant "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/iims/lcaVirshManage.sh/params/kvmHost/fvtn")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:fn:dir:*-relevant dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:fn:dir:*-relevant (dir)
  "Given File, write its content as string as a property of propVar."
  (set-difference
   (f-glob  "*"  (expand-file-name dir))
   (blee:fn:dir:exclusion (expand-file-name dir))
   :test 'string=
   )
  )

;;
;; (blee:fn:dir:exclusion "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/iims/lcaVirshManage.sh/params/kvmHost/fvtn")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:fn:dir:exclusion dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:fn:dir:exclusion (dir)
  ""
  (let (
	(exclusionList)
	)
    (setq exclusionList
	  (list
	   (expand-file-name (concat dir "/" "CVS"))
	   (expand-file-name (concat dir "/" "_tree_"))
	   (expand-file-name (concat dir "/" "fvtn"))   	   
	   )
	  )
    (mapc
     (lambda (x)
       (when (string-match "~$"  x)
	 (blee:msg "%s tilda to be added to exclusion list" x)
	 (push x exclusionList)
	 )
       )
     (f-glob "*" dir)
     )
     exclusionList
     )
  )

;;; (see-file-other-window "/etc/passwd")
(defun see-file-other-window (@args)
  ""
    (find-file-other-window @args)
    (other-window 1)
    )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: bx: Help System Enhancements -- Obsoleted By bx:buf:announce:setup [[elisp:(org-cycle)][| ]]
")


(defun bx:symbols-list-value-in-help (this-symbol-list)
  ""
  (interactive)
  (with-output-to-temp-buffer (help-buffer)
      (switch-to-buffer (help-buffer))

      (setq truncate-lines nil)
      (setq word-wrap t)

      (bx:symbol-list-value-report this-symbol-list)
      (goto-char (point-min))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:buf:announce:setup "Some Title") [[elisp:(org-cycle)][| ]]
")

(defun bx:buf:announce:setup (titleString)
  "Set up a buffer for making announcements and showing results"
  (interactive)
  (let ((buffer-name (generate-new-buffer-name "BleeAnnouncements")))
    (switch-to-buffer buffer-name)

    ;;; insert broken out like this so that it does not show up as a section in this buffer
    (insert "*\
Controls:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(switch-to-buffer (other-buffer))][Switch]]  [[elisp:(progn (kill-buffer) (switch-to-buffer (other-buffer)))][Quit and Switch]]  [[elisp:(kill-buffer)][Quit]]  [[elisp:(bury-buffer)][Bury]] 
")

    (insert (format "* \
\n*               *%s* ::\n" titleString))

    (insert
     (format "* \
\n* %s\n"
	     (s-pad-right 95 "=" "")
	     ))
    
    (org-mode)
    (show-all)

    (buffer-name)
    )
  )


;;
;; (blee:buf:announce:setup "Title String As 5 Words")
;;
(defun blee:buf:announce:setup (titleString)
  "Generate a new buffer for making announcements and showing results"
  (blee:buf:announce:generateNewAndSwitchTo)
  (blee:buf:announce:insertTopHeaders titleString)
  )
  
(defun blee:buf:announce:generateNewAndSwitchTo ()
  "Generate a new buffer for making announcements and showing results"
  (let (
	(buffer-name (generate-new-buffer-name "BleeAnnouncements"))
	)
    (switch-to-buffer buffer-name)
    (buffer-name)
    )
  )

(defun blee:buf:announce:insertTopHeaders (titleString)
  "Set up a buffer for making announcements and showing results"

    ;;; insert broken out like this so that it does not show up as a section in this buffer
  (insert "*\
 Controls:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(switch-to-buffer (other-buffer))][Switch]]  [[elisp:(progn (kill-buffer) (switch-to-buffer (other-buffer)))][Quit and Switch]]  [[elisp:(kill-buffer)][Quit]]  [[elisp:(bury-buffer)][Bury]] 
")

  (insert (format "* \
\n* %s\n"
		  (s-pad-right 105 "=" "")
		  ))
   

  (insert (format "* \
\n*%s ::\n"
		  (s-center 103 (format "*%s*" titleString))))

  (insert (format "* \
\n* %s\n* \n"
		  (s-pad-right 105 "=" "")
		  ))
    
    (org-mode)
    (show-all)
    )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun        :: bx:valueReporter: Functions [[elisp:(org-cycle)][| ]]
")


(defun bx:valueReporter:symbolListValue (symbolList outStream)
  ""
  (mapcar (lambda (arg) (bx:valueReporter:symbolValue arg outStream))  symbolList)
  )


(defun bx:valueReporter:symbolValue (thisSymbol outStream)
  ""
  (let (
	(thisSymbolName (symbol-name thisSymbol))
	)

    (princ (format "** %s=%s\n"
		   thisSymbolName
		   (pp-to-string (eval thisSymbol)))
	   outStream)

    (princ (format "*** symbol-plist=%s\n"
		   (pp-to-string (symbol-plist thisSymbol)))
	   outStream)

    )
  )


;;; 
;;; (blee:org:level:blank 4)
;;;
(defun blee:org:level:blank (orgLevel)
  (let (
	(counter 0)
	(outStr "")
	)
    (while (< counter orgLevel)
      (setq counter (+ counter 1))
      (setq outStr (concat outStr "*"))
      )
    (concat outStr " ")
    ))

;;;
;;; (blee:example:runOnce:initSomeThing)
;;;
(defun blee:example:runOnce:initSomeThing ()
  "Must be interactive because this-command is used."
  (interactive)
  (when (blee:run:isFirst?)
    (blee:run:afterFirst)
    (message "First Execution")
    ))

;;;
;;; (blee:run:isFirst?)
;;;
(defun blee:run:isFirst? ()
  ""
  (not (get this-command 'isFirstRun)))

;;;
;;; (blee:run:afterFirst)
;;;
(defun blee:run:afterFirst ()
  ""
  (put this-command 'isFirstRun (not nil)))


;;(first (b:file:read|nuOfLines "/etc/passwd" 1))
;;
(defun b:file:read|nuOfLines (file n)
  "Return first N lines of FILE."
  (with-temp-buffer
    (insert-file-contents-literally file)
    (cl-loop repeat n
             unless (eobp)
             collect (prog1 (buffer-substring-no-properties
                             (line-beginning-position)
                             (line-end-position))
                       (forward-line 1)))))


;;
;; (b:yas-expand-snippet|file "/bisos/blee/env/snippets/bx-comeega-lisp-mode/fileElements/topLine:elisp.yas")
;; 
(defun b:yas-expand-snippet|file (<filePath)
  "."
  (let* (
	 ($lines (b:file:read|nuOfLines <filePath 2)) 
	 ($nameLine (second $lines))
         ($snippetName (s-chop-prefix "# name: " $nameLine)) 
	)
    (yas-expand-snippet (yas-lookup-snippet $snippetName))))




;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-lib-common"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-lib-common)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
