(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")


(advice-add 'org-dblock-write:bxPanel:mailing/compose :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:bxPanel:mailing/compose  (<params)
  "Creates terse links for navigation surrounding current panel in treeElem."
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         ;  [[elisp:(find-file "./mailing.ttytex")][Visit ./mailing.ttytex]] | [[elisp:(message-mode)][message-mode]] | [[elisp:(message-mode)][message-mode]] | [[elisp:(mcdt:setup-and-compose/with-curBuffer)][Compose]] | [[elisp:(mcdt:setup-and-originate/with-curBuffer)][Originate]];
         (<mailingFile (or (plist-get <params :mailingFile) "auto"))
         (<foldDesc (or (plist-get <params :foldDesc) nil))
         )

    (bxPanel:params$effective)

    (defun helpLine ()
      ":bxoId \"auto or bxoId\""
      )

    (defun bodyContentPlus ()
      ;;(bxPanel:lineDeliminator|top <realm)
      )

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
             ($extensionFileName)
             ($mailingName)
             ($mailingBuf (find-file <mailingFile))
	     ($mailingParams (mcdt:mailing:params|from-buf $mailingBuf))
             ($type (or (plist-get $mailingParams :type) nil))
             )
        (setq $mailingName (mcdt:mailing:getName|with-file <mailingFile))
        (when <foldDesc
          (insert (format "  [[elisp:(org-cycle)][| /%s/ |]] " <foldDesc)))
        (insert (format "    [[elisp:(mcdt:setup-and-compose/with-file \"%s\")][%s]] " <mailingFile $mailingName))
        (when (equalp $type 'originate )
          (insert
           (s-lex-format
            "|| [[elisp:(mcdt:setup-and-originate/with-file \"${<mailingFile}\")][Originate]] ")))
        (message (format "%s" $type))
        (insert (format "|| [[file:%s][Visit]]   " <mailingFile))
        )
      )

    (bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


(advice-add 'org-dblock-write:bx:mtdt:content/actions :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:bx:mtdt:content/actions  (<params)
  "In a content.{mail,msgOrg} file insert orgActionLinks for what applies to that mailing."
  (let* (
         (<governor (letGet$governor)) (<extGov (letGet$extGov))
         (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
         (<style (letGet$style "openTerseNoNl" "closeContinue"))
         )

    (bxPanel:params$effective)   

    (defun helpLine ()
      ":bxoId \"auto or bxoId\""
      )

    (defun bodyContentPlus ()
      ;;(bxPanel:lineDeliminator|top <realm)      
      )

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
             ($extensionFileName)
             ($mailingName)
             ($mailingBuf (current-buffer))
             ($mailingFile (buffer-file-name (current-buffer)))
	     ($mailingParams (mcdt:mailing:params|from-buf $mailingBuf))
             ($type (or (plist-get $mailingParams :type) nil))
             )
        ;;(setq $mailingName (mcdt:mailing:getName|with-file $mailingFile))

        (insert "#+BEGIN_COMMENT\n")
        (insert (s-lex-format
                "  [[elisp:(find-file \"./mailing.ttytex\")][Visit ./mailing.ttytex]]"))
        (insert (s-lex-format
                " | [[elisp:(message-mode)][message-mode]]"))
        (insert (s-lex-format
                " | [[elisp:(mcdt:setup-and-compose/with-curBuffer)][Compose]]"))
        (insert (s-lex-format
                " | [[elisp:(mcdt:setup-and-originate/with-curBuffer)][Originate]]"))
        (insert "\n#+END_COMMENT")
        )
      )

    (bodyContent)
    ;;(bx:invoke:withStdArgs$bx:dblock:governor:process)
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-mailings"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-mailings)
;;;#+END:
