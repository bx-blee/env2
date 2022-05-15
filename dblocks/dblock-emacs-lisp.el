;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

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


(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message [[elisp:(org-cycle)][| ]]
")

(message "ByStar Library LOADING")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: none [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (org-dblock-write:bx:dblock:lisp:requires) [[elisp:(org-cycle)][| ]]
")


(advice-add 'org-dblock-write:b:elisp:file/provide :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/provide (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel -1)) (<model (letGet$model))
         (<style (letGet$style "openBlank" "closeBlank"))
         (<modName (or (plist-get <params :modName) nil))q
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (let* (
             ($modName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
             )
        (when <modName
          (setq $modName <modName))
        (insert (s-lex-format
                "(provide '${$modName})"))))

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:b:elisp:file/requires :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/requires (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (insert (s-lex-format
               "  ~REQUIRES~  ")))

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:b:elisp:file/copyLeftPlus :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/copyLeftPlus (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openBlank" "closeBlank"))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (insert "\
* Libre-Halaal Software --- Part Of Blee ---  Poly-COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Poly-COMEEGA (Polymode Colaborative Org-Mode Enhance Emacs Generalized Authorship)\
"))

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))

(advice-add 'org-dblock-write:b:elisp:file/authors :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/authors (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openBlank" "closeBlank"))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (insert "\
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact\
"))

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))

(advice-add 'org-dblock-write:b:elisp:file/orgTopControls :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/orgTopControls (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openBlank" "closeBlank"))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (insert (s-lex-format
               "  ~ORG-TOP-CONTROS-COME-HERE~  ")))

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:b:elisp:file/endOf :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:file/endOf (<params)
  "
** When ~:modName~ is nil determine modName based on filName. Otherwise  use ~:modName~.
Combination of ~<outLevl~ = -1 and openBlank closeBlank results in pure code.
"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))         
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "Insert the provide line"
      (insert " ~END-OF-FILE~ "))
    
    (bx:invoke:withStdArgs$bx:dblock:governor:process)

    (insert "
;;; local variables:
;;; no-byte-compile: t
;;; end:\
")
    ))


;;;
;;; BELOW IS BEING OBSOLETED
;;;


(defun org-dblock-write:bx:dblock:lisp:requires (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
        )
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
         (or (equal "TRUE" bx:disabledP)
             (equal "true" bx:disabledP)))
        (progn
          ;;; Processing Body
          (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
          (insert (format "\
(lambda () \"\n*  [[elisp:(org-cycle)][| ]]  Requires       :: Requires [[elisp:(org-cycle)][| ]]
\")"
                          )))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (org-dblock-write:bx:dblock:lisp:provide) [[elisp:(org-cycle)][| ]]
")

(defun org-dblock-write:bx:dblock:lisp:provide (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
        (bx:name (or (plist-get params :lib-name) "missing"))
        )
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
         (or (equal "TRUE" bx:disabledP)
             (equal "true" bx:disabledP)))
        (progn
          ;;; Processing Body
          (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
          (insert (format "\
(lambda () \"\n*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
\")

(provide '%s)"
                          bx:name
                          )))
      (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (org-dblock-write:bx:dblock:lisp:loading-message) [[elisp:(org-cycle)][| ]]
")

(defun org-dblock-write:bx:dblock:lisp:loading-message (params)
  (let ((bx:disabledP (or (plist-get params :disabledP) "UnSpecified"))
        (bx:message (or (plist-get params :message) "missing"))
        )
    (message (format "disabledP = %s" bx:disabledP))
    (if (not
         (or (equal "TRUE" bx:disabledP)
             (equal "true" bx:disabledP)))
        (progn
          ;;; Processing Body
          (message (format "EXECUTING -- disabledP = %s" bx:disabledP))
          (insert (format "\
(lambda () \"\n*\
  [[elisp:(org-cycle)][| ]]  \"Loading...\"                :: Loading Announcement Message %s [[elisp:(org-cycle)][| ]]
\")

(blee:msg \"Loading: %s\")"
         bx:message bx:message)))
           (message (format "DBLOCK NOT EXECUTED -- disabledP = %s" bx:disabledP))
      )))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Conversion                 ::      /Conversion Facilities/   [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun elisp-one-defun-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^(defun " nil t))
      (move-beginning-of-line 1)
      (when (re-search-forward "^(defun " nil t)
        (let* (
               (defunName (thing-at-point 'symbol))
               )
          ;;;(message (format "Section ==  %s" defunName))
          (save-excursion
            (skip-chars-forward "^(")
            (forward-char)
            (let ((defunArgs
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^)")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" defunName defunArgs))
              (beginning-of-line 1)
              (open-line 1)
              ;;;(delete-region (point) (progn (forward-line 1) (point)))
              (message "Inserting dblock ...") ;;(sit-for 1)
              (elisp-defun-orgSec-insert defunName defunArgs)
              )))))
  )

(defun elisp-one-cl-defun-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^(cl-defun " nil t))
      (when (re-search-forward "^(cl-defun " nil t)
        (let* (
               (defunName (thing-at-point 'symbol))
               (keyWordLinePoint (point))
               )
          ;;;(message (format "Section ==  %s" defunName))
          (save-excursion
            (skip-chars-forward "^(")
            (forward-char)
            (let ((defunArgs
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^)")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" defunName defunArgs))
              (goto-char keyWordLinePoint)
              (beginning-of-line 1)
              (open-line 1)
              ;;;(delete-region (point) (progn (forward-line 1) (point)))
              (message "Inserting dblock ...") ;;(sit-for 1)
              (elisp-labeled-orgSec-insert "cl-defun" defunName defunArgs)
              )))))

  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-all-defun-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-all-defun-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun elisp-all-defun-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^(defun " nil t))
      (while (re-search-forward "^(defun " nil t)
        (let* (
               (defunName (thing-at-point 'symbol))
               )
          ;;;(message (format "Section ==  %s" defunName))
          (save-excursion
            (skip-chars-forward "^(")
            (forward-char)
            (let ((defunArgs
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^)")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" defunName defunArgs))
              (beginning-of-line 1)
              (open-line 1)
              ;;;(delete-region (point) (progn (forward-line 1) (point)))
              (message "Inserting dblock ...") ;;(sit-for 1)
              (elisp-defun-orgSec-insert defunName defunArgs)
              )))))

  (if (save-excursion (re-search-forward "^(cl-defun " nil t))
      (while (re-search-forward "^(cl-defun " nil t)
        (let* (
               (defunName (thing-at-point 'symbol))
               (keyWordLinePoint (point))              
               )
          ;;;(message (format "Section ==  %s" defunName))
          (save-excursion
            (skip-chars-forward "^(")
            (forward-char)
            (let ((defunArgs
                   (buffer-substring 
                    (point)
                    (progn
                      (skip-chars-forward "^)")
                      (point)))))
              
              (message (format "Section ==  %s-- %s" defunName defunArgs))
              (goto-char keyWordLinePoint)            
              (beginning-of-line 1)
              (open-line 1)
              ;;;(delete-region (point) (progn (forward-line 1) (point)))
              (blee:msg "Inserting dblock ...") ;;(sit-for 1)
              (elisp-labeled-orgSec-insert "cl-defun" defunName defunArgs)            
              )))))
  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-orgSec-insert defunName defunArgs) [[elisp:(org-cycle)][| ]]
  ")

(defun elisp-labeled-orgSec-insert (label defunName defunArgs)
  ""
  (if (string= "" defunArgs)
      (insert
       (format "\
(lambda () \"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || %s :: (%s) [[elisp:(org-cycle)][| ]]
\")\n"
        (str:leftAdjustToLength 12 " " label) defunName))
    (insert
       (format "\
(lambda () \"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || %s :: (%s %s) [[elisp:(org-cycle)][| ]]
  \")\n"
        (str:leftAdjustToLength 12 " " label) defunName defunArgs))
))

(defun elisp-defun-orgSec-insert (defunName defunArgs)
  ""
  (if (string= "" defunArgs)
      (insert
       (format "\
(lambda () \"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (%s) [[elisp:(org-cycle)][| ]]
\")\n"
        defunName))
    (insert
       (format "\
(lambda () \"\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (%s %s) [[elisp:(org-cycle)][| ]]
  \")\n"
        defunName defunArgs))
))




;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-emacs-lisp"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-emacs-lisp)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
