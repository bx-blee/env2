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
(require 'dblock-governor)



;;;#+BEGIN: bx:org-mode:startHere :governor "verbose" 
%%% Args: :exampleOfExtraParams "posibleValue":governor help/enabled
(lambda () "
* /->/ [[elisp:(describe-function 'org-dblock-write:bx:org-mode:startHere)][(dblock-func]]

contentPlus

 na bodyContent
* /<-/ ) E|
")
;;;#+END:



(defun org-dblock-write:bx:org-mode:startHere  (@params)
  " Example for pure Blee org-mode dblocks.

See [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/development/fullUsagePanel-en.org::BleeComeega]]
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@ext-gov (or (plist-get @params :ext-gov) "na")) ;; Controls general behaviour
	(@sur-style (or (plist-get @params :sur-style) "default")) ;; Controls general souroundings style	
	;;
	(@exampleOfExtraParams (or (plist-get
			   @params
			   :bibSrcPaths)
			  "/lcnt/BIB/plpcUrl,/lcnt/BIB/rfcs,/lcnt/BIB/bxsup"
			  ))
	
	;;
	($localVarPlaceHolder)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @ext-gov))    ;; Now available to local defuns

    (defun helpLine ()
      ":exampleOfExtraParams \"posibleValue\""
      )

    (defun bodyContentPlus ()
      (insert "\ncontentPlus\n")
      )

    (defun bodyContent ()
      (insert (format "\n %s bodyContent\n" @ext-gov))
      )
    
    (bx:dblock:governor:process @governor @ext-gov @sur-style
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:bx:comeega:startHere  (@params)
  " Example for pure Blee org-mode dblocks.

"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@ext-gov (or (plist-get @params :gov-ext) "na")) ;; Controls general behaviour
	(@gen-style (or (plist-get @params :gen-style) "default")) ;; Controls general souroundings style	
	;;
	(@exampleOfExtraParams (or (plist-get
			   @params
			   :bibSrcPaths)
			  "/lcnt/BIB/plpcUrl,/lcnt/BIB/rfcs,/lcnt/BIB/bxsup"
			  ))
	
	;;
	($atLeastOnceWhen nil)
	)

    (when @toggle (setq @governor @toggle))
    ;;;(setq @toggle @governor)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\"  :bibProvider \"biblatex|bibtex\" :style \"plain\""
     )
    
    (when (not (string= @governor "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "print-bibliography --- governor=%s  bibSrcPaths=%s"
	      @governor
	      @exampleOfExtraParams
	      )
       :level 1
       :comment (format "")
       )
      )

    (when (string= @governor "hide")
      (setq @governor "disabled")
      )

    (when (string= @governor "enabled")

      (bx:dblock:global:moded:insert-begin major-mode)

      (bx:dblock:org-mode:func-open 1 (compile-time-function-name))

      (insert "\nSome Stuff\n")

      (bx:dblock:org-mode:func-close 1
       (compile-time-function-name)
       :style "terse"
       )
	  
      (bx:dblock:global:moded:insert-end major-mode)
      )
    )
  )
	      

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-begin-examples"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-begin-examples)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:

