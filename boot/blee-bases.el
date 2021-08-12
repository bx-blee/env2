;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (boot-setup:),  [[elisp:(org-cycle)][| ]]
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

;;;#+BEGIN: bx:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
")
;;;#+END:



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'blee-version)

(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")

(lambda () "
* blee:env:  Base determinations
")

;;; (blee:env:base-obtain-based-on-here)
(defun blee:env:base-obtain-based-on-here ()
  "Eg /bisos/blee/env/"
  (file-name-directory
   (directory-file-name
    (file-name-directory
     (if buffer-file-name
	 buffer-file-name
       load-file-name)
     )))
  )

(defvar blee:env:base (blee:env:base-obtain-based-on-here)
  "Base Directory of Blee")

;; (blee:env:base-obtain)
(defun blee:env:base-obtain ()
  "Eg /bisos/blee/env/ -- This function will be invoked frequently, so it uses the obtained variable"
  blee:env:base
  )

;; (blee:base-obtain)
(defun blee:base-obtain ()
  "Eg /bisos/blee"
  (file-name-directory (directory-file-name (blee:env:base-obtain)))
  )


(lambda () "
* Explicit Base Specifications -- eg info yasnipets widgets
")


(defun blee:env:eoe:base-obtain ()
  "Eg /bisos/blee/env/eoe/"
    ;; (file-name-directory      buffer-file-name)
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "eoe"))
  )

(defun blee:env:main:base-obtain ()
  "Eg /bisos/blee/env/boot/"
    ;; (file-name-directory      buffer-file-name)
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "boot"))
  )

(defun blee:env:lib:base-obtain ()
  "Eg /bisos/blee/env/lib/"
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "lib"))
  )

(defun blee:env:info:base-obtain ()
  "Eg /bisos/blee/env/info/"
  (file-name-as-directory
   (concat (file-name-as-directory (blee:env:base-obtain)) "info"))
  )

(defun blee:env:dblocks:base-obtain ()
  "Eg /bisos/blee/env/dblocks/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "dblocks")
  )

(defun blee:env:widgets:base-obtain ()
  "Eg /bisos/blee/env/widgets/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "widgets")
  )


(defun blee:env:splashScreen:base-obtain ()
  "Eg /bisos/blee/env/splashScreen/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "splashScreen")
  )

(defun blee:env:snippets:base-obtain ()
  "Eg /bisos/blee/env/snippets/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "snippets")
  )

(defun blee:env:panels:base-obtain ()
  "Eg /bisos/blee/env/panels/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "panels")
  )

(defun blee:env:images:base-obtain ()
  "Eg /bisos/blee/env/images/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "images")
  )

(defun blee:env:aPkgs:base-obtain ()
  "Eg /bisos/blee/env/aPkgs/"
  (concat (file-name-as-directory (blee:env:base-obtain)) "aPkgs")
  )

(lambda () "
* ByStar User Environment (BUE) Bases
")

;;; (file-directory-p "/bxo/r3/iso/piu_mbFullUsage/blee/elisp")
;;; (blee:bue:base-obtain)
(defun blee:bue:base-obtain ()
  "Using usgBpos we get the usage env base"
  (let*
      (
       ($fullUseBxoPath
	(replace-regexp-in-string "\n$" "" 
	 (shell-command-to-string
	  "usgBpos.sh -i usgBpos_usageEnvs_fullUse_bxoPath")))
       ($bueElispBase
	(expand-file-name
	 (format "%s/blee/elisp" $fullUseBxoPath)))
       ($result)
       )
    ;;(message $bueElispBase)
    (when (file-directory-p $bueElispBase)
      (setq $result $bueElispBase))

    (unless (file-directory-p $bueElispBase)  
      (setq $result nil))
    $result
    )
  )


(defun blee:bue:base-obtain%% ()
  "Either ~/BUE/elisp or ~/blee"
  (let* (bueElispBase (expand-file-name "~/BUE/elisp"))
    )
  (when (file-exists-p bueElispBase)
    bueElispBase)

  (unless (file-exists-p bueElispBase)  
    "~/blee"
    )
  )

(lambda () "
* Package ELPA Bases
")

;;; (blee:vered|base-obtain)
(defun blee:vered|base-obtain ()
  "Eg. /bisos/blee/27f"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name blee:emacs:id)		    
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )


;;; (blee:vered:elpa|base-obtain)
(defun blee:vered:elpa|base-obtain ()
  "Eg. /bisos/blee/27f/elpa/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name blee:emacs:id)		    
		    "/elpa/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )

;;; (blee:vered:run|base-obtain)
(defun blee:vered:run|base-obtain ()
  "Eg. /bisos/blee/27f/run/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name blee:emacs:id)		    
		    "/run/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )

;;; (blee:vered:tmp|base-obtain)
(defun blee:vered:tmp|base-obtain ()
  "Eg. /bisos/blee/27f/tmp/"
  (let ((baseName (expand-file-name
		   (concat
		    (blee:base-obtain)
		    (symbol-name blee:emacs:id)		    
		    "/tmp/"
		    )))
	)
    (unless (file-directory-p baseName)
      (make-directory baseName :parents))
    baseName
    )
  )


(lambda () "
* Now setup the load-path -- (describe-variable 'load-path)
")

;;
;; (describe-variable 'load-path)
;;


(defun blee:load-path:add (@dirPath)
  "@dirPath is added to load-path after verification."
  ;;(blee:ann|this-func (compile-time-function-name))
  (when @dirPath
    (let (
	  ($dirPath (expand-file-name @dirPath))
	  )
      (if (file-directory-p $dirPath)
	  (add-to-list 'load-path $dirPath)
	)
      )))


(funcall  (lambda () "
*     load-path setup
**    +env/main +env/lib +env/dblocks
"
	    (message "Setting Up load-path")
	    
	    (blee:load-path:add (blee:env:main:base-obtain))
	    (blee:load-path:add (blee:env:lib:base-obtain))
	    (blee:load-path:add (blee:env:dblocks:base-obtain))
	    (blee:load-path:add (blee:env:widgets:base-obtain))
	    (blee:load-path:add (blee:env:eoe:base-obtain))
	    
	    (blee:load-path:add 
	     (file-name-as-directory
	      (concat (file-name-as-directory (blee:env:base-obtain)) "eoe/lisp/sys/")))

	    (blee:load-path:add 
	     (file-name-as-directory
	      (concat (file-name-as-directory (blee:env:base-obtain)) "eoe/lisp/pkgs/27f")))
	    
	    ;; (blee:load-path:add "~/BUE/elisp")
	    (blee:load-path:add (blee:bue:base-obtain))
	    
	    (blee:load-path:add "/opt/public/neweoe/lisp/public/bbdb-filters-0.51")	    
	    ))


(defun blee:info-path ()
  (cond ((or (eq blee:emacs:id '19x)
	     (eq blee:emacs:id '19f))
	 ;; emacs 19 supports a list of info directories
	 (require 'info)
	 (setq Info-directory-list
	       (append Info-directory-list
		       (list
			(expand-file-name (format "%s/info" *eoe-root-dir*))
			(expand-file-name (format "%s/lisp/%s/info" *eoe-root-dir* blee:emacs:id))
			(expand-file-name (format "%s/lisp/info" *eoe-root-dir*))
			))))
	((eq blee:emacs:id '18f)
	 ;; emacs 18 only has 1 info directory--use eoe's
	 (setq Info-directory (expand-file-name
			       (format "%s/info" *eoe-root-dir*))))
	)
  )



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-bases-setup"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-bases)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; major-mode: emacs-lisp-mode
;;; end:



