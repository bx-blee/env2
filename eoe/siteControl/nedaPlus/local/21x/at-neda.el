;;;
;;; at-neda.el
;;;

(defconst at-neda-fsf-emacs-p (null (string-match "XEmacs" emacs-version))
  "t if emacs is FSF, nil otherwise.")

;; emacs19f needs Lucid-style menu emulation
(if at-neda-fsf-emacs-p
    (require 'lmenu))



;;; ---------------------------------------------------------------
;;; @Neda menu
;;; ---------------------------------------------------------------


(defconst at-neda-menu
  '("@Neda"
    ["Quick Info" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/nedaQuickInfo/nedaQuickInfo.info" "Top") t]
    "----- Personnel ----"
    ["Info Visit Personnel Policies" (Info-find-node "/usr/curenv/doc/nedaInternal/personnel/personnelPolicies/personnelPolicies.info" "Top") t]
    "----- Operations ----"
    ["Info Visit Doc Of Docs" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/docOfDocs/docofdocs.info" "Top") t]
    ["Info Visit Software Asset Tracking" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/nedaAssetTrackingSoftware/assetTrackingSoftware.info" "Top") t]
    ["Info Visit Hardware Asset Tracking" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/nedaAssetTrackingHardware/assetTrackingHardware.info" "Top") t]
    ["Info Visit Misc Asset Tracking" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/nedaAssetTrackingMisc/assetTrackingMisc.info" "Top") t]
    ["Info Visit Library And Mail Sorting" (Info-find-node "/usr/curenv/doc/nedaInternal/operations/libraryAndMailSorting/libraryAndMailSorting.info" "Top") t]
    "----- Engineering ----"
    ["Neda Computing Env. Sol2" (Info-find-node "/usr/curenv/doc/nedaInternal/engineering/nedaComputingEnvSol2/nedaComputingEnvSol2.info" "Top") t]
    "-----"
    ["Phone Message" (at-neda-notyet) t]
    ["Purchase Order Request" (at-neda-notyet) t]
    ["Print Time Sheet Form 1-15" (at-neda-notyet) t]
    ))


(defun at-neda-update-menu ()
  "Install `@Neda' menu."
  (interactive)
  (cond (at-neda-fsf-emacs-p
	 (add-menu nil "@Neda" (cdr at-neda-menu) "Apps"))
	(t
	 (if current-menubar
	     (let ((assn (assoc "@Neda" current-menubar)))
	       (cond (assn
		      (setcdr assn (cdr at-neda-menu)))
		     (t
		      (add-menu nil "@Neda" (cdr at-neda-menu) "Apps"))))))))

;;; ---------------------------------------------------------------
;;; helper functions
;;; ---------------------------------------------------------------


(defun at-neda-notyet ()
  (message "Not yet implemented.")
  (ding))

;;; ---------------------------------------------------------------
;;; Put the menu in the menubar
;;; ---------------------------------------------------------------

(cond (at-neda-fsf-emacs-p
       (at-neda-update-menu))
      ((and (not at-neda-fsf-emacs-p)
	    (eq window-system 'x))
       (at-neda-update-menu)
       (if (null (member 'at-neda-update-menu activate-menubar-hook))
	   (add-hook 'activate-menubar-hook 'at-neda-update-menu))))


;;; ---------------------------------------------------------------
(provide 'at-neda)
