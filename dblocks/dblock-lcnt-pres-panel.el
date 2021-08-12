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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- Dblocks For LCNT LaTeX Panels --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'bx-lcnt-lib)



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:pres:lcnt-related params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:pres:lcnt-related (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *PresDispose Related Panels*\

*      Lcnt Doc Files     ::  "
		     ))    
    
    (mapcar '(lambda (arg)
	       (progn
		 (insert
		  (format "\
[[elisp:(blee:visit-as-content-list \"%s.ttytex\")][CL ./%s.ttytex]] || "		  
			  arg arg))))
	       (split-string (get 'bx:lcnt:info:base  'docSrcList))
	       )

    (insert (format "\	
*      Related Panels     ::  [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications\")][Blee LCNT Panel]] | [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/blee/screencasting\")][Blee ScreenCasting Panel]] |  [[elisp:(find-file \"./Panel.org\")][Visit ./Panel.org]]\
"
		    ))

    (insert (format "\		    
*      General Info       ::  [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] | [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] | [[elisp:(lsip-local-run-command-here \"ls\")][ls]] | [[elisp:(lsip-local-run-command-here \"lcntProc.sh -i lcntNuOut\")][lcntProc.sh -i lcntNuOut]] | [[elisp:(lsip-local-run-command-here \"lcntProc.sh\")][lcntProc.sh]] | [[file:lcntProc.sh][Visit]] |  [[elisp:(bx:lcnt:info:base-show)][bx:lcnt:info:base-show]]\
"
		    ))

    (insert (format "\		    
*      LCNT-Info          ::  [[elisp:(dired \"./LCNT-INFO\")][dired ./LCNT-INFO]] | [[elisp:(lsip-local-run-command-here \"lcnLcntInfo.sh\")][lcnLcntInfo.sh]] | NOTYET ReName Facilities\
"
		    ))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:pres:lcnt-building params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:pres:lcnt-building (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Cleanings And Refreshing* 
*      Current IIM Params ::  [[elisp:(bx:iimBash:resultsShow:cmndLineElems)][Show Cmnd Line Elems]]
*      Cleaning           ::  [[elisp:(lsip-local-run-command-here \"mmUnite.sh -i fullClean\")][mmUnite.sh -i fullClean]]  ||  [[elisp:(lsip-local-run-command-here \"mmUnite.sh -v -n showRun -i fullRefresh\")][mmUnite.sh -i fullRefresh]]
*      Sync               ::  [[elisp:(cvs-update \".\" t)][Version Control]]
*      =====================
"
		    ))


    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Disposition Preparations*
*      IIM Parameters     ::  [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build+view\")][-p extent=build+view]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build\")][-p extent=build]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=view\")][-p extent=view]]\

"
		    ))

    (insert (format "\
*      Build All          ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"mmUnite.sh\" :iif \"fullBuild\" :iifArgs \"\")][mmUnite.sh -i fullBuild]]\

"
		     ))

    (insert (format "\
*      BuildPdfPreview    ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"mmUnite.sh\" :iif \"buildPdfPreview\" :iifArgs \"\")][mmUnite.sh -p extent=asSelected -i buildPdfPreview]]\

*      BuildHtmlPreview   ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"mmUnite.sh\" :iif \"buildHtmlPreview\" :iifArgs \"\")][mmUnite.sh -p extent=asSelected -i buildHtmlPreview]]\

*    NOTYET -- *CONTINUE The Work Here -- 1/30/2017*
*    [[elisp:(lsip-local-run-command \"ln -s ./mmUnite.sh ./mmUnite.sh\")][ln -s ./mmUnite.sh ./mmUnite.sh]]
*    [[elisp:(lsip-local-run-command \"mmUnite.sh -h -v -n showRun -i baseSetup\")][mmUnite.sh -h -v -n showRun -i baseSetup]]
*    [[elisp:(lsip-local-run-command \"mmUnite.sh -h -v -n showRun -i startAudio\")][mmUnite.sh -h -v -n showRun -i startAudio]]
*    [[elisp:(lsip-local-run-command \"mmUnite.sh -h -v -n showRun -i screenCastingFullUpdate\")][mmUnite.sh -h -v -n showRun -i screenCastingFullUpdate]]
*    [[elisp:(lsip-local-run-command \"mmUnite.sh -h -v -n showRun -i screenCastingFullClean\")][mmUnite.sh -h -v -n showRun -i screenCastingFullClean]]
"
		     ))    

    (insert (format "\
*      =====================
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Presentation Players*
*      IIM Parameters     ::  [[elisp:(setq bx:iimBash:iimParamsArgs \"-p tag=date\")][-p tag=date]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p tag=date\")][-p tag=]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build+release\")][-p extent=build+release]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build\")][-p extent=build]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=release\")][-p extent=release]]
*      Release            ::  [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"mmUnite.sh\" :iif \"resultsRelease\" :iifArgs \"\")][mmUnite.sh -i resultsRelease]]\
 || [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"mmUnite.sh\" :iif \"buildResultsRelease\" :iifArgs \"\")][mmUnite.sh -i buildResultsRelease]]\
 ||  [[elisp:(dired \"./rel\")][dired ./rel]]
*      =====================\
"
         ))
             ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:pres:lcnt-publishing params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:pres:lcnt-publishing (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Publishing*
"
		    ))
    
    (mapcar '(lambda (arg)
	       (progn
		 (insert
		  (format "\
*      Web Publish        ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :paramArgs \"-p bystarUid=%s\" :iif \"plone3FullPublish\" :iifArgs \"\")]\
[lcntProc.sh -p bystarUid=%s -i plone3FullPublish]]\
"
			  arg arg ))))
	       (split-string (get 'bx:lcnt:info:base  'bystarUid))
	       )
         ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:pres:lcnt-mailing params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:pres:lcnt-mailing (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Mailing*
"
		    ))

    (insert
     (format "\
*      Mail.Content       ::  \
[[elisp:(find-file \"./mailing/content.mail\")][Visit ./mailing/content.mail]]
*      Mail.Panel         ::  \
[[elisp:(find-file \"./mailing/Panel.org\")][Visit ./mailing/Panel.org]]\
"
        ))
         ))

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-pres-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-pres-panel)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
