;;; 
;;; RCS: $Id: ndmt.el,v 1.1 2007-11-07 06:31:33 mohsen Exp $
;;;

(defvar *ndmt-version* "$Revision: 1.1 $")

(defvar *ndmt-buffer-name-prefix* "*NDMT*")

(require 'ndmt-basic-lucid)
(require 'ndmt-lsm-mts-lucid)		; MTS
(require 'ndmt-lsm-ua-lucid)		; UA
(require 'ndmt-fax-lucid)		; fax gateway
(require 'ndmt-pager-lucid)		; pager gateway
(require 'ndmt-ivr-lucid)		; ivrmsg mgmt
(require 'ndmt-dns-lucid)		; 
(require 'ndmt-printer-lucid)		; 
(require 'ndmt-gnats-lucid)		; GNATS problem tracking 
(require 'ndmt-usenet-lucid)		; usenet
(require 'ndmt-nts-lucid)		; network terminal server
(require 'ndmt-www-lucid)		; world-wide web
(require 'ndmt-network-lucid)		; network mgmt
(require 'ndmt-backup-lucid)		; tape backups

(defun ndmt-install-menus ()
  "Install"
  (interactive)
)

(provide 'ndmt)
