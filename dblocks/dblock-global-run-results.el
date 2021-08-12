
(require 'bx-lcnt-lib)

;;;
;;;  Layered as:
;;;   run-result-stdout             :command
;;;



(defun org-dblock-write:bx:dblock:global:run-result-stdout (params)
  (let ((bx:command (or (plist-get params :command) ""))
	)
    (insert
      (shell-command-to-string 
       (format "%s 2> /dev/null"  bx:command))
     )
    ))

(defun org-dblock-write:bx:dblock:global:run-result (params)
  (let ((bx:command (or (plist-get params :command) ""))
	)
    (insert
      (shell-command-to-string 
       (format "%s"  bx:command))
     )
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-global-run-results"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-global-run-results)
;;;#+END:
