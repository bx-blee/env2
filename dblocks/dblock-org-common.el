(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")


(advice-add 'org-dblock-write:bxPanel:common/title-plus :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:bxPanel:common/title-plus  (<params)
  "Creates terse links for navigation surrounding current panel in treeElem."
  (let* (
	 (<governor (letGet$governor)) (<extGov (letGet$extGov))
	 (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
	 (<style (letGet$style "openBlank" "closeBlank"))
	 ;;
	 (<title (or (plist-get <params :title) nil))
	 (<alias (or (plist-get <params :alias) nil))	 
	 )

    (bxPanel:params$effective)	 

    (defun helpLine ()
      ":bxoId \"auto or bxoId\""
      )

    (defun bodyContentPlus ()
      ;;(bxPanel:lineDeliminator|top <realm)      
      )

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
	     ($commonName)
	     ($title <title)
	     ($node)
	     ($key)
	     ($parent)
	     )
	(when (not <title)
	  (when (fto:withBase:isLeaf? ".")
	    (setq $node "leaf")
	    (setq $title (format "%s/%s"
			       (file-name-nondirectory (expand-file-name ".."))
			       (file-name-nondirectory (expand-file-name "."))
			       ))
	    (setq $key (format "%s/%s/%s"
				 (file-name-nondirectory (expand-file-name "../.."))
				 (file-name-nondirectory (expand-file-name ".."))
				 (file-name-nondirectory (expand-file-name "."))
				 ))
	    (setq $parent (format "%s/%s"
			       (file-name-nondirectory (expand-file-name "../.."))
			       (file-name-nondirectory (expand-file-name ".."))
			       ))
	    )
	  (when (fto:withBase:isNode? ".")
	    (setq $node "branch")
	    (setq $parent (format "%s"
				  (expand-file-name "../../_nodeBase_/fullUsagePanel-en.org")))
	    (setq $title (format "%s/%s"
				 (file-name-nondirectory (expand-file-name "../.."))				 
				 (file-name-nondirectory (expand-file-name ".."))
				 ))
	    (setq $key (format "%s/%s/%s"
				 (file-name-nondirectory (expand-file-name "../../.."))
				 (file-name-nondirectory (expand-file-name "../.."))
				 (file-name-nondirectory (expand-file-name ".."))
				 ))
	    (setq $parent (format "%s/%s"
			       (file-name-nondirectory (expand-file-name "../../.."))
			       (file-name-nondirectory (expand-file-name "../.."))
			       ))
	    )
	  )
	
	(insert (format "#+title: %s\n"  $title))
	;;(insert (format "#+roam-alias: %s"  <title))
	(insert (format "#+roam_tags: %s\n"  $node))
	(insert (format "#+roam_key: %s\n"  $key))
	(insert (format "[[roam:%s]]"  $parent))			
	)
      )
    
    (bx:invoke:withStdArgs$bx:dblock:governor:process)    
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-commons"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-common)
;;;#+END:
