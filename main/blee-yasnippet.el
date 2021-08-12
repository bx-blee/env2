;;; -*- Mode: Emacs-Lisp -*-

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "ByStar YASNIPPET LOADING"
(lambda () "*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message ByStar YASNIPPET LOADING [[elisp:(org-cycle)][| ]]
")

(message "ByStar YASNIPPET LOADING")
;;;#+END:

;;
;;  TOP LEVEL Entry Point: (bystar:yasnippet:all-defaults-set)
;;
;; bystar:yasnippet 

;;;------------------------------------------------
;;;  Yasnippet 
;;;------------------------------------------------

;; (blee:yasnippet:all-defaults-set)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (blee:yasnippet:all-defaults-set ) [[elisp:(org-cycle)][| ]]
")

(defun blee:yasnippet:all-defaults-set ()
  ""
  (interactive)

  ;;;
  ;;; Make sure needed packages have been installed
  ;;;

  (bx:package:install-if-needed 'yasnippet)  
  (bx:package:install-if-needed 'yasnippet-snippets)


  (require 'yasnippet) ;; not yasnippet-bundle

  (add-to-list 'auto-mode-alist '("\\.yas$" . snippet-mode))

  ;;(setq yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-20140314.255/snippets")

  ;;;
  ;;; NB: This is problematic -- as of 0.13 yas-installed-snippets-dir is obsolete?
  ;;;
  ;;;(add-to-list 'yas-snippet-dirs yas-installed-snippets-dir)

  ;;; Set Bx Snippets Load Path
  (let ((full-dir-name))

    ;;; BxDE Scope
    ;;(setq full-dir-name (expand-file-name "~/lisp/snippets"))
    (setq full-dir-name (expand-file-name "/bisos/blee/env/snippets"))
    (when (file-directory-p full-dir-name)
      (add-to-list 'yas-snippet-dirs full-dir-name)
      )

    ;;; BxSite Scope
    (setq full-dir-name (expand-file-name "/private/site/snippets"))
    (when (file-directory-p full-dir-name)
      (add-to-list 'yas-snippet-dirs full-dir-name)
      )

    ;;; BxUserEnv Scope
    (setq full-dir-name (expand-file-name "~/BUE/elisp/snippets"))
    (when (file-directory-p full-dir-name)
      (add-to-list 'yas-snippet-dirs full-dir-name)
      )
    )



  ;; Stoped Working after 201401 update
  (yas-global-mode 1)

  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  ;; (require 'yasnippet-bundle)

  ;; (setq yas-snippet-dirs
  ;; 	'("~/.emacs.d/snippets"
  ;; 	  "~/lib/elisp/emacs-for-yasnippet/snippets/django"
  ;; 	  "~/.emacs.d/plugins/yasnippet/snippets")

  (message "blee:yasnippet:defaults-set -- Done." )
  )

(blee:yasnippet:all-defaults-set)

;; Completing point by some yasnippet key
(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (yas-ido-expand ) [[elisp:(org-cycle)][| ]]
")

(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
    (let ((original-point (point)))
      (while (and
              (not (= (point) (point-min) ))
              (not
               (string-match "[[:space:]\n]" (char-to-string (char-before)))))
        (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
        (yas-expand)))))


;;; (bx:yas:shCommand nil)
;;; (bx:yas:shCommand "echo Hello")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:yas:shCommand ) [[elisp:(org-cycle)][| ]]
")

(defun bx:yas:shCommand ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (subjectStr)
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (insert (format "[[elisp:(lsip-local-run-command \"%s\")][%s]]"
		    subjectStr subjectStr))
    ))  

;;; (bx:yas:shCommandSelectedSubject)
;;; (bx:yas:shCommandSelectedSubject)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:yas:shCommandSelectedSubject ) [[elisp:(org-cycle)][| ]]
")

(defun bx:yas:shCommandSelectedSubject ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (subjectStr)
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (insert (format "[[elisp:(lsip-local-run-command (concat \"%s \" bufloc:selectedSubject))][%s @selectedSubject@]]"
		    subjectStr subjectStr))
    ))  


;;; (bx:org:link:elisp)
(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (bx:org:link:elisp ) [[elisp:(org-cycle)][| ]]
")

(defun bx:org:link:elisp ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (subjectStr)
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (insert (format "[[elisp:%s][%s]]"
		    subjectStr subjectStr))
    ))  


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (bx:org:link:elispFindFile) [[elisp:(org-cycle)][| ]]
")

(defun bx:org:link:elispFindFile ()
  "Converts the region into a BxPanelCommand"
  (interactive)

  (let (subjectStr)
    (if (region-active-p)
	(progn
	  ;;(message (format "%s %s" (region-beginning) (region-end)))
	  (setq subjectStr (buffer-substring (region-beginning) (region-end)))
	  )
      (setq subjectStr (read-from-minibuffer "Input: "))
      )
    (if (region-active-p)
	(delete-region (region-beginning) (region-end))
      )
    
    (insert (format "[[elisp:(find-file \"%s\")][%s]]"
		    subjectStr subjectStr))
    ))  



(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (yas-redo-selected-text-bx ) [[elisp:(org-cycle)][| ]]
")

(defun yas-redo-selected-text-bx ()
  "Re-do yas's deletion of the selected region.
This is intended to be invoked at the beginning of every
type: command file. Based on this all commands that 
intend to operate based on a region become directly invokable through yas."
  (let ((beg (point)))
    (if yas-selected-text
	(progn
	  (transient-mark-mode 1)
	  (insert yas-selected-text)
	  (push-mark beg)	  
	  (setq deactivate-mark nil)
	  ))))
    


(lambda () "
*  [[elisp:(org-cycle)][| ]]  defun         :: (Dev-yas-redo-selected-text-bx ) [[elisp:(org-cycle)][| ]]
")

(defun Dev-yas-redo-selected-text-bx ()
  ""
  (interactive)
  
  (let ((beg (point)))
    ;;;(message "1 -- region acive= %s -- beg=%s -- point=%s" (region-active-p) beg (point))    
    (if yas-selected-text
	(progn
	  (transient-mark-mode 1)
	  ;;(set-mark-command nil)
	  (insert yas-selected-text)
	  ;;(push-mark)
	  ;;(setq mark-active t)
	  (set-mark beg)
	  (setq deactivate-mark nil)
	  ;;;(message "2 - region acive= %s -- beg=%s -- point=%s" (region-active-p) beg (point))
	  ))))
    

;;; (define-key yas-minor-mode-map (kbd "<C-tab>")     'yas-ido-expand)

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-yasnippet"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-yasnippet)
;;;#+END:

;; Local Variables:
;; no-byte-compile: t
;; End:
