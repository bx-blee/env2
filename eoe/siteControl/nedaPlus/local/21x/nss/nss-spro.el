;;; This file is nss-spro.el

;;; Neda Subscriber Services (NSS) Subscriber Profile processing routines

(require 'eoe-ini-utils)


(defvar nss-spro-file nil
  "The subscriber profile file initialized by `nss-spro-initialize'.")


(defun nss-spro-initialize (subcriber-profile-file)
  "Initialize this package for processing SUBSCRIBER-PROFILE-FILE."
  (cond ((file-exists-p (expand-file-name subcriber-profile-file))
	 (setq nss-spro-file subcriber-profile-file))
	(t
	 (ding)
	 (error "Subscriber profile <%s> not found!" subscriber-profile-file))))


(defvar nss-spro-valid-aua-list '("IVR-Email-AUA"
				  "IVR-Fax-AUA"
				  "IVR-Pager-AUA"
				  "IVR-LSM-AUA"
				  "IVR-PocketNet-AUA"
				  "IVR-SMS-AUA")
  "List of AUAs (excluding `special' ones for default and emergency).")



(defvar nss-spro-ivr-default-aua "IVR-Default-AUA"
  "Name of the default (pseudo) AUA field for IVR.")



(defvar nss-spro-ivr-emergency-aua "IVR-Emergency-AUA"
  "Name of the emergency (pseudo) AUA field for IVR.")


(defvar nss-spro-valid-pseudo-aua-list (list nss-spro-ivr-default-aua
					     nss-spro-ivr-emergency-aua)
  "List of pseudo AUAs.")


(defvar nss-spro-alist nil
  "The alist of some subscriber profile.  
nb. may contain more than just subscriber associations.
Do not use directly--use function `nss-spro-alist' instead.")


(defun nss-spro-alist (&optional force-refresh-p)
  "The alist of some subscriber profile.  
nb. may contain more than just subscriber associations."
  (cond ((or (null nss-spro-alist)
	     force-refresh-p)
	 (setq nss-spro-alist (eoe-ini2alist nss-spro-file)))
	(t 
	 nss-spro-alist)))



(defvar nss-spro-subscribers-alist nil
  "The alist of subscribers in some subscriber profile.  
Do not use directly--use function `nss-spro-subscribers-alist' instead.")


(defun nss-spro-subscribers-alist (&optional force-refresh-p)
  "Returns the alist of subscribers in some subscriber profile."
  (cond ((or (null nss-spro-subscribers-alist)
	     force-refresh-p)
	 (nss-spro-alist force-refresh-p)
	 (setq nss-spro-subscribers-alist nil)
	 (mapcar '(lambda (assn)
		    (if (nss-subscriber-p (car assn))
			(setq nss-spro-subscribers-alist (cons assn nss-spro-subscribers-alist))))
		 (nss-spro-alist)))
	(t nil))
  nss-spro-subscribers-alist)



; (nss-subscriber-list)

(defun nss-subscriber-list ()
  "Returns an alist of the form: ((<sub-id> . <sub-name>) (<sub-id> . <sub-name>) ... )" 
  (let (subs-list)
    (setq subs-list nil)
    (mapcar '(lambda (per-subscriber-assns)
	       (let (subs-assns subs-id subs-name)
		 (setq subs-assns (car (cdr per-subscriber-assns)))
		 (setq subs-id (cdr (assoc "Subscriber-ID" subs-assns)))
		 (setq subs-name (or (nss-subscriber-name subs-assns) "<no name>"))
		 (cond (subs-id
			(setq subs-list (cons (cons subs-id subs-name) subs-list)))
		       (t 
			(ding)
			(message "Warning! malformed subscriber-profile for <%s>?" (car per-subscriber-assns))
			(sleep-for 1)
			))))
	    (nss-spro-subscribers-alist))
    subs-list))


; (nss-html-subscriber-list)

(defun nss-html-subscriber-list ()
  "Return html for a 'selection'."
  (let (subs-list buf)
    (setq subs-list (sort (nss-subscriber-list) '(lambda (elt1 elt2)
						   (string-lessp (car elt1)
								 (car elt2)))))
    (save-window-excursion
      (setq buf (get-buffer-create " nss-html-subscriber-list *scratch*"))
      (switch-to-buffer buf)
      (delete-region (point-min) (point-max)))
    
    (mapcar '(lambda (subscriber)
	       (set-buffer buf)
	       ;; <OPTION VALUE="Default">Default
	       (insert (format "<OPTION VALUE=\"%s\">[%s] %s\n"
			       (car subscriber)
			       (car subscriber)
			       (cdr subscriber))))
	    subs-list)
    
    (save-window-excursion
      (switch-to-buffer buf)
      (buffer-string))))



; (nss-html-subscriber-list)


;(setq subs-id "166.055")
;(setq subs-attr-name "IVR-Default-AUA")

(defun nss-subscriber-attr-value (subs-id subs-attr-name)
  (let (subs-attribs) 
    (setq subs-attribs (nss-subscriber-attribs subs-id))
    (cdr (assoc subs-attr-name subs-attribs))))
  
; (nss-subscriber-attr-value "201.009" "IVR-Email-AUA")
;  (nss-subscriber-attr-value "201.009" "IVR-Default-AUA")


;;; -------------------------------------------------------------------
;;; Helper functions
;;; -------------------------------------------------------------------
    
(defun nss-subscriber-attribs (subs-id)
  (catch 'found
    (mapcar '(lambda (assn)
	       (let (subscriber-attribs subs-id-assn)
		 (if (and (nss-subscriber-p (car assn))
			  (setq subscriber-attribs (car (cdr assn)))
			  (string-equal subs-id (cdr (assoc "Subscriber-ID" subscriber-attribs))))
		     (throw 'found subscriber-attribs))))
	    (nss-spro-subscribers-alist))))			


(defun nss-subscriber-name (subscriber-info)
  "SUBSCRIBER-INFO is an alist.  Returns the subscriber's name or nil."
  (let (ivr-email-aua ivr-lsm-aua)
    ; (message "subscriber info: %s" subscriber-info)
    (or (cdr (assoc "Subscriber-Name" subscriber-info))
	(and (setq ivr-email-aua (cdr (assoc "IVR-Email-AUA" subscriber-info)))
	     (nss-name-from-email-addr ivr-email-aua))
	(and (setq ivr-lsm-aua  (cdr (assoc "IVR-LSM-AUA" subscriber-info)))
	     (nss-name-from-email-addr ivr-lsm-aua)))))


(defun nss-name-from-email-addr (email-addr)
  "Try to see if there's a name part in the subscriber's LSM AUA (e.g.,
`Pean Lim <201.009@lsm.neda.com> (Pithy Comment Here)' ==> Pean Lim.  If not 
present, returns nil."
  (let ((name email-addr)
	left-angle-pos
	right-angle-pos
	left-paren-pos right-paren-pos
	first-non-whitespace last-non-whitespace)

    ;; get rid of address portion
    (if (and (setq left-angle-pos (string-match "<" name))
	     (setq right-angle-pos (string-match ">" name)))
	(setq name (concat (substring name 0 left-angle-pos)
			   (substring name (1+ right-angle-pos)))))

    ;; get rid of comment portion
    (if (and (setq left-paren-pos (string-match "(" name))
	     (setq right-paren-pos (string-match ")" name)))
	(setq name (concat (substring name 0 left-paren-pos)
			   (substring name (1+ right-paren-pos)))))

    ;; trim leading and trialing whitespace
    (if (not (string-equal name ""))
	(progn
	  (string-match "\\s *\\(\\S \\)" name)
	  (setq first-non-whitespace (match-beginning 1))
	  (string-match "\\S \\(\\s *$\\)" name)	 
	  (setq last-non-whitespace (match-beginning 1))
	  (setq name (substring name first-non-whitespace last-non-whitespace))))

    (cond ((string-equal name "") nil)
	  (t name))))


(defconst nss-subscriber-id-regexp "[0-9]+[0-9\\.]*[0-9]+"
  "Regular expression for Subscriber ID")

(defconst nss-subscriber-key-regexp "^[0-9]+[0-9\\.]*[0-9]+$"
  "Regular expression for a Subscriber association.")

(defun nss-subscriber-p (key)
  (string-match nss-subscriber-key-regexp key))

;;; -------------------------------------------------------------------
;;; Error Handling
;;; -------------------------------------------------------------------

(defvar nss-log-file "/tmp/nss-spro.el.log" 
  "Messages get logged here.")
  
(defun nss-log-message (msg)
  (shell-command (format "echo '%s' >> %s" msg nss-log-file)))  


;;; -------------------------------------------------------------------
(provide 'nss-spro)
