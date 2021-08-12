;;; cc-mode-site.el

(defun cc-mode-site-setup ()
  (setq c-basic-offset 4)
  (setq c-tab-always-indent nil))

(add-hook 'c-mode-hook 'cc-mode-site-setup)
(add-hook 'c++-mode-hook 'cc-mode-site-setup)
