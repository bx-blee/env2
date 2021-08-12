;;; 
;;; RCS: $Id: ndmt-lsros-lucid.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

;;;
;;; lsros menu generating function
;;;
(defun ndmt-lsros-menu (host-sexpr)
  `("LSROS"
    ["Visit LSROS .ini" (ndmt-lsros-view-ini ,host-sexpr) t]		
    "-----"
    ["Show `lsros' Status" (ndmt-lsros-show-ps-status ,host-sexpr) t]		
    ["Run `lsros'" (ndmt-lsros-run-lsros ,host-sexpr) t]
    ["Kill `lsros'" (ndmt-lsros-kill-lsros ,host-sexpr) t]
    "-----"
    ["Show LSROS PDU Log" (ndmt-lsros-show-pdu-log ,host-sexpr) t]
    ["Show LSROS PDU Log with SDP Interpretation" (ndmt-lsros-show-pdu-log-interpreted ,host-sexpr) t]
    ["Show LSROS Recent Activity" (ndmt-lsros-show-status ,host-sexpr nil) t]	
    ["Show LSROS Ongoing Activity" (ndmt-lsros-show-status ,host-sexpr t) t]	
    ["View LSROS Trace File" (ndmt-lsros-view-trace ,host-sexpr) t]		
    "-----"
    ["Software Revision Info" (ndmt-lsros-revision-info ,host-sexpr) nil]
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; commands associated with the menu items
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; "LSROS" Sub Menu


(defun ndmt-lsros-view-ini (host)
  (ndmt-view-file (ndmt-system-full-path host "config/lrop.ini")
		  host
		  (ndmt-user)
		  (ndmt-password)))


(defun ndmt-lsros-show-ps-status (host)
  (interactive)
  (ndmt-run-command (ndmt-system-full-path host "bin/showProcs.sh")
		    host
		    (ndmt-user)
		    (ndmt-password)
		    ))

(defun ndmt-lsros-run-lsros (host)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-system-full-path host "bin/runLsros.sh"))
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsros-kill-lsros (host)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-system-full-path host "bin/killLsros.sh"))
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsros-show-pdu-log (host)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-system-full-path host "bin/lropscope.sh"))
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsros-show-pdu-log-interpreted (host)
  (ndmt-run-command (format "csh -c 'setenv CURENVBASE %s ; %s ; exit'" (ndmt-curenvbase)
			    (ndmt-system-full-path host "bin/lsmscope.sh"))
		    host
		    (ndmt-user)
		    (ndmt-password)))


(defun ndmt-lsros-show-status (host ongoing-p)
  "Tail the lsros trace file.  If ONGOING-P, then tail -f."
  (cond (ongoing-p 
	 (ndmt-tail-f-file (ndmt-system-full-path host "log/lsros.trace")
			   host
			   (ndmt-user)
			   (ndmt-password)
			   (ndmt-frame-params 'wide-and-short)
			   ))
	(t 
	 (ndmt-tail-file (ndmt-system-full-path host "log/lsros.trace")
			 host
			 (ndmt-user)
			 (ndmt-password)))))


(defun ndmt-lsros-view-trace (host)
  (ndmt-view-file (ndmt-system-full-path host "log/lsros.trace")
		  host
		  (ndmt-user)
		  (ndmt-password)))


  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'ndmt-lsros-lucid)
