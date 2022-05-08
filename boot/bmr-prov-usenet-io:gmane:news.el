;;; bmr-prov-usenet-io:gmane:news.el --- Gmail Provider Messging Resource  --*- lexical-binding: t; -*-

(orgCmntBegin "
* Blee Messging Resource (BMR) gmail.com Mail Provider
** Specifies imap and submission protocol parameters of Gmail.
" orgCmntEnd)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* Libre-Halaal Software --- Part Of Blee ---  COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Polymode COMEEGA (Colaborative Org-Mode Enhance Emacs Generalized Authorship)
" orgCmntEnd)
;;; DBLOCK_END

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)

(orgCmntBegin "
* Relevant Modules, Files And Panels:
** [[file:/bisos/panels/blee-core/mail/model/_nodeBase_/fullUsagePanel-en.org]]
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
" orgCmntEnd)

(orgCmntBegin "
*   ~Requires~
" orgCmntEnd)

(require 'gnus)
(require 'gnus-srvr)
(require 'loop)

;;;  (b:remprop-all 'b:mrm:resource:manifest)

(orgCmntBegin "
* /Concept:/ <<b:mrm Messaging Resources>>
**  A =b:mrm Messaging Resource= consists of one of or both of:
**  - A Retrievables Messaging Resource  (Credentialed or Open)
**  - A Injection Messaging Resource  (Credentialed or Open)
** [[b:mrm:resource|define]] function is used to define a [[b:mrm:resource]]
" orgCmntEnd)

;;; (b:mrm:retrievablesResource:provider|io-gmane-news)

;;;; DBLOCK_BEGIN
(orgCmntBegin "
* cl-defun <<b:mrm:retrievablesResource:provider|io-gmane-news>>  [[start-stop debugger menu]]
" orgCmntEnd)
(cl-defun b:mrm:retrievablesResource:provider|io-gmane-news (
;;; DBLOCK_END
                                                             )
  " #+begin_org
** DocSrc: For each named arument, take appropriate acction and set the corresponding plist.
#+end_org "

  (put 'b:mrm:usenet:manifest  'protocol "nntp")
  (put 'b:mrm:usenet:manifest  'nntp-address "news.gmane.io")
  (put 'b:mrm:usenet:manifest  'nntp-port "nntp")
  )

(provide 'bmr-prov-usenet-io:gmane:news)

;;; local variables:
;;; no-byte-compile: t
;;; end:
