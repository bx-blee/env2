;; -*-Emacs-Lisp-*-
;; ------------------- Gu Zhou ------------------------

;;设置语言环境
(set-l;; -*-Emacs-Lisp-*-
;; ------------------- Gu Zhou ------------------------

;;设置语言环境
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;;设置字体
(create-fontset-from-fontset-spec
"-bitstream-bitstream vera sans mono-medium-r-normal-*-14-*-*-*-*-*-fontset-guzhou")
; chinese-gbk:-wenquanyi-wenquanyi bitmap song-medium-r-normal--0-0-100-100-p-0-gbk-0")
(set-default-font "fontset-guzhou")
anguage-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;;设置字体
(create-fontset-from-fontset-spec
"-bitstream-bitstream vera sans mono-medium-r-normal-*-14-*-*-*-*-*-fontset-guzhou")
; chinese-gbk:-wenquanyi-wenquanyi bitmap song-medium-r-normal--0-0-100-100-p-0-gbk-0")
(set-default-font "fontset-guzhou")
