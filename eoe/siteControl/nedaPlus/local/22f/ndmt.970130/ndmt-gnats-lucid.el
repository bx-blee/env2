;;; 
;;; RCS: $Id: ndmt-gnats-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(require 'gnats)
(require 'send-pr)

(defconst ndmt-gnats-menu
  '("GNATS"
    "-----"
    ["Submit Problem Report" (send-pr) t]
    "-----"
    ["List All Problem Reports" (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary") t]
    ("List Problem Reports By Severity"
     ["critical"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --severity=critical") t]
     ["serious"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --severity=serious") t]
     ["non-critical" (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --severity=non-critical") t]
     )
    ("List Problem Reports By Priority"
     ["high"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --priority=high") t]
     ["medium"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --priority=medium") t]
     ["low" (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --priority=low") t]
     )
    ("List Problem Reports By State"
     ["open"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --state=open --print-path --summary") t]
     ["closed"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --state=closed --print-path --summary") t]
     )
    ("List Problem Reports By Category"
     ["cdpd-spec" (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=cdpd-spec") t]
     ["doc"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=doc") t]
     ["ivr"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=ivr") t]
     ["ivr-admin"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=ivr-admin") t]
     ["lsm-admin"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-admin") t]
     ["lsm-config"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-config") t]
     ["lsm-misc"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-misc") t]
     ["lsm-mts"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-mts") t]
     ["lsm-spec"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-spec") t]
     ["lsm-ua"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-ua") t]
     ["lsm-ua-dos"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-ua-dos") t]
     ["lsm-ua-win"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsm-ua-win") t]
     ["lsros"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsros") t]
     ["lsros-dos"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsros-dos") t]
     ["lsros-win"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=lsros-win") t]
     ["ocp"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=ocp") t]
     ["pending"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=pending") t]
     ["ppcp"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=ppcp") t]
     ["sns-ref"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=sns-ref") t]
     ["sns-spec"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=sns-spec") t]
     ["sysadmin-WDD"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=sysadmin-WDD") t]
     ["sysadmin-neda"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=sysadmin-neda") t]
     ["test"  (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path --summary --category=test") t]
     )
    ["List All Problem Reports (Detailed)" (query-pr" --directory=/opt/public/sde/lib/gnats/gnats-db --print-path") t]
    "-----"
    ["GNATS Help" ndmt-not-yet nil]
    ["Software Revision Info" ndmt-not-yet nil]
    ))


;;; Put the VM menu in the menubar

(defun ndmt-gnats-install-menubar ()
  "Install"
  (interactive)
  (if (and current-menubar (not (assoc "GNATS" current-menubar)))
      (progn
	(set-buffer-menubar (copy-sequence current-menubar))
	(add-menu nil "GNATS" (cdr ndmt-gnats-menu) "Options"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commands in GNATS Menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'ndmt-gnats-lucid)
