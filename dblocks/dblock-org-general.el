;;;
;;; (setq debug-on
;;;

(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")

(defun blee:panel:button:shCommand (@commandStr)
  "Returns String"
    (format "[[elisp:(lsip-local-run-command \"%s\")][%s]]"
            @commandStr @commandStr))


(defun blee:panel:icm:bash:intro (<icmName)
  "Returns String"
  (let (
        ($result)
        )
    (setq $result
          (concat $result
                  (format "[[elisp:(lsip-local-run-command \"%s -i examples\")][%s]]"
                          <icmName <icmName)))
    (setq $result
          (concat $result
                  (format "  [[elisp:(lsip-local-run-command \"%s -i visit\")][visit]]"
                          <icmName)))
    (setq $result
          (concat $result
                  (format "  [[elisp:(lsip-local-run-command \"%s -i describe\")][describe]]"
                          <icmName)))
    $result
    ))

(defun blee:panel:file:text|intro (<fileName)
  "Returns String"
  (let (
        ($result)
        )
    (setq $result
          (concat $result
                  (format
                   "[[elisp:(find-file \"%s\")][%s]] || [[elisp:(find-file-other-window \"%s\")][Visit In Other]]"
   <fileName
   <fileName   
   (expand-file-name <fileName)
   )))
                  
    $result
    ))


(defun blee:panel:icm:py:intro (<icmName)
  "Returns String"
  (let (
        ($result)
        )
    (setq $result
          (concat $result
                  (format "[[elisp:(lsip-local-run-command \"%s -i examples\")][%s]]"
                          <icmName <icmName)))
    (setq $result
          (concat $result
                  (format "  [[elisp:(lsip-local-run-command \"%s -i visit\")][visit]]"
                          <icmName)))
    (setq $result
          (concat $result
                  (format "  [[elisp:(lsip-local-run-command \"%s -i describe\")][describe]]"
                          <icmName)))
    $result
    ))


(defun blee:panel:outLevelStr (@outLevel)
  "Outline level is included."
  (make-string @outLevel ?*)
  )

(defun blee:panel:dividerLineFull (@outLevel)
  "Returns a string as full line divider with outline level string included."  
  (format
   "%s  %s "
   (blee:panel:outLevelStr @outLevel)
   (make-string 110 ?-)
   ))


(defun blee:panel:divider (@outLevel)
  "Returns a string as front divider with outline level string included."
  (format
   "%s  [[elisp:(beginning-of-buffer)][|^]] ############ [[elisp:(delete-other-windows)][|1]] "
   (blee:panel:outLevelStr @outLevel)   
   ))

;;;

;;; (blee:panel:frontControl 1 :inDblock nil)
;;;

(defun blee:panel:frontControl (@outLevel &rest @args)
  "Outline level is included.
|N (nil)is not in a dblock
(> (t) is immediately in a dblock (above line is BEGIN)
|n (yes) is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
          ;;;
        ($primaryNaturalControl)
        ($result)
        )

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      ;;"[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
      " _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
                                          (blee:panel:outLevelStr @outLevel)
                                          )))
    (when (equal @inDblock t)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
                                           (blee:panel:outLevelStr @outLevel)
                                           )))

    (when (equal @inDblock "yes")
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|n]]"
                                           (blee:panel:outLevelStr @outLevel)
                                           )))


    (setq $result (format "%s %s "
                          $primaryNaturalControl
                          ($commonFrontControls)
                          ))
    $result
   ))


(defun blee:panel:delimiterFrontControl (@outLevel &rest @args)
  "Outline level is included.
|N is not in a dblock
(> is immediately in a dblock (above line is BEGIN)
|n is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
          ;;;
        ($primaryNaturalControl)
        ($result)
        )

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
                                          (blee:panel:outLevelStr @outLevel)
                                          )))

    (when (equal @inDblock t)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
                                           (blee:panel:outLevelStr @outLevel)
                                           )))

    (when (equal @inDblock "yes")
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|n]]"
                                           (blee:panel:outLevelStr @outLevel)
                                           )))

    (setq $result (format "%s %s "
                          $primaryNaturalControl
                          "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
                          ))
    $result
   ))

(defun blee:panel:foldingFrontControl (@outLevel &rest @args)
  "Outline level is included.
|N is not in a dblock
-> is immediately in a dblock (above line is BEGIN)
|n is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
          ;;;
        ($primaryNaturalControl)
        ($result)
        )

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]]"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
                                          (blee:panel:outLevelStr @outLevel)
                                          )))
    (when @inDblock
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
                                           (blee:panel:outLevelStr @outLevel)
                                           )))
    (setq $result (format "%s %s"
                          $primaryNaturalControl
                          ($commonFrontControls)
                          ))
    $result
   ))



(defun blee:panel:frontControlOld (@outLevel &rest @args)
  "Outline level is included."
  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
          ;;;
        ($result)
        )

    (when (not @inDblock)
      (setq $result (format "%s \
[[elisp:(show-all)][|N]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] "
                     (blee:panel:outLevelStr @outLevel)
             )))
    (when @inDblock
      (setq $result (format "%s \
[[elisp:(show-all)][->]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] "
                     (blee:panel:outLevelStr @outLevel)
       )))
    $result
   ))



(defun blee:panel:foldingSection (@outLevel
                                  @title
                                  @anchor
                                  @extraInfo
                                  &rest @args                             
                                  )
  
  "Returns a string with outline level string included.
For outlevel=1, we have chapters and sections at same level.
We then distinguish between chapter and section based on indentation and TitleStr.
--
** TODO Should be renamed to blee:panel:titledSection (sometimes folding, sometimes not)
"
  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
        (@rawTitle (or (plist-get @args :rawTitle) nil))
        (@sep (or (plist-get @args :sep) nil))
        (@folding? (or (plist-get @args :folding?) t))  
        ;;
        ($openTitleStr "==")
        ($closeTitleStr "==")
        ($indentationStr "")
        ;;
        ($result nil)
        )

    (unless (plist-member @args :rawTitle)
      (setq @rawTitle nil))
    
    (when (equal @outLevel 1)
      (setq $openTitleStr "*")
      (setq $closeTitleStr "*")
      (setq $indentationStr "  ")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "/")
      (setq $closeTitleStr "/")
      (setq $indentationStr "  ")      
      )
    (when (equal @outLevel 3)
      (setq $indentationStr "  ")      
      )
    (when (equal @outLevel 4)
      (setq $indentationStr "  ")      
      )
    
    (when @rawTitle
      (setq $openTitleStr "")
      (setq $closeTitleStr "")
      (setq $indentationStr "")      
      )

    (defun effectiveAnchor (@anchor)
      (let (
            ($result)
            )
            (when (string-equal "" @anchor)
              (setq @anchor nil))
            (when @anchor
              (setq $result (format "<<%s>>"@anchor)))
            (unless @anchor
              (setq $result ""))
            $result
            )
      )
    ;;
    ;; (effectiveExtraInfo nil)
    ;; (effectiveExtraInfo "str")    
    (defun effectiveExtraInfo (@extraInfo)
      (if @extraInfo
          (format "%s" @extraInfo)
        ""
        ))
    
    (when @sep
      (insert
       (format "\
%s \
/[[elisp:(beginning-of-buffer)][|^]]  [[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]] [[elisp:(delete-other-windows)][|1]]/ 
"
               ;;; /[[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]] [[elisp:(delete-other-windows)][|1]]/ 
               (blee:panel:outLevelStr @outLevel)
               )))

    (when @folding?
      (setq $result 
            (format "\
%s \
%s   [[elisp:(outline-show-subtree+toggle)][| %s%s:%s |]] %s %s \
"
                    (blee:panel:frontControl @outLevel :inDblock @inDblock)
                    $indentationStr
                    $openTitleStr
                    @title
                    $closeTitleStr
                    (effectiveAnchor @anchor)
                    (effectiveExtraInfo @extraInfo))
            ))
    (unless @folding?
      (setq $result       
            (format "\
%s \
%s    %s%s:%s %s %s \
"
                    (blee:panel:frontControl @outLevel :inDblock @inDblock)
                    $indentationStr
                    $openTitleStr
                    @title
                    $closeTitleStr
                    (effectiveAnchor @anchor)
                    (effectiveExtraInfo @extraInfo))
            ))
    $result
    ))
    


(defun blee:panel:foldingSectionOLD (@outLevel
                                  @title
                                  @anchor
                                  &rest @args                             
                                  )
  
  "Returns a string with outline level string included."
  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))        
        ($openTitleStr "==")
        ($closeTitleStr "==")
        )
    (when (equal @outLevel 1)
      (setq $openTitleStr "*=")
      (setq $closeTitleStr "=*")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "/=")
      (setq $closeTitleStr "=/")
      )

    (defun effectiveAnchor (@anchor)
      (if @anchor
          (format "<<%s>> "@anchor)
        ""
        ))
    
    (format "\
%s \
   [[elisp:(org-cycle)][| %s %s: %s | ]] %s \
"
            (blee:panel:frontControl @outLevel :inDblock @inDblock)
            $openTitleStr
            @title
            $closeTitleStr
            (effectiveAnchor @anchor)
     )))

(defun org-dblock-write:blee:pdf|disposition  (@params)
  "Given a pdf file, create a line for its various dispositions.
---
** TODO Expand this to work on any file. Replace with org-dblock-write:blee:file|disposition
   SCHEDULED: <2020-03-01 Sun>
*** First determin file type. Then determine how we can display it.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
        ;;
        (@anchor (or (plist-get @params :anchor) nil))
        ;;
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line
        ;;
        (@file (or (plist-get @params :file) ""))
        (@folding? (or (plist-get @params :folding?) nil))
        (@title (or (plist-get @params :title) ""))
        (@extraInfo (or (plist-get @params :extraInfo) nil))    
        ;;
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns


    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      ""
      (defun constructedExtraInfo ()
        ""
        (let (
              ($extraInfoDelim "")
              ($extraInfoEffective "")
              ($result nil)
              )
          (when @extraInfo
            (when (not (string-equal @extraInfo ""))
              (setq $extraInfoEffective @extraInfo)
              (setq $extraInfoDelim "--")))
          (setq $result (format "%s %s" $extraInfoDelim $extraInfoEffective)
                )
          ))

      (insert
       (blee:panel:foldingSection
        @outLevel
        @title
        @anchor
        (constructedExtraInfo)
        :inDblock t
        :rawTitle t
        :sep @sep
        :folding? @folding?
        )
       )
      
      (insert "  :: ")
      (insert (blee:bxPanel|pdfViewing @file))
      ;;(insert "\n")   
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )
    ))


(defun org-dblock-write:blee:bxPanel:mention-lcnt  (@params)
  "Produces a section for an lcnt based on the PLPC parameter.
After expanding, displays complete information about the document.
---
** TODO Add author, date, form (article/presentation)
   SCHEDULED: <2020-02-23 Sun>
** TODO Add jump to main.org and Panel.org
   SCHEDULED: <2020-02-23 Sun>
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
        ;;
        (@anchor (or (plist-get @params :anchor) nil))
        (@extraInfo (or (plist-get @params :extraInfo) nil))
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line
        ;;
        (@lcntNu (or (plist-get @params :lcnt-nu) ""))   
        ;;
        ($fileAsString)
        (lcntBase)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns


    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (set 'lcntBase
           (shell-command-to-string 
            (format "echo -n $( lcnLcntSelect.sh  %s 2> /dev/null | head -1 )" @lcntNu))
           )
    
      (bx:lcnt:info:base-read-dir lcntBase)

      (let (
            (lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
            (lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
            (lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
            (lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
            (lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
            (lcnt-version (get 'bx:lcnt:info:base 'version))
            (lcnt-url (get 'bx:lcnt:info:base 'url))
            )

        (defun constructedExtraInfo ()
          (let (
                ($extraInfoDelim "")
                ($extraInfoEffective "")                
                )
            (when @extraInfo
              (when (not (string-equal @extraInfo ""))
                (setq $extraInfoEffective @extraInfo)
                (setq $extraInfoDelim "--")))
            (format
             "[[elisp:(dired-other-window \"%s\")][dired]] || %s %s %s"
             lcntBase lcnt-shortTitle $extraInfoDelim $extraInfoEffective)
            ))
        
        (insert
         (format
          "%s" (blee:panel:foldingSection
                @outLevel
                @lcntNu
                @anchor
                (constructedExtraInfo)
                :inDblock t
                :rawTitle t
                :sep @sep
                )
          ))

        (insert (format "\n~%s~\n" lcnt-mainTitle))
        
        (when (not (string-equal (format "%s" lcnt-subTitle) ""))
          (insert (format "~%s~\n" lcnt-subTitle)))

        (when (not (string-equal (format "%s" lcnt-subSubTitle) ""))
          (insert (format "~%s~\n" lcnt-subSubTitle)))

        (insert (blee:bxPanel|pdfViewing (lcnt:base:pdf|article lcntBase)))
        
        (insert (format " %s\n" lcnt-url))
      ))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


;;; (lcnt:base:pdf|article "/lcnt/lgpc/bystar/permanent/engineering/wsTesting")
(defun lcnt:base:pdf|article  (@lcntBasePath)
  "Returns a file path to lcnt pdf article form file."
  (expand-file-name
   (shell-command-to-string 
    (format "cd %s; echo -n $( ./lcntProc.sh  -p extent=name -i lcntBuild dev )" @lcntBasePath)
    )
   @lcntBasePath
   ))

(defun lcnt:base:pdf|presentation  (@lcntBasePath)
  "Returns a file path to lcnt pdf presentation form file."
  )

(defun blee:bxPanel|pdfViewing  (@pdfFilePath)
  "Returns an org-mode string for viewing of the pdf file."
  (format
   "[[elisp:(find-file \"%s\")][Pdf Here]] || [[elisp:(find-file-other-window \"%s\")][Pdf Other]] || [[elisp:(lsip-local-run-command \"acroread -openInNewInstance %s &\")][Pdf Acroread]] || "
   @pdfFilePath
   @pdfFilePath   
   (expand-file-name @pdfFilePath)
   ))

(advice-add 'org-dblock-write:blee:bxPanel:foldingSection :around #'bx:dblock:control|wrapper)  
(defun org-dblock-write:blee:bxPanel:foldingSection  (@params)
  "foldingSection is a basic ingredient of bxPanels. 
A bxPanel is often structured similar to a LaTeX document With Parts, Chapters, Section, SubSection, etc.
Parts are rare and can be done with ;rawTitle.
Chapters are specified as :outLevel 0.
Sections are specified as :outLevel 1,n
:style should be closeContinue for folding segment.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line   
        ;;
        (@title (or (plist-get @params :title) "TBD"))
        (@rawTitle (or (plist-get @params :rawTitle) nil))      
        (@anchor (or (plist-get @params :anchor) nil))
        (@extraInfo (or (plist-get @params :extraInfo) nil))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s" (blee:panel:foldingSection @outLevel
                                        @title
                                        @anchor
                                        @extraInfo
                                        :inDblock t
                                        :rawTitle @rawTitle
                                        :sep @sep
                                        )
        )))

    ;;;
    ;;; A Chapter is a section at @outLevel=0 and @title
    ;;;
    (when (eq @outLevel 0)
      (setq @outLevel 1)
      (setq @title (format "_%s_" @title))
      (setq @rawTitle t)
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(defun blee:panel:delimiterSection (@outLevel
                                    - 
                                  @title
                                  @anchor
                                  @extraInfo                              
                                  &rest @args                             
                                  )
  
  "Returns a string with outline level string included."
  (let (
        (@inDblock (or (plist-get @args :inDblock) nil))
        (@sep (or (plist-get @args :sep) nil))
        ;;
        ($openTitleStr "==")
        ($closeTitleStr "==")
        )
    (when (equal @outLevel 1)
      (setq $openTitleStr "_")
      (setq $closeTitleStr "_")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "~")
      (setq $closeTitleStr "~")
      )

    (defun effectiveAnchor (@anchor)
      (if @anchor
          (format "<<%s>>"@anchor)
        ""
        ))

    ;; (effectiveExtraInfo nil)
    ;; (effectiveExtraInfo "str")    
    (defun effectiveExtraInfo (@extraInfo)
      (if @extraInfo
          (format "%s" @extraInfo)
        ""
        ))

    (when @sep
      (insert
       (blee:org:separatorStr @outLevel))
      (insert "\n"))
    
    (format "\
%s \
  %s %s%s:%s %s \
"
            (blee:panel:delimiterFrontControl @outLevel :inDblock @inDblock)
            (effectiveAnchor @anchor)
            $openTitleStr
            @title
            $closeTitleStr
            (effectiveExtraInfo @extraInfo)
     )))

(advice-add 'org-dblock-write:blee:bxPanel:delimiterSection :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:delimiterSection  (@params)
  "Non-Folding section delimiter usually with _title_
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))        
        ;;
        (@title (or (plist-get @params :title) "TBD"))
        (@anchor (or (plist-get @params :anchor) nil))
        (@extraInfo (or (plist-get @params :extraInfo) nil))

        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s" (blee:panel:delimiterSection @outLevel
                                        @title
                                        @anchor
                                        @extraInfo
                                        :inDblock t
                                        :sep @sep
                                        )
        )))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun org-dblock-write:blee:bxPanel:dividerLineFull  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
        ;;(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style        
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        ;;
        ($localVarPlaceHolder)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      "No specific params"
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(advice-add 'org-dblock-write:blee:bxPanel:title :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:title  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        ;; (@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
        (@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style        
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@panelType (or (plist-get @params :panelType) "bxPanel"))
        (@title (or (plist-get @params :title) "title"))        
        
        ;;
        ($localVarPlaceHolder)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelType \"bxPanel\" :title \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "NOTYET, use @panelType to choose images."
      (when (string= @title "auto")
        (when (fto:withBase:isLeaf? ".")        
          (setq @title (format "~Leaf:: %s/%s -- %s~"
                               (file-name-nondirectory (expand-file-name "../.."))
                               (file-name-nondirectory (expand-file-name ".."))
                               (file-name-nondirectory (expand-file-name "."))
                               )))
        (when (fto:withBase:isNode? ".")                
          (setq @title (format "~Node:: %s/%s -- %s~"
                               (file-name-nondirectory (expand-file-name "../../.."))
                               (file-name-nondirectory (expand-file-name "../.."))
                               (file-name-nondirectory (expand-file-name ".."))
                               )))
        )
        
      (insert
       (format "
%s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseTop-50.png][http://www.freeprotocols.org]]_ _   %s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseBottom-50.png][http://www.by-star.net]]
"
               ;;;%s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseTop-50.png][http://www.freeprotocols.org]]_ _  %s: %s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseBottom-50.png][http://www.by-star.net]]
               "*"
               ;;@panelType
               @title
               ))
      (insert
       (format "%s %s "
               (blee:panel:outLevelStr @outLevel)
               (make-string 93 cfw:fchar-horizontal-line)
               ;;;(make-string 102 ?-)         
               ))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun org-dblock-write:blee:bxPanel:titleOld  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openContinue" "closeContinue"))) ;; souroundings style
        ;;(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style        
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@panelType (or (plist-get @params :panelType) "bxPanel"))
        (@title (or (plist-get @params :title) "title"))        
        
        ;;
        ($localVarPlaceHolder)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelType \"bxPanel\" :title \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "                /* %s: %s */     "
        @panelType
        @title
        ))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun blee:org:separatorStr (<outLevel)
  (format "\
%s \
/[[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]] [[elisp:(delete-other-windows)][|1]]/"
          (blee:panel:outLevelStr <outLevel)
          ))



(advice-add 'org-dblock-write:blee:bxPanel:separator :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:separator  (@params)
  "
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeBlank"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      ""
      (insert
       (blee:org:separatorStr @outLevel))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(defun org-dblock-write:blee:bxPanel:sisterPanels  (@params)
  "sisterPanels runs in ../sisterPanels.org with regards to the current panel."
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeBlank"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "For each directory create a sister panel"
      (when (string= @model "auto")      
        (insert
         (format
          "*   =Sibling Panels=  :: "
          ))
        (dolist ($eachSubDir (blee:file:dir:listNotableSubdirs "."))
          (when (fto:withBase:isLeaf? (concat (file-name-as-directory ".") $eachSubDir))  
            (insert
             (format
              "[[elisp:(blee:bnsm:panel-goto \"../%s\")][%s]]"
              $eachSubDir
              $eachSubDir
              )
             )
            (insert " || ")
            )
          (when (fto:withBase:isNode? (concat (file-name-as-directory ".") $eachSubDir))
            (insert
             (format
              "[[elisp:(blee:bnsm:panel-goto \"../%s\")][ *%s* ]]"
              $eachSubDir
              $eachSubDir
              )
             )
            (insert " || ")
            )
          )
        (insert
         (format
          "\n*   =Node Panels=     ::  [[elisp:(blee:bnsm:panel-goto \"../main/\")][ *This: (%s)* ]] ||"
          (file-name-nondirectory (expand-file-name "."))
          ))
        (insert
         (format
          " [[elisp:(blee:bnsm:panel-goto \"../../main/\")][ *Parent: (%s)* ]] ||"
          (file-name-nondirectory (expand-file-name ".."))
          ))
        
        )
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:bxPanel:relatedPanels :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:relatedPanels (@params)
  "Lists related panels in two parts. 1) based on :panelsList -- 2) based on :inFile"
  (org-dblock-write:blee:bxPanel:terseTreeNavigator @params))

(advice-add 'org-dblock-write:blee:bxPanel:terseTreeNavigator :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:terseTreeNavigator  (@params)
  "Creates terse links for navigation surrounding current panel in treeElem."
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openFull" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        ;;
        (@panelsList (or (plist-get @params :panelsList) "bxPanel"))
        (@inFile (or (plist-get @params :inFile) "sisterPanels.org"))   
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\" :model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun generalPanels ()
      (insert
       (format
        "%s  General Panels ::   [[img-link:file:/bisos/blee/env/images/bystarInside.jpg][http://www.by-star.net]] *|*  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/listOfDocs/fullUsagePanel-en.org\")][BxDE Top Panel]] *|* [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/planning/Main\")][ByStar Planning]]\n"
        (blee:panel:frontControl @outLevel :inDblock "yes")
        @panelsList
        )))

    (defun topLineDeliminator ()
      (insert
       (format
        "%s%s_%s_%s"
        (blee:panel:outLevelStr @outLevel)
        (make-string 35 ? )
        ;;(make-string 30 ?=)
        (make-string 30 cfw:fchar-horizontal-line)              
        (make-string 25 ? )
        ))
      )

    (defun bodyContent ()
      "Descendents, Siblings and Ancestors of This Node."
      (let* (
            ($cwd ".")
            )          
        (when (string= @model "auto")
          (generalPanels)
          (when (fto:treeElem|atBaseIsNode? $cwd)
            (bodyContentNode)
            )
          (when (fto:treeElem|atBaseIsLeaf? $cwd)
            (bodyContentLeaf)
            ))))

    (defun bodyContentNode ()
      "Descendents, Siblings and Ancestors of This Node."
      (let* (
            ($cwd ".")
            ($thisNode (fto:node|atBaseGetName $cwd))
            ($outString "")
            (count 0)
            (countLimit 5)
            )          
        (when (string= @model "auto")
          (unless (fto:treeElem|atBaseIsNode? $cwd)
            (message "EH_problem"))
          (when (fto:treeElem|atBaseIsNode? $cwd)

            (setq count 0)
            (dolist ($eachSubDir (fto:node|atBaseGetDescendantsBases
                                  $cwd
                                  :expandedFileName t))
              (when (eq count 0)
                (insert (format "\n*   =Decedents=  :: ")))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "terse"))
              (insert " *|* ")
              (setq count (1+ count))
              (when (eq count countLimit)
                (setq count 0))
              )

            (setq count 0)          
            (dolist ($eachSubDir (fto:node|atBaseGetSiblingsBases
                                  $cwd
                                  :expandedFileName t))
              (when (eq count 0)
                (insert (format "\n*   *Siblings*   :: ")))         
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "terse"))
              (insert " *|* ")
              (setq count (1+ count))
              (when (eq count countLimit)
                (setq count 0))
              )

            (setq count 0)          
            (dolist ($eachSubDir (fto:node|atBaseGetAncestorsBases $cwd))
              (when (eq count 0)
                (insert (format "\n*   /Ancestors/  :: ")))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "terse"))
              (insert " *|* ")
              (setq count (1+ count))
              (when (eq count countLimit)
                (setq count 0))
              )
            (insert "\n")
            )
          
          (topLineDeliminator)
          )
        )
      )

    (defun bodyContentLeaf ()
      "Descendents, Siblings and Ancestors of This Leaf."
      (let* (
            ($cwd ".")
            ($thisLeaf (fto:leaf|atBaseGetName $cwd))
            ($outString "")
            (count 0)
            (countLimit 5)
            )          
        (when (string= @model "auto")
          (unless (fto:treeElem|atBaseIsLeaf? $cwd)
            (message "EH_problem"))
          (when (fto:treeElem|atBaseIsLeaf? $cwd)

            (setq count 0)
            (dolist ($eachSubDir (fto:leaf|atBaseGetSiblingsBases
                                  $cwd
                                  :expandedFileName t))
              (when (eq count 0)
                (insert (format "\n*   *Siblings*   :: ")))         
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "terse"))
              (insert " *|* ")
              (setq count (1+ count))
              (when (eq count countLimit)
                (setq count 0))
              )

            (setq count 0)          
            (dolist ($eachSubDir (fto:leaf|atBaseGetAncestorsBases $cwd))
              (when (eq count 0)
                (insert (format "\n*   /Ancestors/  :: ")))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "terse"))
              (insert " *|* ")
              (setq count (1+ count))
              (when (eq count countLimit)
                (setq count 0))
              )
            (insert "\n")
            )

          (topLineDeliminator)    

          )
        )
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun org-dblock-write:blee:bxPanel:siblingPanelLinks  (@params)
  "Renamed."
  (org-dblock-write:blee:bxPanel:linedTreeNavigator @params)
  )

(defun org-dblock-write:blee:bxPanel:linedPanelLinksForNode  (@params)
  "Renamed."
  (org-dblock-write:blee:bxPanel:linedTreeNavigator @params)
  )

;;;
(advice-add 'org-dblock-write:blee:bxPanel:linedTreeNavigator :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:linedTreeNavigator  (@params)
  "Creates lined links for navigation surrounding current treeElem."
  (let* (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        (@dest (or (plist-get @params :dest) "."))      
        ;;
        ($fileAsString)
        ($cwd @dest)    
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "Descendents, Siblings and Ancestors of This Node."
      (let* (
            ($cwdNot ".")
            )          
        (when (string= @model "auto")
          (when (fto:treeElem|atBaseIsNode? $cwd)
            (bodyContentNode)
            )
          (when (fto:treeElem|atBaseIsLeaf? $cwd)
            (bodyContentLeaf)
            ))))

    (defun bodyContentNode ()
      "Descendents, Siblings and Ancestors of This Node."
      (let* (
            ($thisNode (fto:node|atBaseGetName $cwd))
            ($outString "")
            )          
        (when (string= @model "auto")
          (unless (fto:treeElem|atBaseIsNode? $cwd)
            (message "EH_problem"))
          (when (fto:treeElem|atBaseIsNode? $cwd)
            (insert (blee:panel:delimiterSection
                     @outLevel
                     (format "Decedent Links Of")
                     nil
                     (format "~%s~" $thisNode)        
                     :inDblock t))
            (insert "\n")
            
            (dolist ($eachSubDir (fto:node|atBaseGetDescendantsBases
                                  $cwd
                                  :expandedFileName t))
              (insert (blee:panel:delimiterFrontControl @outLevel :inDblock "yes"))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "line"))
              (insert "\n")
              )

            (insert (blee:panel:delimiterSection
                     @outLevel
                     (format "Siblings Links Of")
                     nil
                     (format "~%s~" $thisNode)        
                     :inDblock t))
            (insert "\n")
            
            (dolist ($eachSubDir (fto:node|atBaseGetSiblingsBases
                                  $cwd
                                  :expandedFileName t))
              (insert (blee:panel:delimiterFrontControl @outLevel :inDblock "yes"))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "line"))
              (insert "\n")
              )

            (insert (blee:panel:delimiterSection
                     @outLevel
                     (format "Ancestor Links Of")
                     nil
                     (format "~%s~" $thisNode)        
                     :inDblock t))
            (insert "\n")
            
            (dolist ($eachSubDir (fto:node|atBaseGetAncestorsBases $cwd))
              (insert (blee:panel:delimiterFrontControl @outLevel :inDblock "yes"))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "line"))
              (insert "\n")
              )
            )
          
          (insert (blee:panel:outLevelStr @outLevel))
          )
        )
      )

    (defun bodyContentLeaf ()
      "Descendents, Siblings and Ancestors of This Leaf."
      (let* (
            ($thisLeaf (fto:leaf|atBaseGetName $cwd))
            ($outString "")
            )          
        (when (string= @model "auto")
          (unless (fto:treeElem|atBaseIsLeaf? $cwd)
            (message "EH_problem"))
          (when (fto:treeElem|atBaseIsLeaf? $cwd)
            (insert (blee:panel:delimiterSection
                     @outLevel
                     (format "Siblings Links Of")
                     nil
                     (format "~%s~" $thisLeaf)        
                     :inDblock t))
            (insert "\n")
            
            (dolist ($eachSubDir (fto:leaf|atBaseGetSiblingsBases
                                  $cwd
                                  :expandedFileName t))
              (insert (blee:panel:delimiterFrontControl @outLevel :inDblock "yes"))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "line"))
              (insert "\n")
              )

            (insert (blee:panel:delimiterSection
                     @outLevel
                     (format "Ancestor Links Of")
                     nil
                     (format "~%s~" $thisLeaf)        
                     :inDblock t))
            (insert "\n")
            
            (dolist ($eachSubDir (fto:leaf|atBaseGetAncestorsBases $cwd))
              (insert (blee:panel:delimiterFrontControl @outLevel :inDblock "yes"))
              (insert (blee:panel:fto|atBaseTreeElementLinkStr $eachSubDir :format "line"))
              (insert "\n")
              )
            )
          
          (insert (blee:panel:outLevelStr @outLevel))
          )
        )
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


;;;
(defun org-dblock-write:blee:bxPanel:linkWithOrgFile  (@params)
  "Creates lined links for navigation surrounding current treeElem."
  (let* (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        (@dest (or (plist-get @params :dest) "."))
        (@destDesc (or (plist-get @params :destDesc) "auto"))
        (@foldDesc (or (plist-get @params :foldDesc) "auto"))                   
        ;;
        ($cwd @dest)    
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "Descendents, Siblings and Ancestors of This Node."
      (when (string= @model "auto")
        (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t))
        (insert (format
                 "[[elisp:(find-file \"%s\")][@ ~%s~ @]]   ::  [[elisp:(org-cycle)][| /%s/ |]] "
                 @dest
                 (blee:panel:fto|atBaseGetDestDesc @dest @destDesc)
                 (blee:panel:fto|atBaseGetFoldDesc @dest @foldDesc)              
                 ))
        (insert "                ")
        )
      )
            
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


;;;
(defun org-dblock-write:blee:bxPanel:linkWithTreeElem  (@params)
  "Creates lined links for navigation surrounding current treeElem."
  (let* (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line
        ;;
        (@model (or (plist-get @params :model) "auto"))
        (@dest (or (plist-get @params :dest) "."))
        (@destDesc (or (plist-get @params :destDesc) "auto"))
        (@foldDesc (or (plist-get @params :foldDesc) "auto"))
        (@agenda (or (plist-get @params :agenda) nil))                          
        ;;
        )

    ;;(setq @dest (expand-file-name @dest bx:panel:baseDir))
    (setq @dest (expand-file-name @dest))    

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "Descendents, Siblings and Ancestors of This Node."
      (when (string= @model "auto")
        (insert (blee:panel:delimiterFrontControl (1- @outLevel) :inDblock t))
        (insert (format
                 "[[elisp:(blee:bnsm:panel-goto \"%s\")][@ ~%s~ @]]   ::  [[elisp:(org-cycle)][| /%s/ |]] "
                 @dest
                 (blee:panel:fto|atBaseGetDestDesc @dest @destDesc)
                 (blee:panel:fto|atBaseGetFoldDesc @dest @foldDesc)              
                 ))
        ;;(insert "\n")
        ;;(org-dblock-write:blee:bxPanel:linedTreeNavigator @params)
        )
      )

    (when @sep (insert (blee:org:separatorStr (1- @outLevel))) (insert "\n"))
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    (when @agenda
      (message "In Agenda")
      (setq org-agenda-files
            (append org-agenda-files (list
                                      (concat (file-name-as-directory @dest)
                                              "fullUsagePanel-en.org"))))
      ;;; go to @dest, and run these dblocks there
      (with-temp-buffer
        (insert-file-contents (concat (file-name-as-directory @dest)
                                      "fullUsagePanel-en.org"))
        (setq default-directory (file-name-as-directory @dest))
        (blee:org-update-named-dblocks "blee:bxPanel:linkWithTreeElem")
        )
      )

    ))


;;;
(defun org-dblock-write:blee:bxPanel:linkWithLinedTreeNavigator  (@params)
  "Creates lined links for navigation surrounding current treeElem."
  (let* (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@model (or (plist-get @params :model) "auto"))
        (@dest (or (plist-get @params :dest) "."))
        (@destDesc (or (plist-get @params :destDesc) "auto"))
        (@foldDesc (or (plist-get @params :foldDesc) "auto"))                   
        ;;
        ($cwd @dest)    
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":model \"auto\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "Descendents, Siblings and Ancestors of This Node."
      (when (string= @model "auto")
        (insert (blee:panel:delimiterFrontControl (1- @outLevel) :inDblock t))
        (insert (format
                 "[[elisp:(blee:bnsm:panel-goto \"%s\")][@ ~%s~ @]]   ::  [[elisp:(org-cycle)][| /%s/ |]] "
                 @dest
                 (blee:panel:fto|atBaseGetDestDesc @dest @destDesc)
                 (blee:panel:fto|atBaseGetFoldDesc @dest @foldDesc)              
                 ))
        (insert "\n")
        (org-dblock-write:blee:bxPanel:linedTreeNavigator @params)
        )
      )
            
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))



(defun blee:str:org:stripDblocks (<orgInputString)
  "Strip lines that include dblocks."
  (let (
        ($resultLines (list))   
        ($orgInputLines (s-lines <orgInputString))
        )
    (dolist ($eachLine $orgInputLines)
      (unless (or
               (s-match "^####.BEGIN: " $eachLine)
               (s-match "^####.END" $eachLine)
               )
        (setq $resultLines (append $resultLines (list $eachLine)))
        ))
    (s-join "\n" $resultLines)
    ))

(defun org-dblock-write:blee:bxPanel:relatedPanelsOrig  (@params)
  "Lists related panels in two parts. 1) based on :panelsList -- 2) based on :inFile
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openFull" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@panelsList (or (plist-get @params :panelsList) "bxPanel"))
        (@inFile (or (plist-get @params :inFile) "sisterPanels.org"))   
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s  General Panels ::   [[img-link:file:/bisos/blee/env/images/bystarInside.jpg][http://www.by-star.net]] *|*  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/listOfDocs/fullUsagePanel-en.org\")][BxDE Top Panel]] *|* [[elisp:(blee:bnsm:panel-goto \"/libre/ByStar/InitialTemplates/activeDocs/planning/Main\")][ByStar Planning]]\n"
        (blee:panel:frontControl @outLevel :inDblock "yes")
        @panelsList
        ))
      (when (ignore-errors (get-string-from-file (format "%s" @inFile)))
        (setq $fileAsString (ignore-errors (get-string-from-file (format "%s" @inFile))))
        (insert (blee:str:org:stripDblocks $fileAsString))
        )

      (insert
       (format
        "%s%s_%s_%s"
        (blee:panel:outLevelStr @outLevel)
        (make-string 35 ? )
        ;;(make-string 30 ?=)
        (make-string 30 cfw:fchar-horizontal-line)              
        (make-string 25 ? )
        ))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:bxPanel:evolution :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:evolution  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@taskControls (or (plist-get @params :taskControls) "default"))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      (insert
       (format
        "%s%s_%s_\n"
        (blee:panel:outLevelStr @outLevel)
        (make-string 35 ? )
        ;;(make-string 30 ?=)
        (make-string 30 cfw:fchar-horizontal-line)              
        ))
      )

    (defun bodyContent ()
      (insert
       (format  "\
%s \
   [[elisp:(org-cycle)][| *Maintenance:* | ]]  [[elisp:(blee:menu-sel:agenda:popupMenu)][||Agenda]]  <<Evolution>> "
        (blee:panel:frontControl @outLevel :inDblock "yes")
        ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun org-dblock-write:blee:bxPanel:evolutionOld  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@taskControls (or (plist-get @params :taskControls) "default"))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format  "\
%s \
/Task Controls/ ::  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] || [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] ||  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] || [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] |
"
        "*"
        ))
      (insert
       (format  "\
%s \
   [[elisp:(org-cycle)][| *= Maintenance: =* | ]]  <<Evolution>>  "
        (blee:panel:frontControl @outLevel)
        ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:bxPanel:evolutionMaintainers :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:evolutionMaintainers  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
        ;;
        (@taskControls (or (plist-get @params :taskControls) "default"))
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format  "\
%s \
     [[elisp:(org-cycle)][| /Bug Reports, Development Team:/ | ]]  <<Maintainers>>  
"
        (blee:panel:frontControl @outLevel :inDblock "yes")
        ))
      (insert
       (format  "\
%s  Problem Report                       ::   [[elisp:(find-file \"\")][Send debbug Email]]
"
        (blee:panel:outLevelStr (+ 1 @outLevel))
        ))
      (insert
       (format  "\
%s  Maintainers                          ::   [[bbdb:Mohsen.*Banan]]  :: http://mohsen.1.banan.byname.net  E|\
"
        (blee:panel:outLevelStr (+ 1 @outLevel))
        ))

      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))



(defun org-dblock-write:blee:bxPanel:thisFile  (@params)
  "This File. Used to be
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@origin (or (plist-get @params :origin) ""))
        ;;
        ($out-string)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (setq $out-string (concat "*  This File :: *= " buffer-file-name " =* E|"))
      (if (not (string-equal "" @origin))
          (setq $out-string (concat $out-string "\n** Origin    :: /libre/ByStar/InitialTemplates/activeDocs/common/activitiesPanels/" $origin))
        )
      (insert $out-string)
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(defun org-dblock-write:blee:bxPanel:bashControls  (@params)
  "Bash Controls. :style is expected to be openCloseBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format  "%s \
 [[elisp:(org-cycle)][|#Sh|]] :: (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh -i currentsGetThenShow\")][Show Currents]]  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh\")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][| ]]
"
        "*"
        ))
      (insert
       (format  "%s \
 #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(lsip-local-run-command-here \"echo pushd dest\")][echo pushd dir]] || [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] || [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] |\
"
        "**"
        ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(defun org-dblock-write:blee:bxPanel:destinationControls  (@params)
  "Destination Controls. :style is expected to be openCloseBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format  "%s \
 [[elisp:(org-cycle)][|#Destinations|]] :: [[Evolution]] | [[Maintainers]]  [[elisp:(org-cycle)][| ]]
"
        (blee:panel:outLevelStr @outLevel)
        ))
      (insert
       (format  "%s \
 #See:  [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]  E|\
"
        (blee:panel:outLevelStr (+ 1 @outLevel))
        ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:bxPanel:topPanelControls :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:topPanelControls  (@params)
  "Top Controls. :style is expected to be openCloseBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@origin (or (plist-get @params :origin) ""))
        ;;
        ($out-string)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s \
 [[elisp:(org-cycle)][|#Control|]] :: [[elisp:(blee:bnsm:menu-back)][Back]] [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]] [[elisp:(save-buffer)][Save]] [[elisp:(kill-buffer)][Quit]] [[elisp:(bury-buffer)][Bury]]  [[elisp:(magit)][Magit]]  [[elisp:(org-cycle)][| ]]
"
        "*"
        ))
      (insert
       (format
        "%s \
 [[elisp:(bap:magit:bisos:current-bpo-repos/visit)][BPO-Repos-Magit]] ||
"
        "**"
        ))
      (insert
       (format
        "%s \
 [[elisp:(blee:buf:re-major-mode)][Re-Major-Mode]] ||  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(org-dblock-bx-blank-buffer)][Blank Buf Dblocks]] || [[elisp:(bx:panel:variablesShow)][bx:panel:variablesShow]]
"
        "**"
        ))

      (insert
       (format
        "%s \
 [[elisp:(blee:menu-sel:comeega:maintenance:popupMenu)][||Maintenance]] 
"
        "**"
        ))


      (setq $out-string (concat "**  This File :: *= " buffer-file-name " =* \n"))
      (if (not (string-equal "" @origin))
          (setq $out-string (concat $out-string "\n** Origin    :: /libre/ByStar/InitialTemplates/activeDocs/common/activitiesPanels/" $origin))
        )
      (insert $out-string)
      
      (insert
       (format
        "%s \
 [[elisp:(org-cycle)][|#Select|]]  :: (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh -i currentsGetThenShow\")][Show Currents]]  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh\")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][| ]]
"
        "*"
        ))
      (insert
       (format  "%s \
 #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(lsip-local-run-command-here \"echo pushd dest\")][echo pushd dir]] || [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] || [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] |\
"
        "**"
        ))

      (insert "\n")
      
      (insert
       (format  "%s \
 [[elisp:(org-cycle)][|#Destinations|]] :: [[Evolution]] | [[Maintainers]]  [[elisp:(org-cycle)][| ]]
"
        (blee:panel:outLevelStr (+ 1 @outLevel))
        ))
      
      (insert
       (format  "%s \
 #See:  [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]\
"
        (blee:panel:outLevelStr (+ 1 @outLevel))
        ))
      

      (insert
       (format
        "\
  E|\
"
        ))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:bxPanel:footerPanelControls :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:footerPanelControls  (@params)
  "Similar to topPanelControls but for bottom. :style is expected to be closeBlank.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@panelsList (or (plist-get @params :panelType) "bxPanel"))
        (@inFile (or (plist-get @params :inFile) "panelSisters.org"))   
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "
%s /Footer Controls/ ::  [[elisp:(blee:bnsm:menu-back)][Back]]  [[elisp:(toggle-read-only)][toggle-read-only]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Glob Vis]]  [[elisp:(delete-other-windows)][1 Win]]  [[elisp:(save-buffer)][Save]]   [[elisp:(kill-buffer)][Quit]] \
"
        "*"
        ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

;;;
;;; (blee:org:agenda:category-get)
;;; 
(defun blee:org:agenda:category-get ()
  (format "%s:%s"
          (fto:treeElem|atBaseGetTypeAsLetter (file-name-directory buffer-file-name))
          (fto:treeElem|atBaseGetName (file-name-directory buffer-file-name))
          ))

(advice-add 'org-dblock-write:blee:bxPanel:footerOrgParams :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:footerOrgParams (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@panelsList (or (plist-get @params :panelType) "bxPanel"))
        (@inFile (or (plist-get @params :inFile) "panelSisters.org"))   
        ;;
        ($fileAsString)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s    [[elisp:(org-cycle)][| *= Org-Mode Local Params: =* | ]]\n"
        (blee:panel:frontControl @outLevel :inDblock "yes")
        ))

      (insert
       (format "\
#+STARTUP: overview
#+STARTUP: lognotestate
#+STARTUP: inlineimages
#+SEQ_TODO: TODO WAITING DELEGATED | DONE DEFERRED CANCELLED
#+TAGS: @desk(d) @home(h) @work(w) @withInternet(i) @road(r) call(c) errand(e)
#+CATEGORY: %s\
"
               (blee:org:agenda:category-get)    
               ))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


;;;
;;; (give-me-comment-starters-ender-for-a-mode 'emacs-lisp-mode)
;;; (blee:mode:commentStartGet 'emacs-lisp-mode)
;;; (blee:mode:commentStartGet 'org-mode)
;;; (blee:mode:commentStartGet 'latex-mode)
;;; (blee:mode:commentStartGet 'shell-script-mode)
;;; (blee:mode:commentEndGet 'shell-script-mode)

(defun blee:mode:commentStartGet (mode)
  "Returns a  comment-start of arg MODE"
  (with-temp-buffer
    (funcall mode)
    comment-start))

(defun blee:mode:commentEndGet (mode)
  "Returns comment-end of arg MODE"
  (with-temp-buffer
    (funcall mode)
    comment-end))


(advice-add 'org-dblock-write:blee:bxPanel:footerEmacsParams :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:footerEmacsParams (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@primMode (or (plist-get @params :primMode) (symbol-name major-mode)))
        (@latexMasters (or (plist-get @params :latexMasters) nil))      
        ;;
        ($commentStartStr)
        ($primModeSymb)
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":primMode \"emacs-lisp\"|\"org-Mode\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s    [[elisp:(org-cycle)][| *= Emacs Local Params: =* | ]]\n"
        (blee:panel:frontControl @outLevel :inDblock "yes")
        ))

      (setq $primModeSymb (intern @primMode))

      (setq $commentStartStr (blee:mode:commentStartGet $primModeSymb))

      (mapcar (lambda (x)
                (insert
                 (format "%s%s\n"
                         $commentStartStr
                         x
                         )))
              
              (s-lines
               (format "\
Local Variables:
eval: (setq-local ~selectedSubject \"noSubject\")
eval: (setq-local ~primaryMajorMode '%s)
eval: (setq-local ~blee:panelUpdater nil)
eval: (setq-local ~blee:dblockEnabler nil)
eval: (setq-local ~blee:dblockController \"interactive\")
eval: (img-link-overlays)"

                       @primMode
                       ))
              )
      
      (when (string= @primMode "latex-mode")
        (mapcar (lambda (x)
                  (insert
                   (format "%s%s\n"
                           $commentStartStr
                           x
                           )))
                
                (s-lines
                 (format "\
eval: (setq-local ~lcnt:texClass nil)
eval: (setq-local ~lcnt:bibProvider nil)
eval: (setq-local ~lcnt:paperSize nil)"
                         ))
                )
         
        )

      (when (string= @primMode "org-mode")
        (mapcar (lambda (x)
                  (insert
                   (format "%s%s\n"
                           $commentStartStr
                           x
                           )))
                
                (s-lines
                 (format "\
eval: (set-fill-column 115)
eval: (blee:fill-column-indicator/enable)"
                         ))
                )
         
        )

      (when @latexMasters
        (insert (format "%sTeX-master: \"%s\"\n"
                        $commentStartStr
                        @latexMasters
                        ))
        )
      
      (mapcar (lambda (x)
                (insert
                 (format "%s%s\n"
                         $commentStartStr
                         x
                         )))
              
              (s-lines
                 (format "\
eval: (bx:load-file:ifOneExists \"./panelActions.el\")
End:"
                         ))
              )
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(defun org-dblock-write:bx:dblock:org:parameters (params)
  "Old Style. Kept for backwards comptibilitty. Also shown to pean."
  (let ((bx:types (or (plist-get params :types) ""))
        )
    (when (equal bx:types "agenda")
      ;;;(insert "#+STARTUP: showall
      (insert "#+STARTUP: lognotestate
#+SEQ_TODO: TODO WAITING DELEGATED | DONE DEFERRED CANCELLED
#+TAGS: @desk(d) @home(h) @work(w) @withInternet(i) @road(r) call(c) errand(e)"
              )
      )
    (when (equal bx:types "menu")
      (insert "#+STARTUP: showall")
      )
   ;;(insert (format "Unknon param: %s" bx:types))
   )
  )

(defun bx:dblock|reInsertContent (<content)
  "Re Insert Content Of A Dblock"
  (org-beginning-of-dblock)
  (org-prepare-dblock)
  (insert <content)  
  (kill-line)
  )

(defun bx:dblock:control|wrapper (<origFunc &rest <params)
  "Enforces common features of bx:dblocks. including :lock, ~blee:dblockController.
If there is no :lock and ~blee:dblockController is blank, then blank it. (look at existing code)
If there is :lock and ~blee:dblockController is blank, then reinsert content.
If there is :lock and ~blee:dblockController is not blank, then subject it to ~blee:dblockEnabler.
"

  (let (
        (<content)
        (<name)
        (<lock)
        ($paramsAsParams)
        )


    ;;
    ;; <params is passed as a list of a list.
    ;; $paramsAsParams is a plist usable  list.
    ;;
    (defun paramsAsParams (<params) <params)
    (setq $paramsAsParams (apply 'paramsAsParams <params))      
    
    (setq <content (plist-get $paramsAsParams :content))
    (setq <name (plist-get $paramsAsParams :name))

    ;;; unspecified lock is nil
    (when (plist-member $paramsAsParams :lock)
      (setq <lock (plist-get $paramsAsParams :lock)))
    (unless (plist-member $paramsAsParams :lock)
      (setq <lock nil))

    (when (not (boundp '~blee:dblockController))
      (setq-local ~blee:dblockController "interactive")
      (message "OOPS -- ~blee:dblockController interactive")
      )

    (when (not (boundp '~blee:dblockEnabler))
      (setq-local ~blee:dblockEnabler nil)
      (message "OOPS -- ~blee:dblockEnabler nil")
      )
    
    (defun disabledReport ()
      (setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
      (when (string= ~blee:dblockController "interactive")
        (display-warning "dblock" (format
                                   "%s dblock skipped due to lock and blee:dblockEnabler %s\n"
                                   <name (time-stamp-string))))
      (when (string= ~blee:dblockController "update")
        (message (format
                  "%s dblock skipped due to lock and blee:dblockEnabler %s\n"
                  <name (time-stamp-string))))
      (bx:dblock|reInsertContent <content)
      )

    (when (string= ~blee:dblockController "blank")
      (message "blee-org-dblock-wrapper -- Blanking dblock")
      (when <lock
        (bx:dblock|reInsertContent <content))
      (unless <lock
        (org-dblock-bx-blank-this))
      )

    (unless (string= ~blee:dblockController "blank")
      (when <lock 
        (when ~blee:dblockEnabler
          (apply <origFunc <params))
        (unless ~blee:dblockEnabler
            (disabledReport))
        )
      (unless <lock
        (apply <origFunc <params)
        )
      )
    ))

       

(defun blee:dblockEnablerFunc-OBSOLETED (@origFunc &rest @params)
  "Experiment with  (compile-time-function-name) to see if we get @origFunc name.

Mystery: (apply 'disabledReport @params) works. (disabledReport @params) does not. @params are not accessible after &rest.

NOTYET, See if this can be improved to include bx:dblock:governor:process when
@origFunc returns a plist of contentPlus, content, helpLine functions.
"

  (defun disabledReport (@params)
      (let (
            (@content (plist-get @params :content))
            (@name (plist-get @params :name))   
            )
        (setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
        ;;(insert (format "%s dblock skipped due to blee:dblockEnabler %s\n" @name (time-stamp-string)))
        (display-warning "dblock" (format
                                   "%s dblock skipped due to blee:dblockEnabler %s\n"
                                   @name (time-stamp-string)))
        ;;(insert (format "%s" @content))
        (insert @content)
        ;; solution below does not work
        ;;(org-kill-line)   ;;; @content adds an extra line at the end -- need this as it can be repeated
        )
      )
  (when ~blee:dblockEnabler
    (apply @origFunc @params)
    )
  (unless ~blee:dblockEnabler
    (apply 'disabledReport @params)      
    )
  )

;;; (advice-add 'org-dblock-write:blee:bxPanel:runResult :around #'blee:dblockEnablerFunc)
;;; (advice-remove 'org-dblock-write:blee:bxPanel:runResult #'blee:dblockEnablerFunc)

(advice-add 'org-dblock-write:blee:bxPanel:runResult :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:bxPanel:runResult (@params)
  "@command, @comment and @results control the behaviour.

** When @results is nil, D-Run and Results are eliminated
** When @results is t, both stdout and stderr are captured
** When @results is \"stdout\", only stdout is captured
** When @results is not specified, same a t
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@command (or (plist-get @params :command) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))      
        (@results (or (plist-get @params :results) nil))
        (@content (plist-get @params :content))
        (@name (plist-get @params :name))               
        ;;(@stdErr (and (plist-get @params :stdErr) t))
        ;;
        ($stdErrStr "")
        ($stdOutOnlyIndicator "")
        ($name "")
        )

    ;;; unspecified results is t
    (unless (plist-member @params :results)
      (setq @results t))

    (when (string-equal "none" @results)
      (setq @results nil))
    
    ;;(insert (format "%s dblock skipped due to blee:dblockEnabler\n" @name))
    
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (when (string-equal "stdout" @results)
        (setq $stdErrStr " 2> /dev/null")
        (setq $stdOutOnlyIndicator "stdout "))     


      (insert
       (format
        "%s" (blee:panel:delimiterFrontControl @outLevel
                                             :inDblock t
                                             )))

   
      ;;(insert "   [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  ")

      (insert "    ")
      
      ;;(insert (format "results %s" @results))
      
      (when @results

        (insert (format "[[elisp:(org-cycle)][| /%sResults:/ |]] " $stdOutOnlyIndicator))
        
        (insert " [[elisp:(blee:org-update-named-dblocks-above)][D-Run]]")

        (insert " :: ") 

        )

      (insert (blee:panel:button:shCommand @command))
      
      (when @comment
        (insert " *|* ")
        (insert 
         (format " =%s=" @comment)))

      
      (when @afterComment
        (insert " *|* ")        
        (insert (format " %s " @afterComment)))

 
      (when @results
        (insert " |\n")
        (setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
        (insert (format "Last Executed at: %s  by: %s on: %s\n" (time-stamp-string) (user-login-name) (system-name)))      

        (insert "----------------------------\n")

        ;;(insert
         ;;(shell-command-to-string 
          ;;(format "source ~/.bashrc; %s %s" @command $stdErrStr))
         ;;)

        (insert
         (shell-command-to-string 
          (format "%s" @command))
         )

        )
      )

    (when (not @results)
      (setq @style (list "openBlank" "closeContinue"))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun org-dblock-write:blee:bxPanel:runResultOrig (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeFull"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        ;;
        (@command (or (plist-get @params :command) ""))
        (@comment (or (plist-get @params :comment) nil))        
        (@stdErr (and (plist-get @params :stdErr) t))
        ;;
        ($stdErrStr "")
        )

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
        "%s" (blee:panel:foldingSection @outLevel
                                        "Results"
                                        nil
                                        nil
                                        :inDblock t
                                        )))
      
      (insert "[[elisp:(blee:org-update-named-dblocks-above)][D-Run]]")

      (when @comment
        (insert 
         (format " /%s/" @comment)))
 
      (insert " || ")      

      (insert (blee:panel:button:shCommand @command))
      
      (insert " |\n")

      (unless @stdErr
        (setq $stdErrStr " 2> /dev/null"))

      (setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
      (insert (format "Last Executed at: %s  by: %s on: %s\n" (time-stamp-string) (user-login-name) (system-name)))      

      (insert "----------------------------\n")

      (insert
       (shell-command-to-string 
        (format "source ~/.bashrc; %s %s" @command $stdErrStr))
       )
      )
       

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))



(advice-add 'org-dblock-write:blee:panel:unix:cmnd :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:unix:cmnd (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@command (or (plist-get @params :command) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))
      
      (unless @folding?
        (insert (format " /%s/ :: " @label)))
      (when @folding?
        (insert (format " [[elisp:(org-cycle)][| /%s/ |]] :: " @label)))
      
      (insert (blee:panel:button:shCommand @command))
      
      (when @comment
        (insert " *|* ")
        (insert 
         (format " =%s=" @comment)))

      (when @afterComment
        (insert " *|* ")        
        (insert (format " %s " @afterComment)))
      )

    (setq @style (list "openBlank" "closeContinue"))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(advice-add 'org-dblock-write:blee:panel:unix:cmndIntro :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:unix:cmndIntro (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@command (or (plist-get @params :command) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))
      
      (unless @folding?
        (insert (format " /%s/ :: " @label)))
      (when @folding?
        (insert (format " [[elisp:(org-cycle)][| /%s/ |]] :: " @label)))
      
      (insert (blee:panel:button:shCommand @command))
      
      (when @comment
        (insert " *|* ")
        (insert 
         (format " =%s=" @comment)))

      (when @afterComment
        (insert " *|* ")        
        (insert (format " %s " @afterComment)))
      )

    (setq @style (list "openBlank" "closeContinue"))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun bx:panel:label|basedOnFolding (<label <folding?)
  "Return a string for the label based on folding."
  (let (
        ($result)
        )
      (unless <folding?
        (setq $result (format " /%s/ :: " <label)))
      (when <folding?
        (setq $result (format " [[elisp:(org-cycle)][| /%s/ |]] :: " <label)))
      $result
      ))

(defun bx:panel:comment|produce (<comment)
  "Return a string for the label based on folding."
  (let (
        ($result nil)
        )
    (when @comment
      (setq $result (format " *|*  =%s=" <comment)))
    $result
    ))

(defun bx:panel:afterComment|produce (<afterComment)
  "Return a string for the label based on folding."
  (let (
        ($result nil)
        )
    (when @afterComment
      (setq $result (format " *|*  %s" <afterComment)))
    $result
    ))


(advice-add 'org-dblock-write:blee:panel:icm:bash:intro :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:icm:bash:intro (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style 
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@icmName (or (plist-get @params :icmName) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))

      (bx:str:insert (bx:panel:label|basedOnFolding @label @folding?))
      
      (insert (blee:panel:icm:bash:intro @icmName))

      (bx:str:insert (bx:panel:comment|produce @comment))

      (bx:str:insert (bx:panel:afterComment|produce @afterComment))
      )
 
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(advice-add 'org-dblock-write:blee:panel:icm:bash:cmnd :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:icm:bash:cmnd (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@command (or (plist-get @params :icmName) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))
      
      (unless @folding?
        (insert (format " /%s/ :: " @label)))
      (when @folding?
        (insert (format " [[elisp:(org-cycle)][| /%s/ |]] :: " @label)))
      
      (insert (blee:panel:button:shCommand @command))
      
      (when @comment
        (insert " *|* ")
        (insert 
         (format " =%s=" @comment)))

      (when @afterComment
        (insert " *|* ")        
        (insert (format " %s " @afterComment)))
      )

    (setq @style (list "openBlank" "closeContinue"))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))



(advice-add 'org-dblock-write:blee:panel:icm:py:intro :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:icm:py:intro (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style 
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@icmName (or (plist-get @params :icmName) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))

      (bx:str:insert (bx:panel:label|basedOnFolding @label @folding?))
      
      (insert (blee:panel:icm:bash:intro @icmName))

      (bx:str:insert (bx:panel:comment|produce @comment))

      (bx:str:insert (bx:panel:afterComment|produce @afterComment))
      )
 
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))

(advice-add 'org-dblock-write:blee:panel:icm:py:cmnd :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:icm:py:cmnd (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@command (or (plist-get @params :icmName) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))
      
      (unless @folding?
        (insert (format " /%s/ :: " @label)))
      (when @folding?
        (insert (format " [[elisp:(org-cycle)][| /%s/ |]] :: " @label)))
      
      (insert (blee:panel:button:shCommand @command))
      
      (when @comment
        (insert " *|* ")
        (insert 
         (format " =%s=" @comment)))

      (when @afterComment
        (insert " *|* ")        
        (insert (format " %s " @afterComment)))
      )

    (setq @style (list "openBlank" "closeContinue"))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun bx:str:insert (<str)
  "Insert <str unless nil"
  (when <str
    (insert <str)))

(defun bx:panel:sep|whenRequired (<sep? <outLevel)
  "Return a seperator string or nil"
  (let (
        ($result nil)
        )
    (when <sep?
      (setq $result (format "%s\n" (blee:org:separatorStr <outLevel)))
      )
    $result
    ))


(advice-add 'org-dblock-write:blee:panel:file:text/intro :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:blee:panel:file:text/intro (@params)
  "@command, @comment and @afterComment control the behaviour.
Similar to runResult with results as nil.
"
  (let (
        (@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
        (@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
        (@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style 
        (@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
        (@sep (or (plist-get @params :sep) nil))    ;; seperator line           
        ;;
        (@label (or (plist-get @params :label) nil))
        (@folding? (or (plist-get @params :folding?) nil))      
        ;;
        (@fileName (or (plist-get @params :fileName) ""))
        (@comment (or (plist-get @params :comment) nil))
        (@afterComment (or (plist-get @params :afterComment) nil))
        ;;
        )

    ;;; unspecified results is t
    ;;(unless (plist-member @params :results)
    ;;  (setq @results t))

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (bx:str:insert (bx:panel:sep|whenRequired @sep @outLevel))

      (insert (blee:panel:delimiterFrontControl @outLevel :inDblock t ))

      (bx:str:insert (bx:panel:label|basedOnFolding @label @folding?))
      
      (insert (blee:panel:file:text|intro @fileName))

      (bx:str:insert (bx:panel:comment|produce @comment))

      (bx:str:insert (bx:panel:afterComment|produce @afterComment))
      )
 
    (bx:dblock:governor:process @governor @extGov @style @outLevel
                                (compile-time-function-name)
                                'helpLine
                                'bodyContentPlus
                                'bodyContent
                                )

    ))


(defun bx:panel:variablesShow ()
  "Relevant Buffer Local Variables Are "
  (interactive)
  
  (let ((buffer-name (generate-new-buffer-name "bleePanelVars"))
        (aggregatedStr
         (with-output-to-string
           (princ "This Panel's Variables\n")
           (princ "============================================\n")
           (princ (format "~selectedSubject:\t %S\n" ~selectedSubject))
           (princ (format "~primaryMajorMode:\t %S\n" ~primaryMajorMode))          
           (princ "============================================\n")
           )
         ))
    (switch-to-buffer buffer-name)
    (insert aggregatedStr)))



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-general"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-general)
;;;#+END:
