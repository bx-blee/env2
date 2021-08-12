;;; vm-ruleproc-bbdb-site.el

;;
;; activate canned ruleset to check and dispatch based on the
;; `ruleproc' field in BBDB
;;
(vm-ruleproc-activate-ruleset 'vm-ruleproc-ruleset/vm-ruleproc-bbdb-use-ruleproc-tags t)

;; for the above ruleset, specify handlers for the various possible
;; values of the `ruleproc' field in BBDB.

(defvar bool-menu:on-the-road nil "This for use by vm-ruleproc.")

(setq vm-ruleproc-bbdb/tag-handlers
      `((pager (if (and bool-menu:on-the-road
			eoe-priority-access-address-pager)
		   (vm-ruleproc-action/resend-current-message eoe-priority-access-address-pager)
		 (ding)
		 (message "pager BBDB ruleproc tag handler run")
		 (sleep-for 1)))

	(fax (if (and bool-menu:on-the-road
		      eoe-priority-access-address-fax)
		 (vm-ruleproc-action/resend-current-message eoe-priority-access-address-fax)
	       (ding)
	       (message "fax BBDB ruleproc tag handler run")
	       (sleep-for 1)))

	(lsm (if (and bool-menu:on-the-road
		      eoe-priority-access-address-lsm)
		 (vm-ruleproc-action/forward-current-message eoe-priority-access-address-lsm)
	       (ding)
	       (message "lsm BBDB ruleproc tag handler run")
	       (sleep-for 1)))

	(emergency (if (and bool-menu:on-the-road
			    eoe-priority-access-address-emergency)
		       (vm-ruleproc-action/resend-current-message eoe-priority-access-address-emergency)
		     (ding)
		     (message "emergency BBDB ruleproc tag handler run")
		     (sleep-for 1)))

	(default (if (and bool-menu:on-the-road
			  eoe-priority-access-address-default)
		     (vm-ruleproc-action/resend-current-message ,eoe-priority-access-address-default)
		   (ding)
		   (message "default BBDB ruleproc tag handler run")
		   (sleep-for 1)))
	)) ; activate

