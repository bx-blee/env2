
;; Support Libraries
;;
(load "eoe-misc-lib")


;; BBDB Filters
(load "bbdb-eudora")

(setq bbdb-eudora-nndbase-filename
      (concat "/dos/m/eudora.mai/" (user-login-name) "/nndbase.txt"))
;;; And then
;; (bbdb-eudora-nndbase-output)

(setq bbdb-eudora-rcpdbase-filename
      (concat "/dos/m/eudora.mai/" (user-login-name) "/rcpdbase.txt"))
;;; And then
;; (bbdb-eudora-rcpdbase-output)

(load "bbdb-ccmail")

(setq bbdb-ccmail-filename "~/privdir.ini")
;;; And then
;;; (bbdb-ccmail-output)

(load "bbdb-hp200lx")

(setq bbdb-hp200lx-filename
      (concat "/dos/u/" (user-login-name) "/hp200lx/bbdb/default.cdf"))

;;;XXX;;;
;;;XXX;;;     bbdb-hp200lx-output-requires
;;;XXX;;;     bbdb-hp200lx-output-no-bare-names
(setq bbdb-hp200lx-output-elide
      '(net mail-alias nic nic-updated creation-date timestamp)) ;;  List of fields NOT to output

(setq bbdb-hp200lx-output-requires
      '(and name))   ;; must have (and name (or address phone)

(setq bbdb-hp200lx-output-no-bare-names t)  ;;If nonnil, `bare names' will not be printed.

;;; And then
;; (bbdb-hp200lx-output)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BBDB -> PINE Output Filter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "bbdb-pine")

(setq bbdb-pine-filename "~/.addressbook")
;;; And then
;;; (bbdb-pine-output)


;;; BBDB PASSWD INPUT FILTER

(load "bbdb-passwd")

(setq bpf-omit-uid-limit 100)
(setq bpf-omit-user-name-regexp "\\(sl-\\\|guest\\)")
(setq bpf-omit-user-name-list '("nobody" "noaccess"))
(setq bpf-omit-pretty-name-regexp "\\(Slip \\\|Listserv\\\|PPP\\)")
(setq bpf-omit-pretty-name-list '())


;;; And then
;; (bbdb-passwd-input)

;;; BDBD Export
(require 'bbdb-export)


;;; BDBD Letter
;;(load "bbdb-letter")
;;(load "bbdb-letter-mohsen")

;;; BDBD Supercite (Attribution)
;;(load "bbdb-supercite")

;;; BDBD WWW (w3)
;;;(load "bbdb-www")

;; BBDB SCHDPLUS Filter
(load "bbdb-schdplus")

(setq bos-filename
      (concat "/dos/u/" (user-login-name) "/bbdb-schdplus.csv"))
;;; - to output the *BBDB* buffer in SCHDPLUS comma-delimited-file (.CSV)
;;; format, invoke M-x bbdb-output-schdplus


;; BBDB OUTLOOK97 Filter
(load "bbdb-outlook97")

(setq bopp-filename
      (concat "/dos/u/" (user-login-name) "/bbdb-outlook97.csv"))
;;; - to output the *BBDB* buffer in OUTLOOK97 comma-delimited-file (.CSV)
;;; format, invoke M-x bbdb-output-outlook97

;; BBDB NETSCAPE6 Filter
(load "bbdb-netscape6")

(setq bon-filename
      (concat "/dos/u/" (user-login-name) "/bbdb-netscape6.csv"))
;;; - to output the *BBDB* buffer in NETSCAPE6 comma-delimited-file (.CSV)
;;; format, invoke M-x bbdb-output-netscape6

;; BBDB NETSCAPE4 Unix Filter
(load "bbdb-nsmail")

(setq  bno-file-name "~/.netscape/address-book.bbdb.html")
;;; format, invoke M-x bbdb-output-nsmail


;; BBDB PALMPILOT Filter
(load "bbdb-palmpilot")

(setq bopp-filename
      (concat "/dos/u/" (user-login-name) "/bbdb-palmpilot.csv"))
;;; - to output the *BBDB* buffer in PALMPILOT comma-delimited-file (.CSV)
;;; format, invoke M-x bbdb-output-palmpilot


;;; BDBD Append
(load "bbdb-append")

;;; BBDB Misc
;;(load "insert-fpath")     ;;; Historic, not needed with GNUS

;;; BBDB Action
(load "bbdb-action-extension")
(load "bbdb-action-lib")

;;;
;;; Start Up with an empty list so that this can be reloaded
;;;
(setq bbdb-action-alist nil)


;;; BBDB Action-Tex
(load "bbdb-tex-lib")
(load "bbdb-a-tex-example")

;(setq originator-tex-bbdb-dir "~/bbdbGens")
;(setq originator-file "/originator-prefs.el")
;(a-load-originator-tex-bbdb-prefs originator-tex-bbdb-dir originator-file)

(load "tex-fax-cover")
(load "tex-memo")
(load "tex-letter")
(load "tex-envelope")

(load "envelope-perl")

(load "comRecs")


;;; BBDB Group
(load "bbdb-names")
(load "bbdb-add-notes")

;;; msend tools
(load "msend-lib")
(load "bbdb-log")

(load "bbdb-vcard")

(provide 'bbdb-filters-site)