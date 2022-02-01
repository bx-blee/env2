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


;;(require 'bx-lcnt-lib)

(defun insertTripleQuotes ()
  (insert "\"\"\""))

(defun insertTripleQuotesOrgBegin ()
  (insert "\"\"\" #+begin_org"))

(defun insertTripleQuotesOrgEnd ()
  (insert "#+end_org \"\"\""))


(defun org-dblock-write:bx:icm:python:top-of-file (params)
  (let ((bx:vc (or (plist-get params :vc) ""))
        (bx:partof (or (plist-get params :partof) ""))
        (bx:copyleft (or (plist-get params :copyleft) ""))
        (out-string)
        )
    (insertTripleQuotesOrgBegin)
    (insert "\n")
    
    (setq out-string (concat "*  This file:" buffer-file-name))
    (insert out-string)
    (insert " :: [[elisp:(org-cycle)][| ]]\n")
    
    (when (equal bx:partof "bystar")
      (insert " is part of The Libre-Halaal ByStar Digital Ecosystem. http://www.by-star.net
")
      )

    (when (equal bx:copyleft "halaal+minimal")
      (insert " *CopyLeft*  This Software is a Libre-Halaal Poly-Existential. See http://www.freeprotocols.org")
      nn)
    
    (when (equal bx:copyleft "halaal+brief")
      (insert "** Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
** See PLPC-120001 for restrictions.
**  This is a Halaal Poly-Existential intended to remain perpetually Halaal.\
")
      )
    
    (insert "\n")
    
    (insert " A Python Interactively Command Module (PyICM).\n")
    (insert " Best Developed With COMEEGA-Emacs And Best Used With Blee-ICM-Players.\n")
    (insert " *WARNING*: All edits wityhin Dynamic Blocks may be lost.\n")

    (insertTripleQuotesOrgEnd)
    ))


(defun org-dblock-write:bx:icm:python:topControls (params)
  (let (
        (out-string)
        )
    (insertTripleQuotesOrgBegin)
    (insert "\n")

    (insert "*  [[elisp:(org-cycle)][|/Controls/| ]] :: [[elisp:(org-show-subtree)][|=]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]")

    (insert "\n")
    
    (insert "** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]")
    
    (insert "\n")

    (insertTripleQuotesOrgEnd)
    ))

;;;
;;; mainOnly -- mainForModule -- moduleForMain
;;;

(defun org-dblock-write:bpf:icm:py3:mainOnly (@params)
  "Insert both moduleForMain and mainForModule."
  (let (
        ($moduleBase (or (plist-get @params :moduleBase) ""))
        ($moduleName (or (plist-get @params :moduleName) ""))        
         )
     (insert (format "
from unisos import icm
from %s import %s

if __name__ == \"__main__\":
    icm.g_icmMain(
        icmInfo=%s.icmInfo,
        noCmndEntry=%s.examples,  # noCmndEntry=mainEntry,
        extraParamsHook=%s.g_paramsExtraSpecify,
        importedCmndsModules=%s.g_importedCmndsModules,
    )
"
                    $moduleBase $moduleName $moduleName $moduleName $moduleName $moduleName
                    ))
    ))

(defun org-dblock-write:bpf:icm:py3:moduleForMain (@params)
  "Insert both moduleForMain and mainForModule."
  (let (
        ($moduleBase (or (plist-get @params :moduleBase) ""))
        ($moduleName (or (plist-get @params :moduleName) ""))        
         )
     (insert (format "
from unisos import icm
from %s import %s
"
                    $moduleBase $moduleName
                    ))
    ))

(defun org-dblock-write:bpf:icm:py3:mainForModule (@params)
  "Insert both moduleForMain and mainForModule."
  (let (
        ($moduleBase (or (plist-get @params :moduleBase) ""))
        ($moduleName (or (plist-get @params :moduleName) ""))        
         )
     (insert (format "
if __name__ == \"__main__\":
    icm.g_icmMain(
        icmInfo=%s.icmInfo,
        noCmndEntry=%s.examples,  # noCmndEntry=mainEntry,
        extraParamsHook=%s.g_paramsExtraSpecify,
        importedCmndsModules=%s.g_importedCmndsModules,
    )
"
                    $moduleName $moduleName $moduleName $moduleName
                    ))
    ))

(defalias 'org-dblock-write:bx:icm:python:section 'org-dblock-write:bx:dblock:python:section)

(defun org-dblock-write:bx:dblock:python:section (@params)
  ""
  (let (
        ($title (or (plist-get @params :title) ""))
        )
    (insert
     (format "\"\"\"\n*\
  [[elisp:(beginning-of-buffer)][Top]] ############## [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]    *%s*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
\"\"\""
             $title
             ))))

(defun org-dblock-write:bx:icm:py3:section (@params)
  ""
  (let (
        ($title (or (plist-get @params :title) ""))
        ($comment (or (plist-get @params :comment) "")) 
        )
    
    (sectionTitleOpenInsert (format
                             "/Section/   "))
    
    (insert (format " *%s*" $title))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))
       
    (sectionTitleCloseInsertNoNewLine "")
    ))

(defun org-dblock-write:bx:icm:python:cmnd:subSection (@params)
  ""
  (let (
        ($title (or (plist-get @params :title) ""))
        ($context (or (plist-get @params :context) "")) 
        )
    (defun level1()
      (insert
       (format "    \"\"\"\n**\
  %s          *%s*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
\"\"\""
               (comeegaNativeControls)
               $title
               ))
      )      
    (defun level2()
      (insert
       (format "        \"\"\"\n**\
  %s          *%s*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
\"\"\""
               (comeegaNativeControls)
               $title
               ))
      )      
    
    (when (string= $context "")
      (level2)
      )
    (when (string= $context "func-1")
      (level1)
      )
    (when (string= $context "method-1")
      (level2)
      )
    )
  )


(defalias 'org-dblock-write:bx:icm:python:subSection 'org-dblock-write:bx:dblock:python:subSection)

(defun org-dblock-write:bx:dblock:python:subSection (@params)
  ""
  (let (
        ($title (or (plist-get params :title) ""))
        )
    (insert
     (format "\"\"\"\n*\
  [[elisp:(beginning-of-buffer)][Top]] ============== [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]          *%s*  [[elisp:(org-cycle)][| ]]  [[elisp:(org-show-subtree)][|=]] 
\"\"\""
             $title
             ))))


(defalias 'org-dblock-write:bx:icm:python:subSubSection 'org-dblock-write:bx:dblock:python:subSubSection)


(defun org-dblock-write:bx:dblock:python:subSubSection (@params)
  ""
  (let (
        ($title (or (plist-get params :title) ""))
        )
    (insert
     (format "\"\"\"\n*\
  [[elisp:(beginning-of-buffer)][Top]] --------------- [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(delete-other-windows)][(1)]]              *%s*
\"\"\""
             $title
             ))))

(defun org-dblock-write:bx:icm:py3:func (@params)
  "Insert Header
"
  (let (
        ($funcName (or (plist-get @params :funcName) ""))
        ($funcType (or (plist-get @params :funcType) ""))
        ($decorate (or (plist-get @params :deco) ""))
        ($comment (or (plist-get @params :comment) "")) 
        ($argsListStr (or (plist-get @params :argsList) ""))
        ($argsList)
        )
    (setq $argsList (split-string $argsListStr))
    (sectionTitleOpenInsert (format
                             "Func-%s" $funcType))

    

    (insert (format " /%s/" $funcName))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))

    (if (not (string= $decorate ""))
        (insert (format " deco=%s" $decorate)))
    
    (sectionTitleCloseInsert "")

    (if (string= $decorate "default")
        (setq $decorate "icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)"))

    (if (not (string= $decorate ""))
        (insert (format "@%s\n" $decorate)))
    
    (insert
     (format "def %s(" $funcName))
    ))



(defalias  'org-dblock-write:bx:icm:python:func 'org-dblock-write:bx:dblock:python:func)

(defun org-dblock-write:bx:dblock:python:func (@params)
  "Insert Header
"
  (let (
        ($funcName (or (plist-get @params :funcName) ""))
        ($funcType (or (plist-get @params :funcType) ""))
        ($retType (or (plist-get @params :retType) "")) 
        ($decorate (or (plist-get @params :deco) ""))
        ($comment (or (plist-get @params :comment) "")) 
        ($argsListStr (or (plist-get @params :argsList) ""))
        ($argsList)
        )
    (setq $argsList (split-string $argsListStr))
    (sectionTitleOpenInsert (format
                             "Func-%s" $funcType))

    

    (insert (format " /%s/" $funcName))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))

    (insert
     (format " retType=%s argsList=%s"
             $retType $argsList
             ))

    (if (not (string= $decorate ""))
        (insert (format " deco=%s" $decorate)))
    
    (sectionTitleCloseInsert "")

    (if (string= $decorate "default")
        (setq $decorate "icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)"))

    (if (not (string= $decorate ""))
        (insert (format "@%s\n" $decorate)))
    
    (insert
     (format "def %s(" $funcName))

    (when (not (string= $argsListStr ""))
      (insert "\n")
      (mapcar (lambda (x)
                (insert
                 (format "    %s,\n"
                         x
                         )))
              $argsList
              )
      )
    
    (insert
     (format "):"))
    ))


(defalias 'org-dblock-write:bx:icm:python:icmItem 'org-dblock-write:bx:dblock:python:icmItem)

(defun org-dblock-write:bx:dblock:python:icmItem (@params)
  "Insert Header
"
  (let (
        ($itemType (or (plist-get @params :itemType) ""))
        ($itemTitle (or (plist-get @params :itemTitle) ""))
        ($comment (or (plist-get @params :comment) "")) 
        )
    
    (sectionTitleOpenInsert (format
                             "%s" $itemType))
    
    (insert (format " %s" $itemTitle))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))
       
    (sectionTitleCloseInsertNoNewLine "")
    ))



(defun org-dblock-write:bx:dblock:python:enum (@params)
  "Insert Header
"
  (let (
        ($enumName (or (plist-get @params :enumName) ""))
        ($comment (or (plist-get @params :comment) "")) 
        )
    (sectionTitleOpenInsert (format
                             "Enum"))
    
    (insert (format " /%s/" $enumName))


    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))
         
    (sectionTitleCloseInsert "")

    (insert
     (format "@enum.unique\nclass %s(enum.Enum):" $enumName))
    ))


(defalias  'org-dblock-write:bx:icm:python:class 'org-dblock-write:bx:dblock:python:class)

(defun org-dblock-write:bx:dblock:python:class (@params)
  "Insert Header
"
  (let (
        ($className (or (plist-get @params :className) ""))
        ($superClass (or (plist-get @params :superClass) ""))
        ($comment (or (plist-get @params :comment) "")) 
        ($classType (or (plist-get @params :classType) ""))
        )
    (sectionTitleOpenInsert (format
                             "Class-%s" $classType))
    
    (insert (format " /%s/" $className))

    (if (string= $superClass "")
        (setq $superClass "object"))
    
    (insert (format " %s" $superClass))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))
         
    (sectionTitleCloseInsert "")

    (insert
     (format "class %s(%s):" $className $superClass))
    ))


(defun org-dblock-write:bx:icm:python:method (@params)
  "Insert Header
"
  (let (
        ($methodName (or (plist-get @params :methodName) ""))
        ($methodType (or (plist-get @params :methodType) ""))
        ($retType (or (plist-get @params :retType) "")) 
        ($decorate (or (plist-get @params :deco) ""))
        ($comment (or (plist-get @params :comment) "")) 
        ($argsListStr (or (plist-get @params :argsList) ""))
        ($argsList)
        )
    (setq $argsList (split-string $argsListStr))
    (subSectionTitleOpenInsertMethod (format
                             "Method-%s" $methodType))

    

    (insert (format " /%s/" $methodName))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))

    (insert
     (format " retType=%s argsList=%s"
             $retType $argsList
             ))

    (if (not (string= $decorate ""))
        (insert (format " deco=%s" $decorate)))
    
    (sectionTitleCloseInsert "")

    (if (string= $decorate "default")
        (setq $decorate "icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)"))

    (if (not (string= $decorate ""))
        (insert (format "    @%s\n" $decorate)))

    (if (string= $argsListStr "")
        (insert
         (format "    def %s(self):" $methodName))
      (insert
       (format "    def %s(\n        self," $methodName))
      

    (when (not (string= $argsListStr ""))
      (insert "\n")
      (mapcar (lambda (x)
                (insert
                 (format "        %s,\n"
                         x
                         )))
              $argsList
              )
      (insert
       (format "    ):"))
      )
    )))


(defun org-dblock-write:bx:icm:py3:method (@params)
  "Insert Header
"
  (let (
        ($methodName (or (plist-get @params :methodName) ""))
        ($methodType (or (plist-get @params :methodType) ""))
        ($decorate (or (plist-get @params :deco) ""))
        ($comment (or (plist-get @params :comment) "")) 
        ($argsListStr (or (plist-get @params :argsList) ""))
        ($argsList)
        )
    (setq $argsList (split-string $argsListStr))
    (subSectionTitleOpenInsertMethod (format
                             "Method-%s" $methodType))

    (insert (format " /%s/" $methodName))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))

    (if (not (string= $decorate ""))
        (insert (format " deco=%s" $decorate)))
    
    (sectionTitleCloseInsert "")

    (if (string= $decorate "default")
        (setq $decorate "icm.subjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)"))

    (if (not (string= $decorate ""))
        (insert (format "    @%s\n" $decorate)))

    (insert
     (format "    def %s(" $methodName))
      
    ))


(defun org-dblock-write:bx:icm:py3:main (@params)
  "Insert Header
"
  (let (
        ($mainType (or (plist-get @params :mainType) "mainType"))
        ($comment (or (plist-get @params :comment) ""))
        ($argsListStr (or (plist-get @params :argsList) ""))
        ($argsList)
        )
    (setq $argsList (split-string $argsListStr))
    (sectionTitleOpenInsert (format
                             "=Framework=  ::   __main__ g_icmMain" $mainType))

    (insert (format " /%s/" $mainType))

    (if (not (string= $comment ""))
        (insert (format " =%s=" $comment)))
    
    (sectionTitleCloseInsert "")

    (when (string= $mainType "withExamples")
      (insert
       (format "\
#
# ICM Main Type is: %s
#
if __name__ == \"__main__\":
    icm.g_icmMain(
        icmInfo=icmInfo,
        noCmndEntry=examples,
        extraParamsHook=g_paramsExtraSpecify,
        importedCmndsModules=g_importedCmndsModules,
    )
"
               $mainType)))

    (when (string= $mainType "noCmndProcessor")
      (insert
       (format "\
#
# ICM Main Type is: %s
#
if __name__ == \"__main__\":
    icm.g_icmMain(
        icmInfo=icmInfo,
        noCmndEntry=noCmndProcessor,
        extraParamsHook=g_paramsExtraSpecify,
        importedCmndsModules=g_importedCmndsModules,
    )
"
               $mainType)))

    ))

(defalias  'org-dblock-write:bx:icm:python:cmnd:classHead 'org-dblock-write:bx:dblock:python:iim:cmnd:classHead)

(defun org-dblock-write:bx:dblock:python:iim:cmnd:classHead (@params)
  " asFunc is only used when interactive=False
Insert Org-heading
"
  (let (
        ($modPrefix (or (plist-get @params :modPrefix) ""))     
        ($cmndName (or (plist-get @params :cmndName) ""))
        ($cmndType (or (plist-get @params :cmndType) ""))       
        ($comment (or (plist-get @params :comment) "")) 
        ($parsMand (or (plist-get @params :parsMand) ""))       
        ($parsOpt (or (plist-get @params :parsOpt) "")) 
        ($argsMin (or (plist-get @params :argsMin) ""))
        ($argsMax (or (plist-get @params :argsMax) ""))
        ($asFunc (or (plist-get @params :asFunc) ""))
        ($interactiveP (or (plist-get @params :interactiveP) ""))
        ($icmStr (or (plist-get @params :icmStr) ""))   
        )
    (icm-python-cmnd:classHead $modPrefix $cmndName $cmndType $comment $parsMand $parsOpt $argsMin $argsMax $asFunc $interactiveP $icmStr)
    ))

(defun icm-python-cmnd:classHead(
  @modPrefix @cmndName @cmndType @comment @parsMandListStr @parsOptListStr @argsMin @argsMax @asFuncListStr @interactiveP @icmStr)
  ""
  (let (
        ($icmStr @icmStr)
        ($parsMandList (split-string @parsMandListStr))
        ($parsOptList (split-string @parsOptListStr))
        ($parsList)
        ($asFuncList (split-string @asFuncListStr))
        ($icmStr)
        ($iimStr)       
        ($IicmStr)
        ($iifStr)
        ($IifStr)       
        )
    (setq $parsList (append $parsMandList $parsOptList))

    (cond
     ((string= @modPrefix "")
      (progn
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "old")
      (progn 
        (setq $icmStr "icm.")   
        (setq $iimStr "iim")    
        (setq $IicmStr "Iicm")
        (setq $iifStr "iif")
        (setq $IifStr "Iif")                    
      ))
     ((string= @modPrefix "new")
      (progn 
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "lib")
      (progn 
        (setq $icmStr "")
        (setq $iimStr "icm")                    
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                           
      ))
     (t
      (message "Bad Input"))
     )
    
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
     (format "class %s(%s%s):\n" @cmndName $icmStr $IifStr))
    
    (insert
     (format "    %sParamsMandatory = [ " $iifStr))
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
     (format "    %sParamsOptional = [ " $iifStr))
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
     (format "    %sArgsLen = {'Min': %s, 'Max': %s,}"
             $iifStr @argsMin @argsMax))
    
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

    @%ssubjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def %s(self,
        interactive=%s,        # Can also be called non-interactively"
               $icmStr
               $iifStr
               (trueOrFalseStr @interactiveP)
               ))
      
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
        argsList=[],         # or Args-Input")))
      
      (mapcar (lambda (x)
                (insert
                 (format "
        %s=None,         # asFunc when interactive==False"
                         x
                         )))
              $asFuncList
              )      

      ;;; G = %s%sGlobalContext()
      (insert
       (format "
    ) -> icm.OpOutcome:
"))
      
      (when (string= @modPrefix "lib")
        (insert
         (format "
        G = IcmGlobalContext()
"
                 )))
                 

      (insert
       (format "\
        %sOutcome = self.getOpOutcome()
        if not self.obtainDocStr:
            if interactive:
                if not self.cmndLineValidate(outcome=%sOutcome):
                    return %sOutcome
"
               $iifStr
               $iifStr
               $iifStr         
               ))

      (if (not (string= @argsMax "0"))
          (insert
           (format "\
                effectiveArgsList = G.%sRunArgsGet().%sArgs  # type: ignore
            else:
                effectiveArgsList = argsList

"
                   $iimStr $iifStr
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
            if not %s%sCallParamsValidate(callParamsDict, interactive, outcome=%sOutcome):
                return %sOutcome" $icmStr $iifStr $iifStr $iifStr
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

      (if (not (string= @argsMax "0"))
          (insert
           (format "\


            cmndArgsSpecDict = self.cmndArgsSpec()
            if not self.cmndArgsValidate(effectiveArgsList, cmndArgsSpecDict, outcome=cmndOutcome):
                return cmndOutcome\
"
                   ))
        (insert "\n")
        )
    ))


(defun org-dblock-write:icm:py3:cmnd:classHead (@params)
  " asFunc is only used when interactive=False
Insert Org-heading
"
  (let (
        ($modPrefix (or (plist-get @params :modPrefix) ""))     
        ($cmndName (or (plist-get @params :cmndName) ""))
        ($cmndType (or (plist-get @params :cmndType) ""))       
        ($comment (or (plist-get @params :comment) "")) 
        ($parsMand (or (plist-get @params :parsMand) ""))       
        ($parsOpt (or (plist-get @params :parsOpt) "")) 
        ($argsMin (or (plist-get @params :argsMin) ""))
        ($argsMax (or (plist-get @params :argsMax) ""))
        ($asFunc (or (plist-get @params :asFunc) ""))
        ($interactiveP (or (plist-get @params :interactiveP) ""))
        ($icmStr (or (plist-get @params :icmStr) ""))   
        )
    (icm-py3-cmnd:classHead $modPrefix $cmndName $cmndType $comment $parsMand $parsOpt $argsMin $argsMax $asFunc $interactiveP $icmStr)
    ))

(defun icm-py3-cmnd:classHead(
  @modPrefix @cmndName @cmndType @comment @parsMandListStr @parsOptListStr @argsMin @argsMax @asFuncListStr @interactiveP @icmStr)
  ""
  (let (
        ($icmStr @icmStr)
        ($parsMandList (split-string @parsMandListStr))
        ($parsOptList (split-string @parsOptListStr))
        ($parsList)
        ($asFuncList (split-string @asFuncListStr))
        ($icmStr)
        ($iimStr)       
        ($IicmStr)
        ($iifStr)
        ($IifStr)       
        )
    (setq $parsList (append $parsMandList $parsOptList))

    (cond
     ((string= @modPrefix "")
      (progn
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "new")
      (progn 
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "lib")
      (progn 
        (setq $icmStr "")
        (setq $iimStr "icm")                    
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                           
      ))
     (t
      (message "Bad Input"))
     )
    
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
     (format "class %s(%s%s):\n" @cmndName $icmStr $IifStr))
    
    (insert
     (format "    %sParamsMandatory = [ " $iifStr))
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
     (format "    %sParamsOptional = [ " $iifStr))
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
     (format "    %sArgsLen = {'Min': %s, 'Max': %s,}"
             $iifStr @argsMin @argsMax))
    
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

    @%ssubjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def %s(self,
        interactive=%s,        # Can also be called non-interactively"
               $icmStr
               $iifStr
               (trueOrFalseStr @interactiveP)
               ))
      
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
        argsList=[],         # or Args-Input")))
      
      (mapcar (lambda (x)
                (insert
                 (format "
        %s=None,         # asFunc when interactive==False"
                         x
                         )))
              $asFuncList
              )      

      ;;; G = %s%sGlobalContext()
      (insert
       (format "
    ) -> icm.OpOutcome:\
"))
      (if (not (string= @comment ""))
          (insert
           (format "
        \"\"\"%s\"\"\"" @comment)))
    ))


(defun icm-python-cmnd:classHead-WORKS(
  @modPrefix @cmndName @cmndType @comment @parsMandListStr @parsOptListStr @argsMin @argsMax @asFuncListStr @interactiveP @icmStr)
  ""
  (let (
        ($icmStr @icmStr)
        ($parsMandList (split-string @parsMandListStr))
        ($parsOptList (split-string @parsOptListStr))
        ($parsList)
        ($asFuncList (split-string @asFuncListStr))
        ($icmStr)
        ($iimStr)       
        ($IicmStr)
        ($iifStr)
        ($IifStr)       
        )
    (setq $parsList (append $parsMandList $parsOptList))

    (cond
     ((string= @modPrefix "")
      (progn
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "old")
      (progn 
        (setq $icmStr "icm.")   
        (setq $iimStr "iim")    
        (setq $IicmStr "Iicm")
        (setq $iifStr "iif")
        (setq $IifStr "Iif")                    
      ))
     ((string= @modPrefix "new")
      (progn 
        (setq $icmStr "icm.")
        (setq $iimStr "icm")            
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                   
      ))
     ((string= @modPrefix "lib")
      (progn 
        (setq $icmStr "")
        (setq $iimStr "icm")                    
        (setq $IicmStr "Icm")
        (setq $iifStr "cmnd")
        (setq $IifStr "Cmnd")                           
      ))
     (t
      (message "Bad Input"))
     )
    
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
     (format "class %s(%s%s):\n" @cmndName $icmStr $IifStr))
    
    (insert
     (format "    %sParamsMandatory = [ " $iifStr))
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
     (format "    %sParamsOptional = [ " $iifStr))
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
     (format "    %sArgsLen = {'Min': %s, 'Max': %s,}"
             $iifStr @argsMin @argsMax))
    
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

    @%ssubjectToTracking(fnLoc=True, fnEntry=True, fnExit=True)
    def %s(self,
        interactive=%s,        # Can also be called non-interactively"
               $icmStr
               $iifStr
               (trueOrFalseStr @interactiveP)
               ))
      
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
        argsList=[],         # or Args-Input")))
      
      (mapcar (lambda (x)
                (insert
                 (format "
        %s=None,         # asFunc when interactive==False"
                         x
                         )))
              $asFuncList
              )      

      ;;; G = %s%sGlobalContext()
      (insert
       (format "
    ) -> icm.OpOutcome:
"))
      
      (when (string= @modPrefix "lib")
        (insert
         (format "
        G = IcmGlobalContext()
"
                 )))
                 

      (insert
       (format "\
        %sOutcome = self.getOpOutcome()
        if interactive:
            if not self.cmndLineValidate(outcome=%sOutcome):
                return %sOutcome
"
               $iifStr
               $iifStr
               $iifStr         
               ))

      (if (not (string= @argsMax "0"))
          (insert
           (format "\
            effectiveArgsList = G.%sRunArgsGet().%sArgs  # type: ignore
        else:
            effectiveArgsList = argsList

"
                   $iimStr $iifStr
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
        if not %s%sCallParamsValidate(callParamsDict, interactive, outcome=%sOutcome):
            return %sOutcome" $icmStr $iifStr $iifStr $iifStr
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

      (if (not (string= @argsMax "0"))
          (insert
           (format "\


        cmndArgsSpecDict = self.cmndArgsSpec()
        if not self.cmndArgsValidate(effectiveArgsList, cmndArgsSpecDict, outcome=cmndOutcome):
            return cmndOutcome\
"
                   ))
        (insert "\n")
        )
    ))


(defun org-dblock-write:bx:icm:python:cmnd:argsAffirm (@params)
  " 
Insert Org-heading
"
  (let (
        ($expectedArgs (or (plist-get @params :expectedArgs) ""))
        ($comment (or (plist-get @params :comment) "")) 
        )
    (icm-python-cmnd:argsAffirm $expectedArgs $comment)
    ))

(defun icm-python-cmnd:argsAffirm(
  @expectedArgs @comment)
  ""
  (let (
        ($argsList)
        )
    
    (subSectionTitleOpenInsert "Args-Affirm")

    (insert (format " /%s/" @expectedArgs))

    (if (not (string= @comment ""))
        (insert (format " =%s=" @comment)))

    (sectionTitleCloseInsertNoNewLine "Args-Affirm")

    ))


(defun org-dblock-write:bx:dblock:python:import:jediWorkAround (@params)
  (let (
        ($namespace (or (plist-get @params :namespace) ""))
        ($module (or (plist-get @params :module) ""))
        ($file (or (plist-get @params :file) ""))
        ($devModuleLink)
        )
    (setq $devModuleLink
          (concat 
           (file-name-as-directory
            "/usr/local/lib/python2.7/dist-packages/")
           $module))
    (if (file-symlink-p $devModuleLink)
        (progn
          (insert
           (format "\
# Development Workaround  For JediWorkaround
import %s"
                   $module
                   )))
      (progn
        (insert
         (format "\
# Ordinary Usage
from %s.%s import %s"
                 $namespace
                 $module
                 $file
                 )))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:top-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:python:iim:iif:parsValidate (params)
  (let (
        (let:pars (or (plist-get params :par) ""))
        (let:args (or (plist-get params :args) ""))
        (let:asFunc (or (plist-get params :asFunc) ""))         
        (let:inIicm (or (plist-get params :inIicm) ""))
        )
    (iim-python-iif:parsValidate let:pars let:args let:asFunc let:inIicm)))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Support Functions*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-latex-section-insert-dblock-name-MISTAKE-WhyIsThisHere params) [[elisp:(org-cycle)][| ]]
")

(defun org-latex-section-insert-dblock-name-MISTAKE-WhyIsThisHere (name)
  "Given NAME, insert a latex commented section tag."
  (insert
   (format "\
\\begin{comment}\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK: %s/  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}"
           name
           )))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iim-python"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-iim-python)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


