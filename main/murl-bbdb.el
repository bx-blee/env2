;;;
;;; Rcs: $Id
;;;

;;; (require 'mozmail)
;;; Test It
;;; (progn (murl-pre-hook) (mozmail "mailto:one@example.com") (murl-post-hook))
;;; (setq debug-on-error t)


(defun murl-bbdbCapture-pre ()
  "Mail URL sendlink-toWeblogs"

  (msend-originator-from-line "")

  (msend-originator-envelope-addr "")

  (msend-compose-setup)
  )

(defun murl-bbdbCapture-post ()
  "Mail URL sendlink-toWeblogs"
  (bbdb-show-all-recipients)
  (bury-buffer nil)
   )


(defun murl-bbdbCapture ()
  "Mail URL sendlink-toWeblogs"
  (interactive)

  (setq  a-murl-pre-hook nil)
  (add-hook 'a-murl-pre-hook 'murl-bbdbCapture-pre)

  (setq  a-murl-post-hook nil)
  (add-hook 'a-murl-post-hook 'murl-bbdbCapture-post)
  )
