;
; bbdb-append  "+ b srchString" does not work unless this patch is in place
;
; Came from the net with no author name mentioned 
; 05.03.2003, XSteve, with-output-to-temp-buffer
; 
; MB: Thu Apr 15 09:47:35 PDT 2010
;

(defun bbdb-display-records-1 (records &optional append layout)
  (setq append (or append (bbdb-append-records-p)))
  (if (or (null records)
          (consp (car records)))
      nil

    ;; add layout and a marker to the local list of records
    (setq layout (or layout bbdb-display-layout))
    (setq records (mapcar (lambda (x)
                            (list x layout (make-marker)))
                          records)))

  (let ((b (current-buffer))
        (temp-buffer-setup-hook nil)
        (temp-buffer-show-hook nil)
        (xbbdb-records (copy-alist bbdb-records))
        (first (car (car records))))
    ;;(message "xbbdb-records: %S" xbbdb-records)
    ;;(message "bbdb-records: %S" bbdb-records)

    ;;05.03.2003, XSteve, with-output-to-temp-buffer seems to
    ;; destroy the binding of bbdb-records on windows emacs, cvs version...
    ;; so use xbbdb-records - this works
    (with-output-to-temp-buffer bbdb-buffer-name
      (set-buffer bbdb-buffer-name)
      ;;(message "xbbdb-records: %S" xbbdb-records)
      ;;(message "bbdb-records: %S" bbdb-records)
      
      ;; If append is unset, clear the buffer.
      (unless append
        (bbdb-undisplay-records))

      ;; If we're appending these records to the ones already displayed,
      ;; then first remove any duplicates, and then sort them.
      (if append
          (let ((rest records))
            (while rest
              (if (assq (car (car rest)) xbbdb-records)
                  (setq records (delq (car rest) records)))
              (setq rest (cdr rest)))
            (setq records (append xbbdb-records records))
            (setq records
                  (sort records
                        (lambda (x y) (bbdb-record-lessp (car x) (car y)))))))
      (make-local-variable 'mode-line-buffer-identification)
      (make-local-variable 'mode-line-modified)
      (set (make-local-variable 'bbdb-showing-changed-ones) nil)
      (let ((done nil)
            (rest records)
            (changed (bbdb-changed-records)))
        (while (and rest (not done))
          (setq done (memq (car (car rest)) changed)
                rest (cdr rest)))
        (setq bbdb-showing-changed-ones done))
      (bbdb-frob-mode-line (length records))
      (and (not bbdb-gag-messages)
           (not bbdb-silent-running)
           (message "Formatting..."))
      (bbdb-mode)
      ;; this in in the *BBDB* buffer, remember, not the .bbdb buffer.
      (set (make-local-variable 'bbdb-records) nil)
      (setq bbdb-records records)
      (let ((buffer-read-only nil)
            prs)
        (bbdb-debug (setq prs (bbdb-records)))
        (setq truncate-lines t)
        (while records
          (bbdb-debug (if (not (memq (car (car records)) prs))
                          (error "record doubleplus unpresent!")))
          (set-marker (nth 2 (car records)) (point))
          (bbdb-format-record (nth 0 (car records))
                              (nth 1 (car records)))
          (setq records (cdr records))))
      (and (not bbdb-gag-messages)
           (not bbdb-silent-running)
           (message "Formatting...done."))
      )
    (set-buffer bbdb-buffer-name)
    (if (and append first)
        (let ((cons (assq first bbdb-records))
              (window (get-buffer-window (current-buffer))))
          (if window (set-window-start window (nth 2 cons)))))
    (bbdbq)
    ;; this doesn't really belong here, but it's convenient ... and when
    ;; using electric display it would not be called otherwise.
    (save-excursion (run-hooks 'bbdb-list-hook))
    (if bbdb-gui (bbdb-fontify-buffer))
    (set-buffer-modified-p nil)
    (setq buffer-read-only t)
    (set-buffer b)))

