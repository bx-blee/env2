;;;
;;;

(require 'easymenu)

;;;
;;;
;;;
;;; (blee:blee:menu)
(defun bystar:sync:menu:define ()
  (easy-menu-define 
    bystar:sync:menu:definition 
  nil 
  "Global ByStar Synchronization Menu"
  '("Synchronization/VC (magit)"
    ["magit-status" magit-status t]
    "---"
    ["ByStar Sync (GIT) Panel" bx-sync-panel-goto t]
    ["GIT Reference Sheet (html)" (browse-url "http://daemianmack.com/magit-cheatsheet.html") t]
    ["GIT Manual" bx-sync-panel-goto t]
    ))
  )

;; (defun bystar:sync:menu:define ()
;;   (easy-menu-define 
;;     bystar:sync:menu:definition 
;;   nil 
;;   "Global ByStar Synchronization Menu"
;;   '("Synchronization/VC (magit)"
;;     ["CVS BystarUid  (Autonomous Service Account)" bx:cvs-update:BASA t]
;;     ["CVS Bystar Platform Acct (~)" bx:cvs-update:BPA t]
;;     "---"
;;     ["CVS Full Platform" bx:cvs-update:platform-full t]
;;     "---"
;;     ["CVS /opt/public/osmt" (cvs-update "/opt/public/osmt" t) t]
;;     ["CVS /usr/mapFiles" (cvs-update "/usr/mapFiles" t) t]
;;     ["CVS /libre/ByStar" (cvs-update "/libre/ByStar" t) t]
;;     ["CVS /libre/common" (cvs-update "/libre/common" t) t]
;;     "---"
;;     ["ByStar Sync (GIT) Panel" bystar:sync:doc:howto:all-help t]
;;     ))
;;   )


;; (easy-menu-add-item nil '("Blee") 'bystar:sync:menu:definition "Blee Help")

;; 
(defun bx-sync-menu-help ()
  (interactive)
  (message "bx-sync-menu-help NOTYET")
  )


;; 
(defun bx-sync-panel-goto ()
  (interactive)
  (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git")
  )



(defun bx:cvs-update:BPA ()
  "CVS Bystar Platform Account"
  (interactive)
  ;;
  (cvs-update (expand-file-name "~/") t)
  )


(defun bx:cvs-update:BASA ()
  "CVS BystarUid (ByStar Autonomous Service Account)"
  (interactive)
  ;;
  (cvs-update 
   (bystar:acct:bue-base-dir)
   ;;(concat (expand-file-name "~/") "bystar/accounts/" bystar-cp_acctUid "/LUE")
   t 
   )
  )


(defun bx:cvs-update:platform-full ()
  ""
  (interactive)
  (message "NOTYET"))



(provide 'bystar-sync-menu)
