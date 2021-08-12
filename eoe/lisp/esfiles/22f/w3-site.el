;;; site-specific configuration for w3.el

;; The url to open at startup.  It can be any valid URL.
(setq w3-default-homepage eoe-www-homepage)

;; The filename of the users default stylesheet.
(setq w3-default-stylesheet (concat *eoe-ver-esfiles-dir* ; this directory
				    "/stylesheet"))

;; Whether to delay image loading, or automatically retrieve them.
(setq w3-delay-image-loads nil)

;; Controls whether document retrievals over HTTP should be done in
;; the background.  This allows you to keep working in other windows
;; while large downloads occur.
(setq url-be-asynchronous t)
