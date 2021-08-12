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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- IIM Bash Dblock Processors --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "Module Name"
(lambda () "*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message Module Name [[elisp:(org-cycle)][| ]]
")

(message "NOTYET, module name needs to be auto-generated")
;;;#+END:

;;;#+BEGIN: bx:dblock:lisp:requires :disabledP "false"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires       :: Requires [[elisp:(org-cycle)][| ]]
")
;;;#+END:


(require 'bx-lcnt-lib)

(defun blee:comeega:primaryMajorMode ()
  "Determine Primary Major Mode.

We will get it from ~primaryMajorMode.
If that fails, we try blee:ppmm:mode-stack-get
If that fails, we return major-mode.

** TODO Has not been full implemented and tested.
"
  (blee:ppmm:mode-stack-get)
  )
  



(defun bx:dblock:governor:process (@governor
				   @ext-gov
				   @style
				   @outLevel
				   @dblockFuncName				   
				   @helpLine
				   @bodyContentPlus
				   @bodyContent
				   )
  "Calls open+body+close in order.

** TODO instead of major-mode we should be using (blee:comeega:primaryMajorMode)
"

  ;;(setq @governor (bx:dblock:governor:effective @governor @ext-gov))  

  (bx:dblock:governor:helpLine @governor @style
			       @helpLine)

  (when (>= @outLevel 0 )
    (bx:dblock:global:moded:insert-begin major-mode))
  
  (bx:dblock:governor:open @outLevel @governor @style @dblockFuncName)

  (bx:dblock:governor:bodyContent @governor @style
				  @bodyContentPlus
				  @bodyContent)

  (bx:dblock:governor:close @outLevel @governor @style @dblockFuncName)

  (when (>= @outLevel 0 )
    (bx:dblock:global:moded:insert-end major-mode))
  )


(defun bx:dblock:governor:effective (@governor
				     @ext-gov
				     )
  "For now we ignore @ext-gov"
  @governor
  )

(defun bx:dblock:governor:helpLine (@governor
				    @sur-style
				    @helpLine
				    )
  "Call @helpLine perhaps and call open perhaps"
  (let (
	($dblockParams)
	($fullStr)
	)

    (setq $dblockParams (funcall @helpLine))
  
    (when (string= @governor "help")
      (setq $fullStr
	    (concat
	     $dblockParams
	     (bx:dblock:governor:comeegaCommonOptions)
	     ))
      
      (blee:dblock:params:desc major-mode $fullStr)
      )
    
    (when (string= @governor "verbose")
      (blee:dblock:params:desc major-mode $dblockParams)
      )
    ))

(defun bx:dblock:governor:comeegaCommonOptions ()
  "Returns A string that include possible governor values."
  ":governor \"enabled|disabled|hide|release|fVar\""
  )

(defun bx:dblock:governor:open (@outLevel
				@governor
				@style
				@dblockFuncName
				)
  "call open perhaps"
  (when (or
	 (string= @governor "verbose")
	 (string= @governor "enabled")
	 (string= @governor "disbaled")
	 )
    (bx:dblock:governor:inDblockOpen @outLevel @governor @style @dblockFuncName)
    )
  )

(defun bx:dblock:governor:bodyContent (@governor
				       @style
				       @bodyContentPlus
				       @bodyContent
				       )
  "Call @bodyContentPlus and @bodyContent"

  (when (or
	 (string= @governor "verbose")
	 (string= @governor "enabled")
	 )
    (funcall @bodyContentPlus)
    )

  (when (or
	 (string= @governor "verbose")
	 (string= @governor "enabled")
	 (string= @governor "hide")
	 )
    (funcall @bodyContent)
    )
  )



(defun bx:dblock:governor:close (@outLevel
				 @governor
				 @sur-style
				 @dblockFuncName
				 )
  "call open perhaps"
  (when (or
	 (string= @governor "verbose")
	 (string= @governor "enabled")
	 (string= @governor "disbaled")
	 )
    (bx:dblock:governor:inDblockClose @outLevel @governor @sur-style @dblockFuncName)
    )
  )


(defun bx:dblock:governor:inDblockOpen (@outLevel
					@governor
					@style
					@dblockFuncName
					)
  "Perhaps compile-time-function-name needs to be added"
  ;;;(insert "Open Place Holder")
  (bx:dblock:org-mode:func-open @outLevel @dblockFuncName :style @style)
  
  )

  
(defun bx:dblock:governor:inDblockClose (@outLevel
					 @governor
					 @style
					 @dblockFuncName
					 )
  "Perhaps compile-time-function-name needs to be added"
  ;;;(insert "Close Place Holder")
  (bx:dblock:org-mode:func-close @outLevel @dblockFuncName :style @style)

  )

;;;
;;; Obsoleted -- Junk Yard
;;;

(defun bx:dblock:governor:enforce (@control &rest @args)
  "Based on @control perhpas run @paramsDescFunc, return a variant of @control as $control

NOTYET, Support for fVar  needs to be added, support for more funcs, args should become named args.
"
  (let (
	(@paramsDescFunc (or (plist-get @args :paramsDescFunc) nil))
	;;
	($control nil)
	)
    
    (when (and
	   (not (equal @control "hide"))
	   (not (equal @control "release"))
	   )
      (when @paramsDescFunc
	(funcall @paramsDescFunc)
	)
      )

    (setq $control @control)    
    (when (equal @control "hide")
      (setq $control "disabled")
      )
    (when (equal @control "release")
      (setq $control "enabled")
      )
    
    $control
    )
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iim-bash"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-governor)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


