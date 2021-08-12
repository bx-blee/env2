;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;;
;;;
(defun bystar:selfpub:menu:define ()
  (easy-menu-define 
    bystar:selfpub:menu:definition 
    nil 
    "Global ByStar Selfpub Menu"
    '("Self Publication Facilities"
      "---"
      ("Libre Content Editing Facilities"
       ["Locate Document By Number" (call-interactively 'dired) t]
       ["Set Destintation Publisher" (call-interactively 'dired) t]
       ["How To Start A New Document" (call-interactively 'dired) t]
       ["Self Publication Shell" (call-interactively 'dired) t]
       ["cd To lcnt Base" (call-interactively 'dired) t]
       )
      "---"
      ("Web Site Editing Facilities"
       ["cd To Plone Base" (call-interactively 'dired) t]
       )
      "---"
      ("ByStar Self-Publication Documentation"
       ["Starting A New Document" bystar:selfpub:doc:howto:new-document-help t]
       )
      ))
  )


;;;(easy-menu-add-item nil '("Blee") 'bystar:selfpub:menu:definition "Blee Help")

;; 
(defun bx-selfpub-menu-help ()
  (interactive)
  (message "bx-selfpub-menu-help NOTYET")
  )


(provide 'bystar-selfpub-menu)
