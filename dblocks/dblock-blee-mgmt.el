(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")
(require 'loop)


;;;
;;; Add describe-function, describe-key, edit-variable
;;;

(advice-add 'org-dblock-write:b:elisp:variable/describe :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:variable/describe (<params)
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


(advice-add 'org-dblock-write:b:elisp:function/describe :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:function/describe  (<params)
  "Describe funcName"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         (<funcName (or (plist-get <params :funcName) nil))
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
                "  [[elisp:(describe-function '${<funcName})][Describe Func: ${<funcName}]]"))
        )
      )

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:b:elisp:key/describe :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:key/describe  (<params)
  "Describe keyName"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         (<keyName (or (plist-get <params :keyName) nil))
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
                "  [[elisp:(describe-function '${<funcName})][Describe Func: ${<funcName}]]"))
        )
      )

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:b:elisp:variable/customize :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:variable/customize  (<params)
  "Describe keyName"
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
                "  [[elisp:(customize-variable'${<varName})][Customize Var: ${<varName}]]"))
        )
      )

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))

(advice-add 'org-dblock-write:b:elisp:option/customize :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:b:elisp:option/customize  (<params)
  "Describe keyName"
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         (<optionName (or (plist-get <params :optionName) nil))
         (<foldDesc (or (plist-get <params :foldDesc) nil))
         )

    (bxPanel:params$effective)

    (defun helpLine () "NOTYET")
    (defun bodyContentPlus () "NOTYET")

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
             ($extensionFileName)
             )

        (when <foldDesc
          (insert (format "  [[elisp:(org-cycle)][| /%s/ |]] " <foldDesc)))

        (insert (s-lex-format
                "  [[elisp:(customize-option'${<optionName})][Customize Option: ${<optionName}]]"))
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
