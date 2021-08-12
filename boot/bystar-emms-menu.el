;;;
;;;

(require 'easymenu)

;;;
;;; Global Music Menu
;;;

;; (bystar:emms-global:menu)
(defun bystar:emms-global:menu ()
  (easy-menu-define 
    emms-global-menu 
    nil
    "Global EMMS Menu"
    '("Music"
      ["Pause" emms-pause t]
      ["Volume Down" emms-volume-mode-minus t]
      ["Volume Up" emms-volume-mode-plus t]
      "---"
      ["Score Down" emms-score-down-playing t]
      ["Score Up" emms-score-up-playing t]
      ["Save Scores" emms-score-save-hash t]
      "---"
      ["Next" emms-next t]
      ["Previous" emms-previous t]
      ["Random" emms-random t]
      "---"
      ("Build A Playlist From Dir"
       ["Clear Current Playlist" emms-playlist-current-clear t]
       ["Add Directory Tree" emms-add-directory-tree-bx t]
       ["Add Directory" emms-add-directory-bx t]
       ["Add File" emms-add-file-bx t]
       ["Save Playlist" emms-playlist-save t]
       )
      "---"
      ["Play Playlist (Start)" emms-play-playlist-bx t]
      ["EMMS Buffer" emms t]
      "---"
      ("ByStar Music Help/Documentation"
       ["Help: Music" bystar:music:doc:howto:all-help t]
       )
      ))
  )


;; (bystar:emms-global:keybd)
(defun bystar:emms-global:keybd ()
  ""
  ;;(interactive)
  (define-key global-map [(pause)] nil)

  ;; pause  -- emms
  (define-key global-map [(pause) (pause)] 'emms-pause)
  (define-key global-map [(pause) (e)] 'emms)
  (define-key global-map [(pause) (i)] 'emms-show)
  (define-key global-map [(pause) (f)] 'emms-play-file)
  (define-key global-map [(pause) (l)] 'emms-play-playlist)
  (define-key global-map [(pause) (s)] 'emms-start)
  (define-key global-map [(pause) (p)] 'emms-pause)
  (define-key global-map [(pause) (r)] 'emms-toggle-repeat-track)

  (define-key global-map [(pause) (up)] 'emms-score-up-playing)
  (define-key global-map [(pause) (down)] 'emms-score-down-playing)
  (define-key global-map [(pause) (left)] 'emms-previous)
  (define-key global-map [(pause) (right)] 'emms-next)


  ;;(define-key global-map [(shift pause)] 'emms)
  ;;(define-key global-map [(control pause)] 'emms-show)
  ;;(define-key global-map [(shift control pause)] 'emms-score-toggle)

  ;; Global keys
  (global-set-key (kbd "C-c e e") 'emms)
  (global-set-key (kbd "C-c e f") 'emms-play-file)
  (global-set-key (kbd "C-c e l") 'emms-play-playlist)
  (global-set-key (kbd "C-c e s") 'emms-start)
  (global-set-key (kbd "C-c e p") 'emms-pause)
  (global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)

  (global-set-key (kbd "C-c e <up>") 'emms-score-up-playing)
  (global-set-key (kbd "C-c e <down>") 'emms-score-down-playing)
  (global-set-key (kbd "C-c e <left>") 'emms-previous)
  (global-set-key (kbd "C-c e <right>") 'emms-next)
)


;; (bystar:emms-mode:keybd)
(defun bystar:emms-mode:keybd ()
  ""
  ;; emms-playlist-mode keys
  (define-key emms-playlist-mode-map "g" 'emms-score-up-file-on-line) ;; g for good
  (define-key emms-playlist-mode-map "u" 'emms-score-down-file-on-line) ;; u for ugly
  (define-key emms-playlist-mode-map "i" 'emms-score-show-file-on-line) ;; i for info
  (define-key emms-playlist-mode-map "h" 'emms-score-save-hash) ;; h for hoard
)


;;;
;;;
;;;

;; (bystar:emms-mode:menu)
(defun bystar:emms-mode:menu ()
  (easy-menu-define 
    emms-mode-menu 
    emms-playlist-mode-map
    "Local EMMS Menu"
    '("EMMS"
      ["Pause" emms-pause t]
      ["Volume Down" emms-volume-mode-minus t]
      ["Volume Up" emms-volume-mode-plus t]
      ["Center Around Playing" emms-volume-mode-plus t]
      "---"
      ("Build / Edit Playlist"
       ["Create New Playlist Buffer" emms-playlist-new t]
       ["Clear Current Playlist" emms-playlist-current-clear t]
       ["Kill Current Playlist Buffer" emms-playlist-current-kill t]
       ["Add Directory Tree" emms-add-directory-tree-bx t]
       ["Add Directory" emms-add-directory-bx t]
       ["Add File" emms-add-file-bx t]
       ["Save Playlist" emms-playlist-save t]
       )
      "---"
      ("Lyrics"
       ["NOTYET" ding t]
       )
      "---"
      ("Export Music"
       ["To a CD -- NOTYET" ding t]
       ["To a Directory -- NOTYET" ding t]
       ["Sync Repositories -- NOTYET" ding t]
       )
      "---"
      ("Browsing"
       ["NOTYET" emms-playlist-current-clear t]
       )
      "---"
      ("Current Line"
       ["Score Down" emms-score-down-file-on-line t]
       ["Score Up" emms-score-up-file-on-line t]
       ["Save Scores" emms-score-save-hash t]
       ["Current Line Info" emms-score-show-file-on-line t]
       )
      "---"
      ("Playing"
       ["Next" emms-next t]
       ["Previous" emms-previous t]
       ["Random" emms-random t]
       ["Score Down" emms-score-down-playing t]
       ["Score Up" emms-score-up-playing t]
       ["Save Scores" emms-score-save-hash t]
       ["Playing Info" emms-score-show-playing t]
       )
      "---"
      ("Sort Playlist"
       ["Shuffle" emms-shuffle t]
       ["Sort By Score" emms-playlist-sort-by-score t]
       ["Sort By Name" emms-playlist-sort-by-name t]
       ["Sort By Artist" emms-playlist-sort-by-info-artist t]
       ["Sort By Title" emms-playlist-sort-by-info-title t]
       ["Sort By Natural Order" emms-playlist-sort-by-natural-order t]
       )
      ("Persistance / Cache"
       ["Sync Cache" emms-cache-sync t]
       )
      "---"
      ("Customize"
       ["NOTYET" ding t]
       )
      "---"
      ["Save" emms-playlist-sort-by-score t]
      ["Quit" emms-playlist-mode-bury-buffer t]
      ))
  )


;; 
(defun emms-add-directory-tree-bx ()
  (interactive)
  ;;(let ((orig-default-dir emms-source-file-default-directory))
  (let ((emms-source-file-default-directory "/uniform/Audio"))
    ;;(setq emms-source-file-default-directory "/uniform/Audio")
    (call-interactively 'emms-add-directory-tree)
    ;;(setq emms-source-file-default-directory orig-default-dir)
    ))

(defun emms-add-directory-bx ()
  (interactive)
  (let ((emms-source-file-default-directory "/uniform/Audio"))
    (call-interactively 'emms-add-directory)
    ))

(defun emms-add-file-bx ()
  (interactive)
  (let ((emms-source-file-default-directory "/uniform/Audio"))
    (call-interactively 'emms-add-file)
    ))

      ["Play Playlist (Start)" emms-play-playlist t]

(defun emms-play-playlist-bx ()
  (interactive)
  (call-interactively 'emms-play-playlist)
  (emms)
  (switch-to-buffer  emms-playlist-buffer-name)
  (emms-playlist-mode-center-current)
  )


;;; (emms-play-playlist-default-bx)
(defun emms-play-playlist-default-bx ()
  (interactive)
  (let (default-playlist-file)
    (when (not (string-equal opRunDistFamily "MAEMO"))
      (setq default-playlist-file "~/BUE/PlayLists/Defaults/uniform.emms")
      )
    (when (string-equal opRunDistFamily "MAEMO")
      (setq default-playlist-file "~/BUE/PlayLists/Defaults/n810.emms")
      )

    (if (file-exists-p default-playlist-file)
	(progn
	  (emms-play-playlist default-playlist-file)
	  (emms)
	  (switch-to-buffer  emms-playlist-buffer-name)
	  (emms-playlist-mode-center-current)
	  )
      (message (concat "Missing File: " default-playlist-file))
      )
    )
  )
    

;; You can also add menus and menu items to the global MenuBar. Here
;; is an example that adds an entry to the Tools menu. Watch out,
;; the name of the menu where you want to add the item (the PATH
;; parameter) is case sensitive.

;;     (require 'easymenu)
;;     (easy-menu-add-item nil '("tools") ["IRC" erc-select t])

;; One way to determine PATH is to use C-h C-k and click on a menu
;; item close to where you want your entry to appear. The Help
;; buffer then says something like:

;;     <menu-bar> <tools> <games> <tetris> runs the command tetris
;;        which is an interactive autoloaded Lisp function in `tetris'.



(provide 'bystar-emms-menu)

;;;
;;; JUNK YARD
;;;

;; ;;; (emms-menu-install)

;; (defun emms-menu-install ()
;;   "Install `EMMS' menu."
;;   (interactive)

;;      ;; Make a menu keymap (with a prompt string)
;;      ;; and make it the menu bar item's definition.
;;      (define-key global-map [menu-bar emms]
;;        (cons "EMMS" (make-sparse-keymap "EMMS")))
     
;;      ;; Define specific subcommands in this menu.
;;      (define-key global-map
;;        [menu-bar emms emms]
;;        '("EMMS Buffer" . emms))

;;      (define-key global-map
;;        [menu-bar emms AddPlaylist]
;;        '("Add Playlist" . emms-add-playlist))

;;      (define-key global-map
;;        [menu-bar emms PlayPlaylist]
;;        '("Play Playlist" . emms-play-playlist))

;;      (define-key global-map
;;        [menu-bar emms EmmsPause]
;;        '("Pause" . emms-pause))

;;      (define-key global-map
;;        [menu-bar emms EmmsNext]
;;        '("Next" . emms-next))

;;      (define-key global-map
;;        [menu-bar emms EmmsPrev]
;;        '("Previous" . emms-previous))

;;      (define-key global-map
;;        [menu-bar emms EmmsRandom]
;;        '("Random" . emms-random))

;;      (define-key global-map
;;        [menu-bar emms ScoreUp]
;;        '("Score Up" . emms-score-up-playing))

;;      (define-key global-map
;;        [menu-bar emms ScoreDown]
;;        '("Score Down" . emms-score-down-playing))

;;      )
