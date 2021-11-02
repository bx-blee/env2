;;; -*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:


(require 'bx-lcnt-lib)

(require 's)

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))


;;;
;;;  Layered as:
;;;   file-insert                                  :file
;;;   file-insert-prepend                          :file                  
;;;   file-insert-cond              :cond x.el     :file
;;;   file-insert-replace                          :file      :fileVar1 fileParam   :fileVar2
;;;   file-insert-replace-cond      :cond x.el     :file      :fileVar1 fileParam   :fileVar2
;;;   file-insert-process                          :file      :load  lispCode.el      :exec "funcName"
;;;   file-insert-process-cond      :cond x.el     :file      :load  lispCode.el      :exec "funcName"
;;;

(defalias 'org-dblock-write:bx:icm:python:name 'org-dblock-write:bx:global:icm:name-py)

(defun org-dblock-write:bx:icm:py:name (params)
  ""
  (insert (format "icmInfo['moduleName'] = \"%s\"" (file-name-sans-extension (bx:buf-fname))))
  )

(defun org-dblock-write:bx:global:icm:name-py (params)
  ""
  (insert (format "__icmName__ = \"%s\"" (file-name-sans-extension (bx:buf-fname))))
  )

(defalias 'org-dblock-write:bx:icm:python:libName 'org-dblock-write:bx:global:lib:name-py)

(defun org-dblock-write:bx:global:lib:name-py (params)
  ""
  (insert (format "__libName__ = \"%s\"" (file-name-sans-extension (bx:buf-fname))))
  )

(defun org-dblock-write:bx:icm:py:version-timestamp (params)
  ""
  (insert (format "icmInfo['version'] = \"%s\"" (format-time-string "%Y%m%d%M%S")))
  )

(defun org-dblock-write:bx:global:timestamp:version-py (params)
  ""
  (insert (format "__version__ = \"%s\"" (format-time-string "%Y%m%d%M%S")))
  )

(defun org-dblock-write:bx:icm:py:status (@params)
  ""
  (let (($status (or (plist-get @params :status) ""))
	)
    (insert (format "icmInfo['status']  = \"%s\"" $status))
    ))


(defun org-dblock-write:bx:global:icm:status-py (@params)
  ""
  (let (($status (or (plist-get @params :status) ""))
	)
    (insert (format "__status__ = \"%s\"" $status))
    ))

(defun org-dblock-write:bx:global:icm:section-py (@params)
  ""
  (let (($status (or (plist-get @params :status) ""))
	)
    (insert (format "__status__ = \"%s\"" $status))
    ))


(defun org-dblock-write:bx:dblock:global:iim:name-py (params)
  "params could be something like :style fileName"
  (insert (format "__iimName__ = \"%s\"" (file-name-sans-extension (bx:buf-fname))))
  )

(defun org-dblock-write:bx:dblock:global:timestamp:version-py (params)
  "params could be something like :style date"
  (insert (format "__version__ = \"%s\"" (format-time-string "%Y%m%d%M%S")))
  )

(defun org-dblock-write:bx:dblock:global:copy-file (params)
  "Invoke copy-file on params"
  (let( (source-file (or (plist-get params :source) ""))
	(destination-file (or (plist-get params :destination) ""))
	)
    (copy-file source-file destination-file 't)
    )
  )

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;;; (outlineLevelStars 1)
(defun outlineLevelStars (outLineLevel)
  "For now we just return one star"
  (make-string outLineLevel ?*)
  )

;;; (bx:orgFileLink "/etc/motd")
(defun bx:orgFileLink (filePath orgFileStr)
  "return an edit orgLink for the filePath"
  (format "[[file:%s][%s]]" filePath orgFileStr)
  )

(defun org-dblock-write:bx:dblock:global:file-insert (params)
  "If type is specified, additional text (eg closing comment) is inserted.
If mode is specified, the insert goes in as a comment.
outLevel applies to org-mode indentation.
surround is for panel decoration."
  (let (
	(bx:file (or (plist-get params :file) ""))
	($type (or (plist-get params :type) "none"))	        
	(bx:mode (or (plist-get params :mode) "auto"))	
	(bx:outLevel (or (plist-get params :outLevel) 1))
	(bx:surround (or (plist-get params :surround) ""))	
       	(fileAsString)
	(outlineStars)
	(orgFileLink)
	)

    (bx:dblock:global:typed:insert-begin $type)   
    
    (if (string-equal "auto" bx:mode)
	(progn
	  (setq bx:mode major-mode)
	  ))
    
    (setq orgFileLink (bx:orgFileLink bx:file "dblock-inFile"))
    (setq outlineStars (outlineLevelStars bx:outLevel))
    (setq fileAsString (get-string-from-file (format "%s" bx:file)))

    (bx:dblock:global:moded:insert-begin bx:mode)

    
    (when (equal "default" bx:surround)
      (insert (format "%s /->/ (%s\n" outlineStars orgFileLink))
      )
    (when (equal "terseEnd" bx:surround)
      (insert (format "%s /->/ (%s\n" outlineStars orgFileLink))
      )
    (insert fileAsString)
    ;;; This does not work right -- hence above (insert-file (format "%s" bx:file))
    (when (equal "default" bx:surround)
      (insert (format "%s /<-/ %s)  E|" outlineStars orgFileLink))      
      )
    (when (equal "terseEnd" bx:surround)
      (insert (format "%s /<-/ )  E|" outlineStars))      
      )

    
    (bx:dblock:global:moded:insert-end bx:mode)
    
    ;;; An extra line end up there -- Not Solved Yet
    ;;(beginning-of-line)
    ;;(kill-line)
    ))

;;;
(defun org-dblock-write:bx:dblock:global:this-file (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  (bx:dblock:global:moded:insert-begin bx:mode)
	  (setq out-string (concat "*  #This File: " buffer-file-name "\n"))
	  (insert out-string)
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )

;;;
(defun org-dblock-write:bx:dblock:global:org-controls (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	($outLevel 1)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  
	  (bx:dblock:global:moded:insert-begin bx:mode)

	  (bx:dblock:org-mode:func-open $outLevel (compile-time-function-name))
	  
	  ;;; This needs to become when major-mode based
	  
	  (insert (format "\
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]\
 | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]]\
 | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]
"))

	  (bx:dblock:org-mode:func-close 1 (compile-time-function-name))

	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )


(defun org-dblock-write:bx:dblock:global:org-controls (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  
	  (bx:dblock:global:moded:insert-begin bx:mode)

	  (bx:dblock:org-mode:func-open 1 (compile-time-function-name))
	  
	  ;;; This needs to become when major-mode based
	  
	  (insert (format "\
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]\
 | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]]\
 | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]
"))

	  (bx:dblock:org-mode:func-close 1 (compile-time-function-name))

	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )

;;;
(defun org-dblock-write:bx:blee:panel:relatedGeneralPanels (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  
	  (bx:dblock:global:moded:insert-begin bx:mode)

	  (bx:dblock:org-mode:func-open 1 (compile-time-function-name))
	  
	  ;;; This needs to become when major-mode based
	  
	  (insert (format "\
* Related General BxPanels ::  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/bxServices/bxCentral/fullUsagePanel-en.org\")][bxCentral]] || [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/bxDE/main/fullUsagePanel-en.org\")][bxDE]] || Category Panels
"))

	  (bx:dblock:org-mode:func-close 1
	   (compile-time-function-name)
	   :style "terse"
	   )
	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )


;;;
(defun org-dblock-write:bx:blee:panel:maintenanceTodos (@params)
  (let (
	($style (or (plist-get @params :style) ""))
	)
	  
    (bx:dblock:global:moded:insert-begin bx:mode)

    (bx:dblock:org-mode:func-open 1 (compile-time-function-name))
	  
    ;; This needs to become when major-mode based
    
    (insert (format "\
%s 
* Related General BxPanels ::  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/bxServices/bxCentral/fullUsagePanel-en.org\")][bxCentral]] || [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/bxDE/main/fullUsagePanel-en.org\")][bxDE]] || Category Panels
"))

    (bx:dblock:org-mode:func-close 1
     (compile-time-function-name)
     :style "terse"
     )
	  
    (bx:dblock:global:moded:insert-end bx:mode)
    (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
    )
  )



;;;
(defun org-dblock-write:bx:dblock:global:org-contents-list (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  (bx:dblock:global:moded:insert-begin bx:mode)
	  ;;; This needs to become when major-mode based

	  ;;; (outStrForMode "auto")
	  (defun outStrForMode (mode)
	    (if (string-equal "auto" mode)
		(setq mode major-mode)
	      )

	    (cond
	     (
	      (string-equal "none" mode)
	      ""
	      )
	     (
	      (string-equal "latex-mode" mode)
	      "[[elisp:(reftex-toc)][(RefTOC)]]"
	      )
	     (t
	      ""
	      )
	     ))
	  
	  (insert (format "\
*      ################ CONTENTS-LIST  %s ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
*  /OBSOLETED by  org-dblock-write:bx:global:org-contents-list/
"
		  (outStrForMode bx:mode)))	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )


(defun org-dblock-write:bx:global:org-contents-list (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  (bx:dblock:global:moded:insert-begin bx:mode)
	  ;;; This needs to become when major-mode based

	  ;;; (outStrForMode "auto")
	  (defun outStrForMode (mode)
	    (if (string-equal "auto" mode)
		(setq mode major-mode)
	      )

	    (cond
	     (
	      (string-equal "none" mode)
	      ""
	      )
	     (
	      (string-equal "latex-mode" mode)
	      "[[elisp:(reftex-toc)][(RefTOC)]]"
	      )
	     (t
	      ""
	      )
	     ))
	  
	  (insert (format "\
*      ################ CONTENTS-LIST  %s ###############
"
		  (outStrForMode bx:mode)))	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )


(defun org-dblock-write:bx:global:org-doc-status (params)
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(out-string)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  (bx:dblock:global:moded:insert-begin bx:mode)
	  ;;; This needs to become when major-mode based
	  
	  (insert (format "\
%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] =  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
"
			  "*"
			  )
		  )
	  
	  (bx:dblock:global:moded:insert-end bx:mode)
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    )
  )



(defun org-dblock-write:bx:dblock:global:file-insert-cond (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName"
  (let( (bx:cond (or (plist-get params :cond) ""))
	(bx:file (or (plist-get params :file) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(cond-buffer-name (generate-new-buffer-name "dblock-cond"))
	)
    (save-excursion
      (if (file-exists-p bx:cond)
	  (progn
	    (switch-to-buffer (get-buffer-create cond-buffer-name))
	    (insert-file-contents (format "%s" bx:cond))

	    (goto-char (point-min))
	    (if (call-interactively 'eval-defun)
		(progn
		  (message (format "%s file evaled to non-nil -- Being Included" bx:cond))
		  (save-excursion
		    (switch-to-buffer (get-buffer-create tmp-buffer-name))
		    (insert-file (format "%s" bx:file))
		    )
		  )
	      (message (format "%s file evaled to nil -- Inclusion Skipped" bx:cond))
	      )
	    )
	(progn
	  (message (format "Missing %s file -- Including" bx:cond))
	  (save-excursion
	    (switch-to-buffer (get-buffer-create tmp-buffer-name))
	    (insert-file-contents (format "%s" bx:file))
	    )
	  )
	)
      )
    (if (get-buffer tmp-buffer-name)
	(progn
	  (insert-buffer-substring tmp-buffer-name)
	  (kill-line)  ;;; IMPORTANT -- Otherwise there will be an extra empty line
	  (kill-buffer tmp-buffer-name)
	  )
      )
    (if (get-buffer cond-buffer-name)
	(kill-buffer cond-buffer-name)
      )
    ))


(defun org-dblock-write:bx|file-insert-prepend (params)
  "insert :file"
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(bx:file (or (plist-get params :file) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(lines)
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (save-excursion
	    (switch-to-buffer (get-buffer-create tmp-buffer-name))
	    (goto-char (point-min))		  
	    (mapcar '(lambda (arg)
		       (progn
			 (insert
			  (s-prepend ";;; " arg))
			 (insert "\n")
			 ))
		    (read-lines (format "%s" bx:file))
		    )
	    (goto-char (point-max))		  
	    )
	  (if (get-buffer tmp-buffer-name)
	      (progn
		(insert-buffer tmp-buffer-name)
		(kill-buffer tmp-buffer-name)
		)
	    )
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    ))




(defun org-dblock-write:bx:dblock:global:moded:file-insert (params)
  "insert :file"
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(bx:file (or (plist-get params :file) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))	
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (save-excursion
	    (switch-to-buffer (get-buffer-create tmp-buffer-name))
	    (goto-char (point-min))		  
	    (bx:dblock:global:moded:insert-begin bx:mode)		  
	    (insert-file (format "%s" bx:file))
	    (goto-char (point-max))		  
	    (bx:dblock:global:moded:insert-end bx:mode)				  
	    )
	  (if (get-buffer tmp-buffer-name)
	      (progn
		(insert-buffer tmp-buffer-name)
		(kill-buffer tmp-buffer-name)
		)
	    )
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    ))


(defun org-dblock-write:bx:dblock:global:moded:file-insert-cond (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName"
  (let (
	(bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:mode (or (plist-get params :mode) "auto"))       
	(bx:cond (or (plist-get params :cond) ""))
	(bx:file (or (plist-get params :file) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(cond-buffer-name (generate-new-buffer-name "dblock-cond"))
	)
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  (if (string-equal "auto" bx:mode)
	      (progn
		(setq bx:mode major-mode)
		))
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (save-excursion
	    (if (file-exists-p bx:cond)
		(progn
		  (switch-to-buffer (get-buffer-create cond-buffer-name))
		  (insert-file-contents (format "%s" bx:cond))

		  (goto-char (point-min))
		  (if (call-interactively 'eval-defun)
		      (progn
			(message (format "%s file evaled to non-nil -- Being Included" bx:cond))
			(save-excursion
			  (switch-to-buffer (get-buffer-create tmp-buffer-name))
			  (bx:dblock:global:moded:insert-begin bx:mode)
			  (insert-file (format "%s" bx:file))	
			  (bx:dblock:global:moded:insert-end bx:mode)		
			  )
			)
		    (message (format "%s file evaled to nil -- Inclusion Skipped" bx:cond))
		    )
		  )
	      (progn
		(message (format "Missing %s file -- Including" bx:cond))
		(save-excursion
		  (switch-to-buffer (get-buffer-create tmp-buffer-name))
		  (goto-char (point-min))		  
		  (bx:dblock:global:moded:insert-begin bx:mode)		  
		  (insert-file (format "%s" bx:file))
		  (goto-char (point-max))		  
		  (bx:dblock:global:moded:insert-end bx:mode)				  
		  )
		)
	      )
	    )
	  (if (get-buffer tmp-buffer-name)
	      (progn
		(insert-buffer tmp-buffer-name)
		(kill-buffer tmp-buffer-name)
		)
	    )
	  (if (get-buffer cond-buffer-name)
	      (kill-buffer cond-buffer-name)
	    )
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    ))


;;;(bx:dblock:global:moded:insert-begin "none")
;;;(bx:dblock:global:moded:insert-begin "auto")
;;;(bx:dblock:global:moded:insert-begin "emacs-lisp-mode")
;;;
(defun* bx:dblock:global:moded:insert-begin (mode)
  ""
  (if (string-equal "none" mode)
      (return-from bx:dblock:global:moded:insert-begin)
    )

  (if (string-equal "auto" mode)
      (progn
	(setq mode major-mode)
	))
  
  (progn
    (cond ((string-equal "emacs-lisp-mode" mode)
	   (insert "(lambda () \"\n")	   
	   )
	  ((string-equal "latex-mode" mode)
	   (bx:latex:insert-begin-comment)	     
	   (message "Begin-Comment Set to latex-mode")
	   )
	  ((string-equal "sh-mode" mode)
	   (bx:sh-mode:insert-begin-comment)
	   (message (format "Begin-Comment Set to: %s" mode))
	   )
	  ((string-equal "html-mode" major-mode)
	   (message (format "Set to: %s -  ####+BEGIN..." mode))
	   )
	  (t
	   (message (format "major-mode: %s - dblock re unchanged" mode))
	   )
	  )
    )
  )

;;;(bx:dblock:global:typed:insert-begin "html")
(cl-defun bx:dblock:global:typed:insert-begin (type)
  ""
  (if (string-equal "none" type)
      (cl-return-from bx:dblock:global:typed:insert-begin)
    )
  
  (progn
    (cond ((string-equal "html" type)
	   (insert "-->\n")	   
	   )
	  (t
	   (message (format "typed-insert-begin unexpected type: %s" type))
	   )
	  )
    )
  )



;;;(bx:dblock:global:moded:insert-end "none")
;;;(bx:dblock:global:moded:insert-end "auto")
;;;(bx:dblock:global:moded:insert-end "emacs-lisp-mode")
;;;
(defun* bx:dblock:global:moded:insert-end (mode)
  ""
  (if (string-equal "none" mode)
      (return-from bx:dblock:global:moded:insert-end)
    )

  (if (string-equal "auto" mode)
      (progn
	(setq mode major-mode)
	))

  (progn
    (cond ((string-equal "emacs-lisp-mode" mode)
	   (insert "\n\")")	   
	   )
	  ((string-equal "latex-mode" mode)
	   (bx:latex:insert-end-comment)	     
	   (message "NON-AUTO Set to latex-mode")
	   )
	  ((string-equal "sh-mode" mode)
	   (bx:sh-mode:insert-end-comment)
	   (message (format "End-Comment Set to: %s" mode))
	   )
	  ((string-equal "html-mode" major-mode)
	   (message (format "Set to: %s -  ####+END..." mode))
	   )
	  ((string-equal "org-mode" major-mode)
	   (message (format "Set to: %s - blank end" mode))
	   )
	  (t
	   (message (format "major-mode: %s - dblock re unchanged" mode))
	   )
	  )
    )
  )


(defun bx:latex:insert-begin-comment ()
  (insert "\\begin{comment}\n"))
  

(defun bx:latex:insert-end-comment ()
  ""
  (insert "\
\\end{comment}"
	  )
  )

(defun bx:sh-mode:insert-begin-comment ()
  (insert "_CommentBegin_\n"))
  

(defun bx:sh-mode:insert-end-comment ()
  ""
  (insert "\
_CommentEnd_"
	  )
  )


(defun org-dblock-write:bx:dblock:global:file-insert-cond-strict (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName.
   Difference between file-insert-cond and file-insert-cond-strict is
   that if bx:cond does not exist, inclusion is skipped with -strict.
  "
  (let( (bx:cond (or (plist-get params :cond) ""))
	(bx:file (or (plist-get params :file) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(cond-buffer-name (generate-new-buffer-name "dblock-cond"))
	)
    (save-excursion
      (if (file-exists-p bx:cond)
	  (progn
	    (switch-to-buffer (get-buffer-create cond-buffer-name))
	    (insert-file-contents (format "%s" bx:cond))

	    (goto-char (point-min))
	    (if (call-interactively 'eval-defun)
		(progn
		  (message (format "%s file evaled to non-nil -- Being Included" bx:cond))
		  (save-excursion
		    (switch-to-buffer (get-buffer-create tmp-buffer-name))
		    (insert-file (format "%s" bx:file))
		    )
		  )
	      (message (format "%s file evaled to nil -- Inclusion Skipped" bx:cond))
	      )
	    )
	(progn
	  (message (format "Missing %s file -- Inclusion Skipped" bx:cond))
	  )
	)
      )
    (if (get-buffer tmp-buffer-name)
	(progn
	  (insert-buffer tmp-buffer-name)
	  (kill-buffer tmp-buffer-name)
	  )
      )
    (if (get-buffer cond-buffer-name)
	(kill-buffer cond-buffer-name)
      )
    ))


(defun org-dblock-write:bx:dblock:global:file-insert-replace (params)
  (let ((bx:file (or (plist-get params :file) ""))
	(bx:fileVar1 (or (plist-get params :fileVar1) ""))
	(bx:fileVar2 (or (plist-get params :fileVar2) ""))
	(bx:fileVar3 (or (plist-get params :fileVar3) ""))
	(tmp-buffer (generate-new-buffer-name "dblock-tmp"))
	)
    (save-excursion
      (switch-to-buffer (get-buffer-create tmp-buffer))
      (insert-file (format "%s" bx:file))
    
      (goto-char (point-min))
      ;;(insert (format "xx%s" (file-name-nondirectory bx:fileVar1)))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar1)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar1)))

      (goto-char (point-min))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar2)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar2)))

      (goto-char (point-min))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar3)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar3)))

      )
    (insert-buffer tmp-buffer)
    (kill-buffer tmp-buffer)
    ))


(defun org-dblock-write:bx:dblock:global:file-insert-replace-cond (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName"
  (let( (bx:cond (or (plist-get params :cond) ""))
	(bx:file (or (plist-get params :file) ""))
	(bx:fileVar1 (or (plist-get params :fileVar1) ""))
	(bx:fileVar2 (or (plist-get params :fileVar2) ""))
	(bx:fileVar3 (or (plist-get params :fileVar3) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(cond-buffer-name (generate-new-buffer-name "dblock-cond"))
	)
    (save-excursion
      (if (file-exists-p bx:cond)
	  (progn
	    (switch-to-buffer (get-buffer-create cond-buffer-name))
	    (insert-file-contents (format "%s" bx:cond))

	    (goto-char (point-min))
	    (if (call-interactively 'eval-defun)
		(progn
		  (message (format "%s file evaled to non-nil -- Being Included" bx:cond))
		  (save-excursion
		    (switch-to-buffer (get-buffer-create tmp-buffer-name))
		    (insert-file (format "%s" bx:file))
    
		    (goto-char (point-min))
		    ;;(insert (format "xx%s" (file-name-nondirectory bx:fileVar1)))
		    (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar1)) 
				     (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar1)))

		    (goto-char (point-min))
		    (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar2)) 
				     (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar2)))

		    (goto-char (point-min))
		    (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar3)) 
				     (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar3)))

		    )
		  )
	      (message (format "%s file evaled to nil -- Inclusion Skipped" bx:cond))
	      )
	    )
	(message (format "Missing %s file -- Inclusion Skipped" bx:cond))
	)
      )
    (if (get-buffer tmp-buffer-name)
	(progn
	  (insert-buffer tmp-buffer-name)
	  (kill-buffer tmp-buffer-name)
	  )
      )
    (if (get-buffer cond-buffer-name)
	(kill-buffer cond-buffer-name)
      )
    ))


(defun org-dblock-write:bx:dblock:global:file-insert-process (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName"
  (let(	(bx:file (or (plist-get params :file) ""))
	(bx:load (or (plist-get params :load) ""))
	(bx:exec (or (plist-get params :exec) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	)
    (if (file-exists-p bx:load)
	(progn
	  (load-file bx:load)
	  (save-excursion
	    (switch-to-buffer (get-buffer-create tmp-buffer-name))
	    (insert-file (format "%s" bx:file))
	    
	    (goto-char (point-min))
	    (funcall (intern bx:exec))
	    )
	  )
      (progn
	(message (format "Missing %s file -- Skipped" bx:load))
	(save-excursion
	  (switch-to-buffer (get-buffer-create tmp-buffer-name))
	    (insert-file (format "%s" bx:file))
	    ))
      )
    (if (get-buffer tmp-buffer-name)
	(progn
	  (insert-buffer tmp-buffer-name)
	  (kill-buffer tmp-buffer-name)
	  )
      )
    ))


(defun org-dblock-write:bx:dblock:global:file-insert-process-cond (params)
  "eval :cond file, if nil insert nothing.
   if none nil, insert :file and replace in it @fileName@ of :fileVar1 with
   content of fileName"
  (let( (bx:cond (or (plist-get params :cond) ""))
	(bx:file (or (plist-get params :file) ""))
	(bx:load (or (plist-get params :load) ""))
	(bx:exec (or (plist-get params :exec) ""))
	(tmp-buffer-name (generate-new-buffer-name "dblock-tmp"))
	(cond-buffer-name (generate-new-buffer-name "dblock-cond"))
	)
    (save-excursion
      (if (file-exists-p bx:cond)
	  (progn
	    (switch-to-buffer (get-buffer-create cond-buffer-name))
	    (insert-file-contents (format "%s" bx:cond))

	    (goto-char (point-min))
	    (if (call-interactively 'eval-defun)
		(progn
		  (message (format "%s file evaled to non-nil -- Being Included" bx:cond))
		  (if (file-exists-p bx:load)
		      (progn
			(load-file bx:load)
			(save-excursion
			  (switch-to-buffer (get-buffer-create tmp-buffer-name))
			  (insert-file (format "%s" bx:file))
    
			  (goto-char (point-min))
			  (funcall (intern bx:exec))
			  )
			)
		    (message (format "Missing %s file -- Skipped" bx:load))
		    )
		  )
	      (message (format "%s file evaled to nil -- Inclusion Skipped" bx:cond))
	      )
	    )
	(message (format "Missing %s file -- Inclusion Skipped" bx:cond))
	)
      )
    (if (get-buffer tmp-buffer-name)
	(progn
	  (insert-buffer tmp-buffer-name)
	  (kill-buffer tmp-buffer-name)
	  )
      )
    (if (get-buffer cond-buffer-name)
	(kill-buffer cond-buffer-name)
      )
    ))


(defun org-dblock-write:bx:dblock:global:insert-file (params)
"OBSOLETED by file-insert"
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (insert-file
     (format "%s" bx:types))
    ))

(defun org-dblock-write:bx:dblock:global:insert-file-and-replace (params)
"OBSOLETED by file-insert-replace"
  (let ((bx:file (or (plist-get params :file) ""))
	(bx:fileVar1 (or (plist-get params :fileVar1) ""))
	(bx:fileVar2 (or (plist-get params :fileVar2) ""))
	(bx:fileVar3 (or (plist-get params :fileVar3) ""))
	(tmp-buffer (generate-new-buffer-name "dblock-tmp"))
	)
    (save-excursion
      (switch-to-buffer (get-buffer-create tmp-buffer))
      (insert-file (format "%s" bx:file))
    
      (goto-char (point-min))
      ;;(insert (format "xx%s" (file-name-nondirectory bx:fileVar1)))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar1)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar1)))

      (goto-char (point-min))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar2)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar2)))

      (goto-char (point-min))
      (replace-string  (format "@%s@"  (file-name-nondirectory bx:fileVar3)) 
		       (shell-command-to-string (format "echo -n $( cat %s )" bx:fileVar3)))

      )
    (insert-buffer tmp-buffer)
    (kill-buffer tmp-buffer)
    ))


(defun org-dblock-write:bx:lisp:org-agenda-files (params)
  "Writes a function which returns a list of all related files that may include agenda entries."
  (let (
	(@pkgType (or (plist-get params :pkgType) nil))
	;;
	($outFiles)
	)
    
    (when @pkgType
      (when (string-equal "lcnt" @pkgType)
	(insert
	 (format "\n(defun bx:lisp:lcnt:org-files-list ()\n\
  \"Machine/Dblock GeneratedL Returns a list of deduced files\"
  "
		 )
	 )
	(setq $outFiles
	      (shell-command-to-string
	       (format
		"/bisos/venv/dev-py2-bisos-3/bin/beamerExternalExtensions.py -i latexInputFilesList articleEnFa.ttytex | xargs -n 1 | grep '.tex$'"
		)))
	(insert
	 (format "
(setq org-agenda-files (append org-agenda-files
"
		 )
	 )

	(mapcar '(lambda (arg)
		   (progn
		     (insert
		      (format "\
(list \"%s\")
"		  
			  arg ))))
	       (split-string  $outFiles)
	       )

	(insert
	 (format "
)))

(setq org-agenda-files 
      (append
       (bx:lisp:lcnt:org-files-list)
       )
      )
"
		 )
	 )
	)
      )
    )
  )



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-global"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-global)
;;;#+END:
