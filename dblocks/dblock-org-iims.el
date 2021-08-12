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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "dblock-org-iims"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message dblock-org-iims [[elisp:(org-cycle)][| ]]
")

(message "dblock-org-iims")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lisp:provide params) [[elisp:(org-cycle)][| ]]
  ")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:iims-control params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:iims-control (params)
  (let ((bx:mode (or (plist-get params :mode) "UnSpecified"))
	(file-length)	
	)
    (message (format "mode = %s" bx:mode))
    (if (not
	 (or (equal "DISABLED" bx:mode)
	     (equal "disabled" bx:mode)))
	(progn
	  ;;; Processing Body
	  ;;(message (format "EXECUTING -- mode = %s" bx:mode))
	  
	  (setq file-length (car (cdr (insert-file-contents "/libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/cmndLine/allBxHead.org"))))
	  (forward-char file-length)

	  (setq inhibit-read-only t)
	    
	  (widget-insert "Bash IIM, Arument/Option Values\n")    
	    
	  (widget-create 'menu-choice
                  :tag "*** _iimWrapper_  || Description Of Parameter      || Current Value:"
                  :button-face 'custom-button
                  :notify (lambda (wid &rest ignore)
                            (message "Current value: %S" (widget-value wid))
			    (setq bx:iimBash:iimWrapper (widget-value wid))
			    )
                  :value "None"
                  '(choice-item :tag "None" "")		  
                  '(choice-item :tag "echo" "echo")
                  '(choice-item :tag "time" "time")		  
                  '(editable-field :menu-tag "editable field" "Any")
		  )

	  (use-local-map widget-keymap)
	  ;;(widget-setup)	    

	  (insert-file-contents "/libre/ByStar/InitialTemplates/activeDocs/common/iimPanels/cmndLine/allBxTail.org")
	  )
      ;;; Else of not-disabled
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:iimBash:module-title params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:iimBash:module-title-Ok2Rm (params)  
  (let (
	(bx:types (or (plist-get params :mode) ""))
	(let:iim (or (plist-get params :iim) "UnSpecified"))
	;;(selectedIim (fv:read-as-string "./_selectedIim"))
	)
    (insert (format "*\
                  =IIM Bash ZZ Panel For *%s* in %s= ::"
		    let:iim	    
		    (file-name-directory buffer-file-name)
		    ))))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:iimPkgInfo  params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:panel:iimPkgInfo (params)  
  (let (
	(bx:types (or (plist-get params :mode) ""))
	(let:iim (or (plist-get params :iim) "UnSpecified"))	
	;;(selectedIim (fv:read-as-string "./_selectedIim"))
	)
    (insert (format "**\
 [[elisp:(lsip-local-run-command-here \"%s\")][%s]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i visit\")][%s -i visit]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i describe\")][%s -i describe]] ||\
 "
		    let:iim
		    let:iim
		    let:iim
		    let:iim		    
		    let:iim
		    let:iim		    
		    ))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:iimBash:menuBox:selectBxSrf params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:iimBash:menuBox:selectBxSrfObsoleted (params)
  (let (
	(loc:mode (or (plist-get params :mode) "UnSpecified"))
	(let:iim (or (plist-get params :iim) "UnSpecified"))	
	(loc:scope (or (plist-get params :scope) "UnSpecified"))
	)
    (message (format "mode = %s" loc:mode))
    (if
	(or (equal "DISABLED" loc:mode)
	    (equal "disabled" loc:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
	  )
      (if (eq (call-process let:iim  nil t nil "-i iimCmndPartIncludes") 0)
	  (message "skipped")
	(progn
	  (insert "ZZ")
	  (menuBox:insert:selectBxSrf)
	  )
	)
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (menuBox:insert:selectBxSrf) [[elisp:(org-cycle)][| ]]
")

(defun menuBox:insert:selectBxSrf ()
  (insert "* \n*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select BxSRF Params For BASH IIMs= | ]]               /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/\n"
	  )

  (insert "**\
  [[elisp:(delete-other-windows)][(1)]] || [[elisp:(blee:menu-box:paramsPropListClear)][Clear Params Settings]]\
\n** "
	  )

  (insert "\
\n**  ======================================================================================================|\
\n**  |                              *ByStar Objects BASH IIM*                                              |\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  |  /Par Name/        |  /Par Cur Value/   |             /Parameter Description/                  |info|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menu-box:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxo\")][:BxO]]              *| someBxo            |* ByStar Object Parameter                             |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menu-box:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxso\")][:BxSO]]             *| someValue          |* ByStar Service Object Parameter                     |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menu-box:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxio\")][:BxIO]]             *| None               |* ByStar Information Object Parameter                 |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menu-box:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/srBase\")][:srBase]]           *| None               |* Service Realization Dir Base                        |[[info]]|\
\n**  ======================================================================================================|\
\n**  [[elisp:(org-cycle)][| ]]  [[elisp:(delete-other-windows)][(1)]]"
	  )
  
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:iimBash:menuBox:selectTargets params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:iimBash:menuBox:selectTargets (params)
  (let (
	(loc:mode (or (plist-get params :mode) "UnSpecified"))
	(loc:scope (or (plist-get params :scope) "UnSpecified"))
	)
    (message (format "mode = %s" loc:mode))
    (if
	(or (equal "DISABLED" loc:mode)
	    (equal "disabled" loc:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
	  )
      (progn
	(menuBox:insert:selectTargets)
	)
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (menuBox:insert:selectTargets) [[elisp:(org-cycle)][| ]]
")

(defun menuBox:insert:selectTargets ()
  (insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select Targets= | ]]                                  /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
	  )
  (insert "\n** ")  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:iimBash:menuBox:selectParams params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:iimBash:menuBox:selectParams (params)
  (let (
	(bx:mode (or (plist-get params :mode) "UnSpecified"))
	(bx:menuBoxTitle (or (plist-get params :title) "UnSpecified"))
	(bx:paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))	
	)
    (message (format "mode = %s" bx:mode))
    (if
	(or (equal "DISABLED" bx:mode)
	    (equal "disabled" bx:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
	  )
      (progn
	(insert "*\
 [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select This IIM's Parameters= | ]]                    /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
		)
	(iim:menuBox:headInsert bx:menuBoxTitle)
	;;
	;; Get Params List
	;;
	(mapcar
	 (lambda (x)
	   (iim:bash:menuBox:paramNameInsert x)
	   (iim:bash:menuBox:paramValueInsert x)
	   (iim:bash:menuBox:paramDescriptionInsert x)
	   (iim:bash:menuBox:paramInfoInsert x)	   	   
	   )
	 (blee:fn:dir:*-relevant bx:paramsBaseDir)
	 )
	(iim:menuBox:tailInsert)
	)
      )
    )
  )

(defun org-dblock-write:bx:dblock:org:iimBash:menuBox:iimExamples (params)
  (let (
	(bx:mode (or (plist-get params :mode) "UnSpecified"))
	(bx:menuBoxTitle (or (plist-get params :title) "UnSpecified"))
	(bx:paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))
	(selectedIim (fv:read-as-string "./_selectedIim"))	
	)
    (message (format "mode = %s" bx:mode))
    (if
	(or (equal "DISABLED" bx:mode)
	    (equal "disabled" bx:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
	  )
      (progn
	(insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Customized Runs (IIM Examples)= | ]]                    /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/\n** \n"
		)
	(insert
	 (shell-command-to-string
	  (format "%s -p iimPlayer=blee -i examples 2> /dev/null | iimToEml.sh -i iimToEmlStdout 2"  selectedIim)))	  
	  ;;(format "%s -p iimPlayer=blee -i examples 2> /dev/null | iimToEml.sh -i iimToEmlStdout 2"  selectedIim)))
	
	)
      )
    )
  )

;;;
;;; ####+BEGIN: bx:dblock:org:iimBash:menuBox:selectIimCommonControls  :mode "default" :baseDir "./iimsIn/commonControlFp"
;;;
(defun org-dblock-write:bx:dblock:org:iimBash:menuBox:selectIimCommonControls (params)
  (let (
	(loc:mode (or (plist-get params :mode) "UnSpecified"))
	(loc:fpNodeBase (or (plist-get params :baseDir) "UnSpecified"))	
	)
    (message (format "mode = %s" loc:mode))
    (if
	(or (equal "DISABLED" loc:mode)
	    (equal "disabled" loc:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" loc:disabledP))
	  )
      (progn
	(insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select BASH IIM FrameWork Execution Controls= | ]]                /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
		)
	;;(setq iimsInParams loc:fpNodeBase)

	;;blee:menu-box:paramFromDirUpdate:popupMenu

	;; bx:iimBash:paramsPropList
	
	;;(fp:node:menuBox:insert:iimBash:paramsEditor loc:fpNodeBase 'bx:iimBash:paramsPropList 'fp:node:menuBox:popupMenu:iimBash:trigger)
	
	;;;(fp:node:menuBox:insert:iimBash:paramsEditor loc:fpNodeBase 'iimsInParams 'blee:menu-box:paramFromDirUpdate:popupMenu)
	)
      )
    )
  )



;;;
;;; ####+BEGIN: bx:dblock:org:fp:iimBash:menuBox:selectParams :mode "default" :title "IIM=moduleName Shorter" :baseDir "./iimsIn/params"
;;;
(defun org-dblock-write:bx:dblock:org:fp:iimBash:menuBox:selectParams (params)
  (let (
	(loc:mode (or (plist-get params :mode) "UnSpecified"))
	(loc:menuBoxTitle (or (plist-get params :title) "UnSpecified"))
	(loc:fpNodeBase (or (plist-get params :baseDir) "UnSpecified"))	
	)
    (message (format "mode = %s" loc:mode))
    (if
	(or (equal "DISABLED" loc:mode)
	    (equal "disabled" loc:mode))
	(progn
	  (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" loc:disabledP))
	  )
      (progn
	(insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select This IIM's FP Parameters= | ]]                 /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
		)
	;;(setq iimsInParams loc:fpNodeBase)

	;;blee:menu-box:paramFromDirUpdate:popupMenu

	;; bx:iimBash:paramsPropList
	
	(fp:node:menuBox:insert:iimBash:paramsEditor loc:fpNodeBase 'bx:iimBash:paramsPropList 'fp:node:menuBox:popupMenu:iimBash:trigger)
	
	;;;(fp:node:menuBox:insert:iimBash:paramsEditor loc:fpNodeBase 'iimsInParams 'blee:menu-box:paramFromDirUpdate:popupMenu)
	)
      )
    )
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:paramNameInsert paramBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:paramNameInsert (paramBaseDir)
  ""
  (let (
	(paddingLength)
	)
    (insert "\n")
    (insert (format 
	     "**  | [[elisp:(blee:menu-box:paramFromDirUpdate:popupMenu  \"%s\")][:%s]]"
	     paramBaseDir
	     (file-name-nondirectory x)
	     ))
    (setq paddingLength (- 16 (length (file-name-nondirectory x))))
    (insert (format
	     "%s *|"
	     (make-string paddingLength
			  ? )
	     ))
    ))
     
;; iim:bash:menuBox:paramValueInsert "/libre/ByStar/InitialTemplates/activeDocs/blee/syncUpdate/virBox//iims/lcaVirshManage.sh/params/kvmHost/
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:paramValueInsert paramBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:paramValueInsert (paramBaseDir)
  ""
  (let (
	(curValue (fv:read-as-string (concat paramBaseDir "/fvtn/curValue")))
	(paddingLength)	
	)
    (insert (format 
	     " %s"
	     curValue
	     ))
    (setq paddingLength (- 25 (length curValue)))
    (insert (format
	     "%s |*"
	     (make-string paddingLength
			  ? )
	     ))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:paramDescriptionInsert paramBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:paramDescriptionInsert (paramBaseDir)
  ""
  (let (
	(description (fv:read-as-string (concat paramBaseDir "/fvtn/description")))
	(paddingLength)	
	)
    (insert (format 
	     " %s"
	     description
	     ))
    (if (< (length description) 44)
	(setq paddingLength (- 44 (length description)))
      (setq paddingLength 0)
      )
    (insert (format
	     "%s |"
	     (make-string paddingLength
			  ? )
	     ))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:paramInfoInsert paramBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:paramInfoInsert (paramBaseDir)
  ""
  (insert
   "[[info]]|"
   )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:menuBox:headInsert bx:menuBoxTitle) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:menuBox:headInsert (bx:menuBoxTitle)
  ""
  (insert "** \
\n**  [[elisp:(delete-other-windows)][(1)]] || [[elisp:(blee:menu-box:cmndLineResultsRefresh)][Refresh Command Line]] || [[elisp:(blee:menu-box:paramsPropListClear)][Clear Params Settings]] \
\n**  ======================================================================================================|\n"
	  )
  (insert
   (format "**  |%s|" (s-center 101 (format "*%s*" bx:menuBoxTitle) )))

  (insert "\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  |  /Par Name/        |     /Par Cur Value/       |          /Parameter Description/              |info|\
\n**  +-----------------------------------------------------------------------------------------------------|"
	  )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:menuBox:tailInsert) [[elisp:(org-cycle)][| ]]
")

(defun iim:menuBox:tailInsert ()
  ""
  (insert "\
\n**  ======================================================================================================|\
\n** "
	  )
  )

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-iims"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-iims)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:

