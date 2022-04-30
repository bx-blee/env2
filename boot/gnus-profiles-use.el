;;; gnus-profile.el --- Configure Gnus With Profiles  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Configure Gnus and message-mode based on the specified profiles.
** This should become an independent package, where the inputs are
abstract mail service descriptions.
** Action Plan:
*** TODO Add a b:gnus:profile|init -- does (setq gnutls-log-lyevel 1) and more.
" orgCmntEnd)

(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)

(orgCmntBegin "
*      ================ Requires
" orgCmntEnd)

(require 'loop)

;;; (gnus-group-browse-foreign-server (quote (nntp "news.gmane.io")))

(setq b:gnus:profile:filesList
      (list
       "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@mohsen.byname/gnus-mailService.el"
       "/bxo/iso/piu_mbFullUsage/profiles/gnus/com.gmail@haraamemail.2/gnus-mailService.el"
       ))

(b:gnus:profile/filesList-activate)

;;; local variables:
;;; no-byte-compile: t
;;; end:

