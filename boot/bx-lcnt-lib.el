;; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bx:lcnt:all-defaults-set)
;;
;; bx:lcnt 

;;;------------------------------------------------
;;;  Lcnt 
;;;------------------------------------------------

;; (bx:lcnt:all-defaults-set)
(defun bx:lcnt:all-defaults-set ()
  ""
  (interactive)

  (message "bx:lcnt:defaults-set -- Done." )
  )

;;; Temp experiments
;;(put 'bx:m17n:langs-par 'primary "russian")
;;(symbol-plist 'bx:m17n:langs-par)
;;(get 'bx:m17n:langs-par 'primary)
;; (message "%s" (get 'bx:m17n:langs-par 'primary))
;;(pp-eval-expression '(symbol-plist 'bx:m17n:langs-par))


;;;   (bx:lcnt:info:base-read)
(defun bx:lcnt:info:base-read () ;;;(folder)
  ""
  (interactive)
  (bx:lcnt:info:base-read-dir default-directory)
)

;;;   (bx:lcnt:info:base-read-dir "/lcnt/lgpc/mohsen/permanent/polyExistential/mb_polyExistentials")
;;;   (bx:lcnt:info:base-read-dir "/bxo/iso/pip_lcnt_polyexistentals/lcnt/lgpc/permanent/mb_polyExistentials")
;;;   (bx:lcnt:info:base-read-dir "/bxo/iso/pip_lcnt_bystarOverview/lcnt/lgpc/bystar/permanent/general/bleePersoArabic")
;;;   (bx:lcnt:info:base-read-dir "/bxo/iso/pip_lcnt_bystarCommon/lcnt/lgpc/bystar/permanent/usage/bleeEnFa")
;;;   (get 'bx:lcnt:info:base 'authorUrl1)
(defun bx:lcnt:info:base-read-dir (dir)
  ""
  (interactive "DEnter Directory:")

  (let ((lcnt-info-base-dir (concat dir "/LCNT-INFO")))
    (if (not (file-directory-p lcnt-info-base-dir))
	(message (concat "Missing:"  (concat folder "/LCNT-INFO")))
      (progn 
	(setq bx:lcnt:info:base "folder")

	;;(get 'bx:lcnt:info:base 'lcntNu)
	(put 'bx:lcnt:info:base 
	     'lcntNu
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/lcntNu )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'type
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/type )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'date
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/date )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'url
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/url )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'shortTitle
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/shortTitle )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'mainTitle
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/mainTitle )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'subTitle
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/subTitle )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'subSubTitle
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/subSubTitle )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'version
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/version )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'author1
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/author1 )" lcnt-info-base-dir))
	     )

	(put 'bx:lcnt:info:base 
	     'authorName1
	     (shell-command-to-string 
	      (format "echo -n $( lcnLcntInfo.sh -n showRun -p cntntRawHome=%s -i get authorName 1 )" dir))
	     )

	(put 'bx:lcnt:info:base 
	     'authorUrl1
	     (shell-command-to-string 
	      (format "echo -n $( lcnLcntInfo.sh -n showRun -p cntntRawHome=%s -i get authorUrl 1 )" dir))
	     )

	(put 'bx:lcnt:info:base 
	     'organization
	     (shell-command-to-string 
	      (format "echo -n $( head -1 %s/organization )" lcnt-info-base-dir))
	     )
	(put 'bx:lcnt:info:base 
	     'docSrcList
	     (shell-command-to-string 
	      ;;(format "echo -n $( head -1 %s/docSrcList )" lcnt-info-base-dir))
	      (format "echo -n $( cat %s/docSrcList )" lcnt-info-base-dir))
	     )
	(put 'bx:lcnt:info:base 
	     'bystarUid
	     (shell-command-to-string 
	      (format "echo -n $( cat %s/bystarUid )" lcnt-info-base-dir))
	     )
	;; (put 'bx:lcnt:info:base 
	;;      'articleFileName
	;;      (shell-command-to-string 
	;;       (format "echo -n $( %s/lcntProc.sh  -i getArticleSrcFile %s )" dir dir))
	;;      )
	;; (put 'bx:lcnt:info:base 
	;;      'presentationFileName
	;;      (shell-command-to-string 
	;;       (format "echo -n $( %s/lcntProc.sh  -i getPresentationSrcFile %s )" dir dir))
	;;      )
	;; (put 'bx:lcnt:info:base 
	;;      'presArtSrcFile
	;;      (shell-command-to-string 
	;;       (format "echo -n $( cat %s/presArtSrcFile )" lcnt-info-base-dir))
	;;      )
	)
      )))

  
;;;   (bx:lcnt:info:base-show-after-read-old)
(defun bx:lcnt:info:base-show-after-read-old () ;;;(folder)
  ""
  (interactive)

  (bx:lcnt:info:base-read)

  (with-output-to-temp-buffer (help-buffer)
    (switch-to-buffer (help-buffer))
    (goto-char (point-max))
    (insert "
bx:lcnt:info:base-show

(symbol-plist 'bx:lcnt:info:base) VALUES ARE:
\n")
    
      (goto-char (point-max))
      (pp-eval-expression '(symbol-plist 'bx:lcnt:info:base))
   
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (kill-buffer "*Pp Eval Output*")
      (goto-char (point-min))
))
  
  
;;;   (bx:lcnt:info:base-show)
(defun bx:lcnt:info:base-show ()
  ""
  (interactive)

  ;;;(bx:lcnt:info:base-read)

  (with-output-to-temp-buffer (help-buffer)
    (switch-to-buffer (help-buffer))
    (goto-char (point-max))
    (insert "
bx:lcnt:info:base-show

(symbol-plist 'bx:lcnt:info:base) VALUES ARE:
\n")
    
      (goto-char (point-max))
      (pp-eval-expression '(symbol-plist 'bx:lcnt:info:base))
   
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (kill-buffer "*Pp Eval Output*")
      (goto-char (point-min))
))

;;;   (bx:lcnt:info:base-read-show "/lcnt/lgpc/mohsen/permanent/polyExistential/mb_polyExistentials")
(defun bx:lcnt:info:base-read-show (@dir)
  ""
  (interactive "DEnter Directory:")

  (when (bx:lcnt:info:base-read-dir @dir)
    (bx:lcnt:info:base-show)
    )
  )
 

  
;;;   (bx:lcnt:curBuild:base-show)
(defun bx:lcnt:curBuild:base-show ()
  ""
  (interactive)

  ;;;(bx:lcnt:curBuild:base-read)

  (with-output-to-temp-buffer (help-buffer)
    (switch-to-buffer (help-buffer))
    (goto-char (point-max))
    (insert "
bx:lcnt:curBuild:base-show

(symbol-plist 'bx:lcnt:curBuild:base) VALUES ARE:
\n")
    
      (goto-char (point-max))
      (pp-eval-expression '(symbol-plist 'bx:lcnt:curBuild:base))
   
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (kill-buffer "*Pp Eval Output*")
      (goto-char (point-min))
))

;;;   (bx:lcnt:curBuild:base-read-show "/lcnt/lgpc/mohsen/permanent/polyExistential/mb_polyExistentials")
(defun bx:lcnt:curBuild:base-read-show (@dir)
  ""
  (interactive "DEnter Directory:")

  (when (bx:lcnt:curBuild:base-read-dir @dir)
    (bx:lcnt:curBuild:base-show)
    )
  )
 




;;;   (bx:lcnt:curBuild:base-read)
(defun bx:lcnt:curBuild:base-read ()
  ""
  (interactive)
  (bx:lcnt:curBuild:base-read-dir default-directory)
)

;;;   (bx:lcnt:curBuild:base-read-dir "/lcnt/lgpc/mohsen/permanent/polyExistential/mb_polyExistentials")
(defun bx:lcnt:curBuild:base-read-dir (@dir)
  " For documentation see: /libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntBuilds/fullUsagePanel-en.org
"
  (interactive "DEnter Directory:")

  (let (
	($curBuildBaseDir (concat @dir "/curBuild"))
	)

    (when (not (file-directory-p $curBuildBaseDir))
      (message (format "Missing: %s" $curBuildBaseDir))
      nil
      )
    
    (when (file-directory-p $curBuildBaseDir)
      (setq bx:lcnt:curBuild:base $curBuildBaseDir)      
    
      ;;(get 'bx:lcnt:curBuild:base 'paperSize)
      (put 'bx:lcnt:curBuild:base 
	   'paperSize
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/paperSize )" $curBuildBaseDir))
	   )
      
      ;;(get 'bx:lcnt:curBuild:base 'buildName)
      (put 'bx:lcnt:curBuild:base 
	   'buildName
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/buildName )" $curBuildBaseDir))
	   )
      
      ;;(get 'bx:lcnt:curBuild:base 'docSrc)
      (put 'bx:lcnt:curBuild:base 
	   'docSrc
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/docSrc )" $curBuildBaseDir))
	   )
      
      ;;(get 'bx:lcnt:curBuild:base 'sides)
      (put 'bx:lcnt:curBuild:base 
	   'sides
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/sides )" $curBuildBaseDir))
	   )
       
      ;;(get 'bx:lcnt:curBuild:base 'results)
      (put 'bx:lcnt:curBuild:base 
	   'results
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/results )" $curBuildBaseDir))
	   )
       
      ;;(get 'bx:lcnt:curBuild:base 'buildDocClass)
      (put 'bx:lcnt:curBuild:base 
	   'buildDocClass
	   (shell-command-to-string 
	    (format "echo -n $( head -1 %s/buildDocClass )" $curBuildBaseDir))
	   )
      
      t
      )
    )
  )

  
;;;   (bx:lcnt:curBuild:base-show)
(defun bx:lcnt:curBuild:base-show ()
  ""
  (interactive)

  ;;;(bx:lcnt:curBuild:base-read)

  (with-output-to-temp-buffer (help-buffer)
    (switch-to-buffer (help-buffer))
    (goto-char (point-max))
    (insert "
bx:lcnt:curBuild:base-show

(symbol-plist 'bx:lcnt:curBuild:base) VALUES ARE:
\n")
    
      (goto-char (point-max))
      (pp-eval-expression '(symbol-plist 'bx:lcnt:curBuild:base))
   
      (insert-buffer "*Pp Eval Output*")

      (goto-char (point-max))
      (insert "\n")

      (kill-buffer "*Pp Eval Output*")
      (goto-char (point-min))
))

;;;   (bx:lcnt:curBuild:base-read-show "/lcnt/lgpc/mohsen/permanent/polyExistential/mb_polyExistentials")
(defun bx:lcnt:curBuild:base-read-show (@dir)
  ""
  (interactive "DEnter Directory:")

  (when (bx:lcnt:curBuild:base-read-dir @dir)
    (bx:lcnt:curBuild:base-show)
    )
  )
 


(provide 'bx-lcnt-lib)
