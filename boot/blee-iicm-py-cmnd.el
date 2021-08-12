;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "blee-iicm-py-cmnd")  (replace-string "moduleTag:" "iicm:py:cmnd:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (iicm:py:cmnd:), for handelling File_Var [[elisp:(org-cycle)][| ]]
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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-iicm-py-cmnd"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-iicm-py-cmnd [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: blee-iicm-py-cmnd")
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
*  [[elisp:(org-cycle)][| ]]  Buf Loc Defvar              :: iicm:py:cmnd: By* IIM Panel Buffer Local Defvars [[elisp:(org-cycle)][| ]]
 Panels are independent of one another, based on buffer-local and file-local variables.
")

;;;
;;; Dictvars (property lists) should not have docString
;;;
(defvar iicm:py:cmnd:commonControl/dict/bufLoc "" )
(make-variable-buffer-local 'iicm:py:cmnd:commonControl/dict/bufLoc)

(defvar iicm:py:cmnd:params/dict/bufLoc "" )
(make-variable-buffer-local 'iicm:py:cmnd:params/dict/bufLoc)

(defvar iicm:py:cmnd:lineMode/choice/bufLoc "" )   ;; run/show/echoRun
(make-variable-buffer-local 'iicm:py:cmnd:lineMode/choice/bufLoc)


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Top Entry =* [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:main-init) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:main-init ()
  "Desc:"
  nil
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= iicm:py:cmnd: commonControl and params =* [[elisp:(org-cycle)][| ]]
")



(defun iicm:py:cmnd:commonControl:initialize (varName)
  ""
  (blee:var:initialize 'iicm:py:cmnd:commonControl/dict/bufLoc varName))


(defun iicm:py:cmnd:params:initialize (varName)
  ""
  (blee:var:initialize 'iicm:py:cmnd:params/dict/bufLoc varName))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:commonControl:get) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:commonControl:get ()
  'iicm:py:cmnd:commonControl/dict/bufLoc)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:params:get) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:params:get ()
  'iicm:py:cmnd:params/dict/bufLoc)
  

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:commonControl:clear) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:commonControl:clear ()
  "Desc:"
  (while (symbol-plist 'iicm:py:cmnd:commonControl/dict/bufLoc)
    (pop (symbol-plist 'iicm:py:cmnd:commonControl/dict/bufLoc)))
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:params:clear) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:params:clear ()
  "Desc:"
  (while (symbol-plist 'iicm:py:cmnd:params/dict/bufLoc)
    (pop (symbol-plist 'iicm:py:cmnd:params/dict/bufLoc)))
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:commonControl:defaults) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:commonControl:defaults ()
  "Desc:"
  (iicm:py:cmnd:lineSpecsStore :wrapper ""
				:iicmName ""
				:iif ""
				:iifArgs ""
				:verbosity ""
				:callTracking ""
				:recording ""
				)

  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:params:defaults) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:params:defaults ()
  "Desc:"
  (iicm:py:cmnd:params:clear))


(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Store Based On Line Spec =* [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iicm:py:cmnd:lineSpecsStore :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:storeBasedOnLineSpecs) [[elisp:(org-cycle)][| ]]
")
;;; (iicm:py:cmnd:lineSpecsStore :name "echo")
(cl-defun iicm:py:cmnd:lineSpecsStore (&key
					(wrapper nil)
					(iicmName nil)
					(verbosity nil)
					(callTracking nil)
					(recording nil)				
					(iif nil)
					(iifArgs nil)
					)
  "For each named arument, set the corresponding buffer local variable"
  (blee:msg "Storing")
  (when wrapper
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper wrapper))
  (when iicmName
    (blee:msg (format "iicmName being set %s" iicmName))
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName iicmName))
  (when verbosity
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity verbosity))
  (when callTracking
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking callTracking))
  (when recording
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording recording))    
  (when iif
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif iif))    
  (when iifArgs
    (blee:dict:set 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs iifArgs))        
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Command Line String =* [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iicm:py:cmnd:lineStr :wrapper "echo" :iicmName "someIim.sh") [[elisp:(iicm:py:cmnd:lineStr :wrapper "echo"))][(iicm:py:cmnd:lineStr :wrapper "echo")]]  [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:lineStr) [[elisp:(org-cycle)][| ]]
")

(cl-defun iicm:py:cmnd:lineStr (&key
				 (wrapper (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
				 (iicmName (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
				 (iif (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
				 (iifArgs (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
				 (verbosity (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
				 (callTracking (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
				 (recording (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
				 (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)
				 )
  "Creates the command line string based on the specified key words and content of iicm:py:cmnd:commonControl/dict/bufLoc
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
	    (format "%s --%s %s"
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
	      (blee:str:nilOrNoneAsEmpty  iicmName)
	      (blee:str:nilOrNoneAsEmpty  verbosity)
	      (blee:str:nilOrNoneAsEmpty  callTracking)
	      (blee:str:nilOrNoneAsEmpty  recording)
	      constructedParamArgs
	      )
      (format "%s %s %s %s %s %s -i %s %s"
	    (blee:str:nilOrNoneAsEmpty  wrapper)
	    (blee:str:nilOrNoneAsEmpty  iicmName)
	    (blee:str:nilOrNoneAsEmpty  verbosity)
	    (blee:str:nilOrNoneAsEmpty  callTracking)
	    (blee:str:nilOrNoneAsEmpty  recording)
	    constructedParamArgs
	    (blee:str:nilOrNoneAsEmpty  iif)
	    (blee:str:nilOrNoneAsEmpty  iifArgs)
	    )
      )
    ))


(cl-defun iicm:py:cmnd:lineModeGet ()
  "Read The current Line Mode Settings."
  (blee:dict:get 'iicm:py:cmnd:lineMode/choice/bufLoc 'mode)
  )


;;
;; (iicm:py:cmnd:get:bufLocVar :iicmName)
;; 
(cl-defun iicm:py:cmnd:get:bufLocVar
    (&key
     (wrapper nil)
     (iicmName nil)
     (verbosity nil)
     (callTracking nil)
     (recording nil)				
     (iif nil)
     (iifArgs nil)
     )
  "For each named arument, get the corresponding buffer local variable"
  (let (
	(retVal)
	)
    (when wrapper
      (setq retVal
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper)))
    (when iicmName
      (setq retVal
       	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName)))
    (when verbosity
      (setq retVal
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity)))
    (when callTracking
      (setq retVal      
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking)))
    (when recording
      (setq retVal
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording)))
    (when iif
      (setq retVal
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif)))
    (when iifArgs
      (setq retVal      
	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs iifArgs)))
    retVal
    ))

(cl-defun iicm:py:cmnd:bufLocVar:symb(symbName)
  (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc symbName))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iicm:py:cmnd:lineStrAndStore :wrapper "echo" :iicmName "someIim22.sh") [[elisp:(iicm:py:cmnd:lineStrAndStore :wrapper "echo"))][(iicm:py:cmnd:lineStrAndStore :wrapper "echo")]]  [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:lineStrAndStore) [[elisp:(org-cycle)][| ]]
")

(cl-defun iicm:py:cmnd:lineStrAndStore (&key
					   (wrapper (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
					   (iicmName (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
					   (iif (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
					   (iifArgs (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
					   (verbosity (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
					   (callTracking (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
					   (recording (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
					   (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)
					   )
  "Creates the command line string based on the "

  (iicm:py:cmnd:lineSpecsStore :wrapper wrapper
				:iicmName iicmName
				:iif iif
				:iifArgs iifArgs
				:verbosity verbosity
				:callTracking callTracking
				:recording recording
				)

  (iicm:py:cmnd:lineStr :wrapper wrapper
			 :iicmName iicmName
			 :iif iif
			 :iifArgs iifArgs
			 :verbosity verbosity
			 :callTracking callTracking
			 :recording recording
			 )
  )
  

(cl-defun iicm:py:cmnd:lineSetAndShow (&key
				       (wrapper (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
				       (iicmName (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
				       (iif (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
				       (iifArgs (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
				       (verbosity (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
				       (callTracking (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
				       (recording (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
				       (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)
				       )
  "Creates the command line string based on the key args."

  (iicm:py:cmnd:lineStrAndStore :wrapper wrapper
				:iicmName iicmName
				:iif iif
				:iifArgs iifArgs
				:verbosity verbosity
				:callTracking callTracking
				:recording recording
				)
  
  (save-excursion
    (blee:org-update-named-dblocks "iicm:py:panel:execControlShow")
    )
  (org-overview)
  )
  


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Execute The Command Line    :: *= Command Line Execute =* [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  /Run/                       :: =Test= (iicm:py:cmnd:lineExec :wrapper "echo") [[elisp:(org-cycle)][| ]]
")


;;; (iicm:py:cmnd:lineExec :wrapper "echo")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:lineExec  &key   [[elisp:(org-cycle)][| ]]
  ")

(cl-defun iicm:py:cmnd:lineExec
    (&key
     (wrapper (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
     (iicmName (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
     (iif (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
     (iifArgs (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
     (verbosity (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
     (callTracking (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
     (recording (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
     (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)
     )
  "Execute Command Line"

  (lsip-local-run-command-here
   (iicm:py:cmnd:lineStr :wrapper wrapper
			 :iicmName iicmName
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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:modedExec  &key   [[elisp:(org-cycle)][| ]]
  ")

(cl-defun iicm:py:cmnd:modedExec
    (&key
     (wrapper (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
     (iicmName (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
     (iif (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
     (iifArgs (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
     (verbosity (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
     (callTracking (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
     (recording (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
     (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)
     )
  "Execute Or Show Command Line"
  
  (when (string=
	 (iicm:py:cmnd:lineModeGet)
	 "run")
    (iicm:py:cmnd:lineExec :wrapper wrapper
			    :iicmName iicmName
			    :iif iif
			    :iifArgs iifArgs
			    :verbosity verbosity
			    :callTracking callTracking
			    :recording recording		      
			    :paramArgsDict paramArgsDict
			    )
    )
  
  (when (string=
	 (iicm:py:cmnd:lineModeGet)
	 "echo")
    (iicm:py:cmnd:lineExec :wrapper "echo"
			    :iicmName iicmName
			    :iif iif
			    :iifArgs iifArgs
			    :verbosity verbosity
			    :callTracking callTracking
			    :recording recording		      
			    :paramArgsDict paramArgsDict
			    )
    )

   (when (string=
	 (iicm:py:cmnd:lineModeGet)
	 "show")
     (iicm:py:cmnd:lineSetAndShow :wrapper wrapper
				   :iicmName iicmName
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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || cl-defun     :: (iicm:py:cmnd:lineExecAndStore &key [[elisp:(org-cycle)][| ]]
  ")


(cl-defun iicm:py:cmnd:lineExecAndStore (&key
					 (wrapper            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
					 (iicmName            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
					 (iif                (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
					 (iifArgs            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
					 (verbosity          (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
					 (callTracking	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
					 (recording	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))	
					 (paramArgsDict 'iicm:py:cmnd:params/dict/bufLoc)				 
					 )
  "Execute Command Line"
  (let (cmndLineStr)
    (setq cmndLineStr (iicm:py:cmnd:lineStrAndStore
		       :wrapper wrapper
		       :iicmName iicmName
		       :verbosity verbosity
		       :callTracking callTracking
		       :recording recording		      
		       :paramArgsDict paramArgsDict
		       :iif iif
		       :iifArgs iifArgs
		       ))
    (lsip-local-run-command-here cmndLineStr)
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]                              :: *= Blee Announce Command Line Elements =* [[elisp:(org-cycle)][| ]]
")


;;; (iicm:py:cmnd:lineElemsShow)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:cmnd:lineElemsShow) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:cmnd:lineElemsShow ()
  ""
  (let (displayBuffer
	valuesBuffer
	varList
	cmndLineStr

	(wrapper            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'wrapper))
	(iicmName            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iicmName))
	(iif                (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iif))
	(iifArgs            (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iifArgs))
	(verbosity          (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'verbosity))
	(callTracking	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'callTracking))
	(recording	    (blee:dict:get 'iicm:py:cmnd:commonControl/dict/bufLoc 'recording))
	)
	

    (setq valuesBuffer (generate-new-buffer "iimValues"))

    ;;; Save the buffer local variables before we change buffer
    (setq varList (list
		   'iicm:py:cmnd:commonControl/dict/bufLoc		   
		   'wrapper
		   'iicmName
		   'iif
		   'iifArgs
		   'verbosity
		   'callTracking
		   'recording
		   'iicm:py:cmnd:params/dict/bufLoc
		   ))
		    
    (bx:valueReporter:symbolListValue varList valuesBuffer)

    (setq cmndLineStr (iicm:py:cmnd:lineStr))

    ;;; The above needs to happen with current buffer, to get buffer-local-variables

    ;;; So, we can switch buffers now

    (setq bufName (bx:buf:announce:setup "Iicm-Py Command Line Elements"))
    (insert "* Command Line\n")

    (insert cmndLineStr)
    (insert "\n\n")

    (insert "** =========== Command Line Elements ==========\n\n")
    (goto-char (point-max))
    (insert-buffer valuesBuffer)
    )
  )


;;; (setq bx:iimp:iicmName "INit")
;;; (bx:valueReader:symbol 'bx:iimp:iicmName)

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


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-iicm-py-cmnd"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-iicm-py-cmnd)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
