;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "dblock-org-iims" "blee-iims-panel")  (replace-string "moduleTag:" "fp:")

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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-iims-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message blee-iims-panel [[elisp:(org-cycle)][| ]]
")

(message "blee-iims-panel")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *IIM MenuBox Panel Sections*          ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")

(defun iim:panel:iimsListPanels (iimsListFile)
  (let (
	(iimsListStr (fv:read-as-string iimsListFile))
	(count 1)  ;; first line, will have one less
	)
    (insert
     (format "*\
 ICM Collections :: [[BISOS]] || [[UNISOS]] || [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/blee/deviceAndUser/fullUsagePanel-en.org\")][BxPlatform]] || [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/blee/bystarContinuum/fullUsagePanel-en.org\")][BxSSC Groups]]
"))
    (insert
     (format "*\
 Pkg Panels :: [[elisp:(find-file \"Panel.org\")][Panel.org]]  ||"))
    
    (loop
     for each in (split-string iimsListStr)
     do
     (if each
	 (progn
	   ;;(message (format "%s" count))
	   (if (equal count 5)
	       (progn
		 (insert
		  (format "\n* Pkg Panels ::"))
		 (setq count 0)
		 )
	     )
	   (let(
		(iimNameSansExt (file-name-sans-extension each))
		)
	     (setq count (+ 1 count))
	     (insert
	      (format " [[elisp:(find-file \"%s-Panel.org\")][%s]] ||"
		      iimNameSansExt
		      iimNameSansExt
		      )))
	   )))))
 


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:panel:insert:module-title) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:panel:insert:module-title (selectedIim)  
  (insert (format "*\
     *Bash IIM Execution Panel* :: For [[elisp:(lsip-local-run-command-here \"%s -i visit\")][%s]] in =file:%s="
		  selectedIim
		  selectedIim		    		    
		  (file-name-directory buffer-file-name)
		  )))


(defun iicm:py:panel:set:iicmName (iicmName)
  "Record the iicm for all future uses."
  (iicm:py:cmnd:lineSpecsStore :iicmName iicmName)
  (insert (format "iicmName=%s" iicmName))
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:panel:insert:module-title) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:panel:insert:module-title (selectedIicm)
  ""
  (let (
	(iicmName (iicm:py:cmnd:get:bufLocVar :iicmName t))
	)
    (insert (format "*\
  *Py Module* :: Execute [[elisp:(lsip-local-run-command-here \"%s\")][%s]] or Visit [[elisp:(lsip-local-run-command-here \"%s -i visit\")][ *=%s=* ]] in =file:%s="
		    iicmName
		    iicmName		    		    
		    iicmName
		    iicmName		    		    
		    (file-name-directory buffer-file-name)
		    ))
    (insert (format "\	  
*  =Summary=   ::  A basic example and starting point for IICM (Interactively Invokable Command Modules.).\
"))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:panel:insert:iimPkgInfo) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:panel:insert:iimPkgInfo (iim)  
  (let (
	;;(selectedIim (fv:read-as-string "./_selectedIim"))
	(selectedIim iim)	
	)
    (insert (concat (blee:org:level:blank 2) "\n"))
    
    (insert (format "**\
 [[elisp:(lsip-local-run-command-here \"%s\")][%s]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i visit\")][%s -i visit]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i describe\")][%s -i describe]] ||\
 \n"
		    selectedIim
		    selectedIim
		    selectedIim
		    selectedIim		    
		    selectedIim
		    selectedIim		    
		    ))
    
    (insert (concat (blee:org:level:blank 2) "\n"))

    (insert (concat (blee:org:level:blank 2)
		    "IIM Brief Description :: "))

    (insert
     (shell-command-to-string 
      (format "%s %s"
	      selectedIim
	      "-p iimPlayer=blee -i iimBriefDescription"
	      )))

    (insert (concat (blee:org:level:blank 2) "\n"))    
    (insert (concat (blee:org:level:blank 2)
		    "[[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-cycle)][| *IIM Description* | ]]  ::\n"))

    (insert
     (shell-command-to-string 
      (format "%s %s"
	      selectedIim
	      "-p iimPlayer=blee -i iimDescription | emlOutFilter.sh -i stdinAtOrgLevelStdout 2"
	      )))
    
    (insert (concat (blee:org:level:blank 2) "\n"))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:panel:insert:iimPkgInfo) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:panel:insert:iimPkgInfo (iim)
  "NOTYET, iim is not needed anymore."
  (let (
	(selectedIim (iicm:py:cmnd:get:bufLocVar :iicmName t))
	)
    (insert (concat (blee:org:level:blank 2) "\n"))
    
    (insert (format "**\
 [[elisp:(lsip-local-run-command-here \"%s\")][%s]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i visit\")][%s -i visit]] ||\
 [[elisp:(lsip-local-run-command-here \"%s -i describe\")][%s -i describe]] ||\
 \n"
		    selectedIim
		    selectedIim
		    selectedIim
		    selectedIim		    
		    selectedIim
		    selectedIim		    
		    ))
    
    (insert (concat (blee:org:level:blank 2) "\n"))

    (insert (concat (blee:org:level:blank 2)
		    "IICM Brief Description :: \n"))


    (insert (concat (blee:org:level:blank 2) "\n"))    
    (insert (concat (blee:org:level:blank 2)
		    "[[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-cycle)][| *IICM Description* | ]]  ::\n"))

    (insert
     (shell-command-to-string 
      (format "%s %s"
	      selectedIim
	      "-i describe | emlOutFilter.sh -i stdinAtOrgLevelStdout 2"
	      )))
    
    (insert (concat (blee:org:level:blank 2) "\n"))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:panel:insert:frameworkFeatures) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:panel:insert:frameworkFeatures ()  
  (let (
	(selectedIim (fv:read-as-string "./_selectedIim"))
	)
    
    (insert
     "*  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-shifttab)][(O)]]   /=====/   [[elisp:(org-cycle)][| *IIMs Framework Preparations* | ]]        /======/  [[elisp:(progn (org-shifttab) (org-content))][Content]]  /========/
")
    (insert
     "**     IIMs Pkg Info      ::  [[elisp:(lsip-local-run-command-here \"iimsProc.sh\")][iimsProc.sh]] || [[file:iimsProc.sh][Visit iimsProc.sh]] || [[elisp:(lsip-local-run-command-here \"iimsProc.sh -v -n showRun -i fullClean\")][iimsProc.sh -i fullClean]]
")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:panel:insert:frameworkFeatures) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:panel:insert:frameworkFeatures ()  
  (let (
	(selectedIim (iicm:py:cmnd:get:bufLocVar :iicmName t))	
	)
    
;;     (insert
;;      "*  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-shifttab)][(O)]]   /=====/   [[elisp:(org-cycle)][| *IIMs Framework Preparations* | ]]        /======/  [[elisp:(progn (org-shifttab) (org-content))][Content]]  /========/
;; ")

    (insert
     "**     IIMs Pkg Info      ::  [[elisp:(lsip-local-run-command-here \"iimsProc.sh\")][iimsProc.sh]] || [[file:iimsProc.sh][Visit iimsProc.sh]] || [[elisp:(lsip-local-run-command-here \"iimsProc.sh -v -n showRun -i fullClean\")][iimsProc.sh -i fullClean]]\
")
    ))

(defun iicm:py:panel:devWorkbench ()  
  (let (
	(selectedIim (iicm:py:cmnd:get:bufLocVar :iicmName t))	
	)
    
;;     (insert
;;      "*  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(org-shifttab)][(O)]]   /=====/   [[elisp:(org-cycle)][| *IIMs Framework Preparations* | ]]        /======/  [[elisp:(progn (org-shifttab) (org-content))][Content]]  /========/
;; ")

     (insert
     "** iimWrapper:         [[elisp:(setq bx:iimp:iimWrapper \"\")][\"\"]] | [[elisp:(bx:valueReader:symbol 'bx:iimp:iimWrapper)][Any]] | [[elisp:(setq bx:iimp:iimWrapper \"echo\")][echo]] | [[elisp:(setq bx:iimp:iimWrapper \"time\")][time]] | [[elisp:(setq bx:iimp:iimWrapper \"python -m cProfile -o profile.$$$(date +%s%N)\")][profile]] | [[elisp:(setq bx:iimp:iimWrapper \"pycallgraph  --max-depth 5 graphviz -- \")][pycallgraph]]
**  [[elisp:(org-cycle)][| ]]  Dev WorkBench ::  Lint, Check And Class Browse The IIM Module  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Class Browsers     ::   [[elisp:(python-check (format \"pyclbr %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName)))][pyclbr]]  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Static Checkers    ::   [[elisp:(python-check (format \"pyflakes %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName)))][pyflakes]] | [[elisp:(python-check (format \"pep8 %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName)))][pep8]] | [[elisp:(python-check (format \"flake8 %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName))))][flake8]] | [[elisp:(python-check (format \"pylint %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName))))][pylint]] [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Execution Checkers ::   [[elisp:(python-check (format \"pychecker %s\" (iicm:py:cmnd:bufLocVar:symb 'iicmName))))][pychecker (executes)]]  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Call Graph         ::   [[elisp:(bx:iimp:cmndLineExec :wrapper \"pycallgraph  --max-depth 5 graphviz -- \")][Create ./pycallgraph.png]]  ||  [[elisp:(lsip-local-run-command-here \"eog pycallgraph.png\")][Visit pycallgraph.png]]   [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Sphinx Doc         ::   [[elisp:(lsip-local-run-command-here \"iimProc.sh -h -v -n showRun -i sphinxDocUpdate\")][iimProc.sh -i sphinxDocUpdate]] || [[elisp:(lsip-local-run-command-here \"iimProc.sh -h -v -n showRun -f -i sphinxDocUpdate\")][iimProc.sh -f -i sphinxDocUpdate]]  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Profiling     ::  Execute And Profile the IIM -- Analyze  Profile Results   [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Exec & Profile   ::  [[elisp:(bx:iimp:cmndLineExec :wrapper \"python -m cProfile -o profile.$$$(date +%s%N)\")][Profile Command Line]] [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Profile Analysis ::  [[elisp:(lsip-local-run-command-here \"ls -l profile.*\")][ls -l profile.*]]  [[elisp:(lsip-local-run-command-here \"ls -t profile.* | head -1\")][latest profile.*]] [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Profile CallTree ::  [[elisp:(lsip-local-run-command-here \"gprof2dot -f pstats $(ls -t profile.* | head -1) | dot -Tsvg -o Profile.svg\")][Create Profile.svg]] || [[elisp:(lsip-local-run-command-here \"eog Profile.svg\")][Visit Profile.svg]] [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  python -m pstats ::  [[elisp:(lsip-local-run-command-here \"python -m pstats $(ls -t profile.*)\")][pstats interactive]]  --  \"help\"  \"sort cumulative\"+\"stats 5\" [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Other Prof Tools ::  [[elisp:(lsip-local-run-command-here \"cprofilev -f $(ls -t profile.*)\")][cprofilev]]  [[elisp:(lsip-local-run-command-here \"runsnake $(ls -t profile.*)\")][runsnake profile.pid]] [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Debugging         ::  Debuggers (pdb, trepan, etc)  [[elisp:(org-cycle)][| ]]
***  [[elisp:(org-cycle)][| ]]  Other Prof Tools ::  [[elisp:(lsip-local-run-command-here \"cprofilev -f $(ls -t profile.*)\")][cprofilev]]  [[elisp:(lsip-local-run-command-here \"runsnake $(ls -t profile.*)\")][runsnake profile.pid]] [[elisp:(org-cycle)][| ]]
")
    ))




(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:panel:insert:execControlShow bx:orgLevel) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:panel:insert:execControlShow (orgLevel)
  (let (
	(file-length)
	(outlineStr)
	(foldToggleStr)
	)
    (if (string= orgLevel "1")
	(progn
	  (setq outlineStr "*")
	  (setq foldToggleStr  "[[elisp:(org-cycle)][| ]]")	    	      
	  )
      (progn
	(setq outlineStr "**")
	(setq foldToggleStr  "[[elisp:(org-cycle)][| ]]")	    
	)
      )
    (insert
     (format
      "%s  /Bash-Cmnd/:: (%s) %s\n"
      outlineStr
      (iim:bash:cmnd:lineModeGet)
      (iim:bash:cmnd:lineStr)
      ))
    (insert
     (format
      "%s %s  [[elisp:(iim:bash:cmnd:lineExec)][<Run Cmnd>]] \
|| [[elisp:(iim:bash:cmnd:lineExec :wrapper \"echo\")][<Echo Cmnd>]] \
|| [[elisp:(progn (fp:node:popupMenu:iimBash:trigger \"/lcnt/lgpc/examples/permanent/bxde/en+fa/pres+art/basic/var/lcntProc.sh/iimsIn/lineModeFp/mode\" 'iim:bash:cmnd:lineMode/choice/bufLoc) (org-overview))][:lineMode]] \
|| [[elisp:(iim:bash:cmnd:lineElemsShow)][Show Cmnd Line Elems]] \
|| [[elisp:(iim:bash:cmnd:lineStrAndStore :verbosity \"-v\" :callTracking \"-n showRun\")][Full Verbosity]] \
|| [[elisp:(iim:bash:cmnd:lineStrAndStore :verbosity \"\" :callTracking \"\")][No Verbosity]] \
|| [[elisp:(blee:menuBox:cmndLineResultsRefresh)][Refresh Command Line]] \n"
      outlineStr
      foldToggleStr	  
      )
     )
    (insert
     (format
      "*%s   [[elisp:(blee:menuBox:paramsPropListClear)][Clear Params Settings]] \
|| "
      outlineStr
      )
     )
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:panel:insert:execControlShow orgLevel) [[elisp:(org-cycle)][| ]]
  ")

(defun iicm:py:panel:insert:execControlShow (orgLevel)
  (let (
	(outlineStr)
	(foldToggleStr)
	)
    (if (string= orgLevel "1")
	(progn
	  (setq outlineStr "*")
	  (setq foldToggleStr  "[[elisp:(org-cycle)][| ]]")	    	      
	  )
      (progn
	(setq outlineStr "**")
	(setq foldToggleStr  "[[elisp:(org-cycle)][| ]]")	    
	)
      )
    (insert
     (format
      "%s  /Python-Cmnd/:: (%s) %s\n"
      outlineStr
      (iicm:py:cmnd:lineModeGet)
      (iicm:py:cmnd:lineStr)
      ))
    (insert
     (format
      "%s %s  [[elisp:(iicm:py:cmnd:lineExec)][<Run Cmnd>]] \
|| [[elisp:(iicm:py:cmnd:lineExec :wrapper \"echo\")][<Echo Cmnd>]] \
|| [[elisp:(progn (fp:node:popupMenu:iimBash:trigger \"/lcnt/lgpc/examples/permanent/bxde/en+fa/pres+art/basic/var/lcntProc.sh/iimsIn/lineModeFp/mode\" 'iicm:py:cmnd:lineMode/choice/bufLoc) (org-overview))][:lineMode]] \
|| [[elisp:(iicm:py:cmnd:lineElemsShow)][Show Cmnd Line Elems]] \
|| [[elisp:(iicm:py:cmnd:lineStrAndStore :verbosity \"-v\" :callTracking \"-n showRun\")][Full Verbosity]] \
|| [[elisp:(iicm:py:cmnd:lineStrAndStore :verbosity \"\" :callTracking \"\")][No Verbosity]] \
|| [[elisp:(blee:menuBox:cmndLineResultsRefresh)][Refresh Command Line]] \n"
      outlineStr
      foldToggleStr	  
      )
     )
    (insert
     (format
      "*%s   [[elisp:(blee:menuBox:paramsPropListClear)][Clear Params Settings]] \
|| "
      outlineStr
      )
     )
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:insert:selectBxSrf) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:menuBox:insert:selectBxSrf ()
  (insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select BxSRF Params For BASH IIMs= | ]]               /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/\n"
	  )

  (insert "**\
  [[elisp:(delete-other-windows)][(1)]] || [[elisp:(blee:menuBox:paramsPropListClear)][Clear Params Settings]]\
\n** "
	  )

  (insert "\
\n**  ======================================================================================================|\
\n**  |                              *ByStar Objects BASH IIM*                                              |\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  |  /Par Name/        |  /Par Cur Value/   |             /Parameter Description/                  |info|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menuBox:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxo\")][:BxO]]              *| someBxo            |* ByStar Object Parameter                             |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menuBox:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxso\")][:BxSO]]             *| someValue          |* ByStar Service Object Parameter                     |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menuBox:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/bxio\")][:BxIO]]             *| None               |* ByStar Information Object Parameter                 |[[info]]|\
\n**  +-----------------------------------------------------------------------------------------------------|\
\n**  | [[elisp:(blee:menuBox:paramFromDirUpdate:popupMenu  \"/opt/public/osmt/sysConfigInput/iimBash/bxo/srBase\")][:srBase]]           *| None               |* Service Realization Dir Base                        |[[info]]|\
\n**  ======================================================================================================|\
\n**  [[elisp:(org-cycle)][| ]]  [[elisp:(delete-other-windows)][(1)]]"
	  )
  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:insert:selectBxSrf) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:menuBox:insert:selectBxSrf ()
  "Temporary NOTYET"
  (iicm:py:menuBox:insert:selectBxSrf)
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:iimBash:menuBox:insert:selectTargets) [[elisp:(org-cycle)][| ]]
")

(defun iim:bash:menuBox:insert:selectTargets ()
  (insert "* \n*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select Targets= | ]]                                  /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
	  )
  (insert "\n** ")  
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:iimPy:menuBox:insert:selectTargets) [[elisp:(org-cycle)][| ]]
")

(defun iicm:py:menuBox:insert:selectTargets ()
  (insert "* \n*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select Targets= | ]]                                  /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
	  )
  (insert "\n** ")  
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:examples:insert:iimExamples paramsBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:examples:insert:iimExamples (iim)
  (let (
	(selectedIim (fv:read-as-string "./_selectedIim"))	
	)
    
    (insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Customized Runs (IIM Examples)= | ]]                  /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/\n** \n"
	    )
    (insert
     (shell-command-to-string
      (format "%s -p iimPlayer=blee -i examples 2> /dev/null | emlOutFilter.sh -i iimToEmlStdout 2"  iim)))	  
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:menuBox:examples:insert:iimExamples paramsBaseDir) [[elisp:(org-cycle)][| ]]
  ")

(defun iicm:py:menuBox:examples:insert:iimExamples (iim)
  (let (
	(selectedIim (fv:read-as-string "./_selectedIim"))	
	)
    
    (insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Customized Runs (IIM Examples)= | ]]                  /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/\n** \
\n**  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(progn (fp:node:popupMenu:iimBash:trigger \"/lcnt/lgpc/examples/permanent/bxde/en+fa/pres+art/basic/var/lcntProc.sh/iimsIn/lineModeFp/mode\" 'iicm:py:cmnd:lineMode/choice/bufLoc) (org-overview))][:lineMode]] || [[elisp:(iicm:py:cmnd:lineStrAndStore :verbosity \"-v\" :callTracking \"-n showRun\")][Full Verbosity]] || [[elisp:(iicm:py:cmnd:lineStrAndStore :verbosity \"\" :callTracking \"\")][No Verbosity]] \n** \n"
	    )
    (insert
     (shell-command-to-string
      (format "%s -i examples 2> /dev/null | emlOutFilter.sh -i iimToEmlStdout 2"  iim)))	  
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *IIM Common Controls*                 ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")



;;;
;;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:commonControls:insert:selectValues fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:commonControls:insert:selectValues (fpNodeBase)
  (insert "*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select BASH IIM FrameWork Execution Controls= | ]]                /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
		)
  ;;(setq iimsInParams loc:fpNodeBase)
  
  ;;blee:menuBox:paramFromDirUpdate:popupMenu

  ;; bx:iimBash:paramsPropList
	
  (iim:bash:menuBox:commonControls:insert:paramsEditor fpNodeBase 'iim:bash:cmnd:commonControl/dict/bufLoc 'fp:node:menuBox:popupMenu:iimBash:trigger)
	
          ;;;(fp:node:menuBox:insert:iimBash:paramsEditor loc:fpNodeBase 'iimsInParams 'blee:menuBox:paramFromDirUpdate:popupMenu)
  )


;;
;;
;; (orderedLeavesAtNodeWithList "/tmp" (list "1" "2"))
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (orderedLeavesAtNodeWithList fpNodeBase leavesList) [[elisp:(org-cycle)][| ]]
  ")

(defun orderedLeavesAtNodeWithList (fpNodeBase leavesList)
    (mapcar
     (lambda (x)
       (concat fpNodeBase "/" x)
       )
     leavesList
     ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:commonControls:insert:paramsEditor fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:commonControls:insert:paramsEditor (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  (let (
	(topParsList
	 (list
	  "wrapper"
	  "iimName"
	  )
	 )
	(bottomParsList
	 (list
	  "iifArgs"
	  "verbosity"
	  "callTracking"
	  "tracing"
	  "recording"
	  "forceMode"
	  )
	 )
	(fpNodeDictVar 'iim:bash:cmnd:commonControl/dict/bufLoc) ;;;bx:iimBash:paramsPropList)
	(popUpSelector 'fp:node:menuBox:popupMenu:iimBash:trigger)
	)
  
  (fp:menuBox:insert:head (format "IIM Bash Editor For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))

  (fp:menuBox:paramsEditor:insertRows fpNodeBase topParsList fpNodeDictVar  popUpSelector)

  (blee:menuBox:insert:editor:varName "iif"
				      "Common"
				      fpNodeDictVar
				      'blee:menuBox:iif:popupMenu:trigger
				      "/opt/public/osmt/bin/iimBashNull.sh"
				      )
  (blee:menuBox:insert:varValue "iif" "examples")
  (blee:menuBox:insert:varDescription "Interactively Invokable Function (IIF)")
  (blee:menuBox:insert:varInfo)	   	   

  (blee:menuBox:insert:editor:varName "iif"
				      "Specific"
				      fpNodeDictVar
				      'blee:menuBox:iifSpecific:popupMenu:trigger
				      (get 'iim:bash:cmnd:commonControl/dict/bufLoc 'iimName)
				      )
  (blee:menuBox:insert:varValue "iif" "TBD")
  (blee:menuBox:insert:varDescription "Interactively Invokable Function (IIF)")
  (blee:menuBox:insert:varInfo)	   	   

  (fp:menuBox:paramsEditor:insertRows fpNodeBase bottomParsList fpNodeDictVar  popUpSelector)  

  (fp:menuBox:insert:tail)
  ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:menuBox:commonControls:insert:paramsEditor fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun iicm:py:menuBox:commonControls:insert:paramsEditor (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  (let (
	(topParsList
	 (list
	  "wrapper"
	  "iimName"
	  )
	 )
	(bottomParsList
	 (list
	  "iifArgs"
	  "verbosity"
	  "callTracking"
	  "tracing"
	  "recording"
	  "forceMode"
	  )
	 )
	(fpNodeDictVar 'iicm:py:cmnd:commonControl/dict/bufLoc) ;;;bx:iimPy:paramsPropList)
	(popUpSelector 'fp:node:menuBox:popupMenu:iimPy:trigger)
	)
  
  (fp:menuBox:insert:head (format "IIM Py Editor For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))

  (fp:menuBox:paramsEditor:insertRows fpNodeBase topParsList fpNodeDictVar  popUpSelector)

  (blee:menuBox:insert:editor:varName "iif"
				      "Common"
				      fpNodeDictVar
				      'blee:menuBox:iif:popupMenu:trigger
				      "/opt/public/osmt/bin/iimPyNull.sh"
				      )
  (blee:menuBox:insert:varValue "iif" "examples")
  (blee:menuBox:insert:varDescription "Interactively Invokable Function (IIF)")
  (blee:menuBox:insert:varInfo)	   	   

  (blee:menuBox:insert:editor:varName "iif"
				      "Specific"
				      fpNodeDictVar
				      'blee:menuBox:iifSpecific:popupMenu:trigger
				      (get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iimName)
				      )
  (blee:menuBox:insert:varValue "iif" "TBD")
  (blee:menuBox:insert:varDescription "Interactively Invokable Function (IIF)")
  (blee:menuBox:insert:varInfo)	   	   

  (fp:menuBox:paramsEditor:insertRows fpNodeBase bottomParsList fpNodeDictVar  popUpSelector)  

  (fp:menuBox:insert:tail)
  ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:iifBox:common:selector fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")

(defun iicm:py:iifBox:common:selector (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  (let (
	(bottomParsList nil) ;; Temp to be fixed
	(fpNodeDictVar 'iicm:py:cmnd:commonControl/dict/bufLoc) ;;;bx:iimPy:paramsPropList)
	(popUpSelector 'fp:node:menuBox:popupMenu:iimPy:trigger)
	)
  
    (fp:iifBox:insert:head (format "IICM Py Selector For: [[file:%s][%s]]"
				   fpNodeBase
				   fpNodeBase)
			   (+ 11 (length fpNodeBase)))

  (fp:iifBox:rawsList:insert:selector fpNodeBase bottomParsList fpNodeDictVar  popUpSelector)

  (fp:iifBox:insert:tail)
  ))


(defun iicm:py:iifBox:common:selectorObsoleted (fpNodeBase)
  "Given a fp:node and a dictVar, create a fpMenuBoxViewer."
  (let (
	(topParsList
	 (list
	  "wrapper"
	  "iimName"
	  )
	 )
	(bottomParsList
	 (list
	  "otherIif"
	  "someIif"
	  )
	 )
	(fpNodeDictVar 'iicm:py:cmnd:commonControl/dict/bufLoc) ;;;bx:iimPy:paramsPropList)
	(popUpSelector 'fp:node:menuBox:popupMenu:iimPy:trigger)
	)
  
  (fp:iifBox:insert:head (format "IICM Py Selector For: [[file:%s][%s]]"
				  fpNodeBase
				  fpNodeBase)
			  (+ 11 (length fpNodeBase)))

 
  ;; (blee:iifBox:insert:iifName "iif"
  ;; 				      "Specific"
  ;; 				      fpNodeDictVar
  ;; 				      'blee:menuBox:iifSpecific:popupMenu:trigger
  ;; 				      (get 'iicm:py:cmnd:commonControl/dict/bufLoc 'iimName)
  ;; 				      )
  ;; (blee:iifBox:insert:iifDescription "Interactively Invokable Function (IIF)")
  ;; (blee:iifBox:insert:iifFullDesc)	   	   

  (fp:iifBox:rawsList:insert:selector fpNodeBase bottomParsList fpNodeDictVar  popUpSelector)
  ;;(fp:iifBox:rawsList:insert:selector fpNodeBase (blee:fn:dir:*-relevant fpNodeBase) fpNodeDictVar  popUpSelector)    

  (fp:iifBox:insert:tail)
  ))

;;(blee:fn:dir:*-relevant "/de/bx/nne/dev-py/iimsPkgs/iicmExamples/var/iicmBasicExample.py/iicmIn/iifLibsFp")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *IIM Parameters Select*               ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")


;;;
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim:bash:menuBox:params:insert:selectValues params) [[elisp:(org-cycle)][| ]]
  ")

(defun iim:bash:menuBox:params:insert:selectValues (fpNodeBase)
  "invoked by dblock"
  (insert "* \n*\
  [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =Select This IIM's FP Parameters= | ]]                 /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
	  )
  ;;(setq iimsInParams loc:fpNodeBase)
	
  (fp:node:menuBox:insert:iimBash:paramsEditor fpNodeBase 'iim:bash:cmnd:params/dict/bufLoc 'fp:node:menuBox:popupMenu:iimBash:trigger)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iicm:py:menuBox:params:insert:selectValues fpNodeBase) [[elisp:(org-cycle)][| ]]
  ")
(defun iicm:py:menuBox:params:insert:selectValues (fpNodeBase)
  "invoked by dblock"
  ;; (insert "* \n*\
  ;; [[elisp:(org-show-subtree)][=|=]]  [[elisp:(org-shifttab)][(O)]] /===/      [[elisp:(org-cycle)][| =ZZSelect This IIM's FP Parameters= | ]]                 /====/ [[elisp:(beginning-of-buffer)][Top]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (org-shifttab) (org-content))][(C)]] /====/"
  ;; 	  )
  ;;(setq iimsInParams loc:fpNodeBase)
	
  ;;(fp:node:menuBox:insert:iicmPy:paramsEditor fpNodeBase 'iim:bash:cmnd:params/dict/bufLoc 'fp:node:menuBox:popupMenu:iimBash:trigger)
  (fp:node:menuBox:insert:iicmPy:paramsEditor fpNodeBase 'iicm:py:cmnd:params/dict/bufLoc 'fp:node:menuBox:popupMenu:iicmPy:trigger)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fp:node:menuBox:popupMenu:iimBash:trigger fpLeafBase fpNodeDictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun fp:node:menuBox:popupMenu:iimBash:trigger (fpLeafBase fpNodeDictVar)
  ""
  (fp:node:menuBox:popupMenu:define
   fpLeafBase
   fpNodeDictVar
   )
  (popup-menu fp:node:menuBox:popupMenu:name)

  (save-excursion
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    )
  (blee:menuBox:parallelBranches)  
  )



(defun fp:node:menuBox:popupMenu:iicmPy:trigger (fpLeafBase fpNodeDictVar)
  ""
  (fp:node:menuBox:popupMenu:define
   fpLeafBase
   fpNodeDictVar
   )
  (popup-menu fp:node:menuBox:popupMenu:name)

  (save-excursion
    ;;; NOTYET needs to become iicm:py:panel:execControlShow
    (blee:org-update-named-dblocks "iicm:py:panel:execControlShow")
    )
  (blee:menuBox:parallelBranches)  
  )



(defun fp:node:popupMenu:iimBash:trigger (fpLeafBase fpNodeDictVar)
  ""
  (fp:node:menuBox:popupMenu:define
   fpLeafBase
   fpNodeDictVar
   t  ; dontUpdate
   )
  (popup-menu fp:node:menuBox:popupMenu:name)

  (save-excursion
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    )
  ;;(blee:menuBox:parallelBranches)  
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *Get The Command Line String*         ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] || *IIF PopUp Menus*                     ::  /==============/  [[elisp:(org-cycle)][| ]]
  ")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:iif:popupMenu:define iim dictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:iif:popupMenu:define (iim dictVar)
  ""
  (interactive)
  (let ((menuHeading (format "%s (IIM) IIF Selection Menu" iim)))
    (message menuHeading)
    (easy-menu-define
      blee:menuBox:iif:popupMenu:name
      nil
      "" 
      (append
       (list menuHeading)
       (list "---")
       (mapcar (lambda (x)
	       (vector (format "%s" x)
		       `(lambda ()
			  (interactive)
			  (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif ,x)
			  (blee:menuBox:updateCurValue ,x)
			  )
		       )
	       )
	       (iifsOfIim iim)
	       )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:iif:popupMenu:trigger iim dictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:iif:popupMenu:trigger (iim dictVar)
  ""
  (blee:menuBox:iif:popupMenu:define iim dictVar)
  (popup-menu blee:menuBox:iif:popupMenu:name)

  (save-excursion
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    )
  (blee:menuBox:parallelBranches)  
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:iifSpecific:popupMenu:define iim dictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:iifSpecific:popupMenu:define (iim dictVar)
  ""
  (interactive)
  (let ((menuHeading (format "%s (IIM) IIF Selection Menu" iim)))
    (message menuHeading)
    (easy-menu-define
      blee:menuBox:iifSpecific:popupMenu:name
      nil
      "" 
      (append
       (list menuHeading)
       (list "---")
       (mapcar (lambda (x)
	       (vector (format "%s" x)
		       `(lambda ()
			  (interactive)
			  (blee:dict:set 'iim:bash:cmnd:commonControl/dict/bufLoc 'iif ,x)			  
			  (blee:menuBox:updateCurValue ,x)
			  )
		       )
	       )
	       (set-difference (iifsOfIim iim) (iifsOfIim "/opt/public/osmt/bin/iimBashNull.sh") :test 'string=)
	       )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:iifSpecific:popupMenu:trigger iim dictVar) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menuBox:iifSpecific:popupMenu:trigger (iim dictVar)
  ""
  (blee:menuBox:iifSpecific:popupMenu:define iim dictVar)
  (popup-menu blee:menuBox:iifSpecific:popupMenu:name)
  (save-excursion
    (blee:org-update-named-dblocks "iim:bash:panel:execControlShow")
    )
  (blee:menuBox:parallelBranches)  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menuBox:parallelBranches) [[elisp:(org-cycle)][| ]]
")

(defun blee:menuBox:parallelBranches ()
  "This is not a good name. Perhaps blee:org:parallelBranches"
  ;;(interactive)
  (save-excursion
    (call-interactively 'org-up-element)
    (call-interactively 'org-kill-note-or-show-branches)    
    )
  )



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-iims-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-iims-panel)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:

