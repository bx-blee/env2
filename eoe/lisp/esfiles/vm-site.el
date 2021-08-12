;;; vm-site.el

;;; Starting Up
(setq vm-startup-with-summary t)

;;; Frame Behavior
(if (null eoe-use-toolbars)
    (setq vm-use-toolbar nil))
(setq vm-toolbar-orientation 'top)
(setq vm-frame-per-folder nil)
(setq vm-frame-per-composition nil)
(setq vm-frame-per-edit nil)

;;; Selecting Messages
(setq vm-skip-deleted-messages t)
(setq vm-skip-read-messages nil)
(setq vm-circular-folders nil)
(setq vm-search-using-regexps nil)

;;; (3) Reading Messages

;;; Specify where to get mail. 
(setq vm-spool-files
      `(;; local machine
	("~/INBOX" ,(or (getenv "MAIL") (concat "/var/mail/" (user-login-name))) "~/INBOX.crash") ; solaris
	("~/INBOX" ,(or (getenv "MAIL") (concat "/var/spool/mail/" (user-login-name))) "~/INBOX.crash") ; linux
	;; using POP
	("~/INBOX" ,(format "%s:110:pass:%s:*" eoe-pop-server (user-login-name)) "~/INBOX.crash")
	))

;;; (3.1) Previewing
(setq vm-preview-lines nil)		; Display the entire message
(setq vm-invisible-header-regexp nil)	; Hide everything other than visible-headers
(setq vm-visible-headers (append vm-visible-headers
				 '("Content-Transfer-Encoding:"
				   "Content-Type:"
				   "Reply-to:"
				   "Mime-Version:"
				   "Message-Id:"
				   )))

;; Non-nil value means ignore the version number in the MIME-Version
;; header.  VM only knows how to decode and display MIME version 1.0
;; messages.  Some systems scramble the MIME-Version header, causing
;; VM to believe that it cannot display a message that it actually can
;; display.  You can set vm-mime-ignore-mime-version non-nil if you
;; use such systems.
(setq vm-mime-ignore-mime-version t)

;;; (3.2) Paging
(setq vm-auto-next-message t)
(setq vm-honor-page-delimiters t)

;;; MIME Displaying

;; Non-nil value causes MIME decoding to occur automatically when a
;; message containing MIME objects is exposed.  A nil value means that
;; you will have to run the `vm-decode-mime-message'command (normally
;; bound to `D') manually to decode and display MIME objects.
(setq vm-auto-decode-mime-messages t)

;; List of MIME content types that should be displayed immediately
;; after decoding.  Other types will be displayed as a button that the
;; user must activate to display the object.
(setq vm-auto-displayed-mime-content-types '(
					     "text/plain"
					     "multipart"
					     ))

;; List of MIME content types that should be displayed internally if
;; Emacs is capable of doing so.  A value of t means that VM should
;; always display an object internally if possible.  A nil value means
;; never display MIME objects internally, which means VM have to run
;; an external viewer to display MIME objects.
(setq vm-mime-internal-content-types '(
				       "text/plain"
				       "image/jpeg"
				       "image/gif"
				       ))

;; Alist of MIME content types and the external programs used to
;; display them. If VM cannot display a type internally or has been
;; instructed not to (see the documentation for the
;; vm-mime-internal-content-types variable) it will try to launch an
;; external program to display that type. 
;; 
;; The alist format is ( (TYPE ;;; PROGRAM ARG ARG ... ) ... ) 
;; ...
(setq vm-mime-external-content-types-alist
      (append `(
		("application/postscript" 	"pageview")
		("image/gif"	                "xv")
		("image/jpeg"                   "xv")
		("text/html" 	                ,(if (eq system-type 'windows-nt)
						     "netscape"
						   "netscape-current"))
		("video/mpeg" 	                "mpeg_play")
		("video" 	                "xanim")
		)
	      vm-mime-external-content-types-alist
	      ))

;;; (4) Mail Sending Configuration
(setq mail-archive-file-name (expand-file-name "~/VM/outgoing"))
(let (ufn)
  (setq ufn (user-full-name))
  ;; maybe mangle user-full-name
  (if (or (null ufn)
	  (string-equal ufn "")
	  (string-equal ufn "unknown"))
      (setq ufn nil))

  (setq vm-mail-header-from
	(cond (ufn
	       (format "%s <%s@%s>" ufn (user-login-name) *eoe-site-name*))
	      (t
	       (format "%s@%s" (user-login-name) *eoe-site-name*)))))

;;; (4.1) Replying
(setq vm-reply-subject-prefix "Re: ")
(setq vm-reply-ignored-addresses (list (format "%s@%s" (user-login-name) *eoe-site-name*)))

;;; (4.2) Forwarding
(setq vm-forwarding-subject-format "[Fwd: %s]")

;;; (5) Saving Messages
(setq vm-confirm-new-folders t)
(setq vm-folder-directory (expand-file-name "~/VM/"))
(setq vm-delete-after-saving t)

;;; (6) Deleting Messages
(setq vm-move-after-deleting t)
(setq vm-move-after-undeleting t)

;;; (7) Editing Messages (N.A.)

;;; (8) Message Marks (N.A.)
(setq vm-default-folder-type 'From_-with-Content-Length)
(setq vm-trust-From_-with-Content-Length t)
;; The following line let's you deal with bad folders temporarily
;;(setq vm-trust-From_-with-Content-Length nil)

(setq vm-check-folder-types t)
(setq vm-convert-folder-types t)

;;; (9) Undoing (N.A.)

;;; (10) Grouping

;;; (11) Reading Digests (N.A.)

;;; (12) Summaries
;(setq vm-summary-format ... "%n %*%a %-17.17F %-3.3m %2d %4l/%-5c %I\"%s\"\n") ; original 
(setq vm-summary-format (if eoe-uses-wide-screen
			    "%n %*%a %-17.17F -> %-17.17T %-3.3m %2d %4l/%-5c %I\"%s\"\n" ; add `recipient info'
			  "%n %*%a %-17.17F %-3.3m %2d %-5c %I\"%s\"\n")) ; drop line count

(setq vm-follow-summary-cursor t)

;;; (13) Miscellaneous
(setq vm-delete-empty-folders nil)
(setq vm-highlighted-header-regexp "From:\\|Subject:")
(cond ((eq *eoe-emacs-type* '19x)
       (require 'highlight-headers)
       (setq highlight-headers-regexp "From:\\|Subject:")
       (setq vm-use-lucid-highlighting t))
      (t
       nil))

(if (eq *eoe-emacs-type* '19x)
		
    ;; hack hack hack
    ;; vm assumes you need 16-bit bitplanes to display nifty icons for various
    ;; mime types (e.g., mona lisa for gifs, gear for application/xxx)
    ;; seems actually to work on 8bit displays too, so enable it
    (cond ((or (and (= emacs-major-version 19)
		    (= emacs-minor-version 15))
	       (y-or-n-p "vm-site.el: redefine `vm-mime-set-extent-glyph-for-layout'? "))
	   (eval-after-load "vm-site"
			    '(progn
			       (require 'vm-mime)
			       (defun vm-mime-set-extent-glyph-for-layout (e layout)
				 (if (and (vm-xemacs-p) (fboundp 'make-glyph)
					  (or t	; hack hack hack
					      (eq (device-type) 'x) (> (device-bitplanes) 15)))
				     (let ((type (car (vm-mm-layout-type layout)))
					   (dir vm-image-directory)
					   glyph)
				       (setq glyph
					     (cond ((vm-mime-types-match "text" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "document.xpm" dir))))
						   ((vm-mime-types-match "image" type)
						    (make-glyph (vector
								 'gif ':file
								 (expand-file-name "mona_stamp.gif" dir))))
						   ((vm-mime-types-match "audio" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "audio_stamp.xpm" dir))))
						   ((vm-mime-types-match "video" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "film.xpm" dir))))
						   ((vm-mime-types-match "message" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "message.xpm" dir))))
						   ((vm-mime-types-match "application" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "gear.xpm" dir))))
						   ((vm-mime-types-match "multipart" type)
						    (make-glyph (vector
								 'xpm ':file
								 (expand-file-name "stuffed_box.xpm" dir))))
						   (t nil)))
				       (and glyph (set-extent-begin-glyph e glyph))))))))
	  )) 
