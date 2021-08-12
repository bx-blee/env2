;;; -*- Mode: Emacs-Lisp -*-

;;
;; Once installed, the contents of a package are placed in a
;; subdirectory of ~/.emacs.d/elpa/ (you can change the name of that
;; directory by changing the variable package-user-dir). The package
;; subdirectory is named name-version, where name is the package
;; name and version is its version string.
;;
;;
;; ls -ld /hss/dist/blee/--replaces ~/lisp
;;        /hss/pkgs/blee/emacs24/elpa
;;        /hss/pkgs/blee/emacs24/extra/
;;

(message "ByStar PACKAGES")

(require 'package)

;; (bx:package:all-defaults-set)
(defun bx:package:all-defaults-set ()
  ""
  (interactive)

  (bx:package:repositories:setup)

  (message "bx:packages:all-defaults-set -- Done." )
  )


;;; (bx:package:repositories:setup)
(defun bx:package:repositories:setup ()
  ""
  (interactive)

  (setq package-archives nil)


  ;;(package-initialize)
  (unless package--initialized (package-initialize t))  
  
  (add-to-list 'package-archives
  	       '("gnu" . "http://elpa.gnu.org/packages/"))
  
  (add-to-list 'package-archives
  	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ;;;)

  (when (equal emacs-major-version 24)
    (add-to-list 'package-archives
		 '("marmalade" . "http://marmalade-repo.org/packages/") t)
    )
  )
  ;; (add-to-list 'package-archives
  ;; 	       '("marmalade" . "http://marmalade-repo.org/packages/") t)
  ;; )


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


;;;(bx:package:install-if-needed  'flymake-python-pyflakes)

;; ;; Jedi settings
;; It's also required to run 
;; apt-get install python-pip
;; "pip install --user jedi" 
;; and 
;; "pip install --user epc" 
;; to get the Python side of the library work correctly.


(bx:package:all-defaults-set)

(provide 'blee-packages-install)
