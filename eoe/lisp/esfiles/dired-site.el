;;; dired-site.el

(if (file-exists-p "/usr/bin/ls")	; use the correct `ls' program
    (progn
      (setq dired-ls-program "/usr/bin/ls"
	    dired-listing-switches "-al")))

