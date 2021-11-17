;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Feature: Set Frames and Mini-Buffer font size.
** How to change Emacs font with minibuffer together -- https://valignatev.com/posts/emacs-font/
** Emacs Manual: https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
** Reddit Discussion: https://www.reddit.com/r/emacs/comments/a6p7qr/blog_post_how_to_change_emacs_font_with/
** MELPA Package: default-text-scale 
** B|
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

(setq bf:font:usage:enabled-p t)

;;; (bf:font:full/update)
(defun bf:font:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bf:font:usage:enabled-p
    (bf:font:install/update)
    (bf:font:dejavu-sans-mono/select)
    )
  )

(defun bf:font:install/update ()
  "Could make sure that needed fonts are installed. Place holder for now."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  )

;;;(bf:font:iosevka/select)
(defun bf:font:iosevka/select ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq bf:font:default (font-spec :family "Iosevka" :size 18))
  (set-face-attribute 'default nil :font bf:font:default)
  )


(defun bf:font:dejavu-sans-mono/select ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq bf:font:default (font-spec :family "DejaVu Sans Mono" :size 16))
  (set-face-attribute 'default nil :font bf:font:default)
  )

;; Any available font name
(setq my-font-name "DejaVu Sans Mono")
(defcustom my-font-size 12 "My font size")

(defun set-frame-font-size (&optional font-size)
  "Change frame font size to FONT-SIZE.
If no FONT-SIZE provided, reset the size to its default variable."
  (let ((font-size
     (or font-size
       (car (get 'my-font-size 'standard-value)))))
    (customize-set-variable 'my-font-size font-size)
    (set-frame-font
     (format "%s %d" my-font-name font-size) nil t)))

(defun increase-frame-font ()
  "Increase frame font by one."
  (interactive)
  (set-frame-font-size (+ my-font-size 1)))

(defun decrease-frame-font ()
  "Decrease frame font by one."
  (interactive)
  (set-frame-font-size (- my-font-size 1)))

(defun reset-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size))

(defun set-large-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size 20))

(defun set-very-large-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size 24))


;;;
;;; Global Multi-lingualization Menu
;;;

;; (blee:blee:menu)
;; (bf:font:global:menu)
(defun bf:font:global:menu ()
  (easy-menu-define 
    bx-font-menu 
    nil 
    "ByStar Fonts Menu"
    '("Frame Fonts"
      "---"
      ["Increase Frame Font" (increase-frame-font) t]  
      ["Decrease Frame Font" (decrease-frame-font) t]
      ["Reset Frame Font" (reset-frame-font) t]
      ["Set To Large Demo Font -- 20" (set-large-frame-font) t]
      ["Set To Very Large Demo Font -- 24" (set-very-large-frame-font) t]            
       ))
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bf-font)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

