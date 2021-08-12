;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;;
;;; (bystar:website:menu:define)
(defun bystar:website:menu:define ()
  (easy-menu-define 
    bystar:website:menu:definition 
    nil 
    "Global ByStar Website Menu"
    '("Web Site Facilities"
      "---"
      ("Web Site Editing Facilities"
       ["cd To Plone Base" (call-interactively 'dired) t]
       ["Help: Website Editing" bystar:website:doc:howto:new-document-help t]
       )
      "---"
      ("Manage Photo Gallery"
       ["Upload From Android" (call-interactively 'dired) t]
       ["Upload From SdCard" (call-interactively 'dired) t]
       ["Help: Gallery Upload" bystar:web:doc:howto:gallery-help t]
       )
      "---"
      ("Manage Geneweb"
       ["Run Locally" (call-interactively 'dired) t]
       ["Help: Geneweb" bystar:web:doc:howto:geneweb-help t]
       )
      "---"
      ("ByStar Website Help/Documentation"
       ["Help: Website Editing" bystar:website:doc:howto:new-document-help t]
       ["Help: Gallery Upload" bystar:web:doc:howto:gallery-help t]
       ["Help: Geneweb" bystar:web:doc:howto:geneweb-help t]
       )
      ))
  )


;;;(easy-menu-add-item nil '("Blee") 'bystar:website:menu:definition "Blee Help")

;; 
(defun bx-website-menu-help ()
  (interactive)
  (message "bx-website-menu-help NOTYET")
  )


(provide 'bystar-website-menu)
