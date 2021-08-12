;;; -*- Mode: Emacs-Lisp; -*-

;;; Short Desc
;;; Revision, Origin and Copyleft
;;; Authors

;;; Rcs: $Id: bac-highlight-indentation.el,v 1.1 2015-04-04 00:19:12 lsipusr Exp $

(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ##################
*      ================
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* BROKEN -- Blee Adopeted Component (BAC): for fill-column-indicator
       
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== *[Xref]* Blee Panel Documentation  [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/bleeActivities/fullUsagePanel-en.org::LanguageTool][LanguageTool]]  <<Xref-Here->> 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")

(message "Blee Adopted Component:  bac-highlight-indentation  LOADING")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(require 'highlight-indentation)


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== (bac:highlight-indentation:start)
")

(defun bac:highlight-indentation:start ()
  ""
  ;;(interactive)

  ;;(setq highlight-indentation-face
  (custom-set-faces
   '(highlight-indentation-current-column-face ((t (:background "dark slate gray"))))
   )
  (custom-set-faces
   '(highlight-indentation-face ((t (:background "dark olive green"))))
   )
  )

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== all-defaults-set -- Invoke 
")

(bac:highlight-indentation:start)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bac-highlight-indentation)



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
