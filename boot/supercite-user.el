;;; supercite-site.el

(setq sc-preferred-header-style 1)
(setq sc-citation-leader "  ")
(setq sc-auto-fill-region-p nil)
(setq sc-nuke-mail-headers 'all)
(setq sc-electric-references-p nil)
(add-hook 'mail-yank-hooks 'sc-cite-original)
;;(add-hook  'news-reply-mode-hook 'sc-cite-original)
;;(add-hook  'mail-setup-hook      'sc-cite-original)
