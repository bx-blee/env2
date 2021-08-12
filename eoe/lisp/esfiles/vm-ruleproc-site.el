;;; vm-ruleproc-site.el

;; interval (in seconds) for checking/processing new mail when
;; unattended processing is enabled using `vm-ruleproc-auto-on' or the
(setq vm-ruleproc-auto-interval (* 60 10))	; once every ten minutes

;; where to log vm-ruleproc activity to
(setq vm-ruleproc-log-file
      (format "/tmp/vm-ruleproc.%s.log" (user-login-name)))

;; modify vm-summary-format
(setq vm-summary-format
      (if eoe-uses-wide-screen
	  "%n %*%a%-3.3L %-17.17F -> %-17.17T %-3.3m %2d %4l/%-5c %I\"%s\"\n" ; add label and recipient info
	"%n %*%a%-3.3L %-17.17F %-3.3m %2d %-5c %I\"%s\"\n")) ; add label, drop line count

;;
;; activate canned ruleset to mark messages in which i am explicitly named
;;
(vm-ruleproc-activate-ruleset 'vm-ruleproc-ruleset/vm-ruleproc-label-if-user-named-explicitly t)

;;
;; activate canned ruleset to mark messages from people i know
;;
(vm-ruleproc-activate-ruleset 'vm-ruleproc-ruleset/vm-ruleproc-label-if-in-bbdb t)


