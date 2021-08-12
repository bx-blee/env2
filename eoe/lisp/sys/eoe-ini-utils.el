;;; Utilities for manipulating .ini files.

;;; Definition of Terms

;;; [skdfj]  <--- this is a "tag"
;;;         Foo = Bar
;;;          ^     ^
;;;          |     |
;;;          |     +--- this is a "value"
;;;          +--------- this is a "key" 
;;;
;;; a "record" comprises all the key-value pairs of a "tag"


;;; convert .ini file to alist format
;;; ((<tag> ((<key> <value>+)+)+))

(defun eoe-ini2alist (file)
  (interactive "fFile Name: ")
  (let (ini-buf
	record-beg record-end
	curr-tag curr-key curr-val
	(result-alist nil)
	result-assn)

    (save-window-excursion
      (find-file file)
      (setq ini-buf (current-buffer)))

    (save-excursion
      (set-buffer ini-buf)
      (goto-char (point-min))
      (while (re-search-forward "^\\[\\([A-z0-9\\.\\ \\\t]*\\)\\]" nil t)
	(setq curr-tag (buffer-substring (match-beginning 1) (match-end 1)))

	;; now find the end of current record
	(setq record-beg (match-end 0))
	(setq record-end (if (re-search-forward "^\\[\\([A-z0-9\\.\\ \\\t]*\\)\\]" nil t)
			     (1- (match-beginning 0))
			   (point-max)))

	;; extract all key-value pairs from this record
	(let ((record-alist nil) record-assn)
	  (save-restriction
	    (narrow-to-region record-beg record-end)
	    (goto-char (point-min))
	    (while (re-search-forward "^[ \t]+\\(\\S +\\)\\( [0-9]+\\)*[ \t]=[ \t]\\(\\S \\)" nil t)
	      (setq curr-key (buffer-substring (match-beginning 1) (match-end 1)))
	      (setq curr-val (buffer-substring (match-beginning 3) (progn (end-of-line) (point))))

	      ;; (message "For tag <%s>, found <%s> = <%s>" curr-tag curr-key curr-val)
	      ;; add this pair to record-alist
	      (cond ((setq record-assn (assoc curr-key record-alist))
		     (message "Note [%s] has multiple values for [%s]!" curr-tag curr-key)
		     (rplacd record-assn curr-val))
		    (record-alist
		     (nconc record-alist (list (cons curr-key curr-val))))
		    (t 
		     (setq record-alist (list (cons curr-key curr-val)))))))

	  ;; done with record, save record-alist in result-alist
	  (cond ((setq result-assn (assoc curr-tag result-alist))
		 (nconc result-assn (list record-alist)))
		(result-alist
		 (nconc result-alist (list (cons curr-tag (list record-alist)))))
		(t 
		 (setq result-alist (list (cons curr-tag (list record-alist)))))))
	))


    result-alist))


(provide 'eoe-ini-utils)
