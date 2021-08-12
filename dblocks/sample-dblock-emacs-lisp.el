;;;
;;; TODO: Add a library of dynamic blocs for PLPC
;;;       Add equivalent of C-u C-c C-x C-u to ttytex processor
;;;       Put Buffer in org-mode
;;;       Write the right starting point latex template with dynamic block
;;;
;;;       Testing
;;;       1) Blee->Org->Dblock-> Set Start/End Mode RegExp
;;;       2) Put point inside a block
;;;       3) Blee->Org->Dblock-> Block Update
;;;

;;;#+BEGIN: block-update-time :format "11ZZ%m/%d/%Y"
\date{11ZZ01/28/2011}
Hello World
;;;#+END:

;;;#+BEGIN: block-update-time :format "XXkkpgp4422p%m/%d/%Y"
\date{XXkkpgp4422p01/28/2011}
Hello World
;;;#+END:

;;;+BEGIN: bx:dblock:global:run-result-stdout :command "echo XXkkpgp4422p%m/%d/%Y"
\date{XXkkpgp4422p01/28/2011}
Hello World
;;;+END:

