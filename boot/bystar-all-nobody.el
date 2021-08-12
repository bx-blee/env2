;; 
;; bystar-all.el  -- EMPTY Place Holder
;; 


(defun bystar-nobody ()
  "bystar setting for the nobody"
  (interactive)

(setq bystar-cp_LastName "nobody")
(setq bystar-cp_acctMainBaseDomain "00000.byname.com")
(setq bystar-cp_ContactPerson "Nobody Nobody")
(setq bystar-cp_acctFactoryBaseDomain "nobody..nobody.byname.com")
(setq bystar-cp_EmailAdmin "mohsen.banan@byname.net")
(setq bystar-cp_acctUidHome "/acct/user/1/nobody/nobody")
(setq bystar-cp_acctBynumberBaseDomain "00000.bynumber.com")
(setq bystar-cp_acctUid "nobody")
(setq bystar-cp_acctNu "00000")
(setq bystar-cp_acctNspBaseDir "/acct/user/1/nobody/nobody/NSP")
(setq bystar-cp_factoryBaseDomain "byname.com")
(setq bystar-cp_BacsId "bacs000")
(setq bystar-cp_nameSelector "t1")
(setq bystar-cp_acctPrefix "ua")
(setq bystar-cp_FirstName "nobody")
(setq bystar-cp_ServiceType "BYNAME")
(setq bystar-cp_ServiceSupportType "TRIAL")
  )

(defun bystar-all ()
  "bystar setting for all"
  (interactive)
  (setq bystarAcctsList '())
  (bystar-nobody)
  )



(provide 'bystar-all-nobody)  

