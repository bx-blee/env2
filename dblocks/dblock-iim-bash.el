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
(require 'dblock-controller)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:top-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:bash:top-of-file (@params)
  (let (
        (@control (or (plist-get @params :control) "enabled"))
        (@vc (or (plist-get @params :vc) "git"))
        (@partof (or (plist-get @params :partof) "bystar"))
        (@copyleft (or (plist-get @params :copyleft) "halaal+brief"))
        ;;
        ($control nil)
        )

    (defun paramsDescInsert ()
      (blee:dblock:params:desc
       'shell-script-mode
       (format "%s  :vc \"cvs|git|nil\" :partof \"bystar|nil\" :copyleft \"halaal+minimal|halaal+brief|nil\""
               (bx:dblock:controller:options)
               )
       )
      )

    (setq $control
          (bx:dblock:controller:enforce @control :paramsDescFunc 'paramsDescInsert))
    
    (when (equal $control "enabled")
      (when (equal @vc "cvs")    
        (insert "\
typeset RcsId=\"$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $\"
# *CopyLeft*
")
        )

      (when (equal @partof "bystar")
        (insert (format "\
__copying__=\"
%s Libre-Halaal Software\"
" "*"))
        (insert "#  This is part of ByStar Libre Services. http://www.by-star.net
")
        )

      (when (equal @copyleft "halaal+minimal")
        (insert "#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org\n")
        )
      (when (equal @copyleft "halaal+brief")
        (insert "# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.\
")
        )
      )
    ))


(defun org-dblock-write:bx:bash:origin-statement (@params)
  (let (
        (@control (or (plist-get @params :control) "enabled"))
        (@origin (or (plist-get @params :origin) "bystar"))
        ;;
        ($control nil)
        )

    (defun paramsDescInsert ()
      (blee:dblock:params:desc
       'shell-script-mode
       (format "%s  :origin \"bystar|nil\""
               (bx:dblock:controller:options)
               )
       )
      )

    (setq $control
          (bx:dblock:controller:enforce @control :paramsDescFunc 'paramsDescInsert)
          )    
    (when (equal $control "enabled")
      (when (equal @origin "bystar")    
        (insert (format "\
ORIGIN=\"
%s Part Of ByStar -- Best Used With Emacs, Blee and COMEEGA.\"\
" "*"))
        )
      )
    ))



;;;
(defun org-dblock-write:bx:bsip:bash/libLoadOnce  (<params)
  "Load lib just once."
  (let* (
        (<governor (or (plist-get <params :governor) "enabled")) ;; Controls general behaviour
        (<extGov (or (plist-get <params :extGov) "na")) ;; External Governor
        ;;
        (<libName (or (plist-get <params :libName) "."))
        ;;
        ($libBufferName (file-name-sans-extension
                         (file-name-nondirectory
                          (buffer-file-name))))
        ($libBufferPath (buffer-file-name))
        )

    (setq <governor (bx:dblock:governor:effective <governor <extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":libName \"auto\""
      )

    (defun bodyContent ()
      ""
      (when (string= <libName "auto")
        (setq <libName $libBufferName)
        )
      (insert
       (format
       "\
if [ -z \"${%s:-}\" ] ; then
    %s=\"LOADED\" ; TM_trace 7 \"%s :: Loading Library -- %s\"
else
    TM_trace 7 \"%s :: Prviously Loaded -- Skipping %s\" ; return
fi"
       <libName <libName <libName $libBufferPath <libName $libBufferPath)
       ))

    (bodyContent)
    ))


(defun org-dblock-write:bx:bash:author (@params)
  (let (
        (@control (or (plist-get @params :control) "enabled"))
        (@author (or (plist-get @params :author) "mohsenBanan"))
        ;;
        ($control nil)
        )
    
    (defun paramsDescInsert ()
      (blee:dblock:params:desc
       'shell-script-mode
       (format
        "%s  :author \"mohsenBanan|nil\""
        (bx:dblock:controller:options)
        )))

    (setq $control
          (bx:dblock:controller:enforce @control :paramsDescFunc 'paramsDescInsert)
          )
    
    (when (equal $control "enabled")
      (when (equal @author "mohsenBanan")    
        (insert
         (format "\
__author__=\"
%s Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact\""
                 "*"
                 ))))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:end-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:bash:end-of-file (params)
  (let ((bx:types (or (plist-get params :types) ""))
        )
  (insert "_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:bash:seed-spec params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:bash:seed-spec (params)
  (let ((bx:types (or (plist-get params :types) ""))
        (files-list)
        )
    ;;(insert "# {{{ DBLOCK-seed-spec\n")
    (insert 
     (format "SEED=\"\n*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/%s]] | \n\"\n" bx:types))
    (insert 
     (format "FILE=\"\n*  /This File/ :: %s \n\"\n" buffer-file-name))
    (insert "if [ \"${loadFiles}\" == \"\" ] ; then\n")
    (insert
     (format "    /opt/public/osmt/bin/%s -l $0 \"$@\" \n" bx:types))
    (insert "    exit $?
fi")
    ;;(insert "# }}} DBLOCK-seed-spec")
    ))


(defun org-dblock-write:bx:bsip:bash:seed-spec (params)
  (let ((bx:types (or (plist-get params :types) ""))
        (files-list)
        )
    ;;(insert "# {{{ DBLOCK-seed-spec\n")
    (insert 
     (format "SEED=\"\n*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/%s]] | \n\"\n" bx:types))
    (insert 
     (format "FILE=\"\n*  /This File/ :: %s \n\"\n" buffer-file-name))
    (insert "if [ \"${loadFiles}\" == \"\" ] ; then\n")
    (insert
     (format "    /bisos/core/bsip/bin/%s -l $0 \"$@\" \n" bx:types))
    (insert "    exit $?
fi")
    ;;(insert "# }}} DBLOCK-seed-spec")
    ))


(defun org-dblock-write:bx:bisos:bash:seed-spec (params)
  (let ((bx:types (or (plist-get params :types) ""))
        (files-list)
        )
    ;;(insert "# {{{ DBLOCK-seed-spec\n")
    (insert 
     (format "SEED=\"\n*  /[dblock]/ /Seed/ :: [[file:%s]] | \n\"\n" bx:types))
    (insert 
     (format "FILE=\"\n*  /This File/ :: %s \n\"\n" buffer-file-name))
    (insert "if [ \"${loadFiles}\" == \"\" ] ; then\n")
    (insert
     (format "    %s -l $0 \"$@\" \n" bx:types))
    (insert "    exit $?
fi")
    ;;(insert "# }}} DBLOCK-seed-spec")
    ))


;;; OBSOLETED
(defun org-dblock-write:bx:bsip:bash/processEachArgsOrStdin (params)
  (let (
        (files-list)
        )
    (insert "OBSOLETED: Use bx:bsip:bash/processArgsAndStdinEach instead\n")
    (insert 
     "\
    if [ $# -gt 0 ] ; then
        local each=\"\"
        for each in ${inputsList} ; do
            lpDo processEach ${each}
        done
    else
        local eachLine=\"\"
        while read -r -t 1 eachLine ; do
            if [ ! -z \"${eachLine}\" ] ; then
                local each=\"\"
                for each in ${eachLine} ; do
                    lpDo processEach ${each}
                done
            fi
        done
    fi
"
                )
    ))

(advice-add 'org-dblock-write:bx:bsip:bash/onTargetRun :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:bx:bsip:bash/onTargetRun (<params)
  "
** When :runLocally? is nil don't run. :sshAcct is either intra or bystar.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel -1)) (<model (letGet$model))
         (<style (letGet$style "openBlank" "closeBlank"))
         ;;
         (<managerOrTarget (or (plist-get <params :managerOrTarget) "both"))
         (<sshAcct (or (plist-get <params :sshAcct) "bystar"))
         (<cmndOption (or (plist-get <params :cmndOption) nil))          
         )

    (bxPanel:params$effective)   

    (defun helpLine ()
      "NOTYET"
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
             ($cmndOptionStr "")
             )
        (when (string= <managerOrTarget "manager")
          (insert "\
    if [ -z \"${targetName}\" ] ; then
       EH_problem \"Can Not Be Run On Target. Run It On Manager And Specify targetName.\"
       lpReturn
    fi\n"
                  )
          )

        (when (string= <managerOrTarget "target")
          (insert "\
    if [ ! -z \"${targetName}\" ] ; then
       EH_problem \"Can Only Run On Target. Can Not Be Run On Manager.\"
       lpReturn
    fi\n"
                  )
          )

        (when <cmndOption
          (setq $cmndOptionStr "$(sansTargetName \"${G_paramCmndOption}\")"))
        
        (insert (format "\
    if [ \"${targetName}\" == \"onTargetRun\" ] ; then
        lpDo onTargetRun
    elif [ -z \"${targetName}\" ] ; then
        lpDo onTargetRun
    else
        local commandName=${FUNCNAME##vis_}             
        lpDo sshpass -p intra ${sshCmnd} %s@\"${targetName}\" \\
             $(which ${G_myName}) ${G_commandPrefs} \\
             -p targetName=onTargetRun %s \\
             -i ${commandName}
    fi"
                        <sshAcct $cmndOptionStr
                        )
                )
        )
      )
    
    (bx:invoke:withStdArgs$bx:dblock:governor:process)    
    ))


(defun org-dblock-write:bx:bsip:bash/processArgsAndStdinEach (params)
  "No params are used, but dblock demands params so you need a :param nil or an extra space."
  (insert 
   "\
   function processArgsAndStdin {
        if [ $# -gt 0 ] ; then
            local each=\"\"
            for each in \"$@\" ; do
                lpDo processEach \"${each}\"
            done
        fi
        if [ -t 0 ] ; then # stdin is empty -- FD 0 is opened on a terminal (not piped)
            if [ $# -eq 0 ] ; then
                ANT_raw \"No Args And Stdin Is Empty\"
            fi
            lpReturn
        fi
        local eachLine=\"\"
        while read  eachLine ; do
            if [ ! -z \"${eachLine}\" ] ; then
                local each=\"\"
                for each in \"${eachLine}\" ; do
                    lpDo processEach \"${each}\"
                done
            fi
        done
    }
    lpDo processArgsAndStdin \"$@\"\
"
   )
  )

(defun org-dblock-write:bx:bsip:bash/processStdinWithArgs (params)
  (insert 
   "\
    function processStdinWithArgs {
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
        fi
        if [ ${#stdinArgs[@]} -eq 0 ] ; then
            ANT_raw \"No StdinArgs -- Processing Skipped\"
            lpReturn
        fi
        for each in \"${stdinArgs[@]}\"; do
            lpDo processEach \"${each%$'\\n'}\" \"$@\"
        done
    }
    lpDo processStdinWithArgs \"$@\"\
"
    )
  )

(defun org-dblock-write:bx:bsip:bash/processArgsAndStdin (params)
  "
** stdin and args as one list are processed with processEach with each as an argument.
*** No dblock params are used, but dblock demands params so you need a :param nil or an extra space.
"       
  (insert 
   "\
     function processArgsAndStdin {
        local effectiveArgs=( \"$@\" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( \"$@\" \"${stdinArgs[@]}\" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw \"No Args And Stdin Is Empty\"
            lpReturn
        fi
        for each in \"${effectiveArgs[@]}\"; do
            lpDo processEach \"${each%$'\\n'}\"
        done
    }
    lpDo processArgsAndStdin \"$@\"\
"
    )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:bash:function params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:bash:function (params)
  (let ((bx:func (or (plist-get params :func) ""))
        (bx:type (or (plist-get params :type) ""))
        )
    (insert (format "# {{{ %s\n" bx:func))
    (when (equal bx:type "idempotent")
      (insert (format "typeset %s_hasRun=\"\"\n" bx:func))
      )

    (insert (format "function %s {\n" bx:func))
    (insert "    TM_funcEntered\n")
    (insert "    thisFuncName=$( thisFuncNameBashOrKsh \"$0\" \"$FUNCNAME\" )")
    (when (equal bx:type "idempotent")
      (insert "\n    beIdempotent")
      )
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:binsprep:apt params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:binsprep:apt (params)
  (let ((bx:module (or (plist-get params :module) ""))
        (bx:bash-module)
        )
    (setq bx:bash-module (replace-regexp-in-string "-" "_" bx:module))    
    ;;;(insert (format "# {{{ %s\n" bx:module))
    (insert (format "_CommentBegin_\n"))
    (insert (format "*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: %s [[elisp:(org-cycle)][| ]]\n" bx:module))
    (insert (format "_CommentEnd_\n"))
    (insert (format "item_%s () { distFamilyGenerationHookRun binsPrep_%s; }\n" bx:bash-module bx:bash-module))
    (insert "\n")
    (insert (format "binsPrep_%s_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet \"%s\"; }\n" bx:bash-module bx:module))
    ;;;(insert "# }}}")
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Conversion                 ::      /Conversion Facilities/   [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-bash-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-bash-one-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^function " nil t))
      (when (re-search-forward "^function " nil t)
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
            (iim-bash-func-orgSec-insert defunName)
            )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-bash-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-bash-all-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^function " nil t))
      (while (re-search-forward "^function " nil t)
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
            (iim-bash-func-orgSec-insert defunName)
            )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-orgSec-insert defunName defunArgs) [[elisp:(org-cycle)][| ]]
  ")

(defun iim-bash-func-orgSec-insert (funcName)
  ""
  (insert
   (format "\
_CommentBegin_\n*\
  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]\
 || Cmnd      ::  %s    [[elisp:(org-cycle)][| ]]
_CommentEnd_
"
           funcName)))



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Support Functions*
")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iim-bash"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-iim-bash)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


