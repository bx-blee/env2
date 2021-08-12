;; 
;; bystar-acct-lib.el
;; 


(defvar bystar-acct-profile-buffer "*BYSTAR-ACCT PROFILE*" "BYSTAR-ACCT PROFILE buffer name.")
;; (setq bystar-acct-profile-buffer "*BYSTAR-ACCT PROFILE*")

;;;
;;; TODO: NOTYET: Use a struct style variable, Make the buffer be help based.
;;;
(defun bystar:acct:current-show ()
  "Set up a buffer for showing BYSTAR-ACCT PROFILE"
  (interactive)
  (let ((buffer-name (generate-new-buffer-name bystar-gnus-profile-buffer)))
    (switch-to-buffer buffer-name)
    (insert "BYSTAR-ACCT PROFILE\n")
    (insert "============================================\n")
    (insert (format "bystar-cp_acctNu:\t %s\n" bystar-cp_acctNu))
    (insert (format "bystar-cp_acctUid:\t %s\n" bystar-cp_acctUid))
    (insert (format "bystar-cp_FirstName:\t %s\n" bystar-cp_FirstName))
    (insert (format "bystar-cp_LastName:\t %s\n" bystar-cp_LastName))
    (insert "============================================\n")
    ))               

;; (bystar:acct:canonicals-set)
(defun bystar:acct:canonicals-set ()
  ""
  (interactive)

  (setq bystar:acct:uid-name bystar-cp_acctUid)
  (setq bystar:acct:uid-number bystar-cp_acctNu)

  (setq bystar:acct:passwd-decrypted
	(shell-command-to-string 
	 ( format "/bin/echo -n $( /opt/public/osmt/bin/bystarAcctInfo.sh -p bystarUid=%s -i bystarUidPasswdDecrypted )" bystar-cp_acctUid) ))


  (when (string= "BYNAME" (upcase bystar-cp_ServiceType))
    (progn
      (setq bystar:acct:first-name (capitalize bystar-cp_FirstName))
      (setq bystar:acct:last-name (capitalize bystar-cp_LastName))
      (setq bystar:acct:full-name (concat bystar:acct:first-name " " (upcase bystar:acct:last-name)))
      ;;;
      ;;; NOTYET, TEMP
      ;;;
      (setq bystar:acct:first-name-alt "محسن")
      (setq bystar:acct:last-name-alt "بنان")
      (setq bystar:acct:full-name-alt (concat bystar:acct:first-name-alt " " bystar:acct:last-name-alt))
      ))

  (when (string= "BYSMB" (upcase bystar-cp_ServiceType))
    (progn
      (setq bystar-cp_FirstName "firstNameNotYet")
      (setq bystar-cp_LastName "lastNameNotYet")
      (setq bystar:acct:first-name (capitalize bystar-cp_FirstName))
      (setq bystar:acct:last-name (capitalize bystar-cp_LastName))
      (setq bystar:acct:full-name (concat bystar:acct:first-name " " bystar:acct:last-name))
      ))
  )

;;; (bystar:acct:bue-base-dir)
(defun bystar:acct:bue-base-dir ()
  ""
   (concat (expand-file-name "~/") "bystar/accounts/" bystar-cp_acctUid "/LUE")
   )
    
(provide 'bystar-acct-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
