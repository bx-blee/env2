;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

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
*  [[elisp:(org-cycle)][| ]]  msg("Loading"):: Loading Announcement [[elisp:(org-cycle)][| ]]
")

(message "ByStar Library LOADING")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")

;;(require 'easymenu)
(require 'cl)
(require 'server)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar:: bx:iimp: By* IIM Panel Buffer Local Defvars [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

(defvar bx:iimp:iimWrapper ""
  "The command that may be used to wrap the iim, such as time, profile, etc.")
(make-variable-buffer-local 'bx:iimp:iimWrapper)

(defvar bx:iimp:iimName ""
  "The iim in effect")
(make-variable-buffer-local 'bx:iimp:iimName)

(defvar bx:iimp:iimVerbosity "-v 30"
  "Level Of Verbosity")
(make-variable-buffer-local 'bx:iimp:iimVerbosity)

(defvar bx:iimp:iimCallTracking ""
  "Form of Call Tracking in effect.")
(make-variable-buffer-local 'bx:iimp:iimCallTracking)

(defvar bx:iimp:iimLoads ""
  "Currect Iim Loads in effect.")
(make-variable-buffer-local 'bx:iimp:iimLoads)

(defvar bx:iimp:iimModeArgs "--sonModule"
  "Currect Iim Args in effect.")
(make-variable-buffer-local 'bx:iimp:iimModeArgs)

(defvar bx:iimp:iimParamArgs ""
  "Currect Iim Param Args in effect.")
(make-variable-buffer-local 'bx:iimp:iimParamArgs)

(defvar bx:iimp:iimIif ""
  "Currect Iif in effect.")
(make-variable-buffer-local 'bx:iimp:iimIif)

(defvar bx:iimp:iimIifArgs ""
  "Currect Iif Args in effect.")
(make-variable-buffer-local 'bx:iimp:iimIifArgs)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar:: bufloc: Generic buffer local Panel variables [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

(defvar bufloc:selectedSubject ""
  "The command that may be used to wrap the iim, such as time, profile, etc.")
(make-variable-buffer-local 'bufloc:selectedSubject)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimp:cmndLineStr) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:cmndLineStr)
;;; (bx:iimp:cmndLineStr :name "MyName")
(cl-defun bx:iimp:cmndLineStr (&key
				(wrapper bx:iimp:iimWrapper)
				(name bx:iimp:iimName)
				(verbosity bx:iimp:iimVerbosity)
				(callTracking bx:iimp:iimCallTracking)
				(loads bx:iimp:iimLoads)
				(modeArgs bx:iimp:iimModeArgs)
				(paramArgs bx:iimp:iimParamArgs)
				(iif bx:iimp:iimIif)
				(iifArgs bx:iimp:iimIifArgs)
				)
  "Creates the command line string"

  (bx:iimp:cmndLineSpecs
   :wrapper wrapper
   :name name
   :verbosity verbosity
   :callTracking callTracking
   :loads loads
   :modeArgs modeArgs
   :paramArgs paramArgs
   :iif iif
   :iifArgs iifArgs
   )  
  
  (format "%s %s %s %s %s %s %s -i %s %s"
	  wrapper
	  name
	  verbosity
	  callTracking
	  loads
	  modeArgs
	  paramArgs
	  iif
	  iifArgs
	  )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimp:cmndLineExec :wrapper "echo") [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:cmndLineExec :wrapper "echo")
(cl-defun bx:iimp:cmndLineExec (&key
				(wrapper bx:iimp:iimWrapper)
				(name bx:iimp:iimName)
				(verbosity bx:iimp:iimVerbosity)
				(callTracking bx:iimp:iimCallTracking)
				(loads bx:iimp:iimLoads)
				(modeArgs bx:iimp:iimModeArgs)
				(paramArgs bx:iimp:iimParamArgs)
				(iif bx:iimp:iimIif)
				(iifArgs bx:iimp:iimIifArgs)
				)
  "Execute Command Line"
  (let (cmndLineStr)
    (setq cmndLineStr (bx:iimp:cmndLineStr
		      :wrapper wrapper
		      :name name
		      :verbosity verbosity
		      :callTracking callTracking
		      :loads loads
		      :modeArgs modeArgs
		      :paramArgs paramArgs
		      :iif iif
		      :iifArgs iifArgs
		      ))
    (lsip-local-run-command-here cmndLineStr)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimp:cmndLineSpecs :wrapper "echo") [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:cmndLineSpecs :name "echo")
(cl-defun bx:iimp:cmndLineSpecs (&key
				(wrapper nil)
				(name nil)
				(verbosity nil)
				(callTracking nil)
				(loads nil)
				(modeArgs nil)
				(paramArgs nil)
				(iif nil)
				(iifArgs nil)
				)
  "For each named arument, set the corresponding buffer local variable"
  (when wrapper
    (setq bx:iimp:iimWrapper wrapper))
  (when name
    (setq bx:iimp:iimName name))
  (when verbosity
    (setq bx:iimp:iimVerbosity verbosity))
  (when callTracking
    (setq bx:iimp:iimCallTracking callTracking))
  (when loads
    (setq bx:iimp:iimLoads loads))
  (when modeArgs
    (setq bx:iimp:iimModeArgs modeArgs))
  (when paramArgs
    (setq bx:iimp:iimParamArgs paramArgs))
  (when iif
    (setq bx:iimp:iimIif iif))
  (when iifArgs
    (setq bx:iimp:iimIifArgs iifArgs))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:iimp:resultsShow:cmndLineElems) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:resultsShow:cmndLineElems)
(defun bx:iimp:resultsShow:cmndLineElems ()
  ""
  (let (displayBuffer
	valuesBuffer
	varList
	cmndLineStr
	)

    (setq valuesBuffer (generate-new-buffer "iimValues"))

    (setq varList '(
		    bx:iimp:iimWrapper   ;;; Save the buffer local variables before we change buffer
		    bx:iimp:iimName
		    bx:iimp:iimVerbosity
		    bx:iimp:iimCallTracking
		    bx:iimp:iimLoads
		    bx:iimp:iimModeArgs
		    bx:iimp:iimParamArgs
		    bx:iimp:iimIif
		    bx:iimp:iimIifArgs
		    ))
    (bx:valueReporter:symbolListValue varList valuesBuffer)

    (setq cmndLineStr (bx:iimp:cmndLineStr))

    ;;; The above needs to happen with current buffer, to get buffer-local-variables

    ;;; So, we can switch buffers now

    (setq bufName (bx:buf:announce:setup "IIM-Py Command Line Elements"))
    (insert "* Command Line\n")

    (insert cmndLineStr)
    (insert "\n\n")

    (insert "** =========== Command Line Elements ==========\n\n")
    (goto-char (point-max))
    (insert-buffer valuesBuffer)
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:iimp:realgud:pdb:allArgs) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:realgud:pdb:allArgs)
(defun bx:iimp:realgud:pdb:allArgs ()
  ""
  (interactive)  
  (let (
	this-buffer
	cmndLineStr	
	)
    ;;
    ;; NB: bx:iimp:cmndLineStr is based on local variables
    ;; it should be captured in the buffer from which it was executed.
    ;;
    (setq cmndLineStr (bx:iimp:cmndLineStr :wrapper "pdb"))
    (save-excursion 
      (setq this-buffer (find-file bx:iimp:iimName))
      (realgud:pdb cmndLineStr)
      (message cmndLineStr)
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:iimp:realgud:pdb:noArgs) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimp:realgud:pdb:noArgs)
(defun bx:iimp:realgud:pdb:noArgs ()
  ""
  (interactive)  
  (let (
	this-buffer
	)
    (save-excursion 
      (setq this-buffer (find-file bx:iimp:iimName))
      (realgud:pdb)
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar:: bx:iimBash: By* IIM Panel Buffer Local Defvars [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

(defvar bx:iimBash:iimWrapper ""
  "The command that may be used to wrap the iim, such as time, profile, etc.")
(make-variable-buffer-local 'bx:iimBash:iimWrapper)

(defvar bx:iimBash:iimName ""
  "The iim in effect")
(make-variable-buffer-local 'bx:iimBash:iimName)

(defvar bx:iimBash:iimVerbosity "-v"
  "Level Of Verbosity")
(make-variable-buffer-local 'bx:iimBash:iimVerbosity)

(defvar bx:iimBash:iimRecording ""
  "Form Recording in effect.")
(make-variable-buffer-local 'bx:iimBash:iimRecording)

(defvar bx:iimBash:iimCallTracking "-n showRun"
  "Form of Call Tracking in effect.")
(make-variable-buffer-local 'bx:iimBash:iimCallTracking)

(defvar bx:iimBash:iimParamsArgs ""
  "Currect Iim Param Args in effect.")
(make-variable-buffer-local 'bx:iimBash:iimParamsArgs)

(defvar bx:iimBash:paramsPropList "")
(make-variable-buffer-local 'bx:iimBash:paramsPropList)

(defvar bx:iimBash:iimIif ""
  "Currect Iif in effect.")
(make-variable-buffer-local 'bx:iimBash:iimIif)

(defvar bx:iimBash:iimIifArgs ""
  "Currect Iif Args in effect.")
(make-variable-buffer-local 'bx:iimBash:iimIifArgs)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimBash:cmndLineStr) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimBash:cmndLineStr)
;;; (bx:iimBash:cmndLineStr :name "MyName")
(cl-defun bx:iimBash:cmndLineStr (&key
				(wrapper bx:iimBash:iimWrapper)
				(name bx:iimBash:iimName)
				(verbosity bx:iimBash:iimVerbosity)
				(callTracking bx:iimBash:iimCallTracking)
				(recording bx:iimBash:iimRecording)				
				(paramArgs bx:iimBash:paramsPropList)
				(iif bx:iimBash:iimIif)
				(iifArgs bx:iimBash:iimIifArgs)
				)
  "Creates the command line string"

  (bx:iimBash:cmndLineSpecs
   :wrapper wrapper
   :name name
   :verbosity verbosity
   :callTracking callTracking
   :recording recording   
   :paramArgs paramArgs
   :iif iif
   :iifArgs iifArgs
   )  

  (let (
	(constructedParamArgs "")
	(paramsList (symbol-plist 'bx:iimBash:paramsPropList))
	(paramName)
	(paramValue)
	)
    (while paramsList
      (setq paramName (pop paramsList))
      (setq paramValue (pop paramsList))
      (setq constructedParamArgs
	    (format "%s -p %s=%s"
		    constructedParamArgs paramName paramValue)))
    (message "%s JJJ" constructedParamArgs)
	 
    (if (string= iif "")
      (format "%s %s %s %s %s %s"
	      wrapper
	      name
	      verbosity
	      callTracking
	      recording
	      constructedParamArgs
	      )
      (format "%s %s %s %s %s %s -i %s %s"
	    wrapper
	    name
	    verbosity
	    callTracking
	    recording
	    constructedParamArgs
	    iif
	    iifArgs
	    )
      )
    ))

(defun bx:iimBash:paramsPropListClear ()
  "Desc:"
  (while (symbol-plist 'bx:iimBash:paramsPropList)
    (pop (symbol-plist 'bx:iimBash:paramsPropList)))
  )

;;; (bx:iimBash:cmndLineStr)
;;; (bx:iimBash:cmndLineStr :name "MyName")
(cl-defun bx:iimBash:cmndLineStrOrig (&key
				(wrapper bx:iimBash:iimWrapper)
				(name bx:iimBash:iimName)
				(verbosity bx:iimBash:iimVerbosity)
				(callTracking bx:iimBash:iimCallTracking)
				(recording bx:iimBash:iimRecording)				
				(paramArgs bx:iimBash:iimParamsArgs)
				(iif bx:iimBash:iimIif)
				(iifArgs bx:iimBash:iimIifArgs)
				)
  "Creates the command line string"

  (bx:iimBash:cmndLineSpecs
   :wrapper wrapper
   :name name
   :verbosity verbosity
   :callTracking callTracking
   :recording recording   
   :paramArgs paramArgs
   :iif iif
   :iifArgs iifArgs
   )  

  (if (string= iif "")
      (format "%s %s %s %s %s %s"
	      wrapper
	      name
	      verbosity
	      callTracking
	      recording
	      paramArgs
	      )
    (format "%s %s %s %s %s %s -i %s %s"
	    wrapper
	    name
	    verbosity
	    callTracking
	    recording
	    paramArgs
	    iif
	    iifArgs
	    )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimBash:cmndLineExec :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


;;; (bx:iimBash:cmndLineExec :wrapper "echo")
(cl-defun bx:iimBash:cmndLineExec (&key
				(wrapper bx:iimBash:iimWrapper)
				(name bx:iimBash:iimName)
				(verbosity bx:iimBash:iimVerbosity)
				(callTracking bx:iimBash:iimCallTracking)
				(recording bx:iimBash:iimRecording)				
				(paramArgs bx:iimBash:iimParamsArgs)
				(iif bx:iimBash:iimIif)
				(iifArgs bx:iimBash:iimIifArgs)
				)
  "Execute Command Line"
  (let (cmndLineStr)
    (setq cmndLineStr (bx:iimBash:cmndLineStr
		      :wrapper wrapper
		      :name name
		      :verbosity verbosity
		      :callTracking callTracking
		      :recording recording		      
		      :paramArgs paramArgs
		      :iif iif
		      :iifArgs iifArgs
		      ))
    (lsip-local-run-command-here cmndLineStr)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:iimBash:cmndLineSpecs :wrapper "echo") [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimBash:cmndLineSpecs :name "echo")
(cl-defun bx:iimBash:cmndLineSpecs (&key
				(wrapper nil)
				(name nil)
				(verbosity nil)
				(callTracking nil)
				(recording nil)				
				(paramArgs nil)
				(iif nil)
				(iifArgs nil)
				)
  "For each named arument, set the corresponding buffer local variable"
  (when wrapper
    (setq bx:iimBash:iimWrapper wrapper))
  (when name
    (setq bx:iimBash:iimName name))
  (when verbosity
    (setq bx:iimBash:iimVerbosity verbosity))
  (when callTracking
    (setq bx:iimBash:iimCallTracking callTracking))
  (when recording
    (setq bx:iimBash:iimRecording recording))
  (when paramArgs
    (setq bx:iimBash:iimParamsArgs paramArgs))
  (when iif
    (setq bx:iimBash:iimIif iif))
  (when iifArgs
    (setq bx:iimBash:iimIifArgs iifArgs))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:iimBash:resultsShow:cmndLineElems) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimBash:resultsShow:cmndLineElems)
(defun bx:iimBash:resultsShow:cmndLineElems ()
  ""
  (let (displayBuffer
	valuesBuffer
	varList
	cmndLineStr
	)

    (setq valuesBuffer (generate-new-buffer "iimValues"))

    (setq varList '(
		    bx:iimBash:iimWrapper   ;;; Save the buffer local variables before we change buffer
		    bx:iimBash:iimName
		    bx:iimBash:iimVerbosity
		    bx:iimBash:iimCallTracking
		    bx:iimBash:iimRecording		    
		    bx:iimBash:iimParamsArgs
		    bx:iimBash:iimIif
		    bx:iimBash:iimIifArgs
		    ))
    (bx:valueReporter:symbolListValue varList valuesBuffer)

    (setq cmndLineStr (bx:iimBash:cmndLineStr))

    ;;; The above needs to happen with current buffer, to get buffer-local-variables

    ;;; So, we can switch buffers now

    (setq bufName (bx:buf:announce:setup "IIM-Bash Command Line Elements"))
    (insert "* Command Line\n")

    (insert cmndLineStr)
    (insert "\n\n")

    (insert "** =========== Command Line Elements ==========\n\n")
    (goto-char (point-max))
    (insert-buffer valuesBuffer)
    )
  )

(defun bx:orgm:indirectBufOther ()
  "Usually in |>. Behavior of org-tree-to-indirect-buffer changed in 2021."
  (interactive)
  (let ($kept)
    (setq $kept org-indirect-buffer-display)
    (setq org-indirect-buffer-display 'other-window)
    (org-tree-to-indirect-buffer)
    (setq org-indirect-buffer-display $kept)
    )
  )


(defun bx:orgm:indirectBufMain ()
  "Usually in |I"
  (interactive)  
  (let (
	$baseBuf
	)
    (setq $baseBuf (buffer-base-buffer))
    (if $baseBuf
	(progn
	  (switch-to-buffer $baseBuf))
      (progn
	(org-tree-to-indirect-buffer)
	(other-window 1)
	(delete-other-windows)
	)
      )
    )
  )




;;; (setq bx:iimp:iimName "INit")
;;; (bx:valueReader:symbol 'bx:iimp:iimName)
(defun bx:valueReader:symbol (thisSymbol)
  ""
  (interactive)
  (let (
	gotValue
	(thisSymbolName (symbol-name thisSymbol))
	)

    (message (print (format "%s=%s\n"
		   thisSymbolName
		   (pp-to-string (eval thisSymbol)))))

    (set thisSymbol
	 (read-string (format "%s=%s  ::"
			      thisSymbolName
			      (pp-to-string (eval thisSymbol)))
		      "")
	 )
    )
  )

;;; (call-interactively 'bx:valueReader:readValue)
(defun bx:valueReader:readValue (value)
  ""
  (interactive (list 
		(read-string "Value: " "localhost")
		))
  (message value)
  )
	       


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar:: bx:bxpCmnd: By* IIM Panel Buffer Local Defvars [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

(defvar bx:bxpCmnd:cmndWrapper ""
  "The command that may be used to wrap the iim, such as time, profile, etc.")
(make-variable-buffer-local 'bx:bxpCmnd:cmndWrapper)

(defvar bx:bxpCmnd:cmndName ""
  "The iim in effect")
(make-variable-buffer-local 'bx:bxpCmnd:cmndName)

(defvar bx:bxpCmnd:aFqdn "www.example.com"
  "Arg Fqdn")
(make-variable-buffer-local 'bx:bxpCmnd:aFqdn)

(defvar bx:bxpCmnd:aIpAddr "8.8.8.8"
  "Arg IP Address")
(make-variable-buffer-local 'bx:bxpCmnd:aIpAddr)

(defvar bx:bxpCmnd:aPrinterName "UnSpecifiedPrinter"
  "Printer Name")
(make-variable-buffer-local 'bx:bxpCmnd:aPrinterName)

(defvar bx:bxpCmnd:aSubject "UnSpecifiedSubject"
  "General Purpose Printer")
(make-variable-buffer-local 'bx:bxpCmnd:aSubject)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:bxpCmnd:cmndLineStr) [[elisp:(org-cycle)][| ]]
")

;;; (bx:bxpCmnd:cmndLineStr)
;;; (bx:bxpCmnd:cmndLineStr :name "MyName" :aFqdn t :aIpAddr "198.62.92.1")
(cl-defun bx:bxpCmnd:cmndLineStr (&key
				(wrapper nil)
				(name nil)
				(aFqdn nil)
				(aIpAddr nil)				
				)
  "For each named arument, set the corresponding buffer local variable"
  (let (
	(cmndLineStr "")
	)
    (when wrapper
      (setq cmndLineStr (concat cmndLineStr wrapper)))
    (when name
      (setq cmndLineStr (concat cmndLineStr name)))
    ;;;(setq bx:bxpCmnd:cmndName name))
    (when aFqdn
      (setq cmndLineStr (concat cmndLineStr " " bx:bxpCmnd:aFqdn)))
    ;;(cl-return cmndLineStr)
    (when aIpAddr
      (setq cmndLineStr (concat cmndLineStr " " bx:bxpCmnd:aIpAddr)))
    (format "%s" cmndLineStr)
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:bxpCmnd:cmndLineExec :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


;;; (bx:bxpCmnd:cmndLineExec :name "echo" :aFqdn t)
(cl-defun bx:bxpCmnd:cmndLineExec (&key
				(wrapper nil)
				(name nil)
				(aFqdn nil)	
				(aIpAddr nil)			
				)
  "Execute Command Line"
  (let (cmndLineStr)
    (setq cmndLineStr (bx:bxpCmnd:cmndLineStr
		      :wrapper wrapper
		      :name name
		      :aFqdn aFqdn
		      :aIpAddr aIpAddr		      
		      ))
    (lsip-local-run-command-here cmndLineStr)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  cl-defun      :: (bx:bxpCmnd:cmndLineSpecs :wrapper "echo") [[elisp:(org-cycle)][| ]]
")

;;; (bx:bxpCmnd:cmndLineSpecs :name "echo" :aFqdn "www.example.com")
(cl-defun bx:bxpCmnd:cmndLineSpecs (&key
				(wrapper nil)
				(name nil)
				(aFqdn nil)
				(aIpAddr nil)				
				)
  "For each named arument, set the corresponding buffer local variable"
  (when wrapper
    (setq bx:bxpCmnd:cmndWrapper wrapper))
  (when name
    (setq bx:bxpCmnd:cmndName name))
  (when aFqdn
    (setq bx:bxpCmnd:aFqdn aFqdn))
  (when aIpAddr
    (setq bx:bxpCmnd:aIpAddr aIpAddr))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:bxpCmnd:resultsShow:cmndLineElems) [[elisp:(org-cycle)][| ]]
")

;;; (bx:bxpCmnd:resultsShow:cmndLineElems)
(defun bx:bxpCmnd:resultsShow:cmndLineElems ()
  ""
  (let (displayBuffer
	valuesBuffer
	varList
	cmndLineStr
	)

    (setq valuesBuffer (generate-new-buffer "iimValues"))

    (setq varList '(
		    bx:bxpCmnd:cmndWrapper   ;;; Save the buffer local variables before we change buffer
		    bx:bxpCmnd:cmndName
		    bx:bxpCmnd:aFqdn
		    bx:bxpCmnd:aIpAddr		    
		    ))
    (bx:valueReporter:symbolListValue varList valuesBuffer)

    (setq cmndLineStr (bx:bxpCmnd:cmndLineStr))

    ;;; The above needs to happen with current buffer, to get buffer-local-variables

    ;;; So, we can switch buffers now

    (setq bufName (bx:buf:announce:setup "IIM-Bash Command Line Elements"))
    (insert "* Command Line\n")

    (insert cmndLineStr)
    (insert "\n\n")

    (insert "** =========== Command Line Elements ==========\n\n")
    (goto-char (point-max))
    (insert-buffer valuesBuffer)
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Blee Widget    :: bx: Common Facilities [[elisp:(org-cycle)][| ]]
")


(defvar blee:widget:mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map widget-keymap)
    ;; this command may be helpful for debug
    (define-key map "q" 'kill-buffer)
    (define-key map "\C-c\C-s" 'blee:checklist:begin:-show-source)
    map)
  "Keymap to use in *blee:widget* buffer.")


(define-derived-mode
  blee:widget:mode
  org-mode
  "WBleeWidget"
  "Widget Blee.
\\{blee:widget:mode-map}"
  )

;;; (str:spacesElim "Hello World 2 ")
(defun str:spacesElim (inStr)
  ""
  (apply #'concat (split-string inStr))
  )


;; (insert (which-linux-distribution))Ubuntu 18.04 LTS

(defun which-linux-distribution ()
  "from lsb_release"
  (interactive)
  (when (eq system-type 'gnu/linux)
    (shell-command-to-string "lsb_release -sd")))

(defun ubuntu-1804-P ( )
  " "
  (string= "Ubuntu 18.04 LTS\n" (which-linux-distribution))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide        :: Provide [[elisp:(org-cycle)][| ]]
")


(provide 'bx-lib)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
