(require 'color-theme)

;;; (color-theme:bystar:black-green)
(defun color-theme:bystar:black-green ()
  "Color theme by mohsen banan, created 2011-03-31."
  (interactive)
  (color-theme-install
   '(color-theme:bystar:black-green
     ((background-color . "Black")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "Magenta")
      (foreground-color . "Green")
      (mouse-color . "black"))
     (default ((t (:stipple nil :background "Black" :foreground "Green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "bitstream" :family "Bitstream Vera Sans Mono"))))
     (apt-utils-broken-face ((t (:foreground "red"))))
     (apt-utils-description-face ((t (:foreground "cadet blue"))))
     (apt-utils-field-contents-face ((t (:foreground "orange"))))
     (apt-utils-field-keyword-face ((t (:bold t :foreground "purple" :weight bold))))
     (apt-utils-normal-package-face ((t (:foreground "yellow"))))
     (apt-utils-version-face ((t (:italic t :slant italic))))
     (apt-utils-virtual-package-face ((t (:foreground "green"))))
     (bbdb-company ((t (:bold t :foreground "pink" :weight bold))))
     (bbdb-field-name ((t (:foreground "yellow"))))
     (bbdb-field-value ((t (nil))))
     (bbdb-name ((t (:bold t :foreground "red" :weight bold))))
     (bold ((t (:foreground "yellow" :weight normal))))
     (bold-italic ((t (:foreground "white"))))
     (border ((t (nil))))
     (buffer-menu-buffer ((t (:bold t :weight bold))))
     (buffers-tab ((t (:background "wheat" :foreground "black"))))
     (button ((t (:underline t))))
     (c-annotation-face ((t (:foreground "blue"))))
     (calc-nonselected-face ((t (:italic t :foreground "grey70" :slant italic))))
     (calc-selected-face ((t (:bold t :weight bold))))
     (calendar-today ((t (:underline t))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (compilation-column-number ((t (:foreground "PaleGreen"))))
     (compilation-error ((t (:foreground "Pink"))))
     (compilation-info ((t (:bold t :foreground "Green1" :weight bold))))
     (compilation-line-number ((t (:foreground "LightGoldenrod"))))
     (compilation-warning ((t (:bold t :foreground "Orange" :weight bold))))
     (completions-annotations ((t (:foreground "orange"))))
     (completions-common-part ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "Green" :background "Black" :stipple nil :height 120))))
     (completions-first-difference ((t (:weight normal :foreground "yellow"))))
     (cursor ((t (:background "Magenta"))))
     (custom-button ((t (nil))))
     (custom-button-mouse ((t (:background "grey90" :foreground "black" :box (:line-width 2 :style released-button)))))
     (custom-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button)))))
     (custom-button-pressed-unraised ((t (:underline t :foreground "violet"))))
     (custom-button-unraised ((t (:underline t))))
     (custom-changed ((t (:background "blue1" :foreground "white"))))
     (custom-comment ((t (:background "dim gray"))))
     (custom-comment-tag ((t (:foreground "gray80"))))
     (custom-documentation ((t (nil))))
     (custom-face-tag ((t (:bold t :weight bold :foreground "light blue"))))
     (custom-group-tag ((t (:bold t :family "Sans Serif" :foreground "light blue" :weight bold :height 1.2))))
     (custom-group-tag-1 ((t (:bold t :family "Sans Serif" :foreground "pink" :weight bold :height 1.2))))
     (custom-invalid ((t (:background "red1" :foreground "yellow1"))))
     (custom-link ((t (:underline t :foreground "cyan1"))))
     (custom-modified ((t (:background "blue1" :foreground "white"))))
     (custom-rogue ((t (:background "black" :foreground "pink"))))
     (custom-saved ((t (:underline t))))
     (custom-set ((t (:background "white" :foreground "blue1"))))
     (custom-state ((t (:foreground "lime green"))))
     (custom-themed ((t (:background "blue1" :foreground "white"))))
     (custom-variable-button ((t (nil))))
     (custom-variable-tag ((t (:bold t :foreground "light blue" :weight bold))))
     (custom-visibility ((t (:underline t :foreground "cyan1" :height 0.8))))
     (diary ((t (:foreground "yellow1"))))
     (diary-anniversary ((t (nil))))
     (diary-button ((t (nil))))
     (diary-time ((t (:foreground "LightGoldenrod"))))
     (dictem-database-description-face ((t (:bold t :foreground "white" :weight bold))))
     (dictem-reference-dbname-face ((t (:bold t :foreground "white" :weight bold))))
     (dictem-reference-definition-face ((t (:foreground "cyan"))))
     (dictem-reference-m1-face ((t (:foreground "lightblue"))))
     (dictem-reference-m2-face ((t (:bold t :foreground "gray" :weight bold))))
     (dired-directory ((t (:foreground "LightSkyBlue"))))
     (dired-flagged ((t (:foreground "Pink"))))
     (dired-header ((t (:foreground "PaleGreen"))))
     (dired-ignored ((t (:foreground "grey70"))))
     (dired-mark ((t (:foreground "Aquamarine"))))
     (dired-marked ((t (:foreground "Pink"))))
     (dired-perm-write ((t (nil))))
     (dired-symlink ((t (nil))))
     (dired-warning ((t (:foreground "Pink"))))
     (emms-browser-album-face ((t (:foreground "#aaaaff" :height 1.1))))
     (emms-browser-artist-face ((t (:foreground "#aaaaff" :height 1.3))))
     (emms-browser-track-face ((t (:foreground "#aaaaff" :height 1.0))))
     (emms-browser-year/genre-face ((t (:foreground "#aaaaff" :height 1.5))))
     (emms-playlist-selected-face ((t (:foreground "SteelBlue3"))))
     (emms-playlist-track-face ((t (:foreground "DarkSeaGreen"))))
     (emms-stream-name-face ((t (:bold t :weight bold))))
     (emms-stream-url-face ((t (:foreground "LightSteelBlue"))))
     (escape-glyph ((t (:foreground "cyan"))))
     (file-name-shadow ((t (:foreground "grey70"))))
     (fixed-pitch ((t (:family "Monospace"))))
     (font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-comment-delimiter-face ((t (nil))))
     (font-lock-comment-face ((t (nil))))
     (font-lock-constant-face ((t (:foreground "Aquamarine"))))
     (font-lock-doc-face ((t (:foreground "LightSalmon"))))
     (font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
     (font-lock-keyword-face ((t (nil))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-regexp-grouping-backslash ((t (:weight normal :foreground "yellow"))))
     (font-lock-regexp-grouping-construct ((t (:weight normal :foreground "yellow"))))
     (font-lock-string-face ((t (:foreground "LightSalmon"))))
     (font-lock-type-face ((t (:foreground "PaleGreen"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-warning-face ((t (:foreground "Pink"))))
     (fringe ((t (:background "grey10"))))
     (glyphless-char ((t (:height 0.6))))
     (gnus-button ((t (:bold t :weight bold))))
     (gnus-cite-1 ((t (nil))))
     (gnus-cite-10 ((t (:foreground "plum1"))))
     (gnus-cite-11 ((t (:foreground "turquoise"))))
     (gnus-cite-2 ((t (:foreground "light cyan"))))
     (gnus-cite-3 ((t (:foreground "light yellow"))))
     (gnus-cite-4 ((t (:foreground "light pink"))))
     (gnus-cite-5 ((t (:foreground "pale green"))))
     (gnus-cite-6 ((t (:foreground "beige"))))
     (gnus-cite-7 ((t (:foreground "orange"))))
     (gnus-cite-8 ((t (:foreground "magenta"))))
     (gnus-cite-9 ((t (:foreground "violet"))))
     (gnus-cite-attribution ((t (:italic t :slant italic))))
     (gnus-emphasis-bold ((t (nil))))
     (gnus-emphasis-bold-italic ((t (nil))))
     (gnus-emphasis-highlight-words ((t (:background "black" :foreground "yellow"))))
     (gnus-emphasis-italic ((t (:italic t :slant italic))))
     (gnus-emphasis-strikethru ((t (:strike-through t))))
     (gnus-emphasis-underline ((t (:underline t))))
     (gnus-emphasis-underline-bold ((t (nil))))
     (gnus-emphasis-underline-bold-italic ((t (nil))))
     (gnus-emphasis-underline-italic ((t (:italic t :underline t :slant italic))))
     (gnus-group-mail-1 ((t (:bold t :foreground "red" :weight bold))))
     (gnus-group-mail-1-empty ((t (:bold t :foreground "green1" :weight bold))))
     (gnus-group-mail-2 ((t (:bold t :foreground "firebrick" :weight bold))))
     (gnus-group-mail-2-empty ((t (:bold t :foreground "green2" :weight bold))))
     (gnus-group-mail-3 ((t (:bold t :foreground "orange" :weight bold))))
     (gnus-group-mail-3-empty ((t (:bold t :foreground "green3" :weight bold))))
     (gnus-group-mail-low ((t (:bold t :foreground "yellow" :weight bold))))
     (gnus-group-mail-low-empty ((t (:bold t :foreground "green4" :weight bold))))
     (gnus-group-news-1 ((t (:bold t :foreground "red" :weight bold))))
     (gnus-group-news-1-empty ((t (:bold t :foreground "green1" :weight bold))))
     (gnus-group-news-2 ((t (:bold t :foreground "firebrick" :weight bold))))
     (gnus-group-news-2-empty ((t (:bold t :foreground "green2" :weight bold))))
     (gnus-group-news-3 ((t (:bold t :foreground "orange" :weight bold))))
     (gnus-group-news-3-empty ((t (:bold t :foreground "green3" :weight bold))))
     (gnus-group-news-4 ((t (:bold t :foreground "yellow" :weight bold))))
     (gnus-group-news-4-empty ((t (:bold t :foreground "green4" :weight bold))))
     (gnus-group-news-5 ((t (:bold t :foreground "purple3" :weight bold))))
     (gnus-group-news-5-empty ((t (:bold t :foreground "green5" :weight bold))))
     (gnus-group-news-6 ((t (:bold t :foreground "turquoise" :weight bold))))
     (gnus-group-news-6-empty ((t (:bold t :foreground "green6" :weight bold))))
     (gnus-group-news-low ((t (:bold t :foreground "pink" :weight bold))))
     (gnus-group-news-low-empty ((t (:bold t :foreground "green" :weight bold))))
     (gnus-header-content ((t (:foreground "white" :weight normal))))
     (gnus-header-from ((t (:bold t :foreground "red" :weight bold))))
     (gnus-header-name ((t (:bold t :background "black" :foreground "orange" :weight bold))))
     (gnus-header-newsgroups ((t (:italic t :foreground "DarkGreen" :underline t :slant italic))))
     (gnus-header-subject ((t (:bold t :foreground "DarkGreen" :weight bold))))
     (gnus-server-agent ((t (:bold t :foreground "PaleTurquoise" :weight bold))))
     (gnus-server-closed ((t (:italic t :foreground "LightBlue" :slant italic))))
     (gnus-server-denied ((t (:bold t :foreground "Pink" :weight bold))))
     (gnus-server-offline ((t (:bold t :foreground "Yellow" :weight bold))))
     (gnus-server-opened ((t (:bold t :foreground "Green1" :weight bold))))
     (gnus-signature ((t (:italic t :slant italic))))
     (gnus-splash ((t (:foreground "#cccccc"))))
     (gnus-summary-cancelled ((t (:background "black" :foreground "yellow"))))
     (gnus-summary-high-ancient ((t (:foreground "SkyBlue"))))
     (gnus-summary-high-read ((t (:foreground "PaleGreen"))))
     (gnus-summary-high-ticked ((t (:foreground "pink"))))
     (gnus-summary-high-undownloaded ((t (:bold t :foreground "LightGray" :weight bold))))
     (gnus-summary-high-unread ((t (nil))))
     (gnus-summary-low-ancient ((t (:italic t :foreground "SkyBlue" :slant italic))))
     (gnus-summary-low-read ((t (:italic t :foreground "PaleGreen" :slant italic))))
     (gnus-summary-low-ticked ((t (:italic t :foreground "pink" :slant italic))))
     (gnus-summary-low-undownloaded ((t (:italic t :foreground "LightGray" :slant italic :weight normal))))
     (gnus-summary-low-unread ((t (:italic t :slant italic))))
     (gnus-summary-normal-ancient ((t (:foreground "SkyBlue"))))
     (gnus-summary-normal-read ((t (:foreground "PaleGreen"))))
     (gnus-summary-normal-ticked ((t (:foreground "pink"))))
     (gnus-summary-normal-undownloaded ((t (:foreground "LightGray" :weight normal))))
     (gnus-summary-normal-unread ((t (nil))))
     (gnus-summary-selected ((t (:foreground "Yellow" :underline t))))
     (gui-element ((t (nil))))
     (header-line ((t (:box (:line-width -1 :style released-button) :background "grey20" :foreground "grey90" :box nil))))
     (help-argument-name ((t (:foreground "orange"))))
     (highlight ((t (:background "darkolivegreen"))))
     (holiday ((t (:background "chocolate4"))))
     (info-header-node ((t (:foreground "white"))))
     (info-header-xref ((t (:foreground "yellow"))))
     (info-menu-header ((t (:bold t :family "Sans Serif" :weight bold))))
     (info-menu-star ((t (:foreground "red1"))))
     (info-node ((t (:foreground "white"))))
     (info-title-1 ((t (:bold t :weight bold :family "Sans Serif" :height 1.728))))
     (info-title-2 ((t (:bold t :family "Sans Serif" :weight bold :height 1.44))))
     (info-title-3 ((t (:bold t :weight bold :family "Sans Serif" :height 1.2))))
     (info-title-4 ((t (:bold t :family "Sans Serif" :weight bold))))
     (info-xref ((t (:foreground "yellow"))))
     (info-xref-visited ((t (:foreground "violet" :underline t))))
     (isearch ((t (:background "palevioletred2" :foreground "brown4"))))
     (isearch-fail ((t (:background "red4"))))
     (iswitchb-current-match ((t (:foreground "LightSkyBlue"))))
     (iswitchb-invalid-regexp ((t (:foreground "Pink"))))
     (iswitchb-single-match ((t (nil))))
     (iswitchb-virtual-matches ((t (:foreground "LightSteelBlue"))))
     (italic ((t (:foreground "orange"))))
     (lazy-highlight ((t (:background "paleturquoise4"))))
     (link ((t (:foreground "cyan1" :underline t))))
     (link-visited ((t (:underline t :foreground "violet"))))
     (match ((t (:background "RoyalBlue3"))))
     (menu ((t (nil))))
     (message-cited-text ((t (:foreground "LightPink1"))))
     (message-header-cc ((t (:foreground "orange"))))
     (message-header-name ((t (:foreground "green"))))
     (message-header-newsgroups ((t (:foreground "yellow"))))
     (message-header-other ((t (:foreground "VioletRed1"))))
     (message-header-subject ((t (:foreground "yellow"))))
     (message-header-to ((t (:foreground "red"))))
     (message-header-xheader ((t (:foreground "DeepSkyBlue1"))))
     (message-mml ((t (:foreground "MediumSpringGreen"))))
     (message-separator ((t (:foreground "LightSkyBlue1"))))
     (minibuffer-prompt ((t (:foreground "cyan"))))
     (mm-uu-extract ((t (:background "dark green" :foreground "light yellow"))))
     (mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
     (mode-line-buffer-id ((t (:bold t :weight bold))))
     (mode-line-emphasis ((t (:bold t :weight bold))))
     (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button)))))
     (mode-line-inactive ((t (:background "grey30" :foreground "grey80" :box (:line-width -1 :color "grey40" :style nil) :weight light))))
     (mouse ((t (nil))))
     (next-error ((t (:background "blue3"))))
     (nobreak-space ((t (:foreground "cyan" :underline t))))
     (org-agenda-clocking ((t (:background "SkyBlue4"))))
     (org-agenda-column-dateline ((t (:family "Bitstream Vera Sans Mono" :weight normal :slant normal :underline nil :strike-through nil :background "grey30" :height 120))))
     (org-agenda-date ((t (:foreground "LightSkyBlue"))))
     (org-agenda-date-today ((t (:italic t :bold t :foreground "LightSkyBlue" :slant italic :weight bold))))
     (org-agenda-date-weekend ((t (:bold t :foreground "LightSkyBlue" :weight bold))))
     (org-agenda-diary ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "Green" :background "Black" :stipple nil :height 120))))
     (org-agenda-dimmed-todo-face ((t (:foreground "grey50"))))
     (org-agenda-done ((t (:foreground "PaleGreen"))))
     (org-agenda-restriction-lock ((t (:background "skyblue4"))))
     (org-agenda-structure ((t (:foreground "LightSkyBlue"))))
     (org-archived ((t (:foreground "grey70"))))
     (org-block ((t (:foreground "grey70"))))
     (org-checkbox ((t (:weight normal :foreground "yellow"))))
     (org-checkbox-statistics-done ((t (:bold t :weight bold :foreground "PaleGreen"))))
     (org-checkbox-statistics-todo ((t (:bold t :weight bold :foreground "Pink"))))
     (org-clock-overlay ((t (:background "SkyBlue4"))))
     (org-code ((t (:bold t :foreground "pale turquoise" :weight bold :height 1.2))))     ;; Somehow the base size changes -- Meant to be equivalent to org-document-title
     (org-column ((t (:background "grey30" :strike-through nil :underline nil :slant normal :weight normal :height 120 :family "Bitstream Vera Sans Mono"))))
     (org-column-title ((t (:bold t :background "grey30" :underline t :weight bold))))
     (org-date ((t (:foreground "Cyan" :underline t))))
     (org-document-info ((t (:foreground "pale turquoise"))))
     (org-document-info-keyword ((t (:foreground "grey70"))))
     (org-document-title ((t (:bold t :foreground "pale turquoise" :weight bold :height 1.44))))
     (org-done ((t (:bold t :foreground "PaleGreen" :weight bold))))
     (org-drawer ((t (:foreground "LightSkyBlue"))))
     (org-ellipsis ((t (:foreground "LightGoldenrod" :underline t))))
     (org-footnote ((t (:foreground "Cyan" :underline t))))
     (org-formula ((t (:foreground "chocolate1"))))
     (org-headline-done ((t (:foreground "LightSalmon"))))
     (org-hide ((t (:foreground "black"))))
     (org-latex-and-export-specials ((t (:foreground "burlywood"))))
     (org-level-1 ((t (:foreground "LightSkyBlue" :height 1.2 ))))
     (org-level-2 ((t (:foreground "LightGoldenrod" :height 1.1 ))))
     (org-level-3 ((t (nil))))
     (org-level-4 ((t (nil))))
     (org-level-5 ((t (:foreground "PaleGreen"))))
     (org-level-6 ((t (:foreground "Aquamarine"))))
     (org-level-7 ((t (:foreground "LightSteelBlue"))))
     (org-level-8 ((t (:foreground "LightSalmon"))))
     (org-link ((t (:underline t :foreground "cyan1" :height 1.1))))
     (org-meta-line ((t (nil))))
     (org-mode-line-clock ((t (:box (:line-width -1 :style released-button) :foreground "black" :background "grey75"))))
     (org-mode-line-clock-overrun ((t (:box (:line-width -1 :style released-button) :foreground "black" :background "red"))))
     (org-property-value ((t (nil))))
     (org-quote ((t (:foreground "grey70"))))
     (org-scheduled ((t (:foreground "PaleGreen"))))
     (org-scheduled-previously ((t (:foreground "chocolate1"))))
     (org-scheduled-today ((t (:foreground "PaleGreen"))))
     (org-sexp-date ((t (:foreground "Cyan"))))
     (org-special-keyword ((t (:foreground "LightSalmon"))))
     (org-table ((t (:foreground "LightSkyBlue"))))
     (org-tag ((t (:bold t :weight bold))))
     (org-target ((t (:underline t))))
     (org-time-grid ((t (:foreground "LightGoldenrod"))))
     (org-todo ((t (:bold t :foreground "Pink" :weight bold))))
     (org-upcoming-deadline ((t (:foreground "chocolate1"))))
     (org-verbatim ((t (:foreground "grey70"))))
     (org-verse ((t (:foreground "grey70"))))
     (org-warning ((t (:foreground "Pink"))))
     (outline-1 ((t (:foreground "LightSkyBlue"))))
     (outline-2 ((t (:foreground "LightGoldenrod"))))
     (outline-3 ((t (nil))))
     (outline-4 ((t (nil))))
     (outline-5 ((t (:foreground "PaleGreen"))))
     (outline-6 ((t (:foreground "Aquamarine"))))
     (outline-7 ((t (:foreground "LightSteelBlue"))))
     (outline-8 ((t (:foreground "LightSalmon"))))
     (query-replace ((t (:foreground "brown4" :background "palevioletred2"))))
     (region ((t (:background "blue3"))))
     (scroll-bar ((t (nil))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (shadow ((t (:foreground "grey70"))))
     (shell-input ((t (:foreground "white" :weight normal))))
     (shell-prompt ((t (:foreground "yellow" :slant normal :weight normal :family "lucida"))))
     (spam ((t (:foreground "ivory2"))))
     (tabbar-button ((t (:background "grey50" :family "Sans Serif" :foreground "dark red" :box (:line-width 1 :color "white" :style released-button) :height 0.8))))
     (tabbar-button-highlight ((t (:foreground "grey75" :background "grey50" :family "Sans Serif" :height 0.8))))
     (tabbar-default ((t (:family "Sans Serif" :background "grey50" :foreground "grey75" :height 0.8))))
     (tabbar-highlight ((t (:underline t))))
     (tabbar-selected ((t (:background "grey50" :family "Sans Serif" :foreground "blue" :box (:line-width 1 :color "white" :style pressed-button) :height 0.8))))
     ;;;(tabbar-separator ((t (:foreground "grey75" :background "grey50" :family "Sans Serif" :height 0.08000000000000002))))
     (tabbar-unselected ((t (:foreground "grey75" :background "grey50" :family "Sans Serif" :box (:line-width 1 :color "white" :style released-button) :height 0.8))))
     (tex-math ((t (:foreground "LightSalmon"))))
     (tex-verbatim ((t (:family "courier"))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     (tooltip ((t (:family "Sans Serif" :background "lightyellow" :foreground "black"))))
     (trailing-whitespace ((t (:background "red1"))))
     (underline ((t (:foreground "red" :height 1.1))))   ;;;  Was previously underlined -- (:underline t :foreground "red" :height 1.1)
     (variable-pitch ((t (:family "Sans Serif"))))
     (vertical-border ((t (nil))))
     (w3m-anchor ((t (:foreground "cyan"))))
     (w3m-arrived-anchor ((t (:foreground "LightSkyBlue"))))
     (w3m-bold ((t (:bold t :weight bold))))
     (w3m-current-anchor ((t (:bold t :underline t :weight bold))))
     (w3m-form-button ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style released-button)))))
     (w3m-form-button-mouse ((t (:background "DarkSeaGreen1" :foreground "black" :box (:line-width 2 :style released-button)))))
     (w3m-form-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button)))))
     (w3m-header-line-location-content ((t (:background "Gray20" :foreground "LightGoldenrod"))))
     (w3m-header-line-location-title ((t (:background "Gray20" :foreground "Cyan"))))
     (w3m-history-current-url ((t (:background "SkyBlue4" :foreground "LightSkyBlue"))))
     (w3m-image ((t (:foreground "PaleGreen"))))
     (w3m-image-anchor ((t (:background "dark green"))))
     (w3m-insert ((t (:foreground "orchid"))))
     (w3m-italic ((t (:italic t :slant italic))))
     (w3m-strike-through ((t (:strike-through t))))
     (w3m-tab-background ((t (:background "LightSteelBlue" :foreground "black"))))
     ;;;(w3m-tab-mouse ((t (:background "Gray75" :foreground "white" :box (:line-width -1 :style released-button)))))
     (w3m-tab-selected ((t (:background "Gray90" :foreground "black" :box (:line-width -1 :style released-button)))))
     (w3m-tab-selected-background ((t (:background "LightSteelBlue" :foreground "black"))))
     (w3m-tab-selected-retrieving ((t (:background "Gray90" :foreground "red" :box (:line-width -1 :style released-button)))))
     (w3m-tab-unselected ((t (:background "Gray70" :foreground "Gray20" :box (:line-width -1 :style released-button)))))
     (w3m-tab-unselected-retrieving ((t (:background "Gray70" :foreground "OrangeRed" :box (:line-width -1 :style released-button)))))
     (w3m-tab-unselected-unseen ((t (:background "Gray70" :foreground "Gray20" :box (:line-width -1 :style released-button)))))
     (w3m-underline ((t (:underline t))))
     (widget-button ((t (nil))))
     (widget-button-pressed ((t (:foreground "red1"))))
     (widget-documentation ((t (:foreground "lime green"))))
     (widget-field ((t (:background "dim gray"))))
     (widget-inactive ((t (:foreground "grey70"))))
     (widget-single-line-field ((t (:background "dim gray")))))))

(add-to-list 'color-themes '(color-theme:bystar:black-green  "Green On Black" "ByStar Team"))

(provide 'bystar-color-themes)

;; (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)
;; (org-hide ((t (:foreground "black"))))
;; (org-block ((t (:foreground "grey70"))))
;; (set-face-attribute 'org-block nil :foreground "grey70")
;; (font-lock-add-keywords 'org-mode
;;                        '(("^ *\\([-]\\) "
;;                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "???"))))))
;;

;;;
;;; NOTYET, Add these to view, edit and raw modes.
;;; 

;; (font-lock-add-keywords 'org-mode '(("^####.END.*$" . 'org-hide)))
;; (font-lock-add-keywords 'org-mode '(("^####.BEGIN.*$" . 'org-hide)))


;; (font-lock-remove-keywords 'org-mode '(("^####.END.*$" . 'org-hide)))
;; (font-lock-remove-keywords 'org-mode '(("^####.BEGIN.*$" . 'org-hide)))

;; (font-lock-fontify-buffer)

;; (font-lock-add-keywords 'org-mode '(("^####.END$" . font-lock-doc-face)))

;; (font-lock-remove-keywords 'org-mode '(("^####.END$" . font-lock-comment-face)))

;; (font-lock-remove-keywords 'org-mode '(("^####.END$" . font-lock-doc-face)))

;; (facep font-lock-doc-face)
;; (facep 'org-hide)
