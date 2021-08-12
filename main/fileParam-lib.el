;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "fileParam-lib")  (replace-string "moduleTag:" "fp:")

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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "fileParam-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message fileParam-lib [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: fileParam-lib")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'subr-x)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: fp:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:main-init) [[elisp:(org-cycle)][| ]]
")

(defun fp:main-init ()
  "Desc:"
  nil
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *fp Leaf And Node Facilities*          ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")



;; (setq tmpVar11 "")
;; (message (get 'tmpVar11 'description))
;; (message (get 'tmpVar11 'paramName1))
;; (symbol-plist 'tmpVar11)


;; (bx:file-string "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/iims/lcaVirshManage.sh/params/kvmHost/fvtn/curValue") tmpVar11)
;; (fp:leaf:read-var-as-string "/tmp/base1/paramName1" 'tmpVar11)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseSetInDictVar fpLeafBase fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")


(defun fp:leaf:withBaseSetInDictVar (fpLeafBase fpNodeDictVar)
  "Given File, write its content as string as a property of propVar."
  (let (
	(paramName (fp:leaf:withBaseGetName fpLeafBase)) 
	)
    (put fpNodeDictVar
	 (intern paramName)
	 (fp:leaf:withBaseGetValueAsString  fpLeafBase))))

(defun fp:leaf:withBaseSetInDictVarOld (fpLeafBase fpNodeDictVar)
  "Given File, write its content as string as a property of propVar."
  (let (
	(varName (fp:leaf:withBaseGetName fpLeafBase))
	)
    (blee:eval-string
     (format "(put '%s '%s \"%s\")"
	     fpNodeDictVar
	     varName
	     (fp:leaf:withBaseGetValueAsString  fpLeafBase)
	     ))
    (blee:msg
     (format "(put '%s '%s \"%s\")"
	     fpNodeDictVar
	     varName
	     (fp:leaf:withBaseGetValueAsString  fpLeafBase)
	     ))
    varName))

;;;
;;;(fp:leaf:withDictVarGetLeafBaseValue "/opt/public/osmt/bin/isit442-w2017/mailBot.2/iimsIn/paramsFp/firstName" 'iimsInParams)
;;; 
(defun fp:leaf:withDictVarGetLeafBaseValue (fpLeafBase fpNodeDictVar)
  "Given File, write its content as string as a property of propVar."
  (let (
	(paramName (fp:leaf:withBaseGetName fpLeafBase))
	)
    (get fpNodeDictVar (intern paramName))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseVerifyDictVar fpLeafBase fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withBaseVerifyDictVar (fpLeafBase fpNodeDictVar)
  ""
  (message "Place Holder"))

;;
;; (setq tmpVar11 "")
;; (symbol-plist 'tmpVar11)
;; (fp:node:read-var-as-string "/tmp/base1" 'tmpVar11)
;; (fp:node:read-var-as-string "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox/iims/lcaVirshManage.sh/params/kvmHost/fvtn" 'tmpVar11)
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:withBaseSetAllInDictVar fpNodeBase fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:withBaseSetAllInDictVar (fpNodeBase fpNodeDictVar)
  "Given fpNode, Put ALL of its fpLeaf in fpNodeDictVar."
  (mapc
   (lambda (fpLeafBase)
     (fp:leaf:read-var-as-string fpLeafBase fpNodeDictVar)     
     )
   (blee:fn:dir:*-relevant fpNodeBase)   
   ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:withBaseVerifyAllInDictVar fpNodeBase fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:withBaseVerifyAllInDictVar (fpNodeBase fpNodeDictVar)
  ""
  (message "Place Holder"))


;;
;; (fp:leaf:withBaseGetEnums "/tmp/base1")
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseGetEnums fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withBaseGetEnums (fpLeafBase)
  ""
  (expand-file-name (concat fpLeafBase "/enums"))
  )

;;
;; (fp:leaf:withEnumsGetBase "/tmp/base1/enums")
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withEnumsGetBase dir) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withEnumsGetBase (dir)
  ""
  (expand-file-name (concat dir "/.."))
  )

;;
;; (fp:leaf:withBaseGetValueAsString  "/tmp/base1")
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseGetValueAsString fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withBaseGetValueAsString (fpLeafBase)
  ""
  (fv:read-as-string (concat fpLeafBase  "/value"))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseGetDefaultAsString fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withBaseGetDefaultAsString (fpLeafBase)
  ""
  (fv:read-as-string (concat fpLeafBase  "/default"))
  )



;;
;; (fp:leaf:withBaseGetName  "/tmp/base1")
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:leaf:withBaseGetName fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:leaf:withBaseGetName (fpLeafBase)
  ""
  (file-name-nondirectory fpLeafBase)
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Buffer Setup -- BleeAnnounce* ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")



;;
;; (setq dictVar12 "/opt/public/osmt/bin/isit442-w2017/mailBot.2/tmp/myEnv")
;; (fp:node:menuBox:buffer:paramsEditor "/opt/public/osmt/bin/isit442-w2017/mailBot.2/tmp/myEnv" 'dictVar12 'fp:node:menuBox:popupMenu:trigger)
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:buffer:paramsEditor fpNodeBase fpNodeDictVar popUpSelector) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:buffer:paramsEditor (fpNodeBase  fpNodeDictVar popUpSelector)
  "Given a fp:node and a dictVar, create a fpBoxEditor."
 
  (blee:buf:announce:setup (format "BleeBoxEditor for File Parameters At: %s" fpNodeBase))

  (goto-char (point-max))

  (fp:node:menuBox:insert:topControls fpNodeBase fpNodeDictVar  popUpSelector)
  (fp:node:menuBox:insert:paramsEditor fpNodeBase fpNodeDictVar  popUpSelector)
  )


;;
;; (fp:node:menuBox:buffer:paramsViewer "/opt/public/osmt/bin/isit442-w2017/mailBot.2/tmp/myEnv")
;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:buffer:paramsViewer fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:buffer:paramsViewer (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpBoxEditor."
  (let (
	(infoBuffer)
	)
 
    (setq infoBuffer (bx:buf:announce:setup (format "BleeBoxEditor for File Parameters At: %s" fpNodeBase)))

    (insert "*\
 /===/ [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select This IIM's Parameters= | ]]                    /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
	    )

    ;;;(fp:node:menuBox:insert:topControls fpNodeBase fpNodeDictVar  popUpSelector)
    
    (fp:node:menuBox:insert:paramsViewer fpNodeBase)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Inserts -- Viewer and Editor* ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")


;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:insert:paramsEditor fpNodeBase fpNodeDictVar  popUpSelector) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:insert:paramsEditor (fpNodeBase fpNodeDictVar  popUpSelector)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  
  (fp:menuBox:insert:head (format "File Parameters Editor For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:insert:editor:paramName fpLeafBase fpNodeDictVar popUpSelector)
     (fp:menuBox:insert:paramValue fpLeafBase fpNodeDictVar)
     (fp:menuBox:insert:paramDescription fpLeafBase)
     (fp:menuBox:insert:paramInfo fpLeafBase)	   	   
     )
   (blee:fn:dir:*-relevant fpNodeBase)
   )
  (fp:menuBox:insert:tail)

  (fp:node:insert:currentValues fpNodeBase fpNodeDictVar)  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:insert:iimBash:paramsEditor fpNodeBase fpNodeDictVar  popUpSelector) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:insert:iimBash:paramsEditor (fpNodeBase fpNodeDictVar  popUpSelector)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  
  (fp:menuBox:insert:head (format "IIM Bash Editor For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:insert:editor:paramName fpLeafBase fpNodeDictVar popUpSelector)
     (fp:menuBox:insert:paramValue fpLeafBase fpNodeDictVar)
     (fp:menuBox:insert:paramDescription fpLeafBase)
     (fp:menuBox:insert:paramInfo fpLeafBase)	   	   
     )
   (blee:fn:dir:*-relevant fpNodeBase)
   )
  (fp:menuBox:insert:tail)
  )



(defun fp:node:menuBox:insert:iicmPy:paramsEditor (fpNodeBase fpNodeDictVar  popUpSelector)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  
  (fp:menuBox:insert:head (format "IICM Python Selector For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:insert:editor:paramName fpLeafBase fpNodeDictVar popUpSelector)
     (fp:menuBox:insert:paramValue fpLeafBase fpNodeDictVar)
     (fp:menuBox:insert:paramDescription fpLeafBase)
     (fp:menuBox:insert:paramInfo fpLeafBase)	   	   
     )
   (blee:fn:dir:*-relevant fpNodeBase)
   )
  (fp:menuBox:insert:tail)
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:paramsEditor:insertRows fpNodeBase orderedLeavesList fpNodeDictVar  popUpSelector) [[elisp:(org-cycle)][| ]]
  ")

;;;    fp:menuBox:rawsList:insert:editor [Better Name]
(defun fp:menuBox:paramsEditor:insertRows (fpNodeBase orderedLeavesList fpNodeDictVar  popUpSelector)
  "fp:menuBox:paramsEditor:insertRows"
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:leaf:initDictVarWithDefault fpLeafBase fpNodeDictVar)     
     (fp:menuBox:raw:insert:editor fpLeafBase fpNodeDictVar  popUpSelector)
     )
   (orderedLeavesAtNodeWithList fpNodeBase orderedLeavesList)
   ))


(defun fp:menuBox:raw:insert:editor (fpLeafBase fpNodeDictVar  popUpSelector)
  ""
  (fp:menuBox:insert:editor:paramName fpLeafBase fpNodeDictVar popUpSelector)
  (fp:menuBox:insert:paramValue fpLeafBase fpNodeDictVar)
  (fp:menuBox:insert:paramDescription fpLeafBase)
  (fp:menuBox:insert:paramInfo fpLeafBase)	   	   
  )


(defun fp:iifBox:rawsList:insert:selector (fpNodeBase orderedLeavesList fpNodeDictVar  popUpSelector)
  ""
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:leaf:initDictVarWithDefault fpLeafBase fpNodeDictVar)     
     (fp:iifBox:raw:insert:selector fpLeafBase fpNodeDictVar  popUpSelector)
     )
   ;;(orderedLeavesAtNodeWithList fpNodeBase orderedLeavesList)
   (blee:fn:dir:*-relevant fpNodeBase)
   ))


(defun fp:iifBox:raw:insert:selector (fpLeafBase fpNodeDictVar  popUpSelector)
  ""
  (fp:iifBox:insert:editor:iifName fpLeafBase fpNodeDictVar popUpSelector)  
  (fp:iifBox:insert:iifDescription fpLeafBase)
  ;;(fp:menuBox:insert:paramInfo fpLeafBase)
  (fp:iifBox:insert:iifInfo fpLeafBase)
  )


;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:insert:paramsViewer fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:insert:paramsViewer (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  (fp:menuBox:insert:head (format "File Parameters Viewer For: [[file:%s][%s]]" fpNodeBase fpNodeBase)
			  (+ 11 (length fpNodeBase)))
  ;;
  ;; Get Params List
  ;;
  (mapcar
   (lambda (fpLeafBase)
     (fp:menuBox:insert:viewer:paramName fpLeafBase)
     (fp:menuBox:insert:paramValue fpLeafBase)
     (fp:menuBox:insert:paramDescription fpLeafBase)
     (fp:menuBox:insert:paramInfo fpLeafBase)	   	   
     )
   (blee:fn:dir:*-relevant fpNodeBase)
   )
  (fp:menuBox:insert:tail)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Row/leaf Inserts*             ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")


(defun fp:menuBox:leaf:initDictVarWithDefault (fpLeafBase fpNodeDictVar)
  ""
  (put fpNodeDictVar
       (intern (fp:leaf:withBaseGetName fpLeafBase))
       (fp:leaf:withBaseGetDefaultAsString  fpLeafBase))
  )
      

;;; (fp:menuBox:insert:editor:paramName x dictVar popUpSelector)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:editor:paramName fpLeafBase fpNodeDictVar  popUpSelector) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:editor:paramName (fpLeafBase fpNodeDictVar popUpSelector)
  ""
  (let (
	(parName (file-name-nondirectory fpLeafBase))
	(paddingLength)
	(fieldLength 17)
	)
    (insert "\n")
    (if (< (length parName) fieldLength)
	(progn
	  (setq paddingLength (- fieldLength (length parName)))
	  (insert (format 
		   "**  | [[elisp:(%s \"%s\" '%s)][:%s]]"
		   (symbol-name popUpSelector)
		   fpLeafBase
		   (symbol-name fpNodeDictVar)
		   parName
		   ))
	  (insert (str:leftAdjustToLength paddingLength " " ""))
	  )
      (progn
	  (insert (format 
		   "**  | [[elisp:(%s \"%s\"  '%s)][:%s]]"
		   (symbol-name popUpSelector)
		   fpLeafBase		   
		   (symbol-name fpNodeDictVar)
		   (s-left fieldLength parName)
		   ))
	)
      )
    (insert "*| ")
    ))

;;; NOTYET
(setq selectedIifName "")

(defun blee:iifBox:iifName:select (iifName)
  ""
  (setq selectedIifName iifName)
  (iicm:py:cmnd:lineStrAndStore :iif iifName)
  (blee:org-update-named-dblocks-here "iicm:py:iifBox:common:selector")
  (goto-char (point-min))
  (blee:org-update-named-dblocks "iicm:py:panel:execControlShow")
  (goto-char (point-min))
  (search-forward "=Select IICM IIF (Method)="  nil t)
  (org-cycle)
  (org-cycle)  
  )
  

(defun fp:iifBox:insert:editor:iifName (fpLeafBase fpNodeDictVar popUpSelector)
  ""
  (let (
	(parName (file-name-nondirectory fpLeafBase))
	(paddingLength)
	(fieldLength 16)
	(selectionTag)
	)
    (insert "\n")
    (if (string= parName selectedIifName)
	(setq selectionTag "*X*")	
      (setq selectionTag "/O/")
      )
    (if (< (length parName) fieldLength)
	(progn
	  (setq paddingLength (- fieldLength (length parName)))
	  (insert (format
		   "**  | %s | [[elisp:(%s \"%s\")][%s]]"
		   selectionTag
		   "blee:iifBox:iifName:select"
		   parName
		   parName
		   ))
	  (insert (str:leftAdjustToLength paddingLength " " ""))
	  )
      (progn
	(insert (format
		 "**  | %s | [[elisp:(%s \"%s\")][%s]]"
		 selectionTag
		 "blee:iifBox:iifName:select"
		 parName
		 (s-left fieldLength parName)
		 ))
	)
      )
    (insert "| ")
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:insert:editor:varName varName varComment dictVar popUpSelector popUpSelectorArg) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:insert:editor:varName (varName varComment dictVar popUpSelector popUpSelectorArg)
  ""
  (let (
	(paddingLength)
	(fieldLength 17)
	)
    (insert "\n")
    (if (< (length varName) fieldLength)
	(progn
	  (setq paddingLength (- fieldLength (length varName)))
	  (insert (format 
		   "**  | [[elisp:(%s \"%s\" '%s)][:%s]]"
		   (symbol-name popUpSelector)
		   popUpSelectorArg
		   (symbol-name dictVar)
		   varName
		   ))
	  (if (not (eq varComment nil))
	      (progn
		(insert (format " (%s)" varComment))
		(setq  paddingLength (- paddingLength (+ 3 (length varComment))))
		))			
	  (insert (str:leftAdjustToLength paddingLength " " ""))
	  )
      (progn
	  (insert (format 
		   "**  | [[elisp:(%s \"%s\"  '%s)][:%s]]"
		   (symbol-name popUpSelector)
		   popUpSelectorArg
		   (symbol-name dictVar)
		   (s-left fieldLength varName)
		   ))
	)
      )
    (insert "*| ")
    ))




(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:viewer:paramName fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:viewer:paramName (fpLeafBase &optional fpNodeDictVar)
  ""
  (let (
	(parName (file-name-nondirectory fpLeafBase))
	(paddingLength)
	(fieldLength 17)
	)
    (insert "\n**  | ")
    (insert (str:leftAdjustToLength fieldLength " " parName))
    (insert " *| ")    
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:paramValue fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:paramValue (fpLeafBase fpNodeDictVar)
  "Insert the current value of param based on fpNodeDictVar"
  (let (
	;;(curValue (fp:leaf:withBaseGetValueAsString fpLeafBase))
	(parName (fp:leaf:withBaseGetName fpLeafBase))
	(curValue)
	(fieldLength 26)
	)
    (setq curValue (get fpNodeDictVar (intern parName)))
    
    (insert (str:leftAdjustToLength fieldLength " " curValue))
    (insert "|* ")
    ;; (when fpNodeDictVar
    ;;   (fp:leaf:withBaseSetInDictVar fpLeafBase fpNodeDictVar)
    ;;   )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:insert:varValue varName varValue &optional dictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:insert:varValue (varName varValue &optional dictVar)
  ""
  (let (
	(fieldLength 26)
	)
    (insert (str:leftAdjustToLength fieldLength " " varValue))
    (insert "|* ")
    (when dictVar
      ;;;(put dictVar      
      (blee:dict dictVar
		 (intern varName)
		 varValue)
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:paramDescription fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:paramDescription (fpLeafBase  &optional fpNodeDictVar)
  ""
  (let (
	(description (fv:read-as-string (concat fpLeafBase "/description")))
	(fieldLength 45)	
	)
    (insert (str:leftAdjustToLength fieldLength " " description))
    (insert "|")
    ))



(defun fp:iifBox:insert:iifDescription (fpLeafBase  &optional fpNodeDictVar)
  ""
  (let (
	(description (fv:read-as-string (concat fpLeafBase "/description")))
	(fieldLength 69)	
	)
    (insert (str:leftAdjustToLength fieldLength " " description))
    (insert "|")
    ))

(defun fp:iifBox:insert:iifInfo (fpLeafBase  &optional fpNodeDictVar)
  ""
  (let (
	(iifInfo (fv:read-as-string (concat fpLeafBase "/iifInfo")))
	(fieldLength 69)	
	)
    (insert
     "[[elisp:(org-show-subtree)][|=]] [[elisp:(org-cycle)][| ]]|\n"
     )
    
    (insert  iifInfo)
    (insert
     "\n**  +-----------------------------------------------------------------------------------------------------|"
     )
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:insert:varDescription description) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:insert:varDescription (description)
  ""
  (let (
	(fieldLength 45)	
	)
    (insert (str:leftAdjustToLength fieldLength " " description))
    (insert "|")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:paramInfo fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:paramInfo (fpLeafBase)
  ""
  (insert
   "[[info]]|"
   )
  (insert
   "\n**  +-----------------------------------------------------------------------------------------------------|"
   )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:insert:varInfo) [[elisp:(org-cycle)][| ]]
")

(defun blee:menuBox:insert:varInfo ()
  ""
  (insert
   "[[info]]|"
   )
  (insert
   "\n**  +-----------------------------------------------------------------------------------------------------|"
   )
  )

;;;
;;; IIF-BOX
;;;

(defun blee:iifBox:insert:iifNameUnused (varName varComment dictVar popUpSelector popUpSelectorArg)
  "dictVar popUpSelector popUpSelectorArg are not used."
  (let (
	(paddingLength)
	(fieldLength 16)
	(selectionTag)
	)
    (insert "\n")
    (if (string= varName selectedIifName)
	(setq selectionTag "*X*")
      (setq selectionTag "/-/")
      )
    
    (if (< (length varName) fieldLength)
	(progn
	  (setq paddingLength (- fieldLength (length varName)))
	  (insert (format 
		   "**  | %s | [[elisp:(%s \"%s\")][%s]]"
		   selectionTag
		   "blee:iifBox:iifName:select"
		   varName
		   varName
		   ))
	  (if (not (eq varComment nil))
	      (progn
		(insert (format " (%s)" varComment))
		(setq  paddingLength (- paddingLength (+ 3 (length varComment))))
		))			
	  (insert (str:leftAdjustToLength paddingLength " " ""))
	  )
      (progn
	  (insert (format 
		   "**  | %s | [[elisp:(%s \"%s\"  '%s)][%s]]"
		   selectionTag
		   "blee:iifBox:iifName:select"
		   varName
		   (s-left fieldLength varName)
		   ))
	)
      )
    (insert "| ")
    ))


(defun blee:iifBox:insert:iifDescriptionUnused (description)
  ""
  (let (
	(fieldLength 75)	
	)
    (insert (str:leftAdjustToLength fieldLength " " description))
    (insert "|")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:paramInfo fpLeafBase) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:iifBox:insert:iifFullDesc ()
  ""
  (insert
   "|[[elisp:(org-show-subtree)][|=]] [[elisp:(org-cycle)][| ]]|"
   )
  (insert "\n*** TemporaryNOTYET")
  (insert
   "\n**  +-----------------------------------------------------------------------------------------------------|"
   )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:insert:varInfo) [[elisp:(org-cycle)][| ]]
")

(defun blee:menuBox:insert:varInfo ()
  ""
  (insert
   "[[info]]|"
   )
  (insert
   "\n**  +-----------------------------------------------------------------------------------------------------|"
   )
  )



(defun fp:node:menuBox:insert:topControls (fpNodeBase  fpNodeDictVar popUpSelector)
   ""
  (goto-char (point-max))
    
;;   (insert "** 
;; \n**  [[elisp:(delete-other-windows)][(1)]] || [[elisp:(blee:menu-box:cmndLineResultsRefresh)][Refresh Command Line]] || [[elisp:(blee:menu-box:paramsPropListClear)][Clear Params Settings]] \
;; \n"
;; 	  )

;;   (insert (format "** fpNodeDictVar=%S -- " (symbol-name fpNodeDictVar)))

  (pp-eval-expression '(symbol-plist fpNodeDictVar))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Row/leaf Value Update*        ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:updateCurValue var) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:updateCurValue (var)
  ""
  (save-excursion
    (let (
	  (end-point)
	  (processedVar var)
	  )
      (when (string= var "")
	(setq processedVar "None"))
      (re-search-forward "|" nil t)
      (setq end-point (point))    
      (re-search-forward "|" nil t)
      (backward-char 2)
      (delete-region end-point (point))
      (insert (format " %-25s" processedVar))
      )
    (blee:msg "Running The dblock")
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    ;;(blee:menu-box:parallelBranches)
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:insert:paramValueUpdate var) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:insert:paramValueUpdate (var)
  ""
  (blee:menuBox:updateCurValue var)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:updateCurValueDeleteMe var) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:updateCurValueNot (var)
  ""
  (save-excursion
    (let (
	  (end-point)
	  (processedVar var)
	  )
      (when (string= var "")
	(setq processedVar "None"))
      (re-search-forward "|Z" nil t)
      (setq end-point (point))    
      (re-search-forward "|Z" nil t)
      (backward-char 2)
      (delete-region end-point (point))
      (insert (format " %-25s" processedVar))
      )
    (bufLoc:iimBash:results)
    (blee:org-update-named-dblocks "bx:dblock:org:iimBash:execControlShow")
    ;;(blee:menu-box:parallelBranches)
     ))
  

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Head/Tail Inserts*            ::   /==============/  [[elisp:(org-cycle)][| ]]
  ")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:head menuBoxTitle &optional lengthAdjustment) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:menuBox:insert:head (menuBoxTitle &optional lengthAdjustment)
  ""
  (let (
	(fieldLength 101)
	)
    (if (not (eq lengthAdjustment nil))
	(setq fieldLength (+ fieldLength lengthAdjustment)))
    
    (insert "\
\n**  ======================================================================================================|\n"
	  )
    (insert
     (format "**  |%s|" (s-center fieldLength (format "*%s*" menuBoxTitle))))

    (insert "\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  |  /Par Name/        |    /Parameter Value/      |          /Parameter Description/              |info|\
\n**  +-----------------------------------------------------------------------------------------------------|"
	    )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:menuBox:insert:tail) [[elisp:(org-cycle)][| ]]
")

(defun fp:menuBox:insert:tail ()
  ""
  (insert "\
\n**  ======================================================================================================|\
\n** "
	  )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:iifBox:insert:head menuBoxTitle &optional lengthAdjustment) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:iifBox:insert:head (menuBoxTitle &optional lengthAdjustment)
  ""
  (let (
	(fieldLength 101)
	)
    (if (not (eq lengthAdjustment nil))
	(setq fieldLength (+ fieldLength lengthAdjustment)))
    
    (insert "\
\n**  ======================================================================================================|\n"
	  )
    (insert
     (format "**  |%s|" (s-center fieldLength (format "*%s*" menuBoxTitle))))

    (insert "\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | X-O |  /IIF Name/      |           /Interactively Invokavle Function Description/             | info|\
\n**  +-----------------------------------------------------------------------------------------------------|"
	    )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:iifBox:insert:tail) [[elisp:(org-cycle)][| ]]
")

(defun fp:iifBox:insert:tail ()
  ""
  (insert "\
\n**  ======================================================================================================|\
\n** "
	  )
  )




(defun blee:dict:clear-plist ( dictVar )
  ""
  (while (symbol-plist dictVar)
    (pop (symbol-plist dictVar)))
  )


(defun fp:node:insert:currentValues (fpNodeBase fpNodeDictVar)
  ""
  (insert "\
\n** \
\n**  ======================================================================================================|\
\n** \
\n"
	  )

  ;; (insert (format "** fpNodeDictVar=%S -- " (symbol-name fpNodeDictVar)))

  ;; (pp-eval-expression '(symbol-plist fpNodeDictVar))

  ;; (insert (format "** plist-fpNodeDictVar=%S -- " (symbol-plist fpNodeDictVar)))

  (insert (format  "**  FileParam MenuBox DictVar=%s\n" 	   fpNodeDictVar))

  (bx:valueReporter:symbolValue fpNodeDictVar (current-buffer))

  (insert "** \n** \n")

 
  (insert (format
	   "**  [[elisp:(blee:dict:clear-plist '%s)][(blee:dict:clear-plist '%s)]] || "
	   fpNodeDictVar
	   fpNodeDictVar
	   ))
  
  (insert (format
	   "[[elisp:(symbol-plist '%s)][(symbol-plist '%s)]] || \n"
	   fpNodeDictVar
	   fpNodeDictVar
	   ))
  
  (insert (format
	   "**  [[elisp:(symbol-plist '%s)][NOTYET Write %s To %s]] || \n"
	   fpNodeDictVar
	   fpNodeDictVar
	   fpNodeBase
	   ))
	   
  
  
    (insert "** \
\n**  ======================================================================================================|\
\n** "
	  )

  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *menuBox Popup Menu Facilities*        ::   /=============/  [[elisp:(org-cycle)][| ]]
  ")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:popupMenu:define paramEnumsDir fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:popupMenu:define (fpLeafBase fpNodeDictVar &optional dontUpdate)
  ""
  (interactive)
  (let (
	(paramName (fp:leaf:withBaseGetName fpLeafBase))
	(enumsBase (fp:leaf:withBaseGetEnums fpLeafBase))
	)
    (easy-menu-define fp:node:menuBox:popupMenu:name
      nil
      "FileParam PopupMenu For Selections And Settings of the specified fileParam." 
      (append
       (list (format "Selections Menu For: param=%s" paramName))
       (mapcar (lambda (enumItem)
		 (vector (file-name-nondirectory enumItem)
			 `(lambda ()
			    (interactive)
			    (fp:node:menuBox:paramSetAndUpdate
			     (format "%s" ,fpLeafBase)
			     (file-name-nondirectory ,enumItem)
			     (format "%s" fpNodeDictVar)
			     ,dontUpdate
			     )
			    ;;(blee:menuBox:parallelBranches)
			    t)
			 ))
	       (blee:fn:dir:*-relevant enumsBase)   	     
	       )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:popupMenu:trigger paramEnumsDir fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:popupMenu:trigger (fpLeafBase fpNodeDictVar)
  ""
  (fp:node:menuBox:popupMenu:define fpLeafBase fpNodeDictVar)
  (popup-menu fp:node:menuBox:popupMenu:name)
  (blee:menu-box:parallelBranches)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:paramSetAndUpdate paramName paramValue fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:paramSetAndUpdate (fpLeafBase paramValue fpNodeDictVar &optional dontUpdate)
  ""
  (let (
	(processedParamValue paramValue)
	(paramName (fp:leaf:withBaseGetName fpLeafBase))
	)
    (when (string= paramValue "UserInput")
      (setq processedParamValue (read-string "User Input: "))
      )
    (if (not dontUpdate)
	(fp:node:menuBox:insert:paramValueUpdate processedParamValue)
      )
    (put (intern fpNodeDictVar) (intern paramName) processedParamValue)
    ))

(defun fp:node:menuBox:paramSetAndUpdateWorks (fpLeafBase paramValue fpNodeDictVar)
  ""
  (let (
	(processedParamValue paramValue)
	(paramName (fp:leaf:withBaseGetName fpLeafBase))
	)
    (when (string= paramValue "UserInput")
      (setq processedParamValue (read-string "User Input: "))
      )
    (blee:eval-string
     (format "(put '%s '%s \"%s\")"
	     fpNodeDictVar
	     paramName
	     processedParamValue))
    ;; ParamValue Needs to be set in dictVar
    )
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "fileParam-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'fileParam-lib)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
