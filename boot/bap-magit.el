;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: magit -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-magit.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][VC Panel Roadmap Documentation]]
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Magit
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:magit:defaults-set -- Define 
")

(setq bap:magit:usage:enabled-p t)

(defun bap:magit:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:magit:usage:enabled-p
    (bap:magit:install/update)
    (bap:magit:config/main)
    )
  )


(defun bap:magit:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:magit:install/update")
  (use-package magit
    :ensure t
    ;;; :pin melpa-stable
    )
  )


(defun bap:magit:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    
  (message "blee:ann -- TMP -- bap:magit:install/update")
  ;;(setq magit-git-standard-options
  ;; (append magit-git-standard-options '("-c") '("http.sslVerify=false")))

  (setq magit-repolist-columns
	'(("Name"    25 magit-repolist-column-ident ())
          ("Version" 25 magit-repolist-column-version ())
          ("D"        1 magit-repolist-column-dirty ())
          ("B<U"      3 magit-repolist-column-unpulled-from-upstream
           ((:right-align t)
            (:help-echo "Upstream changes not in branch")))
          ("B>U"      3 magit-repolist-column-unpushed-to-upstream
           ((:right-align t)
            (:help-echo "Local changes not in upstream")))
          ("Path"    99 magit-repolist-column-path ()))
	)
  )


(defun bap:magit:magit-repository-directories/set-with-list (<list)  "
*** Sets the magit-repository-directories based on input <list
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (setq magit-repository-directories nil)
  (dolist (<each <list)
    (let (
	  ($assocList)
	  )
      (unless (string-equal <each "")
	(setq $assocList (acons <each 0 $assocList))
	(setq magit-repository-directories
              (append magit-repository-directories $assocList)))
      )
    )
  )


(defun bap:magit:bisos:current-bpo-repos/list () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (setq $shellCommand
	  (format
	   "bpoReposManage.sh -i basedOnPath_reposPathList %s" buffer-file-name))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )


(defun bap:magit:bisos:current-bpo-repos/visit () "
*** Main panel usage interface.
"
  (interactive)
  (bap:magit:magit-repository-directories/set-with-list
   (bap:magit:bisos:current-bpo-repos/list))
  (magit-list-repositories)
  )


(defun bap:magit:bisos:all-bpo-repos/list () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (setq $shellCommand
	  (format
	   "bpoAcctManage.sh -i bpoIdsList | bpoReposManage.sh -v -i bxoReposPathList"))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )


(defun bap:magit:bisos:all-bpo-repos/visit () "
*** Main panel usage interface.
**** Usage Examples:
(bap:magit:bisos:all-bpo-repos/visit)
"
  (interactive)
  (bap:magit:magit-repository-directories/set-with-list
   (bap:magit:bisos:all-bpo-repos/list))
  (magit-list-repositories)
  )



(defun bap:magit:bisos:current-baseDir-repos/list () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (setq $shellCommand
	  (format
	   "bpoReposManage.sh -i basedOnPath_reposPathList %s" buffer-file-name))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )


(defun bap:magit:bisos:current-baseDir-repos/visit () "
*** Main panel usage interface.
"
  (interactive)
  (bap:magit:magit-repository-directories/set-with-list
   (bap:magit:bisos:current-bpo-repos/list))
  (magit-list-repositories)
  )


(defun bap:magit:bisos:all-baseDir-repos/list%% () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (message "Running An External Shell Command -- Be Patient ...")
    (setq $shellCommand
	  (format
	   "bx-gitRepos -i cachedLs"))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )

(defun bap:magit:bisos:all-baseDir-repos/list () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (message "Running An External Shell Command -- Be Patient ...")
    (setq $shellCommand
	  (format
	   "bx-gitReposBases -v 30 --baseDir=\"/bisos/git/bxRepos\" --pbdName=\"bxReposRoot\" --vcMode=\"auth\"  -i pbdVerify all"))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )



(defun bap:magit:bisos:all-baseDir-repos/visit () "
*** Main panel usage interface.
**** Usage Examples:
(bap:magit:bisos:all-baseDir-repos/visit)
"
  (interactive)
  (bap:magit:magit-repository-directories/set-with-list
   (bap:magit:bisos:all-baseDir-repos/list))
  (magit-list-repositories)
  )


(defun bap:magit:bisos:all-baseDir-atoms-repos/list () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (message "Running An External Shell Command -- Be Patient ...")
    (setq $shellCommand
	  (format
	   "bx-gitRepos -i cachedLsAtoms"))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )


(defun bap:magit:bisos:all-baseDir-atoms-repos/list%% () "
*** Based on current buffer, determine cur-dir and bpo. List bpos repos.
"
  (interactive)
  ;; (blee:ann|this-func (compile-time-function-name))
  (let (
	($shellCommand)
	($reposListAsString)
	($reposList)
	)
    (message "Running An External Shell Command -- Be Patient ...")
    (setq $shellCommand
	  (format
	   "bx-gitReposBases -v 30 --baseDir=\"/bisos/git/bxRepos\" --pbdName=\"bxReposRoot\" --vcMode=\"auth\"  -i pbdVerify all"))
    (setq $reposListAsString (shell-command-to-string $shellCommand))
    (setq $reposList (s-split "\n" $reposListAsString))
    )
  )



(defun bap:magit:bisos:all-baseDir-atoms-repos/visit () "
*** Main panel usage interface.
**** Usage Examples:
(bap:magit:bisos:all-baseDir-repos/visit)
"
  (interactive)
  (bap:magit:magit-repository-directories/set-with-list
   (bap:magit:bisos:all-baseDir-atoms-repos/list))
  (magit-list-repositories)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-magit)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

