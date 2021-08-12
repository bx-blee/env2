;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: emms -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-emms.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][VC Panel Roadmap Documentation]]
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Emms
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:emms:defaults-set -- Define 
")

(setq bap:emms:usage:enabled-p t)

(defun bap:emms:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:emms:usage:enabled-p
    (bap:emms:install/update)
    (bap:emms:config/main)
    )
  )

(defun bap:emms:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  
  (message "blee:ann -- TMP -- bap:emms:install/update")
  (use-package emms
    :ensure t
    ;;; :pin melpa-stable
    )

  ;; bystar-emms-menu.el
  (require 'bystar-emms-menu)

  )

(defun bap:emms:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)

  (require 'emms-setup)
  (emms-all)
  (emms-default-players)

  (require 'emms-volume)
  (require 'emms-browser)

  (require 'emms-score)
  (require 'emms-playlist-sort)

  ;;;
  ;;; Parameters And Locations
  ;;;

  (setq emms-playlist-buffer-name "*ByStar Music!*")
 
  (setq emms-directory "~/BUE/emacs/emms/")   

  (if (file-directory-p emms-directory)
      (progn
	(setq emms-history-file (concat emms-directory "history"))
	(setq emms-cache-file (concat emms-directory "cache"))
	(setq emms-stream-bookmarks-file (concat emms-directory "streams"))
	
	(setq emms-score-file (concat emms-directory "scores"))
	(setq emms-score-default-score 0)

	(emms-score 1)

	;; When asked for emms-play-directory, always start from this one 
	;;(setq emms-source-file-default-directory "/uniform/Audio")
	(setq emms-source-file-default-directory "~/BUE/PlayLists")

  ;;;
  ;;; Display and Information
  ;;;

  ;; Show the current track each time EMMS
  ;; starts to play a track with "NP : "
	(add-hook 'emms-player-started-hook 'emms-show)
	(setq emms-show-format "NP: %s")
 
	;;(emms-mode-line-disable)
	(emms-mode-line-enable)

	(setq emms-playing-time-display-format "")


  ;;;
  ;;; Playing Hooks / Behavior
  ;;;
	
	;;(add-hook 'emms-player-finished-hook 'emms-random) 
	(setq emms-playlist-default-major-mode 'emms-playlist-mode)
	(add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)

	(setq emms-player-next-function 'emms-next)  
	(setq emms-repeat-playlist t)                
	(setq emms-history-start-playing t)
	(setq emms-playlist-sort-function  'emms-playlist-sort-by-natural-order)



	;; Want to use alsa with mpg321 ? 
	(setq emms-player-mpg321-parameters '("-o" "alsa"))
  
	;;  emms-player-mplayer-parameters '("-ao oss" "-slave")
	(setq emms-player-mplayer-command-name "mplayer"
	      emms-player-mplayer-parameters '("-slave")
	      emms-player-mpg321-command-name "mpg123"
	      emms-player-list
	      '(emms-player-mplayer
		emms-player-mplayer-playlist
		emms-player-mpg321
		emms-player-ogg123))
	
	(bystar:emms-global:keybd)
	(bystar:emms-mode:keybd)
	)
    )
  (message "bystar:emms:defaults-set -- Done." )
  
  )


(defun bx:emms:playlist:save-to-burn ()
  ""
  (interactive)
  (emms-playlist-save 'm3u (expand-file-name "~/BUE/PlayLists/CD-Burn/current.m3u"))
  )


(defun my-mplayer-volume-change-function (amount)
  (interactive)
  (process-send-string
   emms-player-simple-process-name (format "volume %d\n" amount)))

(setq emms-volume-change-function  'my-mplayer-volume-change-function)


;;; (bystar:emms:mpdBisp0004)
(defun bystar:emms:mpdBisp0004 ()
  ""
  (interactive)

  (require 'emms-player-mpd)

  ;;;(setq emms-player-mpd-server-name "192.168.0.184")
  ;;;(setq emms-player-mpd-server-name "localhost")
  (setq emms-player-mpd-server-name "192.168.0.137")
  (setq emms-player-mpd-server-port "6600")

  (add-to-list 'emms-info-functions 'emms-info-mpd)
  (setq emms-player-list nil)
  (add-to-list 'emms-player-list 'emms-player-mpd)

  ;; For later (setq emms-player-mpd-music-directory "/var/lib/mpd/music/")

  (emms-player-mpd-connect)
)


;; (defun ddliu-emms-player-mplayer-volume-up ()
;; "Depends on mplayer’s -slave mode."
;; (interactive)
;; (process-send-string
;; emms-player-simple-process-name "volume 1\n"))

;; (defun ddliu-emms-player-mplayer-volume-down ()
;; “Depends on mplayer’s -slave mode.”
;; (interactive)
;; (process-send-string
;; emms-player-simple-process-name “volume -1\n”))

;; (define-key emms-playlist-mode-map (kbd ">") 'ddliu-emms-player-mplayer-volume-up)
;; (define-key emms-playlist-mode-map (kbd "<") 'ddliu-emms-player-mplayer-volume-down)

(defun my-emms-playlist-total-time-below-point ()
"Calculates the total time taken for all the tracks currently in playlist and below point"
(interactive)
(let ((move-forward t)
      (total-playlist-time 0))
  (save-excursion 		
    (while move-forward
      (setq total-playlist-time (+ total-playlist-time (or (emms-track-get (emms-playlist-track-at (point)) 'info-playing-time) 0)))
      (forward-line 1)
	(setq move-forward (next-single-property-change (point) 'emms-track))))
(setq total-hour-only (/ total-playlist-time 3600)
	total-minutes-only (/ (% total-playlist-time 3600) 60)
	total-seconds-only (% total-playlist-time 60))
(message "Total time is %dh:%dm:%ds" total-hour-only total-minutes-only total-seconds-only)))


(defun my-emms-play-apache-mp3-folder (folder-url)
  "Plays mp3 files found in Apache directory listing."
  (interactive "sURL to Apache directory listing: ")
  (let ((tmp-file "~/.my-emms-play-apache-mp3-folder-tmp"))
    (when (file-exists-p tmp-file)
      (delete-file tmp-file))
    (url-copy-file folder-url "~/.my-emms-play-apache-mp3-folder-tmp" t)
    (while (not (file-exists-p tmp-file))
      (sleep-for 0 500)
      (message "Looking for file..."))
    (message "Listing downloaded. Parsing...")
    (with-temp-buffer
      (insert-file-contents "~/.my-emms-play-apache-mp3-folder-tmp")
      (goto-char (point-min))
      (while (search-forward-regexp "a href=\"\\(.+\.mp3\\)\"" nil t)
        (emms-add-url (concat folder-url (match-string 1))))
      (message "Done."))))


;; #!/bin/bash
;; # Modified: Fang lungang 03/13/2010 21:55>
;; for afile in "$@"; do
;;     path=$(dirname "$afile")
;;     convert -resize 60x60 "$afile" "$path/cover_small.jpg"
;;     convert -resize 120x120 "$afile" "$path/cover_med.jpg"
;;     # large cover not used
;; done

;; ;; emms-stream
;; (("NDR Info" "http://ndr.ic.llnwd.net/stream/ndr_ndrinfo_hi_mp3" 1 url)
;;  ("NDR Kultur" "http://ndr.ic.llnwd.net/stream/ndr_ndrkultur_hi_mp3" 1 url)
;;  ("BBC Radio 1" "mms://wmlive.bbc.net.uk/wms/bbc_ami/radio1/radio1_bb_live_int_eq1_sl0?BBC-UID=e44a970b22ffbda06a4e058b91802eba1c90682640d091dff269e685b0547800&SSO2-UID=" 1 url)
;;  ("BBC Radio 2" "mms://wmlive.bbc.net.uk/wms/bbc_ami/radio2/radio2_bb_live_int_eq1_sl0?BBC-UID=e44a970b22ffbda06a4e058b91802eba1c90682640d091dff269e685b0547800&SSO2-UID=" 1 url)
;;  ("BBC Radio 3" "mms://wmlive.bbc.net.uk/wms/bbc_ami/radio3/radio3_bb_live_int_eq1_sl0?BBC-UID=e44a970b22ffbda06a4e058b91802eba1c90682640d091dff269e685b0547800&SSO2-UID=" 1 url)
;;  ("BBC Radio 4" "mms://wmlive.bbc.net.uk/wms/bbc_ami/radio4/radio4_bb_live_int_eq1_sl0?BBC-UID=e44a970b22ffbda06a4e058b91802eba1c90682640d091dff269e685b0547800&SSO2-UID=" 1 url)
;;  ("BBC Radio 5" "mms://wmlive.bbc.net.uk/wms/bbc_ami/radio5/radio5_bb_live_int_eq1_sl0?BBC-UID=e44a970b22ffbda06a4e058b91802eba1c90682640d091dff269e685b0547800&SSO2-UID=" 1 url)
;;  ("Nectarine" "http://calcipher.verbrennung.org:8000/nectarine.ogg.m3u" 1 url))

;; (require 'emms-playlist-mode)
;; (require 'cl)

(defun emms-playlist-make-mix (dir)
  "Eases mix creation by doing the symlinking for me."
  (interactive "FWhere should I make the mix? ")
  (save-excursion
    (unless (progn (get-buffer-create emms-playlist-buffer)
                   (set-buffer emms-playlist-buffer)
                   (> (count-lines (point-min) (point-max)) 0))
      (error "There is no playlist"))
    (if (file-exists-p (if (string-match "/$" dir)
                           (replace-in-string dir "/$" "")
                         dir))
        (if (not (file-directory-p dir))
            (error "File %s exists and is not a directory" dir)
          (unless (y-or-n-p "Directory exists. Continue? ")
            (error "Not continuing")))
      (make-directory dir))
    (set-buffer emms-playlist-buffer)
    (emms-playlist-current-select-first)
    (let ((counter 1)
          (lines (count-lines (point-min) (point-max))))
      (unless (string-match "/$" dir)
        (setq dir (concat dir "/")))
      (while (<= counter lines)
        (let ((track (cdr (third (emms-playlist-current-selected-track))))
              (symlinkname (replace-in-string
                            (cdr (third
                                  (emms-playlist-current-selected-track)))
                            "/home/user/media/music/.*/[0-9][0-9]-"
                            (concat (if (< counter 10) "0")
                                    (number-to-string counter)
                                    "-"))))
          (make-symbolic-link track (concat dir symlinkname) t)
          (emms-playlist-current-select-next)
          (setq counter (1+ counter)))))))



(defun emms-iran-singers-list ()
  "Eases mix creation by doing the symlinking for me."
  (interactive)

  (keep-lines 
   (srx-or 
    "Mixed/Alireza eftekhari"
    "Mixed/vigen"
    "Mixed/Mahasti"
    "Mixed/Faramarz Assef"
    "Mixed/DELKASH"
    "Mixed/Emad Ram"
    "Mixed/Farhad"
    "Mixed/Fattaneh"
    "Mixed/Googoosh"
    "Mixed/Hesamedin Seraj"
    "Mixed/Homira"
    "Mixed/Javad Maaroufi"
    "Mixed/Koroosh Yaghmaei"
    "Mixed/Marzieh"
    "Mixed/Ramesh"
    "Mixed/Shakila"
    "Mixed/Sima Bina"
    "Mixed/Soli"
    "Mixed/Ziba Shirazi"
    "Mixed/haydeh"
    "Mixed/mohsen namjoo"
    )))

(defun emms-playlist-sort-by-score ()
  "Sort emms playlist by score, decreasingly."
  (interactive)
  (emms-playlist-sort
   (lambda (a b)
     (> (emms-score-get-score (emms-track-get a 'name))
	(emms-score-get-score (emms-track-get b 'name))))))



(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-emms)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

