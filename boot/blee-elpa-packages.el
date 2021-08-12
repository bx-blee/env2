;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "blee-elpa-packages")  (replace-string "moduleTag:" "blee:elpa:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (blee:elpa:), for handelling File_Var [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
*  /OBSOLETED by  org-dblock-write:bx:global:org-contents-list/

")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-elpa-packages"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-elpa-packages [[elisp:(org-cycle)][| ]]
")

;;;(blee:msg "Loading: blee-elpa-packages")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(defvar *emacs-type* "fsf"
  "Historic but kept for future resurrections -- used to distinguish lucid emacs etc")

(defvar blee:emacs:type "fsf"
  "We are assuming that other than fsf emacs types could exist -- used to distinguish lucid emacs etc")


(defvar *eoe-emacs-type* (intern (format "%df" emacs-major-version))
  "A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")

(defvar blee:emacs:id (intern (format "%df" emacs-major-version))
  "A symbol (not a string) major-version+f for fsf-emacs.
Eg 27f. Used to tag filenames.")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: blee:elpa:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:elpa:main-init) [[elisp:(org-cycle)][| ]]
")

;;; (blee:elpa:main-init)
(defun blee:elpa:main-init ()
  "Desc:"
  
  (setq package-user-dir (blee:vered:elpa|base-obtain))
  
  (message (format "package-user-dir=%s" package-user-dir))

  ;; Below require will auto-create `package-user-dir' it doesn't exist.
  (require 'package)

  (blee:elpa:repositories:setup)

  (unless (blee:elpa:standalone/mode?)
    (blee:elpa:repositories/prep)

    ;; NOTYET, this should happen at the very end -- Not here.
    (blee:elpa:standalone/enable)
    )
  
  (when (blee:elpa:updatePkgs:needUpdating-p)  
    
    (blee:elpa:install-if-needed 'use-package)
    
    ;;;(bx:package:install-if-needed 'org-bullets)

    ;;(bx:package:install:all)

    ;; NOTYET, more to come here. Variable to control :enabled with  pkgEnabled

    ;; NOTYET, this should happen at the very end -- Not here.
    (blee:elpa:updatePkgs:disable)
    )
  )


(defvar blee:elpa:updatePkgs:areUpToDateFile
  (format "/bisos/blee/%s/run/elpa-pkgs-are-up-to-date" *eoe-emacs-type*)
  "File whose existence indicates that elpa pkgs are up-to-date and need not be updated.")

;;; (blee:elpa:updatePkgs:needUpdating-p)
(defun blee:elpa:updatePkgs:needUpdating-p ()
  "When /bisos/blee/27f/run/elpa-pkgs-are-up-to-date exists, return nil, otherwise t"
  (not (file-exists-p blee:elpa:updatePkgs:areUpToDateFile))
  )

(defun blee:elpa:updatePkgs:enable ()
  "Delete /bisos/blee/27f/run/elpa-pkgs-are-up-to-date"
  (delete-file blee:elpa:updatePkgs:areUpToDateFile)
  )

(defun blee:elpa:updatePkgs:disable ()
  "Create /bisos/blee/27f/run/elpa-pkgs-are-up-to-date"
  (write-region "" nil  blee:elpa:updatePkgs:areUpToDateFile)
  )

(defvar blee:elpa:standalone:standaloneModeFile
  (format "/bisos/blee/%s/run/standalone-mode" *eoe-emacs-type*)
  "File whose existence indicates that blee should operate in standalone mode."
  )

;;; (blee:elpa:standalone/mode?)
(defun blee:elpa:standalone/mode? ()
  "When /bisos/blee/27f/run/standalone-mode exists, return t, otherwise nil"
  (interactive)
  (file-exists-p blee:elpa:standalone:standaloneModeFile)
  )

;;; (blee:elpa:standalone/enable)
(defun blee:elpa:standalone/enable ()
  "Create /bisos/blee/27f/run/standalone-mode"
  (interactive)  
  (write-region "" nil  blee:elpa:standalone:standaloneModeFile)
  )

;;; (blee:elpa:standalone/disable)
(defun blee:elpa:standalone/disable ()
  "Delete /bisos/blee/27f/run/standalone-mode"
  (interactive)  
  (delete-file blee:elpa:standalone:standaloneModeFile)  
  )

;;; (blee:elpa:repositories:setup)
(defun blee:elpa:repositories:setup ()
  "Sets up package-archives list but does not prep/contact the repos.
Also initializes the package system."
  (interactive)
  
  (setq package-archives nil)

  ;;(package-initialize)
  (unless package--initialized (package-initialize t))

  (add-to-list 'package-archives
  		 '("gnu" . "https://elpa.gnu.org/packages/"))
  
  ;; (add-to-list 'package-archives
  ;; 	       '("melpa" . "https://melpa.milkbox.net/packages/") t)

  (unless (assoc-default "melpa" package-archives)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
  
  (unless (assoc-default "melpa-stable" package-archives)
    (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
  
  (unless (assoc-default "org" package-archives)
    (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

  
  (when (equal emacs-major-version 24)
    (add-to-list 'package-archives
		 '("marmalade" . "http://marmalade-repo.org/packages/") t)
    )

  )

;;; (blee:elpa:repositories/prep)
(defun blee:elpa:repositories/prep ()
  "Prepares elpa for usage. This requires network access for obtaining pkgs list.
This is necessary for package-install to work."
  (interactive)
  
  (package-refresh-contents)

  ;;(package-list-packages)
  ;;(quit-window)
  )


(defun bap:auto-package-update:install|update ()
  "NOTYET, un tested."
  (use-package auto-package-update
    :config
    (setq auto-package-update-delete-old-versions t)
    (setq auto-package-update-hide-results t)
    (auto-package-update-maybe))
  )

;;
;; (package-installed-p 'use-package)
;; (package-installed-p 'org-mime)
;;
;; (package-install 'use-package)
;; (package-install 'org-mime)
;; 
;; (blee:elpa:install-if-needed 'use-package)
;; (blee:elpa:install-if-needed 'org-mime)
;; 
(defun blee:elpa:install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

;;
;; (bx:package:install-if-needed 'yasnippet-snippets)
;; 
(defun bx:package:install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))


;;; (bx:package:install:all)
(defun bx:package:install:all ()
  "\
Does not run at start up. Run as new packages are to be installed.
"
  (interactive)

  ;;(when (blee:elpa:updatePkgs:needUpdating-p)

  (package-refresh-contents)

  ;; make more packages available with the package installer
  (let (
	(to-install)
	)
    (setq to-install
	  '(
	    magit
	    )
	  )
    (mapc 'bx:package:install-if-needed to-install)
    )

  ;;(blee:elpa:updatePkgs:disable)
    
    ;;)
  )


(defun bx:package:install:all-full ()
  "\
Does not run at start up. Run as new packages are to be installed.
"
  (interactive)

  ;;(when (blee:elpa:updatePkgs:needUpdating-p)

    (package-refresh-contents)

    ;; make more packages available with the package installer
    (let (
	  (to-install)
	  )
      (setq to-install
	    '(
	      auto-complete
	      auctex
	      yasnippet 
	      jedi 
	      autopair 
	      python-mode 
              flymake-python-pyflakes
	      magit
	      google-maps
	      highlight-indentation
	      tabbar
	      ;;ipython 25f
	      realgud
	      ;;
	      offlineimap
	      notmuch
	      ;;
	      w3m
	      bbdb
	      emms
	      f
	      load-dir
	      markdown-mode
	      ;;
	      seq
	      ;;rw-hunspell 25f
	      ;;
	      ;;helm
	      ;;
	      ;;fill-column-indicator
	      ;;dic-lookup-w3m
	      ;;find-file-in-repository
	      )
	    )
      (when (equal emacs-major-version 24)
	(add-to-list 'to-install 'ipython)
	(add-to-list 'to-install 'rw-hunspell)
	)
      
      (mapc 'bx:package:install-if-needed to-install)
      )

    ;;(blee:elpa:updatePkgs:disable)
    
    ;;)
  )


;;; (bx:package:install:update)
(defun bx:package:install:update ()
  "\
Does not run at start up. Run as new packages are to be installed.
"
  (interactive)

  (package-refresh-contents)

  ;; make more packages available with the package installer
  (let (to-install)
    (setq to-install
	  '(
	    f
	    helm
	    ;;
	    ;;fill-column-indicator
	    ;;dic-lookup-w3m
	    ;;find-file-in-repository
	    )
	  )
    (mapc 'bx:package:install-if-needed to-install)
    )
  )





;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-elpa-packages"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-elpa-packages)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
