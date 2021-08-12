;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string  "blee-iim-bash-cmnd" "blee-dict")  (replace-string "moduleTag:" "iim:bash:cmnd:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (iim:bash:cmnd:), for handelling File_Var [[elisp:(org-cycle)][| ]]
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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-dict"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-dict [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: blee-dict")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: /Requires/ [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Definitions                 :: /Definitions/ [[elisp:(org-cycle)][| ]]
")



(lambda () "
*  [[elisp:(org-cycle)][| ]]  blee:dict: library          :: /Blee Dict Library/ [[elisp:(org-cycle)][| ]]
")

;;;
;;; (setq blee:example:var/dict "")
;;; (setq blee:example:var/dict/bufLoc "")
;;;

;;; (blee:dict:set 'blee:example:var/dict/bufLoc 'exampleKey "exampleValue")
;;; (blee:dict:set 'blee:example:var/dict 'exampleKey "exampleValue")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dict:set dict key value) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dict:set (dict key value)
  "Blee Dict uses Emacs Property Lists"
  (put dict key value)
  )

;;; (blee:dict:get 'blee:example:var 'exampleKey)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dict:get dict key) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dict:get (dict key)
  ""
  (get dict key)  
  )

;;; (blee:dict:keys 'blee:example:var)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dict:keys dict) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dict:keys (dict)
  "Returns A list of Keys"
  (let (
	(keysList)
	(localDictCopy (symbol-plist dict))
	)
    (while localDictCopy
      (add-to-list 'keysList (pop localDictCopy))
      (pop localDictCopy) ;;; ignoring the value
      )
    keysList
    ))

;;; (blee:dict:list 'blee:example:var)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dict:list dict) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dict:list (dict)
  "Returns dict as list"
  (symbol-plist dict)
  )

;;; (blee:dict:print 'blee:example:var)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:dict:print dict) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:dict:print (dict)
  "Returns A list of Keys"
  (message "NOTYET")
  )




;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-dict"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-dict)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
