;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: bbdb -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-bbdb.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Bbdb
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
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:bbdb:defaults-set -- Define 
")

;;(setq bcg:org:roam:usage:enabled-p t)
(setq bcg:org:roam:usage:enabled-p nil)

(defun bcg:org:roam:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:org:roam:usage:enabled-p
    (bcg:org:roam:install/update)
    (bcg:org:roam:server:install/update)    
    (bcg:org:roam:config/main)
    ;;(org-roam-server-mode)
    )
  )

(defun bcg:org:roam:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package org-roam
    :ensure t
    ;;; :pin melpa-stable
    )
  )

(defun bcg:org:roam:server:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (require 'org-roam-protocol)

  (use-package org-roam-server
    :ensure t
    :config
    (setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 9901
          org-roam-server-authenticate nil
          org-roam-server-export-inline-images t
          org-roam-server-serve-files nil
          org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
          org-roam-server-network-poll t
          org-roam-server-network-arrows nil
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          org-roam-server-network-label-wrap-length 20))  
  )

; (org-roam-server:uri/construct)
(defun org-roam-server:uri/construct ()
  ""
  (interactive)
  (format "http://%s:%s" org-roam-server-host org-roam-server-port)
  )


(defun bcg:org:roam:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq org-roam-directory "/bisos/panels")
  ;; (setq org-roam-directory "/bxo/iso/pip_xx/panel")  
  ;; (setq org-roam-db-location "/bxo/iso/pip_xx/panel/org-roam.db")
  
  (add-hook 'after-init-hook 'org-roam-mode)

  (add-hook 'org-mode-hook 'org-roam-buffer-activate)

  (bap:org:roam:key|activate-keys)
  )

(defun bap:org:roam:key|activate-keys ()
  "All addional keys come here"
  
  ;; org-roam-mode-map
  ;;(define-key org-roam-mode-map [(control ?c) (n)] nil)
  (define-key org-roam-mode-map [(control ?c) (n) (l)] 'org-roam)
  (define-key org-roam-mode-map [(control ?c) (n) (f)] 'org-roam-find-file)
  (define-key org-roam-mode-map [(control ?c) (n) (g)] 'org-roam-graph)  

  ;; org-roam-map
  (define-key org-mode-map [(control ?c) (n) (i)] 'org-roam-insert)
  (define-key org-mode-map [(control ?c) (n) (I)] 'org-roam-insert-immediate)
  )



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-org-roam)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

