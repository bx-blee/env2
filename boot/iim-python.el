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

(message "ByStar YASNIPPET LOADING")
;;;#+END:

;;;#+BEGIN: bx:dblock:lisp:requires :disabledP "false"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires       :: Requires [[elisp:(org-cycle)][| ]]
")
;;;#+END:


(require 'bx-lcnt-lib)


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Conversion                 ::      /Conversion Facilities/   [[elisp:(org-cycle)][| ]]
")


(defun comeegaNativeControls()
   (format "\
 [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]"
	   ))

(defun subSectionTitleOpenInsertMethod%%(@sectionType)
  (insert
   (format "\
    \"\"\"\n** \
 [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  %-13s ::"
@sectionType
)))


(defun subSectionTitleOpenInsertMethod(@sectionType)
  (insert
   (format "\
    \"\"\"\n** \
 _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  %-10s ::"
@sectionType
)))


(defun subSectionTitleOpenInsert(@sectionType)
  (insert
   (format "\
        \"\"\"\n** \
 [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  %-13s ::"
@sectionType
)))


(defun sectionTitleOpenInsert%%(@sectionType)
  (insert
   (format "\
\"\"\"\n* \
 [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  %-14s ::"
@sectionType
)))

(defun sectionTitleOpenInsert(@sectionType)
  (insert
   (format "\
\"\"\"\n* \
 _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  %-10s ::"
@sectionType
)))


(defun sectionTitleCloseInsert(@sectionType)
  (insert
   (format "  [[elisp:(org-cycle)][| ]]\n\"\"\"\n")))


(defun sectionTitleCloseInsertNoNewLine(@sectionType)
  (insert
   (format "  [[elisp:(org-cycle)][| ]]\n\"\"\"")))



(defun icm-python-cmnd:classHead-Obsoleted(
  @cmndName @cmndType @comment @parsMandListStr @parsOptListStr @argsMin @argsMax @asFuncListStr @interactiveP @icmStr)
  ""
  (let (
	($icmStr @icmStr)
	($parsMandList (split-string @parsMandListStr))
	($parsOptList (split-string @parsOptListStr))
	($parsList)
	($asFuncList (split-string @asFuncListStr))	  	  
	)
    (setq $parsList (append $parsMandList $parsOptList))

    (if (not (string= @cmndType ""))
	(sectionTitleOpenInsert @cmndType)
      (sectionTitleOpenInsert "ICM-Cmnd")
      )

    (insert (format " /%s/" @cmndName))

    (if (not (string= @comment ""))
	(insert (format " =%s=" @comment)))
    
    (insert
     (format " parsMand=%s parsOpt=%s argsMin=%s argsMax=%s asFunc=%s interactive=%s"
             @parsMandListStr @parsOptListStr @argsMin @argsMax @asFuncListStr @interactiveP
	     ))
    
    (sectionTitleCloseInsert "ICM-Cmnd")

    (insert
     (format "class %s(icm.Iif):\n" @cmndName))
    
    (insert
     (format "    iifParamsMandatory = [ "))
    (mapcar (lambda (x)
	      (insert
	       (format "'%s', "
		       x
		       )))
	    $parsMandList
	    )
    (insert
     (format "]\n"))

    (insert
     (format "    iifParamsOptional = [ "))
    (mapcar (lambda (x)
	      (insert
	       (format "'%s', "
		       x
		       )))
	    $parsOptList
	    )
    (insert
     (format "]\n"))

    (insert
     (format "    iifArgsLen = {'Min': %s, 'Max': %s,}"
	     @argsMin @argsMax))
    
    (defun trueOrFalseStr(inStr)
      (let (
	    ($retVal)
	    )
      (cond
       ((string= inStr "")
	(setq $retVal "False"))
       ((string= inStr "true")
	(setq $retVal "True"))
       (t
	(setq $retVal "False"))
       )
      $retVal
      ))

      (insert
       (format "

    @icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def iif(self,
        interactive=%s,        # Can also be called non-interactively"
	       (trueOrFalseStr @interactiveP)))
      
      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # or Cmnd-Input"
			 x
			 )))
	      $parsMandList
	      )

      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # or Cmnd-Input"
			 x
			 )))
	      $parsOptList
	      )

      (if (not (string= @argsMax "0"))
	  (insert
	   (format "
        argsList=None,         # or Args-Input")))
      
      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # asFunc when interactive==False"
			 x
			 )))
	      $asFuncList
	      )      

      
      (insert
       (format "
    ):
        G = icm.IicmGlobalContext()
        iifOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=iifOutcome):
                return iifOutcome
"))

      (if (not (string= @argsMax "0"))
	  (insert
	   (format "\
            effectiveArgsList = G.iimRunArgsGet().iifArgs
        else:
            effectiveArgsList = argsList

"
		   ))
	(insert "\n")
	)
  
      (insert "\
        callParamsDict = {")
      (mapcar (lambda (x)
		(insert
		 (format "'%s': %s, "
			 x
			 x
			 )))
	      $parsList
	      )
      (insert
       (format "}
        if not icm.iifCallParamsValidate(callParamsDict, interactive, outcome=iifOutcome):
            return iifOutcome"
	       ))
    
      (mapcar (lambda (x)
		(insert
		 (format "
        %s = callParamsDict['%s']"
			 x
			 x
			 )))
	      $parsList
	      )
    ))



(defun iim-python-iif:parsValidate (parsListStr argsListStr asFuncListStr inIicm)
  ""
  (interactive)
  (let (
	(iicmStr)
	)
    
    (if (equal inIicm "")
	(setq iicmStr "iicm.")
      (setq iicmStr "")
      )

    (let (
	  (parsList (split-string parsListStr))
	  (argsList (split-string argsListStr))
	  (asFuncList (split-string asFuncListStr))	  	  
	  )
      (insert
       (format "\
    @iicm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def iif(self,
        interactive=False,        # Can also be called non-interactively"))

      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # or Cmnd-Input"
			 x
			 )))
	      parsList
	      )
      
      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # or Args-Input"
			 x
			 )))
	      argsList
	      )      

      (mapcar (lambda (x)
		(insert
		 (format "
        %s=None,         # asFunc when interactive==False"
			 x
			 )))
	      asFuncList
	      )      

      
      (insert
       (format "
    ):
        iifOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=iifOutcome):
                return iifOutcome

"
	       ))
  
      (insert "\
        callParamsDict = {")
      (mapcar (lambda (x)
		(insert
		 (format "'%s': %s, "
			 x
			 x
			 )))
	      parsList
	      )
      (insert
       (format "}
        if not %siifCallParamsValidate(callParamsDict, interactive, outcome=iifOutcome):
            return iifOutcome"
	       iicmStr))
    
      (mapcar (lambda (x)
		(insert
		 (format "
        %s = callParamsDict['%s']"
			 x
			 x
			 )))
	      parsList
	      )
    )))



(defun iim-python-one-class-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^class " nil t))
      (let* (
	     (defunName)
	     )
	(save-excursion
	  (when (re-search-forward "^class " nil t)
	    (setq defunName (thing-at-point 'symbol))
	    ))
	(iim-python-class-orgSec-insert defunName)
	)))



(defun iim-python-one-class-to-orgSecAfter ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^class " nil t))
      (when (re-search-forward "^class " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-python-func-orgSec-insert defunName)
	    )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-python-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-python-one-func-to-orgSecAfter ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^def " nil t))
      (when (re-search-forward "^def " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-python-func-orgSec-insert defunName)
	    )))))


(defun iim-python-one-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^def " nil t))
      (let* (
	     (defunName)
	     )
	(save-excursion
	  (when (re-search-forward "^def " nil t)
	    (setq defunName (thing-at-point 'symbol))
	    ))
	(iim-python-func-orgSec-insert defunName)
	)))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-python-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-python-all-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^def " nil t))
      (while (re-search-forward "^def " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    ;;(forward-paragraph -1)
	    (re-search-backward "^\\|[^[:space:]]")
	    (forward-line -1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-python-func-orgSec-insert defunName)
	    )))))



(defun iim-python-all-class-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^class " nil t))
      (while (re-search-forward "^class " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    ;;(forward-paragraph -1)
	    (re-search-backward "^\\|[^[:space:]]")
	    (forward-line -1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-python-class-orgSec-insert defunName)
	    )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-orgSec-insert defunName defunArgs) [[elisp:(org-cycle)][| ]]
  ")

(defun iim-python-func-orgSec-insert (funcName)
  ""
  (insert
   (format "\
\"\"\"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  %s    [[elisp:(org-cycle)][| ]]
\"\"\""
	   funcName)))



(defun iim-python-class-orgSec-insert (funcName)
  ""
  (insert
   (format "\
\"\"\"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Class-IIF       ::  %s    [[elisp:(org-cycle)][| ]]
\"\"\""
	   funcName)))



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Support Functions*
")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "iim-python"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'iim-python)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


