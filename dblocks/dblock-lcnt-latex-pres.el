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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- /dblock:lcnt:latex:/ --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'bx-lcnt-lib)


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]    *=====================================================*
")



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Common Packages Style Settings*
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (full-latex-frame-begin params) [[elisp:(org-cycle)][| ]]
  ")

;;;#+BEGIN: bx:dblock:lcnt:pres:latex-frame-nonfragile-begin  :mode "disabled" :title "ODG Image Incusion" :subtitle "After dblock" :label "adblockLabel" :transition "Trans" :onLeave "OnLeave"

;;;#+END:



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bx:dblock:lcnt:slidesDisposition-validP @frameType) [[elisp:(org-cycle)][| ]]
  ")
;; (bx:dblock:lcnt:slidesDisposition-validP "videoed")
;; (bx:dblock:lcnt:slidesDisposition-validP "")
(defun bx:dblock:lcnt:slidesDisposition-validP (@frameType)
  "Valid dispositionTypes are:
oneSlide       -- dblock expand frame as one slide -- For pdf printing
slides         -- dblock expand frame as slides -- For Recording 
videoed        -- dblock expand frame as video  -- For Reveal.js final publication
"
  (let (
        ($validFrameTypes
         '(
           "oneSlideDispose"
           "slidesDispose"
           "videoedDispose"
           ))
        )
    (member @frameType $validFrameTypes)
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bx:lcnt:frameTypeValidP @frameType) [[elisp:(org-cycle)][| ]]
  ")

;; (bx:lcnt:frameType-validP "videoed")
;; (bx:lcnt:frameType-validP "")
(defun bx:lcnt:frameType-validP (@frameType)
  "Valid frame-types are:
plain         -- Text/Images/Links
narrated      -- Voice-Over Plain Slide
videoed       -- Screen capture of Narration + Impressive enhancements
nar+videoed   -- Narrated frame followed by videoed of same frame
plain+videoed -- Plain frame  followed by videoed of same frame
screenCapture -- Video of Emacs/Terminal Sessions + Live Examples
cameraVideo   -- Video produced by a camera
extVideo      -- Generic Video comming from an external source
"
  (let (
        ($validFrameTypes
         '(
           "UnSpecified"
           "plain"
           "narrated"
           "videoed"
           "nar+videoed"
           "plain+videoed"
           "screenCapture"
           "cameraVideo"
           "extVideo"
           ))
        )
    (member @frameType $validFrameTypes)
    ))
        


;;;
;;; (full-latex-frame-begin '(:title "Some Title" :label "someLable" :fragile "true"))
;;;
;;; (shell-command-to-string "uriEncode.sh 'English/Globish: By* Some'")

(defun full-latex-frame-begin (params)
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        (frame-title (or (plist-get params :title) "UnSpecified"))
        (frame-subtitle (or (plist-get params :subtitle) "UnSpecified"))        
        (frame-label (or (plist-get params :label) "UnSpecified"))
        (frame-fragile (or (plist-get params :fragile) "UnSpecified"))
        (frame-options (or (plist-get params :options) "UnSpecified"))          
        (frame-audio (or (plist-get params :audio) "UnSpecified"))      
        (frame-transition (or (plist-get params :transition) "UnSpecified"))
        (frame-onLeave (or (plist-get params :onLeave) "UnSpecified"))
        (frameOptionsStr "")
        (frame-labelEncoded "")
        (frame-titleEncoded "")
        (frame-subtitleEncoded "")      
        )


    (setq frame-titleEncoded (shell-command-to-string (concat "uri@Encode.sh " frame-title)))
    (setq frame-subtitleEncoded (shell-command-to-string (concat "uri@Encode.sh " frame-subtitle)))

    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      
      ;;
      ;; Combine frame options into frameOptionsStr
      ;;
      (when (equal frame-fragile "true")
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr "fragile")))

      (when (not (equal frame-options "UnSpecified"))   
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr frame-options)))

      (when (string-equal frame-label  "auto")
        (setq frame-label (str:spacesElim frame-title))
        )
      (setq frame-labelEncoded (shell-command-to-string (concat "uri@Encode.sh " frame-label))) 

      (when (not (equal frame-label "UnSpecified"))
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr "label=" frame-labelEncoded)))

      (if (not (string= "" frameOptionsStr))
          (setq frameOptionsStr (concat "[" frameOptionsStr "]")))
          
      (insert
       (format "\
\\begin{comment}\
\n*****  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Frame/ *Label=%s*  %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\begin{frame}%s\n"
               frame-label
               frame-title
               frameOptionsStr
               ))

      (when (not (equal frame-transition "UnSpecified"))
        (insert
         (format "\
    \\transition{%s}\n"
                 frame-transition)))

      (when (not (equal frame-onLeave "UnSpecified"))
        (insert
         (format "\
    \\transitionout{%s}\n"
                 frame-onLeave)))

      (when (not (equal frame-audio "UnSpecified"))
        (when (not (equal frame-audio "labeled"))
          (insert
           (format "\
    \\frameaudio{\"audio/%s.mp3\"}\n"
                   frame-audio))
          )
        (when (equal frame-audio "labeled")
          (insert
           (format "\
    \\frameaudio{\"audio/%s.mp3\"}\n"
                   frame-labelEncoded))
          )
        )       
      
      ;;
      ;; If Title is not specified, it is passed in as blank
      ;; frametitle initiates the slide creation with HaVeA.
      ;; It needs to come after transition 
      ;;
      (when (equal frame-title "UnSpecified")
        (setq frame-title "")
        )
      (insert
       (format "\
    \\frametitle{%s}\n"
                 frame-title))
      
      (when (not (equal frame-subtitle "UnSpecified"))
        (insert
         (format "\
    \\framesubtitle{%s}\n"
                 frame-subtitle)))
      

      ;;
      ;; These are used for Impressive
      ;;
      (insert (format "\
%%BxPy: impressiveFrameParSet('%s', 'always', 'True')
%%BxPy: impressiveFrameParSet('%s', 'transition', '%s')"
                      frame-labelEncoded
                      frame-labelEncoded                          
                      frame-transition
                      ))

      )))

;;;
;;; (full-latex-frame-begin '(:title "Some Title" :label "someLable" :fragile "true"))
;;;

(defun full-latex-frame-video-begin (params)
  " Handles All Of: :slide-type videoed, nar+videoed, plain+videoed -- with two modes
  ./Control/dblocks.el/bx:
Rlevant params are to be communicated.
"
  (let (
        (dblockMode (or (plist-get params :mode) "UnSpecified"))
        ($frame-type (or (plist-get params :type) "UnSpecified"))       
        (frame-title (or (plist-get params :title) "UnSpecified"))
        (frame-subtitle (or (plist-get params :subtitle) "UnSpecified"))        
        (frame-label (or (plist-get params :label) "UnSpecified"))
        (frame-fragile (or (plist-get params :fragile) "UnSpecified"))
        (frame-options (or (plist-get params :options) "UnSpecified"))          
        (frame-audio (or (plist-get params :audio) "UnSpecified"))      
        (frame-transition (or (plist-get params :transition) "UnSpecified"))
        (frame-onLeave (or (plist-get params :onLeave) "UnSpecified"))
        (frameOptionsStr "")
        )

    (bx:dblock:load-dblocksControl)

    ;;
    ;; To Accomodate Transition
    ;;
    (if (not 
         (bx:dblock:lcnt:slidesDisposition-validP bx:dblock:lcnt:slidesDisposition)
         )
        (setq bx:dblock:lcnt:slidesDisposition "oneSlide")
      )
    
    (when (blee:dblock:mode:disabledP dblockMode)
      (blee:dblock:mode:disabledIndicate))
    
    (when (not (blee:dblock:mode:disabledP dblockMode))
      
      ;;
      ;; Combine frame options into frameOptionsStr
      ;;
      (when (equal frame-fragile "true")
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr "fragile")))

      (when (not (equal frame-options "UnSpecified"))   
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr frame-options)))

      (when (string-equal frame-label  "auto")
        (setq frame-label (str:spacesElim frame-title)))

      (when (not (equal frame-label "UnSpecified"))
        (if (not (string= "" frameOptionsStr))
            (setq frameOptionsStr (concat frameOptionsStr ",")))
        (setq frameOptionsStr (concat frameOptionsStr "label=" frame-label)))

      (if (not (string= "" frameOptionsStr))
          (setq frameOptionsStr (concat "[" frameOptionsStr )))


      (defun headerCommentInsert ()
        (insert
         (format "\
\\begin{comment}\
\n*****  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Frame: %s/ *Label=%s*  %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}
"
                 $frame-type
                 frame-label
                 frame-title
                 )))

      (headerCommentInsert)

      (defun frameTopInsert (videoTag)
        (insert
         (format "\

\\begin{frame}%s%s]\n"
                 frameOptionsStr videoTag
                 ))
        
        (when (not (equal frame-transition "UnSpecified"))
          (insert
           (format "\
    \\transition{%s}\n"
                   frame-transition)))

        (when (not (equal frame-onLeave "UnSpecified"))
          (insert
           (format "\
    \\transitionout{%s}\n"
                   frame-onLeave)))

        (when (not (equal frame-audio "UnSpecified"))
          (when (not (equal frame-audio "labeled"))
            (insert
             (format "\
    \\frameaudio{\"%s\"}\n"
                     frame-audio))
            )
          (when (equal frame-audio "labeled")
            (insert
             (format "\
    \\frameaudio{\"audio/%s%s.mp3\"}\n"
                     frame-label videoTag))
            )
          )     
      
      ;;
      ;; If Title is not specified, it is passed in as blank
      ;; frametitle initiates the slide creation with HaVeA.
      ;; It needs to come after transition 
      ;;
        (when (equal frame-title "UnSpecified")
          (setq frame-title "")
          )
        (insert
         (format "\
    \\frametitle{%s}\n"
                 frame-title))
      
        (when (not (equal frame-subtitle "UnSpecified"))
          (insert
           (format "\
    \\framesubtitle{%s}\n"
                   frame-subtitle)))
      

        ;;
        ;; These are used for Impressive
        ;;
        (insert (format "\
%%BxPy: impressiveFrameParSet('%s%s', 'always', 'True')
%%BxPy: impressiveFrameParSet('%s%s', 'transition', '%s')"
                        frame-label videoTag
                        frame-label videoTag                      
                        frame-transition
                        ))

;;      (when (not (string= videoTag ""))
;;        (insert (format "
;; %%BxPy: impressiveFrameParSet('%s%s', 'record', '%s')"
;;                      frame-label videoTag                      
;;                      "recorderstudio"
;;                      ))
;;        )

        )

      (defun frameBodyInsert ()
        (let (
              ($ignored (shell-command-to-string 
                         (format "lcntProc.sh -i frameBody %s.tex" frame-label)))
              )
          )
        
        (insert
         (format "

\\input{./frameBody-%s.tex}\n

\\end{frame}\n"
                 frame-label))
        )

       ;;;bx:lcnt:body:video-presArt :videoBaseFile "./video/master-initialSetup.mp4" :presResolution "360" :artResolution "720"            
      (defun frameVideoInsert ()
        (insert
         (format "

dblock expansion of bx:lcnt:body:video-presArt :videoBaseFile ./video/master-%s.tex comes here

\\end{frame}\n"
                 frame-label))
        )
      
      ;;
      ;; For PDF Printing
      ;;
      (when (string= bx:dblock:lcnt:slidesDisposition "oneSlideDispose")
        (cond
         ((string= $frame-type "videoed")
          (frameTopInsert "-vid")
          (frameBodyInsert)     
          )
         ((string= $frame-type "nar+videoed")
          (frameTopInsert "-vid")
          (frameBodyInsert)      
          )
         ((string= $frame-type "plain+videoed")
          (frameTopInsert "-vid")
          (frameBodyInsert)      
          )
         (t
          (message "PROBLEM")   
          )
         )
        )
      
      ;;
      ;; For Recording
      ;;
      (when (string= bx:dblock:lcnt:slidesDisposition "slidesDispose")
        (cond
         ((string= $frame-type "videoed")
          (frameTopInsert "-vid")
          (frameBodyInsert)     
          )
         ((string= $frame-type "nar+videoed")
          (frameTopInsert "")
          (frameBodyInsert)
          (frameTopInsert "-vid")
          (frameBodyInsert)      
          )
         ((string= $frame-type "plain+videoed")
          (frameTopInsert "")
          (frameBodyInsert)
          (frameTopInsert "-vid")
          (frameBodyInsert)      
          )
         (t
          (message "PROBLEM")   
          )
         )
        )
      
      ;;
      ;; For Reveal.js final publication
      ;; 
      (when (string= bx:dblock:lcnt:slidesDisposition "videoedDispose")
        (cond
         ((string= $frame-type "videoed")
          (frameTopInsert "-vid")
          (frameVideoInsert)    
          )
         ((string= $frame-type "nar+videoed")
          (frameTopInsert "")
          (frameBodyInsert)
          (frameTopInsert "-vid")
          (frameVideoInsert)      
          )
         ((string= $frame-type "plain+videoed")
          (frameTopInsert "")
          (frameBodyInsert)
          (frameTopInsert "-vid")
          (frameVideoInsert)      
          )
         (t
          (message "PROBLEM")   
          )
         )
        )
      
        )))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:lcnt:frame-videoed-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:lcnt:frame-videoed-begin (params)
  (setq params (plist-put params ':type "videoed"))
  (setq params (plist-put params ':audio "labeled"))  
  (setq params (plist-put params ':fragile "true"))
  (full-latex-frame-video-begin params)
  )

(defun org-dblock-write:bx:lcnt:frame-nar+videoed-begin (params)
  (setq params (plist-put params ':type "nar+videoed"))  
  (setq params (plist-put params ':audio "labeled"))
  (setq params (plist-put params ':fragile "true"))
  (full-latex-frame-video-begin params)
  )

(defun org-dblock-write:bx:lcnt:frame-plain+videoed-begin (params)
  (setq params (plist-put params ':type "plain+videoed"))    
  (setq params (plist-put params ':audio "labeled"))
  (setq params (plist-put params ':fragile "true"))
  (full-latex-frame-video-begin params)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-narrated-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-narrated-begin (params)
    (let (
        (frame-audio (or (plist-get params :audio) "labeled"))  
        )

      (setq params (plist-put params ':audio frame-audio))
      (setq params (plist-put params ':fragile "true"))
      (full-latex-frame-begin params)
      )
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-narratedSpecified-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-narratedSpecified-begin (params)
  (setq params (plist-put params ':fragile "true"))
  (full-latex-frame-begin params)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-narrated-plain-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-narrated-plain-begin (params)
  (setq params (plist-put params ':audio "labeled"))
  (setq params (plist-put params ':options "plain"))
  (setq params (plist-put params ':fragile "true"))  
  (full-latex-frame-begin params)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-narratedSpecified-plain-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-narratedSpecified-plain-begin (params)
  (setq params (plist-put params ':fragile "true"))
  (setq params (plist-put params ':options "plain"))  
  (full-latex-frame-begin params)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-basic-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-basic-begin (params)
  (setq params (plist-put params ':fragile "true"))
  (full-latex-frame-begin params)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-basic-plain-begin params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-basic-plain-begin (params)
  (setq params (plist-put params ':fragile "true"))
  (setq params (plist-put params ':options "plain"))    
  (full-latex-frame-begin params)
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-minimal-begin params) /NonFragile/ [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-minimal-begin (params)
  (setq params (plist-put params ':fragile "false"))
  (full-latex-frame-begin params)
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:frame-full-begin params) /Fully Specification/ [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:frame-full-begin (params)
  (full-latex-frame-begin params)
  )


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Deprecated -- Old -- Obsoleted*
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:pres:latex-frame-beginOld params) [[elisp:(org-cycle)][| ]]
  ")


(defun org-dblock-write:bx:dblock:lcnt:pres:latex-frame-begin (params)
  (insert "%%%% Obsoleted -- Use New Snippets -- Or use -beginOld")
  )

(defun org-dblock-write:bx:dblock:lcnt:pres:latex-frame-beginOld (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
        (frame-title (or (plist-get params :title) "missing"))
        (frame-subtitle (or (plist-get params :subtitle) "missing"))    
        (frame-label (or (plist-get params :label) "missing"))
        (frame-transition (or (plist-get params :transition) "missing"))
        (frame-onLeave (or (plist-get params :onLeave) "missing"))      
        )
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
         (or (equal "TRUE" bx:disabledP)
             (equal "true" bx:disabledP)))
        (progn
          ;;; Processing Body
          (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
          (insert (format "\
\\begin{comment}\
\n*****  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Frame/  %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\begin{frame}[label=%s]
    \\frametitle{%s}
    \\framesubtitle{%s}\n"
                          frame-title
                          frame-label
                          frame-title
                          frame-subtitle
                          ))
  
          (insert (format "\
%%BxPy: impressiveFrameParSet('%s', 'always', 'True')
%%BxPy: impressiveFrameParSet('%s', 'transition', '%s')
%%BxPy: impressiveFrameParSet('%s', 'onLeave', '%s')"
                          frame-label
                          frame-label                     
                          frame-transition
                          frame-label                                             
                          frame-onLeave
                          ))

          )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:pres:latex-frame-fragile-beginOld params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:pres:latex-frame-fragile-begin (params)
  (insert "%%%% Obsoleted -- Use New Snippets -- Or use -beginOld")
  )


(defun org-dblock-write:bx:dblock:lcnt:pres:latex-frame-fragile-beginOld (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
        (frame-title (or (plist-get params :title) "missing"))
        (frame-subtitle (or (plist-get params :subtitle) "missing"))    
        (frame-label (or (plist-get params :label) "missing"))
        (frame-transition (or (plist-get params :transition) "missing"))
        (frame-onLeave (or (plist-get params :onLeave) "missing"))      
        )
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
         (or (equal "TRUE" bx:disabledP)
             (equal "true" bx:disabledP)))
        (progn
          ;;; Processing Body
          (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
          (insert (format "\
\\begin{comment}\
\n*****  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Frame/  %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\begin{frame}[fragile,label=%s]
    \\transition{%s}
    \\transitionout{%s}
    \\frameaudio{%s}
    \\frametitle{%s}
    \\framesubtitle{%s}\n"
                          frame-title
                          frame-label
                          frame-transition
                          frame-onLeave
                          frame-label
                          frame-title
                          frame-subtitle
                          ))
          
          (insert (format "\
%%BxPy: impressiveFrameParSet('%s', 'always', 'True')
%%BxPy: impressiveFrameParSet('%s', 'transition', '%s')"
                          frame-label
                          frame-label                     
                          frame-transition
                          ))

          )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))



(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Conversions*
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-one-section-to-dblock) [[elisp:(org-cycle)][| ]]
")

(defun pres-latex-one-section-to-dblock ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^\\\\.*section" nil t))
      (when (re-search-forward "^\\\\.*section" nil t)
        (let* (
               (sectionCmnd (thing-at-point 'word))
               )
          (save-excursion
            (skip-chars-forward "       {")
            (let ((sectionTitle
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^}")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" sectionCmnd sectionTitle))
              (beginning-of-line 1)
              (delete-region (point) (progn (forward-line 1) (point)))
              (message "Inserting dblock ...") ;;(sit-for 1)
              (latex-dblock-section-insert sectionCmnd sectionTitle)
              ))))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-all-section-to-dblock) [[elisp:(org-cycle)][| ]]
")

(defun pres-latex-all-section-to-dblock ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^\\\\.*section" nil t))
      (while (re-search-forward "^\\\\.*section" nil t)
        (let* (
               (sectionCmnd (thing-at-point 'word))
               )
          (save-excursion
            (skip-chars-forward "       {")
            (let ((sectionTitle
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^}")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" sectionCmnd sectionTitle))
              (beginning-of-line 1)
              (delete-region (point) (progn (forward-line 1) (point)))
              (message "Inserting dblock ...") ;;(sit-for 1)
              (latex-dblock-section-insert sectionCmnd sectionTitle)
              ))))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (latex-dblock-section-insert segCmnd segTitle) [[elisp:(org-cycle)][| ]]
  ")

(defun pres-latex-dblock-section-insert (segCmnd segTitle)
  ""
  (insert "\
%%%#+BEGIN:")
          
  (insert
   (format "\
 bx:dblock:lcnt:latex-%s :disabledP \"false\" :seg-title \"%s\""
           segCmnd
           segTitle))
  
  (insert "
%%%#+END:
"
          )
  )

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex-pres"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-latex-pres)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
