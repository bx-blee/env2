(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")
(require 'loop)


;;;
;;; Add describe-function, describe-key, edit-variable
;;;

(advice-add 'org-dblock-write:b:elisp:describe/variable :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:describe/variable  (<params)
  "Describe varName"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         (<varName (or (plist-get <params :varName) nil))
         (<foldDesc (or (plist-get <params :foldDesc) nil))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET" )
    (defun bodyContentPlus ())

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
             ($extensionFileName)
             )

        (when <foldDesc
          (insert (format "  [[elisp:(org-cycle)][| /%s/ |]] " <foldDesc)))

        (insert (s-lex-format
                "  [[elisp:(describe-variable '${<varName})][Describe Var: ${<varName}]]"))
        )
      )

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-mailings"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-blee-mgmt)

;;;#+END:
