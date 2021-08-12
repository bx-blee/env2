;;; -*- Mode: Emacs-Lisp; -*-

(funcall  (lambda () "
* Description: auto-complete -- Blee Adopted Facility.
"
	    (message "LOADING: blee-ac: AUTO-COMPLETE")
	    ))

(lambda () "
* Origin, Revision And Libre-Halaal CopyLeft
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: blee-af-auto-complete.el,v 1.1 2014-03-28 06:22:16 lsipusr Exp $"
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
*  /Controls/:  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Vis]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][1 Win]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]]

####+END:
")

(lambda () "
*      ================
*      ================ CONTENTS-LIST ================
*      ================ *[Info]* General TODO List
")

(lambda () "
*      ================ Requires
")

(require 'auto-complete)

(lambda () "
*      ================ Module Functions
")

;; (blee:af:auto-complete:all-defaults-set)
(defun blee:af:auto-complete:all-defaults-set ()
  ""
  (interactive)

  ;; (add-to-list 'load-path
  ;;               "~/.emacs.d/elpa/auto-complete-20140322.321")

  ;; 

  (message "blee:af:auto-complete:all-defaults-set Done." )
  )

(blee:af:auto-complete:all-defaults-set)


(lambda () "
*      ================ Provide
")

(provide 'blee-af-auto-complete)


(lambda () "
*      ================ /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
