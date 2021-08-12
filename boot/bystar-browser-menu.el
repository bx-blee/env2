;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;;
;;;

;;; 
;;;

(put 'bx:browser:base-par 'primary "localhost")
(put 'bx:browser:base-par 'video-server "192.168.0.181")
(put 'bx:browser:base-par 'audio-server "192.168.0.186")

(defun bx:browser:visit-url-at-remote (remote)
  (interactive (list 
		(completing-read "Remote: "
				 (list "video-server" "audio-server")
				 nil 
				 nil
				 "video-server")))

  (let (
	(remote-addr (get 'bx:browser:base-par (intern remote)))
	(thisUrlAtPoint (ffap-url-at-point))
	)
    (let (
	  (commandLine (concat 
		      "env DISPLAY=:0.0 firefox -a firefox  -remote 'openurl("
		      thisUrlAtPoint
		      ")'"))
	  )
      (save-window-excursion 
	(lsip-run-command 
	 commandLine
	 remote-addr
	 "lsipusr"
	 "nopasswd")
	)
      )
    )
  )

;;;
;;; For Key Bindings
;;;
(defun bx:browser:visit-url-at-video-server ()
  (interactive)
  (bx:browser:visit-url-at-remote "video-server")
  )

(defun bx:browser:visit-url-at-audio-server ()
  (interactive)
  (bx:browser:visit-url-at-remote "audio-server")
  )


;;;
;;; Obsoleted by bx:browser:visit-url-at-remote
;;;
(defun bue:visit-url-at-remote-firefoxObsoleted ()
  (interactive)
  (setq thisUrlAtPoint (ffap-url-at-point))
  ;; NOTYET, check for thisUrlAtPoint and parameetrize remote firefox
  (setq commandLine (concat 
		     "env DISPLAY=:0.0 firefox -a firefox  -remote 'openurl("
		     thisUrlAtPoint
		     ")'"))

  (lsip-run-command 
   commandLine
   "192.168.0.181"
   "lsipusr"
   "nopasswd")
  )


;;; (blee:blee:menu)
(defun bystar:browser:menu:define ()
  (easy-menu-define 
    bystar:browser:menu:definition 
    nil 
    "Global ByStar Send Mail Menu"
    '("ByStar Browsers Interface"
      "---"
      ["Current Parameters and Status" (bystar:browser:params:help) t]  
      "---"
      ["Send At-Point (url) To Primary Server" (bx:browser:visit-url-at-remote "primary") t]
      ["Send At-Point To Video Server" (bx:browser:visit-url-at-remote "video-server") t]
      ["Send At-Point To Audio Server" (bx:browser:visit-url-at-remote "audio-server") t]
      "---"
      ["Gnus-Browser Interface Test" (message "NOTYET") t]
      "---"
      ("From Browser To Emacs"
       ["Emacs Server Start" (server-start) t]
       "---"
       ["Capture mailto: in bbdb" (murl-bbdbCapture) t]
       )
      "---"
      "---"
      ("Browser Interface Help"
       ["Kbd: F1 Key Bindings" bystar:browser:send:menu:global-kbd-help t]
       "---"
       ["RevDoc: Blee Browser Configuration" blee:blee:doc:howto:browser:config-help t]
       ["RevDoc: Blee Desktop Configuration" blee:blee:doc:howto:desktop:config-help t]
       )
      ))
  )

;; (bystar:browser:params:help)
(defun bystar:browser:params:help ()
  ""
  (interactive)
  (bx:symbols-list-value-in-help (list
				  'bx:browser:base-par)
				 )
  )

(provide 'bystar-browser-menu)
