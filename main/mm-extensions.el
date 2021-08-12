
(add-to-list 'mm-text-html-renderer-alist
	     '(true-w3m mm-inline-render-with-stdin
			nil "w3m" "-T" "text/html"))

(add-to-list 'mm-text-html-washer-alist
	     '(true-w3m mm-inline-wash-with-stdin
			nil "w3m" "-T" "text/html"))

(add-to-list 'mm-text-html-renderer-alist
	     '(pipe-to-mozilla mm-inline-render-with-stdin
			nil "/opt/public/osmt/bin/lcaMozillaAdmin.sh" "-i" "stdin" "text/html"))

(add-to-list 'mm-text-html-washer-alist
	     '(pipe-to-mozilla mm-inline-wash-with-stdin
			nil "/opt/public/osmt/bin/lcaMozillaAdmin.sh" "-i" "stdin" "text/html"))

;(setq mm-text-html-renderer 'true-w3m)
(setq mm-text-html-renderer 'pipe-to-mozilla)