;; 
;; bystar-ue-lib.el
;; 

(require 'eoeLsip)
(require 'lsip-basic)
    
;;; (bystar:ue:params-auto-set)
(defun bystar:ue:params-auto-set ()
  (interactive)
  (cond ((or (string-equal opRunDistFamily "UBUNTU")
	     (string-equal opRunDistFamily "DEBIAN"))
	 (message "GOT UBUNTU/DEBIAN")
	 (setq bystar:ue:form-factor 'desktop)
	 )
	((string-equal opRunDistFamily "MAEMO")
	 (message "GOT MAEMO")
	 (setq bystar:ue:form-factor 'handset)
	 )
	(t
	 (message "EH_problem")
	 (ding)
	 (sleep-for 1)
	 (message (format "Don't know: %s" opRunDistFamily)))
	)
  (when 
      (string-equal (lsip-fqdn-host (system-name)) "bisp0017")
    (setq bystar:ue:form-factor 'testing)
    )
  )

(provide 'bystar-ue-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
