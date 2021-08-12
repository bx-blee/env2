
;; 

(defun blee:bnsm:results-window-set (arg)
  (interactive)
  (setq lsip-local-run-command-window arg)
  (message "Results Window Position = %s" arg)
  )

(defun blee:bnsm:results-window-show ()
  (interactive)
  (message "Results Window Position = %s" lsip-local-run-command-window)
  )


(defun blee:bnsm:results-here ()
  (interactive)
  (switch-to-buffer "*LSIP* localhost")
  (goto-char (point-max))
  )

(defun blee:bnsm:results-split-below ()
  (interactive)
  (split-window-below)
  ;(split-window-horizontally)
  (other-window 1)
  (switch-to-buffer "*LSIP* localhost")
  (goto-char (point-max))
  )

(defun blee:bnsm:results-split-right ()
  (interactive)
  (split-window-right)
  ;(split-window-vertically)
  (other-window 1)
  (switch-to-buffer "*LSIP* localhost")
  (goto-char (point-max))
  )

(defun blee:bnsm:results-other ()
   ;;(switch-to-buffer-other-frame "*LSIP* localhost")
  (other-frame 2)
  (switch-to-buffer "*LSIP* localhost")
  )

(defun blee:bnsm:results-popup ()
   (switch-to-buffer-other-frame "*LSIP* localhost")
   (goto-char (point-max))
  )


(defun org-dblock-write:bx:dblock:bnsm:agenda-list (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(out-string)
	)
    ;;(insert "*  #Agenda:  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]]    [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]]"
    (insert "*  [[elisp:(org-cycle)][|#Marshal:|]]  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/listOfDocs/fullUsagePanel-en.org\")][BxDE Top Panel]] ||  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] || [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] |
")
    (insert "**  #See:  [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]"
	  )
  ))


(defun org-dblock-write:bx:dblock:bnsm:see-related (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(out-string)
	)
  (insert "*  [[elisp:(org-cycle)][|#Bash:|]] (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh -i currentsGetThenShow\")][Show Currents]]  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh\")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][| ]]
")
  (insert "**  #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(lsip-local-run-command-here \"echo pushd dest\")][echo pushd dir]] || [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] || [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] |"
	  )
  ))


(defun org-dblock-write:bx:dblock:bnsm:iim-see-related (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(out-string)
	)
  (insert "*  [[elisp:(org-cycle)][Bash]] :: (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) || [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] | [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] [[elisp:(org-cycle)][| ]]
")
  (insert "**  #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]"
	  )
  ))


(defun org-dblock-write:bx:dblock:bnsm:top-of-menu (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
    ;;;  [[elisp:(blee:bnsm:menu-back)][Back]]
    (insert "*  [[elisp:(org-cycle)][|#Controls:|]]  [[elisp:(blee:bnsm:menu-back)][Back]] [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]]  [[elisp:(bury-buffer)][Bury]]  [[elisp:(org-cycle)][| ]]\n"
	    )

    (insert "**  [[elisp:(blee:buf:re-major-mode)][Re-Major-Mode]] ||  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(org-dblock-bx-blank-buffer)][Blank Buf Dblocks]] || [[elisp:(bx:panel:variablesShow)][bx:panel:variablesShow]]  E|"
	    )
    ))


(defun org-dblock-write:bx:dblock:bnsm:menu-stack-OLD (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
  (insert "*  #Menu Stack: ")
  (blee:bnsm:menu-stack-insert)
    ))


(defun org-dblock-write:bx:dblock:bnsm:menu-stack (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
  ;;(insert "*  #Menu Stack: ")
  ;;(blee:bnsm:menu-stack-insert)
    ))

(defun org-dblock-write:bx:dblock:bnsm:end-of-menu (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
  (insert "*  #Controls:  [[elisp:(blee:bnsm:menu-back)][Back]]  [[elisp:(toggle-read-only)][toggle-read-only]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Glob Vis]]  [[elisp:(delete-other-windows)][1 Win]]  [[elisp:(save-buffer)][Save]]   [[elisp:(kill-buffer)][Quit]]"
)
    ))

(defun org-dblock-write:bx:dblock:bnsm:this-node (params)
  (let (
	(bx:types (or (plist-get params :types) ""))
	(let:origin (or (plist-get params :origin) ""))	
	(out-string)
	)
    (setq out-string (concat "*  This File :: *= " buffer-file-name " =*"))
    (if (not (string-equal "" let:origin))
	(setq out-string (concat out-string "\n** Origin    :: /libre/ByStar/InitialTemplates/activeDocs/common/activitiesPanels/" let:origin))
      )
    (insert out-string)
    )
  )

(defun org-dblock-write:bx:dblock:bnsm:languages (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(out-string)
	(fa-string)
	(en-string)
	)
    (setq fa-string "[[elisp:(blee:bnsm:panel-goto-langauge \"fa\")][فارسی‌:persian/farsi]]")
    (setq en-string "[[elisp:(blee:bnsm:panel-goto-langauge \"en\")][globish/english]]")
    (setq out-string (concat "*  #Languages: " en-string "  " fa-string))
    (insert out-string)
    )
  )

(defun org-dblock-write:bx:dblock:bnsm:sub-nodes-and-siblings (params)
  "NOTYET, look for menuFile in subDirs, then make them visitable"
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (let 
    	(out-string)
      (setq out-string (shell-command-to-string "find . -maxdepth 1 -type d -print  | sed -e s:^./:: | sed -e s:^\.$:: | grep -v \"^CVS$\" | xargs echo"))
      (setq out-string (concat "*  #Sub Nodes: " out-string))
      (insert out-string)
      (setq out-string (shell-command-to-string "find .. -maxdepth 1 -type d -print  | sed -e s:^../:: | sed -e s:^\..$:: | grep -v \"^CVS$\" | xargs echo"))
      (setq out-string (concat "*  #Siblings Nodes: " out-string))
      (insert out-string)
      (setq out-string 
	    (replace-regexp-in-string "\n" ""  
				      (shell-command-to-string "find . -maxdepth 1 -type f -print  | sed -e s:^./:: | sed -e s:^\.$:: | egrep -v \"^CVS$|~$|^#|^\.#\" | xargs echo")))
      (setq out-string (concat "*  #Leaves: " out-string))
      (insert out-string)
      )
    )
  )

(defun org-dblock-write:bx:dblock:bnsm:user-extenstions-insert (params)
  "NOTYET, look for menuFile in subDirs, then make them visitable"
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (let 
    	(out-string user-base-dir user-file-name)
      (setq out-string (replace-regexp-in-string "\n" "" (shell-command-to-string "pwd")))
      (setq user-base-dir (expand-file-name (replace-regexp-in-string "/libre/ByStar/InitialTemplates" "~/BUE" out-string)))
      (setq user-file-name (concat user-base-dir "/" "fullUsagePanel-en.org"))
      (if (file-exists-p user-file-name)
	  (progn
	    (insert (concat "     *Extended By: " user-file-name " :*\n"))
	    (insert-file user-file-name)
	    )
	(insert (concat "No user extention found at: " user-file-name))
	)
      )
    )
  )


(defun org-dblock-write:bx:dblock:bnsm:user-extenstions-point-to (params)
  ""
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (let 
    	(out-string user-base-dir user-file-name)
      (setq out-string (replace-regexp-in-string "\n" "" (shell-command-to-string "pwd")))
      (setq user-base-dir (expand-file-name (string-replace-regexp out-string "/libre/ByStar/InitialTemplates" "~/BUE")))
      (setq user-file-name (concat user-base-dir "/" "fullUsagePanel-en.org"))
      (if (file-exists-p user-file-name)
	  (progn
	    (insert (concat "     *Extended By: " user-file-name " :* \n"))
	    (insert (concat "*           /User:/    [[elisp:(find-file%20\"" user-file-name "\")][Pointer To User Specific Information File]]"))
	    )
	(insert (concat "No user extention found at: " user-file-name))
	)
      )
    )
  )


(defun org-dblock-write:bx:dblock:bnsm:site-extenstions-insert (params)
  "NOTYET, look for menuFile in subDirs, then make them visitable"
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (let 
    	(out-string site-base-dir site-file-name)
      (setq out-string (replace-regexp-in-string "\n" "" (shell-command-to-string "pwd")))
      (setq site-base-dir (expand-file-name (replace-regexp-in-string "/libre/ByStar/InitialTemplates" "/private/site" out-string)))      
      (setq site-file-name (concat site-base-dir "/" "fullUsagePanel-en.org"))
      (if (file-exists-p site-file-name)
	  (progn
	    (insert (concat "     *Extended By: " site-file-name " :*\n"))
	    (insert-file site-file-name)
	    )
	(insert (concat "No site extention found at: " site-file-name))
	)
      )
    )
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-bnsm"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-bnsm)
;;;#+END:
