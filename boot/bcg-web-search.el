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

(setq bcg:web:search:usage:enabled-p t)

(defun bcg:web:search:full/update ()
  "This will replace everything that has to do with org-mode, including ./orgModeInit.el
"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:web:search:usage:enabled-p
    (bcg:web:search:install/update)
    (bcg:web:search:config/main)
    )
  )

(defun bcg:web:search:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  (use-package engine-mode
    :ensure t
    ;;; :pin melpa-stable
    )
  )

;;
;;  زندگی مسال
;;
;; (bcg:web:search:config/main)
(defun bcg:web:search:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (require 'engine-mode)
  (engine-mode t)

  ;;(setq engine/browser-function browse-url-browser-function)

  (bcg:web:search:defengine/create)

  (require 'engine-mode-menu)
  )



(defun bap:web:search:key|activate-keys ()
  "All addional keys come here"
  
  (engine/set-keymap-prefix (kbd "C-c s"))
  )


;;
;;  زندگی مثال
;;
;; (bcg:web:search:defengine/create)
;;
(defun bcg:web:search:defengine/create ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (defengine fa-dehkhoda
    "https://dehkhoda.ut.ac.ir/fa/dictionary?DictionarySearch[word]=%s&DictionarySearch[definition]=")

  (defengine amazon
  "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")

  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s")

  (defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

  (defengine google-images
    "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

  (defengine google-maps
    "http://maps.google.com/maps?q=%s"
    :docstring "Mappin' it up.")

  (defengine project-gutenberg
    "http://www.gutenberg.org/ebooks/search/?query=%s")

  (defengine qwant
    "https://www.qwant.com/?q=%s")

  (defengine rfcs
    "http://pretty-rfc.herokuapp.com/search?q=%s")

  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s")

  (defengine twitter
    "https://twitter.com/search?q=%s")

  (defengine wikipedia
    "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
    :keybinding "w"
    :docstring "Searchin' the wikis.")

  (defengine wiktionary
    "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

  (defengine wolfram-alpha
    "http://www.wolframalpha.com/input/?i=%s")
  
  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s")
  
  )

;;; The custom search URLs
(defvar *internet-search-urls*
 (quote ("http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
         "http://en.wikipedia.org/wiki/Special:Search?search=")))

(defun search-in-google (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")))
  (search-in-internet arg)
  )

(defun search-in-dehkhoda (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://www.loghatnaameh.org/dehkhodasearchresult-fa.html?searchtype=0&word=%s")))
  (search-in-internet arg)
  )

(defun search-in-wikipedia (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://en.wikipedia.org/wiki/Special:Search?search=")))
  (search-in-internet arg)
  )

;;; (search-in-dict-en-fa 1)
(defun search-in-dict-en-fa (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://farsilookup.com/e2p/seek.jsp?lang=fa&word=%s")))
  (search-in-internet arg)
  )

;;; (search-in-dict-fa-en 1)
(defun search-in-dict-fa-en (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://farsilookup.com/p2e/seek.jsp?lang=fa&word=%s")))
  (search-in-internet arg)
  )

;;; "http://www.farsidic.com/")
;;;
;;; مالکیت فکری 
;;;

;;; Search a query on the Internet using the selected URL.
(defun search-in-internet (arg)
 "OBSOLETED by engine-mode.

Searches the internet using the ARGth custom URL for the marked text.

If a region is not selected, prompts for the string to search on.

The prefix number ARG indicates the Search URL to use. By default the search URL at position 1 will be used."
 (interactive "p")

 ;; Some sanity check.
 (if (> arg (length *internet-search-urls*))
      (error "There is no search URL defined at position %s" arg))

  (let ((query                          ; Set the search query first.
    (if (region-active-p)
      (buffer-substring (region-beginning) (region-end))
    (read-from-minibuffer "Search for: ")))

  ;; Now get the Base URL to use for the search
  (baseurl (nth (1- arg) *internet-search-urls*)))

  ;; Add the query parameter
  (let ((url
    (if (string-match "%s" baseurl)
      ;; If the base URL has a %s embedded, then replace it
         (replace-match query t t baseurl)
    ;; Else just append the query string at end of the URL
      (concat baseurl query))))
 
   (message "Searching for %s at %s" query url)
   ;; Now browse the URL
   (browse-url url))))



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-web-search)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

