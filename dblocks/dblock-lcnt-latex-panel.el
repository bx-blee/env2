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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:lcnt-related params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:lcnt-related (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *LCNT Base Info And Related Panels*\

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
*      Related Panels     ::  [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications\")][Blee LCNT Panel]] | [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/blee/screencasting\")][Blee ScreenCasting Panel]] | [[elisp:(find-file \"./PresPanel.org\")][Visit ./PresPanel.org]] | [[elisp:(lsip-local-run-command-here \"lcntProc.sh -v -n showRun -i mmUniteStart\")][lcntProc.sh -i mmUniteStart]]\
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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:lcnt-building params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:lcnt-building (params)  
  (let (
	(bx:types (or (plist-get params :types) ""))
	(docsList)
	)
    (bx:lcnt:info:base-read)

    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Cleanings And Refreshing* 
*      Current IIM Params ::  [[elisp:(bx:iimBash:resultsShow:cmndLineElems)][Show Cmnd Line Elems]]
*      Cleaning           ::  [[elisp:(lsip-local-run-command-here \"lcntProc.sh -i fullClean\")][lcntProc.sh -i fullClean]]  ||  [[elisp:(lsip-local-run-command-here \"lcntProc.sh -v -n showRun -i fullRefresh\")][lcntProc.sh -i fullRefresh]]
*      Sync               ::  [[elisp:(cvs-update \".\" t)][Version Control]]
*      =====================
"
		    ))


    (insert (format "\
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Building And Previewing*
*      IIM Parameters     ::  [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build+view\")][-p extent=build+view]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build\")][-p extent=build]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=view\")][-p extent=view]]\

"
		    ))

    (insert (format "\
*      Build All          ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"fullBuild\" :iifArgs \"\")][lcntProc.sh -i fullBuild]]\
|| [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildFullPreview\" :iifArgs \"\")][lcntProc.sh -p extent=asSelected -i buildFullPreview]]\

"
		     ))

    (insert (format "\
*      BuildPdfPreview    ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildPdfPreview\" :iifArgs \"\")][lcntProc.sh -p extent=asSelected -i buildPdfPreview]]\

*      BuildHtmlPreview   ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildHtmlPreview\" :iifArgs \"\")][lcntProc.sh -p extent=asSelected -i buildHtmlPreview]]\

"
		     ))    
    
    (mapcar '(lambda (arg)
	       (progn
		 (insert
		  (format "\
*      Build Pdf          ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildPdfPreview\" :iifArgs \"%s.ttytex\")]\
[lcntProc.sh -p extent=asSelected -i buildPdfPreview %s.ttytex]]\

*      Build Hevea Html   ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildHtmlPreview\" :iifArgs \"%s.ttytex\")]\
[lcntProc.sh -p extent=asSelected -i buildHtmlPreview %s.ttytex]]\

"
			  arg arg arg arg))))
	       (split-string (get 'bx:lcnt:info:base  'docSrcList))
	       )

     (insert (format "\
*      =====================
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Disposition*
*      Release            ::  [[elisp:(lsip-local-run-command-here \"lcntProc.sh -v -n showRun -i mmUniteStart\")][lcntProc.sh -i mmUniteStart]] || [[elisp:(find-file \"./PresPanel.org\")][Visit ./PresPanel.org]] || [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/blee/screencasting\")][Blee ScreenCasting Panel]]
"
      ))


    (insert (format "\
*      =====================
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Releasing*
*      IIM Parameters     ::  [[elisp:(setq bx:iimBash:iimParamsArgs \"-p tag=date\")][-p tag=date]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p tag=date\")][-p tag=]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build+release\")][-p extent=build+release]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=build\")][-p extent=build]] || [[elisp:(setq bx:iimBash:iimParamsArgs \"-p extent=release\")][-p extent=release]]
*      Release            ::  [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"resultsRelease\" :iifArgs \"\")][lcntProc.sh -i resultsRelease]]\
 || [[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :iif \"buildResultsRelease\" :iifArgs \"\")][lcntProc.sh -i buildResultsRelease]]\
 ||  [[elisp:(dired \"./rel\")][dired ./rel]]
*      =====================\
"
         ))


    (insert (format "
*  [[elisp:(beginning-of-buffer)][Top]] #####################  [[elisp:(delete-other-windows)][(1)]]      *Publishing*
"
		    ))
    
    (mapcar '(lambda (arg)
	       (progn
		 (insert
		  (format "\
*      Web Publish        ::  \
[[elisp:(bx:iimBash:cmndLineExec :wrapper \"\" :name \"lcntProc.sh\" :paramArgs \"-p bystarUid=%s\" :iif \"plone3FullPublish\" :iifArgs \"\")]\
[lcntProc.sh -p bystarUid=%s -i plone3FullPublish]]
*      =====================\
"
			  arg arg ))))
	       (split-string (get 'bx:lcnt:info:base  'bystarUid))
	       )


    (insert (format "
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



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:lcnt-publishing params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:lcnt-publishing (params)  
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
[[elisp:(lsip-local-run-command-here  \"lcntProc.sh -p bystarUid=%s -i plone3FullPublish\")]\
[lcntProc.sh -p bystarUid=%s -i plone3FullPublish]]\
"
			  arg arg ))))
	       (split-string (get 'bx:lcnt:info:base  'bystarUid))
	       )
         ))

(defun org-dblock-write:bx:dblock:org:lcnt-publishing-iimBash (params)  
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
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:org:lcnt-mailing params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:org:lcnt-mailing (params)  
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

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex-panel"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-latex-panel)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
