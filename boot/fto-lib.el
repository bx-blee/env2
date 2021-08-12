;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "fv-lib" "fto-lib")  (replace-string "fv:" "fto:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (fto:), for handelling File Tree Objects [[elisp:(org-cycle)][| ]]
* 
")


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
* Description:
** ftp:treeElem:     -- When we don't know we are at a node or at a leaf
** ftp:node:
** ftp:leaf:
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message fto-lib [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: fto-lib")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: fto:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fto:main-init) [[elisp:(org-cycle)][| ]]
")

(defun fto|main-init ()
  "Desc:"
  nil
  )


;;; (blee:file:dir:listNotableSubdirs "..")
;;; (blee:file:dir:listNotableSubdirs "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;;
(defun blee:file:dir:listNotableSubdirs (<dir &rest <args)
  "List Notable subDirs of <dir"
  (let (
	(<expandedFileName (or (plist-get <args :expandedFileName) nil))
	(<includeMain (or (plist-get <args :includeMain) nil))	
	($result (list))
	($filesList (directory-files <dir))
	($eachExpandedFileName "")
	($excludeDirs (list "." ".." ".git" "CVS" "RCS"))
	)
    (unless <includeMain
      (setq $excludeDirs (append $excludeDirs (list "main")))
      )
    (dolist ($eachFile $filesList)
      (unless (member $eachFile $excludeDirs)
	;;(message (format "DisrListing: %s" $eachFile))
	(setq $eachExpandedFileName (expand-file-name (format "%s/%s" <dir $eachFile)))
	(when (file-directory-p $eachExpandedFileName)
	  ;;(message (format "DirIs: %s" $eachFile))
	  (if <expandedFileName
	      (setq $result (append $result (list $eachExpandedFileName)))
	    (setq $result (append $result (list $eachFile)))
	    )
	  )))
    $result
    ))

;;;
;;; (blee:file:dir|listNotableSubdirs "..")
;;; (blee:file:dir|listNotableSubdirs "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;;
(defun blee:file:dir|listNotableSubdirs (<dir &rest <args)
  "List Notable subDirs of <dir.
When <expandedFileName use expand-file-name.
When <include_nodeBase_ the _nodeBase_ directory is included.
"
  (let (
	(<expandedFileName (or (plist-get <args :expandedFileName) nil))
	(<include_nodeBase_ (or (plist-get <args :include_nodeBase_) nil))	
	($result (list))
	($filesList (directory-files <dir))
	($eachExpandedFileName "")
	($excludeDirs (list "." ".." ".git" "CVS" "RCS"))
	)
    (unless <include_nodeBase_
      (setq $excludeDirs (append $excludeDirs (list "_nodeBase_")))
      )
    (dolist ($eachFile $filesList)
      (unless (member $eachFile $excludeDirs)
	;;(message (format "DisrListing: %s" $eachFile))
	(setq $eachExpandedFileName (expand-file-name (format "%s/%s" <dir $eachFile)))
	(when (file-directory-p $eachExpandedFileName)
	  ;;(message (format "DirIs: %s" $eachFile))
	  (if <expandedFileName
	      (setq $result (append $result (list $eachExpandedFileName)))
	    (setq $result (append $result (list $eachFile)))
	    )
	  )))
    $result
    ))





(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fto:withBaseNode? ftoBase) [[elisp:(org-cycle)][| ]]
  ")


;;;
;;; (fto:withBase:treeElementGet  "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:withBase:treeElementGet (<ftoBase)
  "One of Node, Leaf, AuxNode"    
  (fv:read-as-string (concat <ftoBase "/_tree_"))
  )

;;;
;;; (fto:treeElem|atBaseGetType "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:treeElem|atBaseGetType "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_/")
;;; (fto:treeElem|atBaseGetType "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/davfs")
;;; (fto:treeElem|atBaseGetType "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/davfs/")
;;; 
(defun fto:treeElem|atBaseGetType (<ftoBase)
  "One of Node, Leaf, AuxNode or Unknown"
  (let (
	($result "leaf")
	)
    (setq $result (fv:read-as-string (concat (file-name-as-directory <ftoBase) "/_tree_")))
    (when (string= $result "")
      (setq $result "leaf")
      )
    $result
    )
  )

;;; (fto:treeElem|atBaseGetTypeAsLetter "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:treeElem|atBaseGetTypeAsLetter  "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_/")
;;; (fto:treeElem|atBaseGetTypeAsLetter  "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/davfs")
;;; (fto:treeElem|atBaseGetTypeAsLetter  "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/davfs/")
;;;
(defun fto:treeElem|atBaseGetTypeAsLetter (<ftoBase)
  "One of N, L, A, U"
  (let (
	($treeElemType (fto:treeElem|atBaseGetType <ftoBase))
	($result "U")
	)
    (cond
     ((string= $treeElemType "node")
      (setq $result "N"))
     ((string= $treeElemType "leaf")
      (setq $result "L"))
     )
    $result
    )
  )


(make-obsolete 'fto:withBase:treeElementGet 'fto:treeElem:atBaseGetType "blee-3.1.")

;;;
;;; (fto:withBase:isNode? "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:withBase:isNode? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (let (
	($result nil))
    (when (string= (fto:treeElem|atBaseGetType <ftoBase) "node")
      (setq $result t)
      )
    $result
    )
  )

;;;
;;; (fto:treeElem|atBaseIsNode? "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:treeElem|atBaseIsNode? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (let (
	($result nil))
    (when (string= (fto:treeElem|atBaseGetType <ftoBase) "node")
      (setq $result t)
      )
    $result
    )
  )

(make-obsolete 'fto:withBase:isNode? 'fto:treeElem|atBaseIsNode? "blee-3.1.")

;;;
;;; (fto:withBase:isLeaf? "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:withBase:isLeaf? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (let (
	($result nil))
    (when (string= (fto:withBase:treeElementGet <ftoBase) "leaf")
      (setq $result t)
      )
    $result
    )
  )

;;;
;;; (fto:treeElem|atBaseIsLeaf? "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:treeElem|atBaseIsLeaf? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Leaf."
  (let (
	($result nil))
    (when (string= (fto:treeElem|atBaseGetType <ftoBase) "leaf")
      (setq $result t)
      )
    $result
    )
  )

(make-obsolete 'fto:withBase:isLeaf? 'fto:treeElem|atBaseIsLeaf? "blee-3.1.")

;;;
;;; (fto:treeElem|atBaseGetName "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;;
;;; (fto:treeElem|atBaseGetName "/acct/employee/lsipusr/org/currents/_nodeBase_/")
;;; (fto:node|atBaseGetName "/acct/employee/lsipusr/org/currents/_nodeBase_/")
;;; (fto:treeElem|atBaseIsNode? "/acct/employee/lsipusr/org/currents/_nodeBase_/")
;;; 
(defun fto:treeElem|atBaseGetName (<ftoBase)
  "Name of the treeElem based on fileName base"
  (let (
	($result nil)
	)
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (setq $result (fto:node|atBaseGetName <ftoBase))
      )
    (when (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (setq $result (fto:leaf|atBaseGetName <ftoBase))
      )
    $result
    )
  )

;;;
;;; (fto:node|atBaseGetName "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:node|atBaseGetName "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_/")
;;; (expand-file-name "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_/")
;;; 
(defun fto:node|atBaseGetName (<ftoBase)
  "Name of the Node as string"
  (let (
	($result nil)
	)
    (setq <ftoBase (expand-file-name (directory-file-name <ftoBase)))
    (setq $result (file-name-nondirectory (fto:node|atBaseGetDirBase <ftoBase)))
    $result
    )
  )

;;;
;;; (fto:leaf|atBaseGetName "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:leaf|atBaseGetName "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_/")
;;; 
(defun fto:leaf|atBaseGetName (<ftoBase)
  "Name of the leaf as string"
  (let (
	($result nil)
	)
    (setq $result (file-name-nondirectory
		   (expand-file-name (directory-file-name <ftoBase))
		   ))
    $result
    )
  )


;;;
;;; (fto:node|atBaseGetDirBase "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:node|atBaseGetDirBase "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;; (fto:node|atBaseGetDirBase "/acct/employee/lsipusr/org/assests")
;;; (fto:node|atBaseGetDirBase "/acct/employee/lsipusr/org/assests/_nodeBase_")
;;; 
(defun fto:node|atBaseGetDirBase (<ftoBase)
  "Provides base directory sans _nodeBase_."
  (let (
	($result nil)
	)
    (setq <ftoBase (expand-file-name <ftoBase))
    (unless (fto:treeElem|atBaseIsNode? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (unless (string= (file-name-nondirectory <ftoBase) "_nodeBase_")
	(setq $result (expand-file-name
		       (concat (file-name-as-directory <ftoBase) ".")
		       )))
      (when (string= (file-name-nondirectory <ftoBase) "_nodeBase_")
	(setq $result (expand-file-name
		       (concat (file-name-as-directory <ftoBase) "..")
		       )))
      )
      
    $result
    )
  )

;;;
;;; (fto:node|atBaseGetNodeBase "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:node|atBaseGetNodeBase "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;; (fto:node|atBaseGetNodeBase "/acct/employee/lsipusr/org/assests")
;;; (fto:node|atBaseGetNodeBase "/acct/employee/lsipusr/org/assests/_nodeBase_")
;;; 
(defun fto:node|atBaseGetNodeBase (<ftoBase)
  "Provides the _nodeBase_ directory."
  (let (
	($result nil)
	)
    (setq <ftoBase (expand-file-name <ftoBase))
    (unless (fto:treeElem|atBaseIsNode? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (unless (string= (file-name-nondirectory <ftoBase) "_nodeBase_")
	(setq $result (expand-file-name
		       (concat 
			(file-name-as-directory <ftoBase)
			"_nodeBase_"
			)))
	)
      (when (string= (file-name-nondirectory <ftoBase) "_nodeBase_")
	(setq $result <ftoBase)
	)
      )
    $result
    )
  )


;;;
;;; (fto:node|atBaseGetDescendantsBases "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:node|atBaseGetDescendantsBases "/acct/employee/lsipusr/org/assests/vehicles/_nodeBase_")
;;; 
(defun fto:node|atBaseGetDescendantsBases (<ftoBase &rest <args)
  "Provides a list of descendants bases
When <expandedFileName use expand-file-name.
** TODO Descendents should go till thisGitRoot=$( cd $(dirname $0); git rev-parse --show-toplevel 2> /dev/null ) 
"
  (let (
	($result nil)
	(<expandedFileName (or (plist-get <args :expandedFileName) nil))
	)
    (unless (fto:treeElem|atBaseIsNode? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (setq $result (blee:file:dir|listNotableSubdirs
		     (fto:node|atBaseGetDirBase <ftoBase)
		     :expandedFileName <expandedFileName
		     )
	    )
      )
    $result
    )
  )

;;;
;;; (fto:node|atBaseGetSiblingsBases "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; (fto:node|atBaseGetSiblingsBases "~/org/assests/vehicles/_nodeBase_")
;;; 
(defun fto:node|atBaseGetSiblingsBases (<ftoBase &rest <args)
  "Provides a list of siblings bases"
  (let (
	($result nil)
	(<expandedFileName (or (plist-get <args :expandedFileName) nil))
	)
    (unless (fto:treeElem|atBaseIsNode? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (setq $result (blee:file:dir|listNotableSubdirs
		     (expand-file-name
		      (concat 
		       (file-name-as-directory (fto:node|atBaseGetDirBase <ftoBase))
		       ".."
		       ))
		       :expandedFileName <expandedFileName
		       )
	    )
      )
    $result
    )
  )

;;;
;;; (fto:leaf|atBaseGetSiblingsBases "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;; 
;;; 
(defun fto:leaf|atBaseGetSiblingsBases (<ftoBase &rest <args)
  "Provides a list of siblings bases"
  (let (
	($result nil)
	(<expandedFileName (or (plist-get <args :expandedFileName) nil))
	)
    (unless (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (setq $result (blee:file:dir|listNotableSubdirs
		     (expand-file-name
		      (concat 
		       (file-name-as-directory <ftoBase)
		       ".."
		       ))
		       :expandedFileName <expandedFileName
		       )
	    )
      )
    $result
    )
  )


;;;
;;; (fto:node|atBaseGetAncestorsBases "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/_nodeBase_")
;;; 
(defun fto:node|atBaseGetAncestorsBases (<ftoBase)
  "Provides a list of ancestor bases. For now, just a place-holder"
  (let (
	($result nil)
	)
    (unless (fto:treeElem|atBaseIsNode? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (setq $result (append $result
			    (list
			     (expand-file-name
			      (concat 
			       (file-name-as-directory (fto:node|atBaseGetDirBase <ftoBase))
			       ".."
			       ))))
	    )
      (setq $result (append $result
			    (list
			     (expand-file-name
			      (concat 
			       (file-name-as-directory (fto:node|atBaseGetDirBase <ftoBase))
			       "../.."
			       ))))
	    )
      )
    $result
    )
  )

;;;
;;; (fto:leaf|atBaseGetAncestorsBases "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs")
;;; 
(defun fto:leaf|atBaseGetAncestorsBases (<ftoBase)
  "Provides a list of ancestor bases. For now, just a place-holder"
  (let (
	($result nil)
	)
    (unless (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (message "NOTYET problem reporting")
      )
    (when (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (setq $result (append $result
			    (list
			     (expand-file-name
			      (concat 
			       (file-name-as-directory <ftoBase)
			       ".."
			       ))))
	    )
      (setq $result (append $result
			    (list
			     (expand-file-name
			      (concat 
			       (file-name-as-directory <ftoBase)
			       "../.."
			       ))))
	    )
      )
    $result
    )
  )



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'fto-lib)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
