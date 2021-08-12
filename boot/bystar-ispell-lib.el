;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "bystar-ispell-lib")  (replace-string "moduleTag:" "bx:ispell:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (bx:ispell:), for handelling IspellPlus [[elisp:(org-cycle)][| ]]
** TODO Revisit the whole file -- Support both aspell and hunspell as backends.
** TODO [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]   Decide on whether or not rw-haunspell should be used
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
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "bystar-ispell-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message bystar-ispell-lib [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: bystar-ispell-lib")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

;;;(require 'rw-language-and-country-codes)
;;;(require 'rw-ispell)

(require 'rw-hunspell)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: bystar:ispell:all-defaults-set [[elisp:((org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bystar:ispell:all-defaults-set) [[elisp:(org-cycle)][| ]]
")

(defun bystar:ispell:all-defaults-set ()
  "Desc:"
  (if (file-exists-p "/usr/bin/hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))))

  (setq ispell-local-dictionary-alist '())
  
  (add-to-list 'ispell-local-dictionary-alist '("deutsch-hunspell"
						"[[:alpha:]]"
						"[^[:alpha:]]"
						"[']"
						t
						("-d" "de_DE"); Dictionary file name
						nil
						iso-8859-1))

  (add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
						"[[:alpha:]]"
						"[^[:alpha:]]"
						"[']"
						t
						("-d" "en_US")
						nil
						iso-8859-1))

  (add-to-list  'ispell-local-dictionary-alist '("american-hunspell"
						"[[:alpha:]]"
						"[^[:alpha:]]"
						"[']"
						t
						("-d" "en_US" "-p" "~/hunspell-personal.en")
						nil
						iso-8859-1))
  
  (setq  ispell-dictionary   "en_US") ; Default dictionary to use

  (custom-set-variables
   '(rw-hunspell-default-dictionary "american-hunspell")
   '(rw-hunspell-dicpath-list (quote ("/usr/share/hunspell")))
   '(rw-hunspell-make-dictionary-menu t)
   '(rw-hunspell-use-rw-ispell t))

  (rw-hunspell-setup)

  (setq ispell-personal-dictionary "~/BUE/emacs/ispell/en/general.words")

  ;;; Create the ispell-personal-dictionary file if needed
  (let (
	(file (expand-file-name ispell-personal-dictionary)))
    (unless (file-exists-p file)
      (with-temp-file file t)))
  
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "bystar-ispell-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'bystar-ispell-lib)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
