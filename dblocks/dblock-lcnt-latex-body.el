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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* --  /DBLOCK LaTeX Body Inserts/ --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "Module Name"
(lambda () "*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message Module Name [[elisp:(org-cycle)][| ]]
")

(message "Module Name")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(require 'bx-lcnt-lib)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:warning-intro params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:warning-intro (params)
  (let ((bx:class (or (plist-get params :class) ""))
        (bx:langs (or (plist-get params :langs) "")))

    ;;;(bx:lcnt:info:base-read)
    ;;;(bxi:dblock-warning)
;;     (insert "%{{{ DBLOCK-warning-intro
;; %%%   This is a ByStar Body LaTeX document.
;; %%%   It includes Dynamic Blocks (dblock).
;; %%%   WARNING: Any edits inside of a dblock will be overwritten.
;; %}}} DBLOCK-warning-intro
    ;; ")

        (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: body:warning-intro modeStar*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")


    (when (or (equal bx:class "art+pres")
              (equal bx:class "pres+art")
              )
      (insert "\\mode*\n")
      )
    )
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:insert-artPresAllFigs params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:insert-artPresAllFigs (params)
  (let ((bx:class (or (plist-get params :class) ""))
        (bx:langs (or (plist-get params :langs) "")))

    (bx:lcnt:info:base-read)
    
    ;;; NOTYET, verify that  figures directory exists
    ;;; NOTYET, verify that  ./figures/artPresAllFigs.tex exists
    (insert-file "./figures/artPresAllFigs.tex")

    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:part-artpres params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:part-artpres (params)
  (let ((bx:part-title (or (plist-get params :part-title) ""))
        (bx:part-nu (or (plist-get params :part-nu) "")))

    (bx:lcnt:info:base-read)

    (insert (format "\\part{%s}\n"
                    bx:part-title))

    (insert (format "%%{{{ DBLOCK part-%s\n"
                    bx:part-title))

    (insert "
\\mode<presentation>{
\\begin{frame}
\\partpage
\\end{frame}

\\begin{frame}[plain]
")

    (insert (format "\\frametitle{Part %s: %s}\n" 
                    bx:part-nu
                    bx:part-title))

    (insert (format "\\tableofcontents[part=%s]\n" 
                    bx:part-nu))

    (insert "\\end{frame}
}\n")

    (insert (format "%%}}} DBLOCK part-%s"
                    bx:part-title))
    )
  )


;;;
;;; (fig-base-name "/lcnt/lgpc/bystar/permanent/general/overview/figures/bystarHourGlass.tex")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fig-base-name file-name) [[elisp:(org-cycle)][| ]]
  ")

(defun fig-base-name (file-name)
  "Given file-name figure base-name"
  (file-name-sans-extension (file-name-nondirectory file-name)))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:odg-artpres params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:odg-artpres (params)
  (let (
        (bx:fig-file (or (plist-get params :fig-file) ""))
        )

    (let ((fig-title (shell-command-to-string 
                     (format "echo -n $( cat %s )"
                             (concat (file-name-sans-extension bx:fig-file) ".title"))))
          (fig-caption (shell-command-to-string 
                     (format "echo -n $( cat %s )"
                             (concat (file-name-sans-extension bx:fig-file) ".caption"))))
          )

      (bx:lcnt:info:base-read)

      (insert (format "\
\\begin{comment}
******  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Figure/ =ODG-ArtPres=  *%s* -- %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
                      (fig-base-name bx:fig-file)
                      fig-title))


      (insert "
\\begin{presentationMode}
  
\\begin{latexonly}
  \\begin{figure}
    \\begin{center}")

      (insert (format "
       \\includegraphics[width=108mm,height=76mm,keepaspectratio]{%s}" 
                      (file-name-sans-extension bx:fig-file)))

      (insert "
    \\end{center}
  \\end{figure}
\\end{latexonly}

\\begin{htmlonly}
  \\begin{rawhtml}")

      (insert (format "
<div class=\"center\">
<img src=\"%s\" height=\"450\">
</div>"
                     (concat (file-name-sans-extension bx:fig-file) ".png")))

      (insert "
  \\end{rawhtml}
\\end{htmlonly}

\\end{presentationMode}    


\\begin{articleMode}
  
\\begin{latexonly}
  \\begin{figure}[H]
    \\begin{center}")
  
      (insert (format "
      \\includegraphics[width=\\textwidth]{%s}"
                      (file-name-sans-extension bx:fig-file)))

    ;;; BUG: insert-file-contents did not work

      (insert (format "
      \\caption{%s}"
                      fig-title))

      (insert (format "
      \\label{fig:%s}"
                      (fig-base-name bx:fig-file)))

      (insert "
    \\end{center}
  \\end{figure}
\\end{latexonly}

\\begin{htmlonly}
  %BEGIN IMAGE
  \\begin{center}")

      (insert (format "
      \\includegraphics[width=\\textwidth]{%s}"
                      (file-name-sans-extension bx:fig-file)))

      (insert "      
  \\end{center}
  %END IMAGE
  %HEVEA\\imageflush

  \\begin{figure}")

         ;;; BUG: insert-file-contents did not work

      (insert (format "
      \\caption{%s}"
                      fig-title))

      (insert (format "
      \\label{fig:%s}"
                      (fig-base-name bx:fig-file)))


      (insert "
  \\end{figure}
\\end{htmlonly}

\\end{articleMode}\n")

      )
    )
  )


(defun org-dblock-write:bx:lcnt:body:video-presArt (params)  
  (let (
        ($videoBaseFile (or (plist-get params :videoBaseFile) ""))
        ($presResolution (or (plist-get params :presResolution) "360"))
        ($artResolution (or (plist-get params :artResolution) "720"))           
        ($videoRawBaseName)
        ($videoBaseName)
        ($videoBaseDir) 
        ($videoBaseNameExtension)
        ($videoBaseNameSansExtension)           
        )
    
    (setq $videoRawBaseName (file-name-nondirectory $videoBaseFile))
    (setq $videoBaseDir (file-name-directory $videoBaseFile))    
    (if (string-prefix-p "master-" $videoRawBaseName)
        (setq $videoBaseName (substring $videoRawBaseName (length "master-")))
      (setq $videoBaseName $videoRawBaseName)
      )

    (setq $videoBaseNameExtension (file-name-extension $videoBaseName))
    (setq $videoBaseNameSansExtension (file-name-sans-extension $videoBaseName))    

    (insert (format "\
\\begin{comment}
******  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Video/ =PresArt=  *%s* -- %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
                      $videoRawBaseName
                      $videoBaseNameSansExtension
                      ))

      (insert (format "
\\begin{presentationMode}
\\begin{htmlonly}
  \\begin{rawhtml}
      <!-- data-autoplay  controls -->
    <p>
    <video     preload=\"auto\"  src=\"%s%s-%s.%s\" controls  height=\"80%%\" width=\"80%%\">
    </video>
    </p>
  \\end{rawhtml}
\\end{htmlonly}
\\end{presentationMode}
"
                      $videoBaseDir $videoBaseNameSansExtension $presResolution $videoBaseNameExtension
    ))

      (insert (format "
\\begin{articleMode}
\\begin{htmlonly}
  \\begin{rawhtml}
      <!-- data-autoplay  controls -->
    <p>
    <video  controls   preload=\"auto\"  src=\"%s%s-%s.%s\"  height=\"50%%\" width=\"50%%\">
    </video>
    </p>
  \\end{rawhtml}
\\end{htmlonly}
\\end{articleMode}
"
                      $videoBaseDir $videoBaseNameSansExtension $artResolution $videoBaseNameExtension
    ))
      ))


(defun org-dblock-write:bx:lcnt:body:videoJs-presArt (params)  
  (let (
        ($videoBaseFile (or (plist-get params :videoBaseFile) ""))
        ($presResolution (or (plist-get params :presResolution) "360"))
        ($artResolution (or (plist-get params :artResolution) "720"))           
        ($videoRawBaseName)
        ($videoBaseName)
        ($videoBaseDir) 
        ($videoBaseNameExtension)
        ($videoBaseNameSansExtension)           
        )
    
    (setq $videoRawBaseName (file-name-nondirectory $videoBaseFile))
    (setq $videoBaseDir (file-name-directory $videoBaseFile))    
    (if (string-prefix-p "master-" $videoRawBaseName)
        (setq $videoBaseName (substring $videoRawBaseName (length "master-")))
      (setq $videoBaseName $videoRawBaseName)
      )

    (setq $videoBaseNameExtension (file-name-extension $videoBaseName))
    (setq $videoBaseNameSansExtension (file-name-sans-extension $videoBaseName))    

    (insert (format "\
\\begin{comment}
******  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /VideoJs/ =PresArt=  *%s* -- %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
                      $videoRawBaseName
                      $videoBaseNameSansExtension
                      ))

      (insert (format "
\\begin{presentationMode}
\\begin{htmlonly}
  \\begin{rawhtml}
      <!-- VideoJs  controls -->

<div>
  <video id='%s' class=\"video-js vjs-default-skin center\" ></video>
</div>
"
                      $videoBaseNameSansExtension
                      ))

      (insert (format "
  <script>
    // fire up the plugin
    videojs('%s', {
      controls: true,
      muted: false,
      width: 750,
      plugins: {
        videoJsResolutionSwitcher: {
          ui: true,
          default: '%s', // 'low' Default resolution [{Number}, 'low', 'high'],
          dynamicLabel: true // Display dynamic labels or gear symbol
        }
      }
    }, function(){
      var player = this;
      window.player = player

      player.updateSrc([
        {
          src: '%s%s-144.%s',
          type: 'video/mp4',
          label: '144',
          res: 144
        },
        {
          src: '%s%s-360.%s',
          type: 'video/mp4',
          label: '360',
          res: 360
        },
        {
          src: '%s%s-720.%s',
          type: 'video/mp4',
          label: '720',
          res: 720
        },
        {
          src: '%s%s-1080.%s',
          type: 'video/mp4',
          label: '1080',
          res: 1080
        }
      ])

      player.on('resolutionchange', function(){
        console.info('Source changed to %%s', player.src())
      })

    })
  </script>
"
                      $videoBaseNameSansExtension
                      $presResolution
                      $videoBaseDir $videoBaseNameSansExtension $videoBaseNameExtension
                      $videoBaseDir $videoBaseNameSansExtension $videoBaseNameExtension
                      $videoBaseDir $videoBaseNameSansExtension $videoBaseNameExtension
                      $videoBaseDir $videoBaseNameSansExtension $videoBaseNameExtension                               
                      ))

      (insert (format "
  \\end{rawhtml}
\\end{htmlonly}
\\end{presentationMode}
"
                      ))
      
      (insert (format "
\\begin{articleMode}
\\begin{htmlonly}
  \\begin{rawhtml}
      <!-- data-autoplay  controls -->
    <p>
    <video  controls   preload=\"auto\"  src=\"%s%s-%s.%s\"  height=\"50%%\" width=\"50%%\">
    </video>
    </p>
  \\end{rawhtml}
\\end{htmlonly}
\\end{articleMode}
"
                      $videoBaseDir $videoBaseNameSansExtension $artResolution $videoBaseNameExtension
    ))
      ))




(defun org-dblock-write:bx:lcnt:body:videoYoutube-presArt (params)  
  (let (
        ($videoBaseFile (or (plist-get params :videoBaseFile) ""))
        ($presResolution (or (plist-get params :presResolution) "360"))
        ($artResolution (or (plist-get params :artResolution) "720"))           
        ($videoRawBaseName)
        ($videoBaseName)
        ($videoBaseDir) 
        ($videoBaseNameExtension)
        ($videoBaseNameSansExtension)           
        )
    
    (setq $videoRawBaseName (file-name-nondirectory $videoBaseFile))
    (setq $videoBaseDir (file-name-directory $videoBaseFile))    
    (if (string-prefix-p "master-" $videoRawBaseName)
        (setq $videoBaseName (substring $videoRawBaseName (length "master-")))
      (setq $videoBaseName $videoRawBaseName)
      )

    (setq $videoBaseNameExtension (file-name-extension $videoBaseName))
    (setq $videoBaseNameSansExtension (file-name-sans-extension $videoBaseName))    

    (insert (format "\
\\begin{comment}
******  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /VideoYoutube/ =PresArt=  *%s* -- %s ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
                      $videoRawBaseName
                      $videoBaseNameSansExtension
                      ))

      (insert (format "
\\begin{presentationMode}
\\begin{htmlonly}
  \\begin{rawhtml}

<iframe width=\"560\" height=\"315\" src=\"%s?rel=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>

"
                      $videoBaseFile
                      ))

      (insert (format "
  \\end{rawhtml}
\\end{htmlonly}
\\end{presentationMode}
"
                      ))
      
      (insert (format "
\\begin{articleMode}
\\begin{htmlonly}
  \\begin{rawhtml}

<iframe width=\"560\" height=\"315\" src=\"%s?rel=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>

  \\end{rawhtml}
\\end{htmlonly}
\\end{articleMode}
"
                      $videoBaseFile
    ))
      ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:toBeAddedText  params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:toBeAddedText (params)
  (let (
        (bx:mode (or (plist-get params :mode) "auto")) 
        )

        (insert (format "\
\\begin{comment}
******  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || *Incomplete Text*  ::  [[elisp:(org-cycle)][| ]]
\\end{comment}\n"
         ))
      ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:fig-artpres params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:fig-artpres (params)
  (let ((bx:fig-file (or (plist-get params :fig-file) ""))
        (bx:sec (or (plist-get params :sec) "")))
    (let ((fig-title (shell-command-to-string 
                     (format "echo -n $( cat %s )"
                             (concat (file-name-sans-extension bx:fig-file) ".title"))))
          (fig-caption (shell-command-to-string 
                     (format "echo -n $( cat %s )"
                             (concat (file-name-sans-extension bx:fig-file) ".caption"))))
          )

      (bx:lcnt:info:base-read)

      (insert (format "\\begin{comment}\n"))
      (insert (format "**     ======[[elisp:(org-cycle)][Fold]]======  /Figure:/ %s -- %s\n"
                      (fig-base-name bx:fig-file)
                      fig-title))
      (insert (format "\\end{comment}\n"))


      ;; (insert (format "%%{{{ DBLOCK %s-figure %s -- %s\n"
      ;;                      bx:sec
      ;;                      (fig-base-name bx:fig-file)
      ;;                      fig-title))


      (when (equal bx:sec "none")
        (message (format "Skipped: section{%s}\n" fig-title)))


      (when (equal bx:sec "sec")
        (insert (format "\\section{%s}\n\n" fig-title)))


      (when (equal bx:sec "subsec")
        (insert (format "\\subsection{%s}\n\n" fig-title)))

      (when (equal bx:sec "subsubsec")
        (insert (format "\\subsubsection{%s}\n\n" fig-title)))

      (insert "
\\begin{latexonly}
\\mode<presentation>{\n")

      ;;;(insert (format "\\begin{frame}[plain]{%s}\n" (fig-base-name bx:fig-file)))
      (insert (format "\\begin{frame}[plain]{%s}\n" fig-title))

      (insert "\\begin{figure}
\\begin{center}
")

      ;;;(insert (format "\\includegraphics[width=108mm,height=76mm,keepaspectratio]{figures/%s}\n" (fig-base-name bx:fig-file)))

      (insert (format "\\includegraphics[width=108mm,height=76mm,keepaspectratio]{%s}\n" 
                      (file-name-sans-extension bx:fig-file)))

      (insert "\\end{center}
\\end{figure}
")

      (insert "\\end{frame}\n}\n")

      (insert "\\mode<article>{\n")

      (insert "\\begin{figure}
\\begin{center}
")

      ;;;(insert (format "\\includegraphics[width=\\textwidth]{figures/%s}\n" (fig-base-name bx:fig-file)))
      (insert (format "\\includegraphics[width=\\textwidth]{%s}\n" (file-name-sans-extension bx:fig-file)))

    ;;; BUG: insert-file-contents did not work

      (insert (format "\\caption{%s}\n"
                      fig-title))

      (insert (format "\\label{fig:%s}\n" (fig-base-name bx:fig-file)))

      (insert "\\end{center}
\\end{figure}
}
\\end{latexonly}

\\begin{htmlonly}
\\begin{center}
%BEGIN IMAGE
\\begin{center}
")

      ;;;(insert (format "\\includegraphics[width=\\textwidth]{figures/%s}\n" (fig-base-name bx:fig-file)))
      (insert (format "\\includegraphics[width=\\textwidth]{%s}\n" (file-name-sans-extension bx:fig-file)))

      (insert "\\end{center}
%END IMAGE
%HEVEA\\imageflush
\\end{center}

\\begin{figure}
")
      (insert (format "\\caption{%s}\n"
                      fig-title))

      ;;(insert (format "\\label{fig:%s}\n" (fig-base-name bx:fig-file)))
      (insert (format "\\label{fig:%s}\n" (file-name-sans-extension bx:fig-file)))

      (insert "\\end{figure}
\\end{htmlonly}
")
      ;;;(insert (format "%%}}} sec-slide: %s" bx:fig-file))
      )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:about-this-document params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:about-this-document (params)
  (let ((bx:class (or (plist-get params :class) ""))
        (bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-about-this-document\n")
    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: body:about-this-document*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n")


    (when (equal bx:class "art")
      ;; Language dependent stuff can then come here

     (when (equal bx:langs "en")
      (insert "
\\section*{About This Document}

This document has been web published as PLPC-XXX. 
The access page for this document is:
It is available in pdf format at:
xxx
and as html at: yyy
")
      )
     )


    (when (or (equal bx:class "art+pres")
              (equal bx:class "pres+art")
              (equal bx:class "art")
              )
      ;; Language dependent stuff can then come here

     (when (equal bx:langs "en")
      (insert "
\\mode<article>{ 
\\section*{About This Document}

This document has been web published as PLPC-XXX. 
The access page for this document is:
It is available in pdf format at:
xxx
and as html at: yyy
}

")
      )
     
     (when (equal bx:langs "en+fa")
       (insert "
\\begin{faPar}
محسن دارِه ىک پاراقراپه مگفسل اونجا مينِيسِه وا هِى هِى ِدامِه ميدِه چُنکِه خِيلى راهت 
ميچِ نِوِشت. آلاوِه بار ان, با بايد کار ديگر بکنيم. ولى من نِميدونم چِجورى.

خب رافتيم. به پاراگراپه دِون.
\\end{faPar}

Some English \\RLE{\\persian{درست وصت انگليسى}} comes here.
Some \\begin{fa}درست وصت انگليسى\\end{fa} English comes here.
Some  English comes \\persian{درست وصت انگليسى} here.

\\begin{fa}
محسن دارِه ىک پاراقراپه مگفسل اونجا مينِيسِه وا هِى هِى ِدامِه ميدِه چُنکِه خِيلى راهت 
ميچِ نِوِشت. آلاوِه بار ان, با بايد کار ديگر بکنيم. ولى من نِميدونم چِجورى.

خب رافتيم. به پاراگراپه دِون.
\\end{fa}
")
       )
     
      )

    (when (or (equal bx:class "pres+art")
              (equal bx:class "art+pres")
              (equal bx:class "pres"))
      (insert "
\\mode<presentation>{
\\section*{About This Document}
\\begin{frame}{Some Frame Title}{}
  \\begin{itemize}
  \\item This text only apears in the presentation form
  \\end{itemize}
")

     (when (equal bx:langs "en+fa")
       (insert "
\\begin{faPar}
محسن دارِه ىک پاراقراپه مگفسل اونجا مينِيسِه وا هِى هِى ِدامِه ميدِه چُنکِه خِيلى راهت 
ميچِ نِوِشت. آلاوِه بار ان, با بايد کار ديگر بکنيم. ولى من نِميدونم چِجورى.

خب رافتيم. به پاراگراپه دِون.
\\end{faPar}

Some English \\RLE{\\persian{درست وصت انگليسى}} comes here.
Some \\begin{fa}درست وصت انگليسى\\end{fa} English comes here.
Some  English comes \\persian{درست وصت انگليسى} here.
")
       )

      (insert "
\\end{frame}
}
")
      )

    ;;;(insert "%}}} DBLOCK-about-this-document")
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:body:colophon params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:body:colophon (params)
  (let ((bx:class (or (plist-get params :class) ""))
        (bx:langs (or (plist-get params :langs) "")))
    (bx:lcnt:info:base-read)
    ;;;(insert "%{{{ DBLOCK-colophon\n")

    (insert "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  *DBLK: body:colophon*                                       :: [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]]  [[elisp:(org-cycle)][| ]]
\\end{comment}\n") 
    

    (when (equal bx:class "art")
      (insert "
\\section*{Colophon}
This document was produced with Halaal Software and is 
published using Halaal Internet Services.

It uses LaTeX, beamer, ByStar, Blee, Emacs, ...
")
      )

    (when (or (equal bx:class "art+pres")
              (equal bx:class "pres+pres")
              )
      (insert "
\\mode<article>{ 
\\section*{Colophon}
This document was produced with Halaal Software and is 
published using Halaal Internet Services.

It uses LaTeX, beamer, ByStar, Blee, Emacs, ...
}
")
      )

    (when (or (equal bx:class "pres+art")
              (equal bx:class "art+pres")
              (equal bx:class "pres"))
      (insert "
\\mode<presentation>{
\\section*{Colophon}
\\begin{frame}{Colophon}{}
  \\begin{itemize}
  \\item Produced with Halaal Software and Halaal Internet Services.
  \\item It uses LaTeX, beamer, ByStar, Blee, Emacs, ...
  \\end{itemize}
\\end{frame}
}
")
      )
    ;;;(insert "%}}} DBLOCK-colophon\n")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lcnt:latex:end-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lcnt:latex:end-of-file (params)
  (let (
        (bx:class (or (plist-get params :class) ""))
        (bx:langs (or (plist-get params :langs) ""))
        (masters (or (plist-get params :masters) ""))   
        )

    ;;;(bx:lcnt:info:base-read)
    ;;;(bxi:dblock-warning)
    (insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] EndOfFileVars ::  *DBLK: Org-Mode And Emacs Specific Configurations*   [[elisp:(org-cycle)][| ]]
\\end{comment}

%%+CATEGORY: lcnt.latex.inputed
%%+STARTUP: content
"
                    ))
    
    (insert (format "
%%local variables:
%%major-mode: latex-mode
%%folded-file: nil
%%fill-column: 65
%%TeX-master: \"%s\"
%%End:"
                    masters))
    ))

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-latex-body"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-latex-body)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
