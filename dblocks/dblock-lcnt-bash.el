
(require 'bx-lcnt-lib)

;;; NOTYET, figsList should become filesList
(defun org-dblock-write:bx:dblock:lcnt:bash:figsList (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(files-list)
	)
    (insert "filesList=\"\n")
    (when (not (equal bx:types "dir"))
      (insert
       (shell-command-to-string 
	(format "ls *.%s" bx:types)))
	;;; (format "ls *.odg"))
      )
    (insert "\"")
    ))


(defun org-dblock-write:bx:dblock:lcnt:bash:dirs-list (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(files-list)
	)
    ;;; bx:types Ignored all together -- (equal bx:types "xxx")
    (insert (format "\
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /DBLOCK/  DirsList ::  [[elisp:(org-cycle)][| ]]
_CommentEnd_
"
		    ))
    
    (insert "\n")
    (insert "dirsList=\"\n")
    (insert
     (shell-command-to-string 
      "find .  -maxdepth 1 -type d -print  | sed -e s:^./:: | egrep -v '^\.$' | egrep -v '^CVS$'" )
      )
    (insert "\"")
    ))

(defun org-dblock-write:bx:dblock:org:lcnt-related-Ok2Delete (params)  
   (let ((bx:types (or (plist-get params :types) "")))
     (bx:lcnt:info:base-read)
     (insert (format "\
*  [[elisp:(org-cycle)][| ]]  Related       ::    [[elisp:(find-file \"%s.ttytex\")][Visit ./%s.ttytex]] | [[elisp:(find-file \"./mailingStatic/content.mail\")][Visit ./mailingStatic/content.mail]]| [[elisp:(find-file \"./mailingStatic/Panel.org\")][Visit ./mailingStatic/Panel.org]]  [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Notes         ::   *LcntProc.sh How-To*  [[elisp:(org-cycle)][| ]]"
                     (get 'bx:lcnt:info:base  'docSrcList)
                     (get 'bx:lcnt:info:base  'docSrcList)
 		    ))))

(defalias 'org-dblock-write:bx:dblock:org:latex-input 'org-dblock-write:bx:dblock:lcnt:latex-input)

(defun org-dblock-write:bx:dblock:org:latex-inputObsolted (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
	(bx:input-file (or (plist-get params :input-file) "missing")))
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
	 (or (equal "TRUE" bx:disabledP)
	     (equal "true" bx:disabledP)))
	(progn
	  ;;; Processing Body
	  (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
	  (if (file-exists-p bx:input-file)
	      (progn
		(insert (format "\
\\begin{comment}
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || /Input/  [[elisp:(find-file \"%s\")][Visit %s]] ::  [[elisp:(org-cycle)][| ]]
\\end{comment}

\\input{%s}"
				bx:input-file
				bx:input-file
				bx:input-file
				))))		
	  )
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-lcnt-bash"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-lcnt-bash)
;;;#+END:
