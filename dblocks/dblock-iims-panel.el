;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "dblock-org-iims" "dblock-iims-panel")  (replace-string "moduleTag:" "fp:")

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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "dblock-iims-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message dblock-iims-panel [[elisp:(org-cycle)][| ]]
")

(message "dblock-iims-panel")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")


(defun org-dblock-write:iim:panel:iimsListPanels (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        (let:iimsList (or (plist-get params :iimsList) "UnSpecified"))                  
        )
    ;;;(iim:bash:panel:insert:module-title let:iim)
    (iim:panel:iimsListPanels let:iimsList)    
    ))



(defun org-dblock-write:iicm:py:panel:set:iicmName (params)  
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        (iicmName (or (plist-get params :iicm) "UnSpecified"))                  
        )
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (iicm:py:panel:set:iicmName iicmName)
      )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:module-title params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:panel:module-title (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        (let:iim (or (plist-get params :iim) "UnSpecified"))                    
        )
    (iim:bash:panel:insert:module-title let:iim)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:panel:module-title params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:panel:module-title (params)  
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        (iicm (or (plist-get params :iicm) "UnSpecified"))                      
        )
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (iicm:py:panel:insert:module-title iicm)
      )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:iimPkgInfo params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:panel:iimPkgInfo (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        (loc:iim (or (plist-get params :iim) ""))               
        )
    (iim:bash:panel:insert:iimPkgInfo loc:iim)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:panel:iimPkgInfo params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:panel:iimPkgInfo (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        (loc:iim (or (plist-get params :iim) ""))       
        )
    (iicm:py:panel:insert:iimPkgInfo loc:iim)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:frameworkFeatures params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:panel:frameworkFeatures (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        )
    (iim:bash:panel:insert:frameworkFeatures)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:panel:frameworkFeatures params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:panel:frameworkFeatures (params)  
  (let (
        (mode (or (plist-get params :mode) ""))
        )
    (iicm:py:panel:insert:frameworkFeatures)
    ))

(defun org-dblock-write:iicm:py:panel:devWorkbench (params)  
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        )
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (iicm:py:panel:devWorkbench)
      )
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:execControlShow params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:panel:execControlShow  (params)
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        (orgLevel (or (plist-get params :orgLevel) "UnSpecified"))      
        )

    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (iim:bash:panel:insert:execControlShow orgLevel)
      )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:panel:execControlShow params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:panel:execControlShow  (params)
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        (orgLevel (or (plist-get params :orgLevel) "UnSpecified"))      
        )

    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (iicm:py:panel:insert:execControlShow orgLevel)
      )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:menuBox:commonControls:selectValues params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:menuBox:commonControls:selectValues  (params)
  (let (
        (loc:mode (or (plist-get params :mode) "UnSpecified"))
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (fpNodeBase (or (plist-get params :baseDir) "UnSpecified"))     
        )
    (message (format "mode = %s" loc:mode))
    (if
        (or (equal "DISABLED" loc:mode)
            (equal "disabled" loc:mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (progn
        (iim:bash:menuBox:commonControls:insert:paramsEditor  fpNodeBase)
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:menuBox:commonControls:selectValues params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:menuBox:commonControls:selectValues  (params)
  (let (
        (loc:mode (or (plist-get params :mode) "UnSpecified"))
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (fpNodeBase (or (plist-get params :baseDir) "UnSpecified"))     
        )
    (message (format "mode = %s" loc:mode))
    (if
        (or (equal "DISABLED" loc:mode)
            (equal "disabled" loc:mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (progn
        (iicm:py:menuBox:commonControls:insert:paramsEditor  fpNodeBase)
        )
      )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:iifBox:common:selector params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:iifBox:common:selector (params)
  (let (
        (loc:mode (or (plist-get params :mode) "UnSpecified"))
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (fpNodeBase (or (plist-get params :baseDir) "UnSpecified"))     
        )
    (message (format "mode = %s" loc:mode))
    (if
        (or (equal "DISABLED" loc:mode)
            (equal "disabled" loc:mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (progn
        (iicm:py:iifBox:common:selector fpNodeBase)
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:menuBox:selectBxSrf params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:menuBox:selectBxSrf (params)
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
      (if (eq (call-process let:iim  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (menuBox:insert:selectBxSrf)
            )
        (message "skipped")
        )
      )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:menuBox:selectBxSrf params) [[elisp:(org-cycle)][| ]]
  ")
(defun org-dblock-write:iicm:py:menuBox:selectBxSrf (params)
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))                
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (iicmName (iicm:py:cmnd:get:bufLocVar :iicmName t))     
        )
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (if (eq (call-process iicmName  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (menuBox:insert:selectBxSrf)
            )
        (blee:msg "skipped")
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:menuBox:selectTargets params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:menuBox:selectTargets (params)
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
      (if (eq (call-process let:iim  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (iim:bash:menuBox:insert:selectTargets)         
            )
        (message "skipped")
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:menuBox:selectTargets params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:menuBox:selectTargets (params)
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
      (if (eq (call-process let:iim  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (iicm:py:menuBox:insert:selectTargets)          
            )
        (message "skipped")
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:menuBox:selectParams params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:menuBox:params:selectValues (params)
  (let (
        (bx:mode (or (plist-get params :mode) "UnSpecified"))
        (let:iim (or (plist-get params :iim) "UnSpecified"))                    
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (menuBoxTitle (or (plist-get params :title) "UnSpecified"))
        (paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))  
        )
    (message (format "mode = %s" bx:mode))
    (if
        (or (equal "DISABLED" bx:mode)
            (equal "disabled" bx:mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (if (eq (call-process let:iim  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (iim:bash:menuBox:params:insert:selectValues paramsBaseDir)     
            )
        (message "skipped")
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:menuBox:selectParams params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:menuBox:params:selectValues (params)
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))        
        (loc:scope (or (plist-get params :scope) "UnSpecified"))
        (menuBoxTitle (or (plist-get params :title) "UnSpecified"))
        (paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))
        ;;(iicmName (iicm:py:cmnd:get:bufLocVar :iicmName t))
        (iicmName (or (plist-get params :iicmName) "UnSpecified"))      
        )
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      (if (eq (call-process iicmName  nil t nil "-i" "iimCmndPartIncludes" loc:scope) 0)
          (progn
            (iicm:py:menuBox:params:insert:selectValues paramsBaseDir)      
            )
        (message "skipped")
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iim:bash:menuBox:iimExamples params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iim:bash:menuBox:iimExamples (params)
  (let (
        (mode (or (plist-get params :mode) "UnSpecified"))
        (paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))
        (loc:iim (or (plist-get params :iim) "UnSpecified"))    
        )
    (message (format "mode = %s" mode))
    (if
        (or (equal "DISABLED" mode)
            (equal "disabled" mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (progn
        (iim:bash:menuBox:examples:insert:iimExamples loc:iim)
        )
      )
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:iicm:py:menuBox:iimExamples params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:iicm:py:menuBox:iimExamples (params)
  (let (
        (mode (or (plist-get params :mode) "UnSpecified"))
        (paramsBaseDir (or (plist-get params :baseDir) "UnSpecified"))
        (loc:iim (or (plist-get params :iim) "UnSpecified"))            
        )
    (message (format "mode = %s" mode))
    (if
        (or (equal "DISABLED" mode)
            (equal "disabled" mode))
        (progn
          (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
          )
      (progn
        (iicm:py:menuBox:examples:insert:iimExamples loc:iim)
        )
      )
    )
  )


;;;
;;; ####+BEGIN: bx:dblock:org:fp:iimBash:menuBox:selectParams :mode "default" :title "IIM=moduleName Shorter" :baseDir "./iimsIn/params"
;;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:fp:iimBash:menuBox:selectParams params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:fp:iimBash:menuBox:selectParams-Delete (params)
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


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iims-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-iims-panel)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:

