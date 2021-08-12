;;; pcl-cvs-site.el

;;;
;;; Site-specific configuration for the pcl-cvs.el package
;;;

;; Full path to the cvs executable.
(setq cvs-program "/usr/public/foundation/bin/cvs")

;; Full path to the best diff program you've got.
(setq cvs-diff-program "/usr/public/foundation/bin/diff")

;; Full path to the rmdir program.  Typically /bin/rmdir.
(setq cvs-rmdir-program "/bin/rmdir")

;; Non-nil means don't display a Copyright message in the ``*cvs*'' buffer.
(setq cvs-inhibit-copyright-message nil)
