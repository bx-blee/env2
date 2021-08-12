;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "blee-iim-bash-cmnd")  (replace-string "moduleTag:" "iim:bash:cmnd:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (iim:bash:cmnd:), for handelling File_Var [[elisp:(org-cycle)][| ]]
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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-iim-bash-cmnd"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-iim-bash-cmnd [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: blee-iim-bash-cmnd")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: /Requires/ [[elisp:(org-cycle)][| ]]
")

(require 'cl)
(require 'server)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Definitions                 :: /Definitions/ [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar              :: bx:iimBash: By* IIM Panel Buffer Local Defvars [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

;;;
;;; Dictvars (property lists) should not have docString
;;;
(defvar iim:bash:cmnd:commonControl/dict/bufLoc "" )
(make-variable-buffer-local 'iim:bash:cmnd:commonControl/dict/bufLoc)

(defvar iim:bash:cmnd:params/dict/bufLoc "" )
(make-variable-buffer-local 'iim:bash:cmnd:params/dict/bufLoc)

(defvar iim:bash:cmnd:lineMode/choice/bufLoc "" )   ;; run/show/echoRun
(make-variable-buffer-local 'iim:bash:cmnd:lineMode/choice/bufLoc)


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Top Entry =* [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:main-init) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:main-init ()
  "Desc:"
  nil
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= iim:bash:cmnd: commonControl and params =* [[elisp:(org-cycle)][| ]]
")



(defun iim:bash:cmnd:commonControl:initialize (varName)
  ""
  (blee:var:initialize 'iim:bash:cmnd:commonControl/dict/bufLoc varName))


(defun iim:bash:cmnd:params:initialize (varName)
  ""
  (blee:var:initialize 'iim:bash:cmnd:params/dict/bufLoc varName))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:commonControl:get) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:commonControl:get ()
  'iim:bash:cmnd:commonControl/dict/bufLoc)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:params:get) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:params:get ()
  'iim:bash:cmnd:params/dict/bufLoc)
  

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:commonControl:clear) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:commonControl:clear ()
  "Desc:"
  (while (symbol-plist 'iim:bash:cmnd:commonControl/dict/bufLoc)
    (pop (symbol-plist 'iim:bash:cmnd:commonControl/dict/bufLoc)))
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:params:clear) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:params:clear ()
  "Desc:"
  (while (symbol-plist 'iim:bash:cmnd:params/dict/bufLoc)
    (pop (symbol-plist 'iim:bash:cmnd:params/dict/bufLoc)))
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:commonControl:defaults) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:commonControl:defaults ()
  "Desc:"
  (iim:bash:cmnd:lineSpecsStore :wrapper ""
				:iimName ""
				:iif ""
				:iifArgs ""
				:verbosity ""
				:callTracking ""
				:recording ""
				)

  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:cmnd:params:defaults) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:params:defaults ()
  "Desc:"
  (iim:bash:cmnd:params:clear))


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Store Based On Line Spec =* [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (bx:iimBash:cmndLineSpecs :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:storeBasedOnLineSpecs) [[elisp:(org-cycle)][| ]]
")


;;; (bx:iimBash:cmndLineSpecs :name "echo")
(cl-defun iim:bash:cmnd:lineSpecsStore (&key
					(wrapper nil)
					(iimName nil)
					(verbosity nil)
					(callTracking nil)
					(recording nil)				
					(iif nil)
					(iifArgs nil)
					)
  "For each named arument, set the corresponding buffer local variable"
  (blee:msg "Stroing")
  (when wrapper
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper wrapper))
  (when iimName
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName iimName))
  (when verbosity
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity verbosity))
  (when callTracking
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking callTracking))
  (when recording
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording recording))    
  (when iif
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif iif))    
  (when iifArgs
    (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs iifArgs))        
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Command Line String =* [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iim:bash:cmnd:lineStr :wrapper "echo" :iimName "someIim.sh") [[elisp:(iim:bash:cmnd:lineStr :wrapper "echo"))][(iim:bash:cmnd:lineStr :wrapper "echo")]]  [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:lineStr) [[elisp:(org-cycle)][| ]]
")

(cl-defun iim:bash:cmnd:lineStr (&key
				 (wrapper (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
				 (iimName (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
				 (iif (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
				 (iifArgs (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
				 (verbosity (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
				 (callTracking (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
				 (recording (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
				 (paramArgsDict 'iim:bash:cmnd:params/dict/bufLoc)
				 )
  "Creates the command line string based on the specified key words and content of iim:bash:cmnd:commonControl/dict/bufLoc
   as defaults."

  
  (let (
	(constructedParamArgs "")
	(paramsList (blee:dict:list paramArgsDict))
	(paramName)
	(paramValue)
	)
    (while paramsList
      (setq paramName (pop paramsList))
      (setq paramValue (pop paramsList))
      (setq constructedParamArgs
	    (format "%s -p %s=%s"
		    constructedParamArgs paramName paramValue)))
    (message "%s JJJKKK" constructedParamArgs)

    (defun blee:str:nilOrNoneAsEmpty (str)
      (let ((retVal str))
	(when (string= str "None")
	  (setq retVal ""))
	(when (not str)
	  (setq retVal ""))
	retVal
	)
      )
    
    (if (string= (blee:str:nilOrNoneAsEmpty  iif) "")
      (format "%s %s %s %s %s %s"
	      (blee:str:nilOrNoneAsEmpty  wrapper)
	      (blee:str:nilOrNoneAsEmpty  iimName)
	      (blee:str:nilOrNoneAsEmpty  verbosity)
	      (blee:str:nilOrNoneAsEmpty  callTracking)
	      (blee:str:nilOrNoneAsEmpty  recording)
	      constructedParamArgs
	      )
      (format "%s %s %s %s %s %s -i %s %s"
	    (blee:str:nilOrNoneAsEmpty  wrapper)
	    (blee:str:nilOrNoneAsEmpty  iimName)
	    (blee:str:nilOrNoneAsEmpty  verbosity)
	    (blee:str:nilOrNoneAsEmpty  callTracking)
	    (blee:str:nilOrNoneAsEmpty  recording)
	    constructedParamArgs
	    (blee:str:nilOrNoneAsEmpty  iif)
	    (blee:str:nilOrNoneAsEmpty  iifArgs)
	    )
      )
    ))


(cl-defun iim:bash:cmnd:lineModeGet ()
  "Read The current Line Mode Settings."
  (blee:dict:get 'iim:bash:cmnd:lineMode/choice/bufLoc 'mode)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iim:bash:cmnd:lineStrAndStore :wrapper "echo" :iimName "someIim22.sh") [[elisp:(iim:bash:cmnd:lineStrAndStore :wrapper "echo"))][(iim:bash:cmnd:lineStrAndStore :wrapper "echo")]]  [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:lineStrAndStore) [[elisp:(org-cycle)][| ]]
")

;;; (bx:iimBash:cmndLineStr)
;;; (bx:iimBash:cmndLineStr :name "MyName")

(cl-defun iim:bash:cmnd:lineStrAndStore (&key
					   (wrapper (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
					   (iimName (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
					   (iif (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
					   (iifArgs (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
					   (verbosity (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
					   (callTracking (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
					   (recording (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
					   (paramArgsDict 'iim:bash:cmnd:params/dict/bufLoc)
					   )
  "Creates the command line string based on the "

  (iim:bash:cmnd:lineSpecsStore :wrapper wrapper
				:iimName iimName
				:iif iif
				:iifArgs iifArgs
				:verbosity verbosity
				:callTracking callTracking
				:recording recording
				)

  (iim:bash:cmnd:lineStr :wrapper wrapper
			 :iimName iimName
			 :iif iif
			 :iifArgs iifArgs
			 :verbosity verbosity
			 :callTracking callTracking
			 :recording recording
			 )
  )
  

(cl-defun iim:bash:cmnd:lineSetAndShow (&key
					   (wrapper (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
					   (iimName (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
					   (iif (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
					   (iifArgs (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
					   (verbosity (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
					   (callTracking (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
					   (recording (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
					   (paramArgsDict 'iim:bash:cmnd:params/dict/bufLoc)
					   )
  "Creates the command line string based on the key args."

  (iim:bash:cmnd:lineStrAndStore :wrapper wrapper
				 :iimName iimName
				 :iif iif
				 :iifArgs iifArgs
				 :verbosity verbosity
				 :callTracking callTracking
				 :recording recording
				 )
  
  (save-excursion
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    )
  (org-overview)
  )
  


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Execute The Command Line    :: *= Command Line Execute =* [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (bx:iimBash:cmndLineExec :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


;;; (iim:bash:cmnd:lineExec :wrapper "echo")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:lineExec  &key   [[elisp:(org-cycle)][| ]]
  ")

(cl-defun iim:bash:cmnd:lineExec (&key
				  (wrapper (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
				  (iimName (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
				  (iif (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
				  (iifArgs (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
				  (verbosity (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
				  (callTracking (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
				  (recording (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
				  (paramArgsDict 'iim:bash:cmnd:params/dict/bufLoc)
				  )
  "Execute Command Line"

  (lsip-local-run-command-here
   (iim:bash:cmnd:lineStr :wrapper wrapper
			   :iimName iimName
			   :iif iif
			   :iifArgs iifArgs
			   :verbosity verbosity
			   :callTracking callTracking
			   :recording recording		      
			   :paramArgsDict paramArgsDict
			   )
   )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:lineExec  &key   [[elisp:(org-cycle)][| ]]
  ")

(cl-defun iim:bash:cmnd:modedExec (&key
				      (wrapper (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
				      (iimName (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
				      (iif (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
				      (iifArgs (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
				      (verbosity (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
				      (callTracking (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
				      (recording (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
				      (paramArgsDict 'iim:bash:cmnd:params/dict/bufLoc)
				      )
  "Execute Or Show Command Line"
  
  (when (string=
	 (iim:bash:cmnd:lineModeGet)
	 "run")
    (iim:bash:cmnd:lineExec :wrapper wrapper
			    :iimName iimName
			    :iif iif
			    :iifArgs iifArgs
			    :verbosity verbosity
			    :callTracking callTracking
			    :recording recording		      
			    :paramArgsDict paramArgsDict
			    )
    )
  
  (when (string=
	 (iim:bash:cmnd:lineModeGet)
	 "echo")
    (iim:bash:cmnd:lineExec :wrapper "echo"
			    :iimName iimName
			    :iif iif
			    :iifArgs iifArgs
			    :verbosity verbosity
			    :callTracking callTracking
			    :recording recording		      
			    :paramArgsDict paramArgsDict
			    )
    )

   (when (string=
	 (iim:bash:cmnd:lineModeGet)
	 "show")
     (iim:bash:cmnd:lineSetAndShow :wrapper wrapper
				   :iimName iimName
				   :iif iif
				   :iifArgs iifArgs
				   :verbosity verbosity
				   :callTracking callTracking
				   :recording recording		      
				   :paramArgsDict paramArgsDict
				   )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iim:bash:cmnd:lineExecAndStore &key [[elisp:(org-cycle)][| ]]
  ")


(cl-defun iim:bash:cmnd:lineExecAndStore (&key
					  (wrapper bx:iimBash:iimWrapper)
					  (iimName bx:iimBash:iimName)
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
		      :iimName name
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
*  [[elisp:(org-cycle)][| ]]                              :: *= Blee Announce Command Line Elements =* [[elisp:(org-cycle)][| ]]
")


;;; (iim:bash:cmnd:lineElemsShow)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bx:iimBash:resultsShow:cmndLineElems) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:cmnd:lineElemsShow ()
  ""
  (let (displayBuffer
	valuesBuffer
	varList
	cmndLineStr

	(wrapper            (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'wrapper))
	(iimName            (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName))
	(iif                (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif))
	(iifArgs            (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iifArgs))
	(verbosity          (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'verbosity))
	(callTracking	    (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'callTracking))
	(recording	    (blee:dict:get 'iim:bash:cmnd:commonControl/dict/bufLoc 'recording))
	)
	

    (setq valuesBuffer (generate-new-buffer "iimValues"))

    ;;; Save the buffer local variables before we change buffer
    (setq varList (list
		   'iim:bash:cmnd:commonControl/dict/bufLoc		   
		   'wrapper
		   'iimName
		   'iif
		   'iifArgs
		   'verbosity
		   'callTracking
		   'recording
		   'iim:bash:cmnd:params/dict/bufLoc
		   ))
		    
    (bx:valueReporter:symbolListValue varList valuesBuffer)

    (setq cmndLineStr (iim:bash:cmnd:lineStr))

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


;;; (setq bx:iimp:iimName "INit")
;;; (bx:valueReader:symbol 'bx:iimp:iimName)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (bx:valueReader:symbol thisSymbol) [[elisp:(org-cycle)][| ]]
  ")

(cl-defun bx:valueReader:symbol (thisSymbol)
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


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-iim-bash-cmnd"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-iim-bash-cmnd)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
