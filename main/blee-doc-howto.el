;;
;;;

;; (blee:blee:doc:howto:overview-help)
(defun blee:blee:doc:howto:overview-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:overview-desc)
  )

;;
;; (blee:blee:doc:howto:overview-desc)
(defun blee:blee:doc:howto:overview-desc ()
  "
Released Document: URL `http://www.neda.com'.

Development Document: URL `http://www.neda.com/store'.


Introduction:               `blee:blee:doc:howto:introduction-desc'

Obtain and Configure:       `blee:blee:doc:howto:obtain-and-config-desc'

    Desktop Config:         `blee:blee:doc:howto:desktop:config-desc'

    Browser Config:         `blee:blee:doc:howto:browser:config-desc'

Mail Send:                  `bystar:mail:send:doc:howto:introduction-desc'

Mail Read:                  `bystar:mail:doc:howto:introduction-desc'

   Gnus Levels:             `bystar:mail:doc:howto:levels-policy-desc'

   FDBM Names:              `bystar:mail:doc:howto:fdmb-names-desc'

   Maintenance/Archiving:   `bystar:mail:doc:howto:maintenance-desc'

   Spam Training:           `bystar:mail:doc:howto:spam-proc-desc'

Self Publication:           `bystar:selfpub:doc:howto:introduction-desc'

   New Document:            `bystar:selfpub:doc:howto:new-document-desc'

Web Site Editing:           `bystar:website:doc:howto:new-document-desc'

Gallery:                    `bystar:web:doc:howto:gallery-desc'

Geneweb:                    `bystar:web:doc:howto:geneweb-desc'

Music:                      `bystar:music:doc:howto:all-desc'

Insert/Template:            `bystar:insert:doc:howto:all-desc'

M17N:                       `bystar:m17n:doc:howto:all-desc'

Organizer:                  `bystar:org:doc:howto:all-desc'

Sync:                       `bystar:sync:doc:howto:all-desc'

Bug Reports and Todos:      `blee:blee:doc:howto:bugs-and-todos-desc'

New Feature Ideas:          `blee:blee:doc:howto:ideas-desc'
"
  (interactive)
  )

;; (blee:blee:doc:howto:build-all-doc-modules)
(defun blee:blee:doc:howto:build-all-doc-modules ()
  "Call Each module doc in turn.

    1) Gather the doc-string of functions
    2) Form them as a texinfo document
    3) Create the PLPC document in texinfo format
"
  (interactive)

  (save-excursion
    (setq module-doc:base-name "/lcnt/lgpc/bystar/permanent/usage/bleeDev/")
    (setq module-doc:file-name "blee-howto-gened.tex")

    (find-file (concat  module-doc:base-name module-doc:file-name))

    (delete-region (point-min) (point-max))
    (goto-char (point-min))

    ;;; Introduction
    (insert "%%%\n%%% (find-function 'blee:blee:doc:howto:introduction-desc)\n%%%\n")
    (insert (documentation 'blee:blee:doc:howto:introduction-desc))
    (goto-char (point-max))



    ;;; Obtain and Configure
    (insert "%%%\n%%% (find-function 'blee:blee:doc:howto:obtain-and-config-desc)\n%%%\n")
    (insert (documentation 'blee:blee:doc:howto:obtain-and-config-desc))
    (goto-char (point-max))

    ;;; Mail Begins
    (insert "%%%\n%%% (find-function 'bystar:mail:send:doc:howto:introduction-desc)\n%%%\n")
    (insert (documentation 'bystar:mail:send:doc:howto:introduction-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'bystar:mail:doc:howto:introduction-desc)\n%%%\n")
    (insert (documentation 'bystar:mail:doc:howto:introduction-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'bystar:mail:doc:howto:levels-policy-desc)\n%%%\n")
    (insert (documentation 'bystar:mail:doc:howto:levels-policy-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'bystar:mail:doc:howto:fdmb-names-desc)\n%%%\n")
    (insert (documentation 'bystar:mail:doc:howto:fdmb-names-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'bystar:mail:doc:howto:spam-proc-desc)\n%%%\n")
    (insert (documentation 'bystar:mail:doc:howto:spam-proc-desc))
    (goto-char (point-max))

    ;;; Mail Ends

    ;;; SelfPub Begins
    (insert "%%%\n%%% (find-function 'bystar:selfpub:doc:howto:introduction-desc)\n%%%\n")
    (insert (documentation 'bystar:selfpub:doc:howto:introduction-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'bystar:selfpub:doc:howto:new-document-desc)\n%%%\n")
    (insert (documentation 'bystar:selfpub:doc:howto:new-document-desc))
    (goto-char (point-max))

    ;;; SelfPub Ends

    ;;; PloneWeb Begins
    (insert "%%%\n%%% (find-function 'bystar:website:doc:howto:new-document-desc)\n%%%\n")
    (insert (documentation 'bystar:website:doc:howto:new-document-desc))
    (goto-char (point-max))
    ;;; PlonePub Ends

    ;;; Gallery Begins
    (insert "%%%\n%%% (find-function 'bystar:web:doc:howto:gallery-desc)\n%%%\n")
    (insert (documentation 'bystar:web:doc:howto:gallery-desc))
    (goto-char (point-max))
    ;;; Gallery Ends

    ;;; Geneweb Begins
    (insert "%%%\n%%% (find-function 'bystar:web:doc:howto:geneweb-desc)\n%%%\n")
    (insert (documentation 'bystar:web:doc:howto:geneweb-desc))
    (goto-char (point-max))
    ;;; Geneweb Ends

    ;;; Music Begins
    (insert "%%%\n%%% (find-function 'bystar:music:doc:howto:all-desc)\n%%%\n")
    (insert (documentation 'bystar:music:doc:howto:all-desc))
    (goto-char (point-max))
    ;;; Music Ends

    ;;; Insert Begins
    (insert "%%%\n%%% (find-function 'bystar:insert:doc:howto:all-desc)\n%%%\n")
    (insert (documentation 'bystar:insert:doc:howto:all-desc))
    (goto-char (point-max))
    ;;; Insert Ends


    ;;; M17N Begins
    (insert "%%%\n%%% (find-function 'bystar:m17n:doc:howto:all-desc)\n%%%\n")
    (insert (documentation 'bystar:m17n:doc:howto:all-desc))
    (goto-char (point-max))
    ;;; M17N Ends

    ;;; Organizer Begins
    (insert "%%%\n%%% (find-function 'bystar:org:doc:howto:all-desc)\n%%%\n")
    (insert (documentation 'bystar:org:doc:howto:all-desc))
    (goto-char (point-max))
    ;;; Organizer Ends


    ;;; Sync Begins
    (insert "%%%\n%%% (find-function 'bystar:sync:doc:howto:all-desc)\n%%%\n")
    (insert (documentation 'bystar:sync:doc:howto:all-desc))
    (goto-char (point-max))
    ;;; Sync Ends

    ;;; BugsAndIdeas Begin
    (insert "%%%\n%%% (find-function 'blee:blee:doc:howto:bugs-and-todos-desc)\n%%%\n")
    (insert (documentation 'blee:blee:doc:howto:bugs-and-todos-desc))
    (goto-char (point-max))

    (insert "%%%\n%%% (find-function 'blee:blee:doc:howto:ideas-desc)\n%%%\n")
    (insert (documentation 'blee:blee:doc:howto:ideas-desc))
    (goto-char (point-max))
    ;;; BugsAndIdeas Ends

    (save-buffer)
    (kill-buffer)
    (message (format "File %s written"   (concat  module-doc:base-name module-doc:file-name)))

    )
  )


;; (blee:blee:doc:howto:build-all-doc-modules-and-visit)
(defun blee:blee:doc:howto:build-all-doc-modules-and-visit ()
  ""

  (interactive)
  (blee:blee:doc:howto:build-all-doc-modules)
  (find-file (concat  module-doc:base-name module-doc:file-name))
  (toggle-read-only)
  )


;; (blee:blee:doc:howto:full-build
(defun blee:blee:doc:howto:full-build ()
  "Web Publish"
  (interactive)
  (blee:blee:doc:howto:build-all-doc-modules)

  (setq commandLine
	(concat
	 "cd /lcnt/lgpc/bystar/permanent/usage/bleeDev; ./lcntProc.sh -i cleanAndFullBuild"))

  (lsip-run-command
   commandLine
   "localhost"
   (user-login-name)
   "nopasswd")
  )


;; (blee:blee:doc:howto:web-publish)
(defun blee:blee:doc:howto:web-publish ()
  "Web Publish"
  (interactive)
  (blee:blee:doc:howto:build-all-doc-modules)

  (setq commandLine
	(concat
	 "cd /lcnt/lgpc/bystar/permanent/usage/bleeDev; ./lcntProc.sh -i cleanAndPlone3FullPublish"))

  (lsip-run-command
   commandLine
   "localhost"
   (user-login-name)
   "nopasswd")
  )

;;;
;;;


;; (blee:blee:doc:howto:introduction-help)
(defun blee:blee:doc:howto:introduction-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:introduction-desc)
  )

;; (blee:blee:doc:howto:introduction-desc)
(defun blee:blee:doc:howto:introduction-desc ()
  "
\\section{Introduction}

See these other relevant documents.

Model doc. PLPC-180001

Stable Doc. 180004

This Development doc. 180005

\\subsection{Development Blee Manual Maintenance}

- Edit doc:howto:xx-desc entries in blee-doc-howto.el

- Web Publish from the menu.

"
  (interactive)
  )

;; (blee:blee:doc:howto:obtain-and-config-help)
(defun blee:blee:doc:howto:obtain-and-config-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:introduction-desc)
  )

;; (blee:blee:doc:howto:obtain-and-config-desc)
(defun blee:blee:doc:howto:obtain-and-config-desc ()
  "
\\section{Obtaining BLEE}

\\section{Configuring BLEE}

\\subsection{Emacs Configurations}

\\begin{verbatim}
(require 'mozmail)
(server-start)

Select default destination with M-x murl-sendLink-xxx


\\end{verbatim}
"
  (interactive)
  )


;; (blee:blee:doc:howto:browser:config-help)
(defun blee:blee:doc:howto:browser:config-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:browser:config-desc)
  )

;; (blee:blee:doc:howto:browser:config-desc)
(defun blee:blee:doc:howto:browser:config-desc ()
  "

\\subsection{Browser (Mozilla/Firefox) Configuration for Blee}

\\begin{verbatim}

CONFIGURATION
=============

Major Packages Used Are:
 - httpheaders:    mozmail.el plus about:config protocol ...
 - firemacs:       Emacs Keyboard Mapping
 - mozex:          Textbox editing, Source View, Send Email, Send Link (does not work)
 - It's All Text:  Textbox Editing
 - mozmail:        mozmail.el plus gnome prefered application
 - mozrepl:        Control the browser with javascript from inside

Live HTTP Headers
-----------------
--- View HTTP headers of a page and while browsing. (Used for Plone Reverse Engineering) ---
https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/
Click -- Add to Firefox

FIREMACS Installation
---------------------
--- Emacs Key Bindings for Mozilla/Firefox ---
download firemacs
https://addons.mozilla.org/en-US/firefox/addon/4141
Click -- Add to Firefox
Click -- Install Now
Click -- Restart Firefox
After Install Verify --  Firefox/Tools/Add-Ons/Extensions/Firemacs


plugin: It's All Text -- Text Box Editor (Replaces Mozex) -- Not for Firefox 4
------------------------------------------------------------------------------

FireFox4 Note: It's All Text Does not Work, Living Without For Now.

https://addons.mozilla.org/en-US/firefox/addon/its-all-text/contribute/roadblock/?src=addondetail&version=1.5

Tools -> It's All Text -> Preferences

    Editor=/usr/bin/emacsclient

When done with the buffer, C-X #


MOZREPL
-------

- http://wiki.github.com/bard/mozrepl/


Install the released version for Firefox 3 -- Click on Allow
Install version 1.1 beta for Firefox 4 -- Click on Allow


In Firefox go to Tools -> MozRepl -> Activate on Startup



View Sources Editor Specification (Firefox's Own Configuration)
---------------------------------------------------------------

about:config

view_source.editor.external (toggle it -- right mouse)

view_source.editor.path (/usr/bin/emacsclient)  -- leave .editor.args empty


Send Link -- For MOZMAIL -- On The Browser Side:
------------------------------------------------

On The Desktop of the target machine -- NOT REMOTELEY

Go To:  Gnome (Desktop) -> System -> Preferences -> Preferred Applications == Mail Reader Custom
   Command: /opt/public/osmt/bin/lcaMozillaProc.sh -p url=%s -i SendLink
   Select Run in Terminal

FireFox4 Note: The above does now work on Ubuntu 11.04 with FF4
Likely buggy software. Have tried about:config network.protocol and
gconf-edit without success.
Instead do the following:

In FF4  Edit->Preferences->Applications
   Locate mailto  Change to Always ask.
   When asked, specify /opt/public/osmt/bin/bx-mailto
   Then set it to don't ask.

TESTING YOUR BROWSER ENVIRONMENT:
---------------------------------

A) (FIREMACS) Emacs Key Bindings
   Try C-s instead of find

B) Edit a Box
   Should See The (edit) option under the box

C) View Sources
   View > Page Source  (make sure that (server-start) was done on emacs side)
   Should Throw you in emacs

D) MozRepl

E) (MOZMAIL)
   1- On The Emacs side run M-x server-start -- (server-start)
   2) Get Some Sample Addresses From
      http://mc-computing.com/HTML_Examples/MailTo.htm
   3) Click on one of the mailto: addresses

USEFUL INFO:

http://kb.mozillazine.org/About:config_Entries

OBSOLETED - JUNKYARD - HISTORIC:
================================

Plugin: MOZEX -- OBSOLETED by it's all text
-------------------------------------------
http://mozex.mozdev.org/installation.html
## (Not Normally Used )http://mozex.mozdev.org/development.html

Under *NIX installation
Click -- here
Click -- ALLOW
Click -- Install Now
Click -- Restart Firefox

After Install Verify -- Firefox/Tools/Add-Ons/Extensions/Mozex 1.9.9
After Restart
Right Mouse Click
Mozex-Configration
Textarea
    Text editor: /usr/bin/emacsclient.emacs-snapshot %t
Source
    Source editor: /usr/bin/emacsclient.emacs-snapshot %t
close window

B) (MOZEX)
   1- On The Emacs side run M-x server-start -- (server-start)
   2- On The Browser Side -- Right Mouse Click - Mozex - View Page Source

\\end{verbatim}

"
  (interactive)
  )


;; (blee:blee:doc:howto:desktop:config-help)
(defun blee:blee:doc:howto:desktop:config-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:desktop:config-desc)
  )

;; (blee:blee:doc:howto:desktop:config-desc)
(defun blee:blee:doc:howto:desktop:config-desc ()
  "

\\subsection{Browser (Mozilla/Firefox) Configuration for Blee}

\\begin{verbatim}

***  2.2.1)  Gnome Configs
****     1) Screen Saver 
	    System > Preferences > Screensaver 
	       Uncheck Lock Screen 
	       Check   Activate Screen
	       15 minutes

****     2) Power Management
	    System > Preferences > Power Management
	       Uncheck Dim When Idle

****     3) Send Link -- For MOZMAIL -- On The Browser Side:
            On The Desktop of the target machine -- NOT REMOTELEY
            Go To:  Gnome (Desktop) -> System -> Preferences -> Preferred Applications == Mail Reader Custom
            Command: /opt/public/osmt/bin/lcaMozillaProc.sh -p url=%s -i SendLink
            Select Run in Terminal

****      4) Printer Setup

Taken from opPrHosts.sh

lcaCupsBinsPrep.sh -h -v -n showRun -s all -a fullUpdate

  For CUPS based systems use 
       System -> Administration -> Printing
       or if there are permission problems 
       Run as root
       /usr/bin/system-config-printer

          (Old -- Edit -> New -> Printer)
       Server -> New -> Printer1

       Network Printer
           (Old (LPR/LPD))
           AppSocket/HP JetDirect -- Host: 192.168.0.102
                (socket://192.168.0.102:9100)

       LaserJet 8000N
       
       1) Choose HP 8000 192.168.0.102
       2) HP
       3) HP 8000 en
       4) Duplexer + Envelope Feeder

       5) Printer Name:
              hp8000
          Description:
             HP 8000 with Duplexer
          Location 
             3610-up-2 -- 192.168.0.102

       Click on hp8000
          Print Test Page

\\end{verbatim}

"
  (interactive)
  )


;; (blee:blee:doc:howto:bugs-and-todos-help)
(defun blee:blee:doc:howto:bugs-and-todos-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:bugs-and-todos-desc)
  )


;; (blee:blee:doc:howto:introduction-desc)
(defun blee:blee:doc:howto:bugs-and-todos-desc ()
  "
\\section{Bugs and Todos}

Bugs and Todos go here.

"
  (interactive)
  )


;; (blee:blee:doc:howto:ideas-help)
(defun blee:blee:doc:howto:ideas-help ()
  ""
  (interactive)
  (describe-function 'blee:blee:doc:howto:ideas-desc)
  )


;; (blee:blee:doc:howto:ideas-desc)
(defun blee:blee:doc:howto:ideas-desc ()
  "

\\section{New Text}

New text will be captured here.

\\section{Ideas}

Ideas will be captured here.

And here we go.

"
  (interactive)
  )

;;;;; MAIL
;;;
;;;

;;
(defun bystar:mail:send:doc:howto:introduction-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:send:doc:howto:introduction-desc)
  )

;;
(defun bystar:mail:send:doc:howto:introduction-desc ()
  "
\\section{Sending Mail}

Introduction to Sending Mail. Weave in with the menus

\\subsection{Post Articles via Gmane}

\\begin{verbatim}

Get your authorization to post via Gmane
          o http://gmane.org/post.php
          o http://gmane.org/post-details.php


Subscribe to the list you want to post to i.e. that has nothing
      to do with Gmane and then disable mail delivery to you
      since it is not needed anymore because you get the
      information via Gmane and Gnus. If you do not disable it,
      you get every mail send to the ML (Mailing List) in
      question twice — once via Gmane as news and once send to
      your email address you made you subscription with. I would
      also recommend to disable the option which sends you your
      own postings to the list since it is also all on Gmane once
      you made a posting.

To finally post, visit the group you want to post a message to
and hit a if you want to write a new posting or use f
respectively F for followups.

\\end{verbatim}

"
  )

;;
(defun bystar:mail:doc:howto:introduction-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:doc:howto:introduction-desc)
  )

;;
(defun bystar:mail:doc:howto:introduction-desc ()
  "
\\section{Reading and Processing Mail}

Introduction to Reading and Processing Mail. Weave in with the menus.

\\begin{verbatim}

ByStar Multi-Address Multi-Mailbox Model
****************************************

Multi-Address
=============

Multiple Addresses for different purposes
to give out to direct communication based on
your model. 

Multiple Addresses to shape the texture of communication.


Multi-Mailbox
=============

Multiple Mailboxes to store relevant communication.

Address to Mailbox Mappings
===========================

A Task Oriented Guide To ByStar Gnus
************************************

* Service-Software Continum
===========================

 - Service
     - qmail
     - spamAssassin
     - courier Imap
 - Software (User Env)
     - qmail (user-env-resident-mta)
     - Gnus

* MESSAGE READING
===============

**Fresh  Start/ReStart
--------------------

 - bueMailManage.sh -h -v -n showRun -i gnusClearReset
 - \"^\" In Gnus/Groups -- Takes you to server
 - \"s\" In Servers -- scan gets you the groups list - but is not displayed
 - \"q\" In Servers -- takes you back
 - \"R\" In Gnus/Groups Restart Gnus
 - You Will Now See the Groups

**Organizing The Groups (Lists/Levels)
------------------------------------

 - To See All Groups -- Group \"INBOX\"
 - Sort Alphabetical

**Bringing New Mail
-----------------

  All in Gnus/Groups

 - \"g\" -- Bring in all groups
 - \"M-g\" -- bring in just this group
 - \"C-U <levelNu> g\" --

** Reading Mail (Ham Groups)
----------------------------

  All in Article Buffer

*** Identifying Spam (False Negatives)
######################################

 - \"M-d\" -- Will be tagged with '$'
 - Upon \"q\" (quit) -- Will be moved to training.spam

*** Mark As Read
################

 - \"d\" or \"C-u <num> d\"
  (gnus-summary-mark-as-read-forward N)

*** Mark For Deletion (Mark As Expirable)
#########################################

 - \"E\" or \"C-u <num> E\"
  (gnus-summary-mark-as-expirable N)
     E, M x, M e, <menu-bar> <Gnus> <Mark Various> <Set expirable mark>.

*** Force Deletions (Forever)
#############################

  (gnus-summary-expire-articles-now)

 <menu-bar> <Article> <Copy, move,... (Backend)> <Delete expirable articles> 

  bound to B C-M-e


*** Delete Forever (BackEnd)
#############################

  (gnus-summary-delete-article &optional N)
   <menu-bar> <Article> <Copy, move,... (Backend)> <Delete article>
   B DEL

  If N is negative, delete backwards.
  If N is nil and articles have been marked with the process mark,
  delete these instead.

*** Move To Different Folder
############################

 - \"B m\"

  Marking following by B m prompts for each but
  Ctl U num B m prompts only once

** Reading Mail (Spam Groups)
----------------------------

*** Identifying Ham
####################

 - \"M-d\" -- Will be tagged with '$'
 - Upon \"q\" (quit) -- Will be moved to training.spam

** Reading Mail (Mixed Spam/Ham Groups)
---------------------------------------

 - For Now, Same as Ham Groups

*** Creating New Folders
------------------------

 - bound to G m, <menu-bar> <Groups> <Foreign groups> <Make a foreign group...>
    (gnus-group-make-group NAME &optional METHOD ADDRESS ARGS ENCODED)

* Message Sending
=================

** Envelope Addresses (Ephemeral)
---------------------------------

 - envelope201001@...byname.net
 - ephemeral201001@
 - e201001@

* General
=========

Mailboxes are Spam protected
Normally spam should end up in
spam.detected.rare,often,usual

When reading real mail, when you note
spam, move it to training.spam

When scanning a spam.detected folder have bbdb
identify false positives.

Archives go in -extra.1.20000

\\end{verbatim}

\\subsection{Read Articles via Gmane}

\\begin{verbatim}

If you are with Gnus then visit the group buffer, type B, choose
nntp as protocol and news.gmane.org as news server. Then search
for whatever group you are interested in — note, you can use d
with point on that line to get a description. Then subscribe the
group with point on that line and u. After that quit the buffer
using q. Now you are subscribed to the mailing list you picked
via Gmane. I abandoned normal subscription to mailing list
completely in favor of Gmane since it is way easier to handle,
way faster to get things done and what is the most important
... I am confronted with a single unique UI (User Interface) no
matter what ML (Mailing List) I deal with.

\\end{verbatim}
"
  )

;; (bystar:mail:doc:howto:fdmb-names-help)
(defun bystar:mail:doc:howto:levels-policy-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:doc:howto:levels-policy-desc)
  )

;; (bystar:mail:doc:howto:fdmb-names-desc)
(defun bystar:mail:doc:howto:levels-policy-desc ()
  "
\\subsection{Gnus Level Facilities Summary}

\\begin{verbatim}
l    -- List all groups that have unread articles.
        With numeric prefix and lower.

L    -- List all groups With numeric prefix and lower.

A l  -- List all unread groups on a specific level.
        With a prefix, also list the groups with no unread articles.

S l -- Set the level group to LEVEL.

\\end{verbatim}

\\subsection{ByStar Gnus Level Conventions}

\\begin{verbatim}

0- unused

1- Urgent/Very Important:  text, urgent, mobile, exceptions

2- Important:  / Noraml / Usual (End-To-End) 
   Confirmation (Envelope) / Web Originated / Indirect / Form

3- Less Important: Reports/FYI/ Self Originated: Archives / References / Bookmarks /Sent /Record / Public Originated --

4: Lists Primary

5: Spam -- And Related To Spam

6- Gmane and News Groups

7- Archives

8- Zombie

9- Killed

\\end{verbatim}

\\subsection{ByStar BFDM Gnus Level Assignments}

\\subsubsection{BFDM Gnus Level 1 -- Urgent / Very Important}

S l 1 -- Set the level group to 1.

\\begin{verbatim}
nnimap+bystar.000000:INBOX.urgent
nnimap+bystar.000000:INBOX.text
nnimap+bystar.000000:INBOX.exception
nndraft:drafts
nnimap+bystar.000000:INBOX.form
nnimap+bystar.000000:INBOX.activism
nnimap+bystar.000000:INBOX.desk
nnimap+bystar.000000:INBOX.family
nnimap+bystar.000000:INBOX.friend
nnimap+bystar.000000:INBOX.personal
nnimap+bystar.000000:INBOX
nnimap+bystar.000000:INBOX.job
nnimap+bystar.000000:INBOX.school
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 2 -- Important}

S l 2 -- Set the level group to 2.

\\begin{verbatim}
nnimap+bystar.000000:INBOX.envelope.old
nnimap+bystar.000000:INBOX.forsale
nnimap+bystar.000000:INBOX.mobile
nnimap+bystar.000000:INBOX.null
nnimap+bystar.000000:INBOX.test
nnimap+bystar.000000:INBOX.web
nnimap+bystar.000000:INBOX.confirmation
nnimap+bystar.000000:INBOX.envelope.current
nnimap+bystar.000000:INBOX.indirect
nnimap+bystar.000000:INBOX.system
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 3 -- Less Important}

S l 3 -- Set the level group to 3.

\\begin{verbatim}
nnimap+bystar.000000:INBOX.fyi
nnimap+bystar.000000:INBOX.weblog
nnimap+bystar.000000:INBOX.AlmostJunk
nnimap+bystar.000000:INBOX.Sent
nnimap+bystar.000000:INBOX.bookmark
nnimap+bystar.000000:INBOX.fax
nnimap+bystar.000000:INBOX.vendor
nnimap+bystar.000000:INBOX.public
nnimap+bystar.000000:INBOX.record
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 4 -- Subscribed Mailing Lists}

S l 4 -- Set the level group to 4.

\\begin{verbatim}
nnimap+bystar.000000:INBOX.LIST.org-freeprotocols.rim-6219694
nnimap+bystar.000000:INBOX.LIST.general
nnimap+bystar.000000:INBOX.LIST.net-payk.iran-news
nnimap+bystar.000000:INBOX.LIST.org-emsd.announce
nnimap+bystar.000000:INBOX.LIST.org-emsd.interest
nnimap+bystar.000000:INBOX.LIST.org-esro.announce
nnimap+bystar.000000:INBOX.LIST.org-esro.esro-spec
nnimap+bystar.000000:INBOX.LIST.org-esro.interest
nnimap+bystar.000000:INBOX.LIST.org-freeprotocols.announce
nnimap+bystar.000000:INBOX.LIST.org-freeprotocols.interest
nnimap+bystar.000000:INBOX.LIST.org-gslug.general
nnimap+bystar.000000:INBOX.LIST.org-leapforum.announce
nnimap+bystar.000000:INBOX.LIST.org-sasag.general
nnimap+bystar.000000:INBOX.LIST.org-seattleplone.general
nnimap+bystar.000000:INBOX.LIST.org-vorde.announce
nnimap+bystar.000000:INBOX.LIST.records
nnimap+bystar.000000:INBOX.lists.misc
nnimap+bystar.000000:INBOX.LIST.net-payk.pnw-iranians.mmaInbox
nnimap+bystar.000000:INBOX.LIST.org-emsd.emsd-spec
nnimap+bystar.000000:INBOX.LIST.org-ietf.announce
nnimap+bystar.000000:INBOX.LIST.org-ietf.discussion
nnimap+bystar.000000:INBOX.LIST.org-leapforum.interest
nnimap+bystar.000000:INBOX.LIST.org-vorde.interest
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 5 -- Spam Detected / Training}

S l 5 -- Set the level group to 5.

\\begin{verbatim}
nnimap+bystar.000000:INBOX.spam.detected.rare
nnimap+bystar.000000:INBOX.spam.detected.usual
nnimap+bystar.000000:INBOX.training.spam
nnimap+bystar.000000:INBOX.training.ham
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 6 -- GMANE / News Groups}

S l 6 -- Set the level group to 6.

\\begin{verbatim}
\\end{verbatim}

\\subsubsection{BFDM Gnus Level 7 -- Static Archives}

S l 7 -- Set the level group to 7.

\\begin{verbatim}
\\end{verbatim}

"
  (interactive)
  )


;; (bystar:mail:doc:howto:fdmb-names-help)
(defun bystar:mail:doc:howto:fdmb-names-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:doc:howto:fdmb-names-desc)
  )

;; (bystar:mail:doc:howto:fdmb-names-desc)
(defun bystar:mail:doc:howto:fdmb-names-desc ()
  "
\\subsection{Address to Final Delivery Mail Box (FDMB) Mapping}

\\subsubsection{Address and Fdmb Purposes}

\\begin{verbatim}
* Syntax
========
  - address@
  - [fdmb]  -- no spam protection
  - (fdmb)  -- spam protected
  - <level> --

** fdmb to address mapping and purposes
---------------------------------------

[.]       main@
           Purpose:

[test]    test@
           Purpose:

[text]    text@
           Purpose:

[school]    kid@ kids@ shs@ tillicum@
           Purpose:
\\end{verbatim}
"
  (interactive)
  )



;; (bystar:mail:doc:howto:spam-proc-help)
(defun bystar:mail:doc:howto:spam-proc-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:doc:howto:spam-proc-desc)
  )

;; (bystar:mail:doc:howto:spam-proc-desc)
(defun bystar:mail:doc:howto:spam-proc-desc ()
  "
\\subsection{Spam and Ham Identification and Processing}

\\subsubsection{Terminology}

False Positive (legitimate message tagged spam)

In programs used to filter spam, a false positive is a legitimate message mistakenly marked as spam.

False Negative (Spam that passed through)

\\subsubsection{Spam Detection Model}

Each addresses .qmail, determines (1) the FDMB (2) be subject to spam processing or not.

For example: 
\\begin{verbatim}
 .qmail-office: | forward fdmb-main-despam@mohsen.1.banan.byname.net
\\end{verbatim}

Then the FDMBs .qmail tags the message with spamassassin tags and 
passes it to maildrop.

\\begin{verbatim}
 .qmail-fdmb-main-despam: |  preline spamc | /usr/bin/maildrop .maildrop-fdmb-main-despam
\\end{verbatim}

If it is tagged as spam it is put in ByStarMailDir/spam.detected.{rare,often,usual}.

If it is tagged as ham it is put in a despammed ByStarMailDir/${FDMB}

\\subsubsection{False Negative Re-Training (Spam in despamed FDMB)}

When you see spam in a despamed FDMB

\\begin{verbatim}
*** Identifying Spam (False Negatives)
######################################

 - \"M-d\" -- Will be tagged with '$'
 - Upon \"q\" (quit) -- Will be moved to training.spam
\\end{verbatim}

Then on the server, run or wait for cron to run it next time:

\\begin{verbatim}
bystarSpamAdmin.sh -p ri=root:files -p bystarUid=sa-20000 -i spamLearnMaildir training.spam
\\end{verbatim}

From then on, you won't be seeing that particular type of spam.


\\subsubsection{False Positives Re-Training (Ham in spam.detected. )}

So, every so often you should visit you spam detected folders
to look for false positives. ByStar is designed for this to be 
highly unlikely -- but it is possible. Your detected spam folders are:
spam.detected.rare -- spam.detected.often -- spam.detected.usual

\\begin{verbatim}
*** Identifying Ham (False Positives)
######################################

 - Visit spam.detected.rare
 - Everything will be marked as spam
 - Look for the particular emails that you suspect were mistagged
 - Upon \"q\" (quit) -- Will be moved to training.ham
\\end{verbatim}

Then on the server, run or wait for cron to run it next time:

\\begin{verbatim}
bystarSpamAdmin.sh -p ri=root:files -p bystarUid=sa-20000 -i spamLearnMaildir training.ham
\\end{verbatim}

From then on, you won't be seeing that particular type of message mistaken for spam.

"
  (interactive)
  )

;; (bystar:mail:doc:howto:maintenance-help)
(defun bystar:mail:doc:howto:maintenance-help ()
  ""
  (interactive)
  (describe-function 'bystar:mail:doc:howto:maintenance-desc)
  )

;; (bystar:mail:doc:howto:maintenance-desc)
(defun bystar:mail:doc:howto:maintenance-desc ()
  "
\\subsection{Maintenance And Archiving}

\\subsubsection{Large Folders Cleanup }

B m  (Move) to Almost Junk

\\subsubsection{Browser Interface Garbage Cleaning}

\\begin{verbatim}

- In folder xxx do an expounge.

\\end{verbatim}


"
  (interactive)
  )


;;;; SLEFPUB
;;;
;;;


;;
(defun bystar:selfpub:doc:howto:introduction-help ()
  ""
  (interactive)
  (describe-function 'bystar:selfpub:doc:howto:introduction-desc)
  )

;;
(defun bystar:selfpub:doc:howto:introduction-desc ()
  "
\\section{Blee Self Publication Facilities}

Introduction to Blee Self Publication Facilities. Weave in with the menus.
"
  )


;; (bystar:selfpub:doc:howto:new-document-help)
(defun bystar:selfpub:doc:howto:new-document-help ()
  ""
  (interactive)
  (describe-function 'bystar:selfpub:doc:howto:new-document-desc)
  )


;; (bystar:selfpub:doc:howto:fdmb-names-desc)
(defun bystar:selfpub:doc:howto:new-document-desc ()
  "
\\subsection{Creating a New Lcnt Document}

A- Decide on where the document will reside in the /lcnt hierarchy.
    e.g., /lcnt/lgpc/bystar/permanent/usage/bleeDev

B- cd there and decide on what languages you want to include in
  this doc, en, en+fa, and what formats art+pres you want.

B.1- Then if you want to auto assign the lcnt number just run:

lcnLcntGens.sh -n showRun -p cntntRawHome=. -p srcForms=\"art+pres\" -p srcLangs=\"en\" -i baseFullStart

B.2- If you want to hand assign the lcnt number:

lcnLcntGens.sh -n showRun -p cntntRawHome=. -p srcForms=\"art+pres\" -p srcLangs=\"en\" -i baseBlankStartSteps

Follow the steps as presented.

C- Edit the LCNT-INFO parameters -- typiaclly with:

lcntProc.sh  -i editLcntInfo mainTitle shortTitle subTitle subSubTitle description

D- Expand dblocks based on LCNT-INFO

lcntProc.sh  -i dblockUpdateFile articleEn.ttytex presentationEn.ttytex artPresBodyEn.tex

E- You can now process and adit your document

lcntProc.sh -i  fullBuild

\\end{verbatim}

\\subsubsection{Add The New Document Base To CVS Tree}

\\begin{verbatim}
  - cd to the parent directory and weave in the new document in its lcntProc.sh

  - Run a cleanTree from that parent directory

  - Run cvs-update from that parent directory

  - Make sure that the registry with the new document assignment is also CVSed
\\end{verbatim}


"
  (interactive)
  )

;;;;
;;;; Plone Web Publishing
;;;
;;;


;;
(defun bystar:website:doc:howto:introduction-help ()
  ""
  (interactive)
  (describe-function 'bystar:website:doc:howto:introduction-desc)
  )

;;
(defun bystar:website:doc:howto:introduction-desc ()
  "
\\section{Blee Website Editing Facilities}

Introduction to Website Editing Facilities. Weave in with the menus.
"
  )

;; (bystar:website:doc:howto:fdmb-names-help)
(defun bystar:website:doc:howto:new-document-help ()
  ""
  (interactive)
  (describe-function 'bystar:website:doc:howto:fdmb-names-desc)
  )


;; (bystar:website:doc:howto:fdmb-names-desc)
(defun bystar:website:doc:howto:new-document-desc ()
  "
\\section{Editing ByStar WebSites -- ploneProc.sh}

\\begin{verbatim}

- Locate the bystarUid

\\end{verbatim}
"
  (interactive)
  )


;; (bystar:web:doc:howto:gallery-help)
(defun bystar:web:doc:howto:gallery-help ()
  ""
  (interactive)
  (describe-function 'bystar:web:doc:howto:gallery-desc)
  )


;; (bystar:web:doc:howto:gallery-desc)
(defun bystar:web:doc:howto:gallery-desc ()
  "
\\section{Gallery Upload}

\\begin{verbatim}

- Locate the bystarUid

\\end{verbatim}


\\subsection{Gallery Folder Upload}

\\begin{verbatim}

\\end{verbatim}

\\subsection{Gallery Upload From Android}

\\begin{verbatim}

\\end{verbatim}

\\subsection{Gallery Upload From SD Card}

\\begin{verbatim}

\\end{verbatim}
"
  (interactive)
  )


;; (bystar:web:doc:howto:geneweb-help)
(defun bystar:web:doc:howto:geneweb-help ()
  ""
  (interactive)
  (describe-function 'bystar:web:doc:howto:geneweb-desc)
  )

;; (bystar:web:doc:howto:geneweb-desc)
(defun bystar:web:doc:howto:geneweb-desc ()
  "
\\section{Geneweb Manage}

\\begin{verbatim}

\\end{verbatim}
"
  (interactive)
  )

;; (bystar:music:doc:howto:all-help)
(defun bystar:music:doc:howto:all-help ()
  ""
  (interactive)
  (describe-function 'bystar:music:doc:howto:all-desc)
  )

;; (bystar:music:doc:howto:all-desc)
(defun bystar:music:doc:howto:all-desc ()
  "
%{{{ ByStar Multi-Media Interface Facilities

\\part{ByStar Multi-Media Interface Facilities}

\\section{Bystar Music}

\\subsection{Obtaining Music}

\\begin{itemize}
\\item Extract from CD
\\item Download From Web
\\end{itemize}

\\subsection{Canonicalize and add to Repository}

  \\begin{itemize}
  \\item Classify - culture/genre/artist/album/songName
    Culture is one of (int) for international,
    2 letter country code or region name.
  \\item id3 tag -- id3tool, id3v2

  \\item canonicalize -format and volume

  \\item place in repository using culture/genre/artist/album/songName

  \\end{itemize}

\\subsection{Music Player Tools}

  \\begin{itemize}
  \\item mplayer
  \\item emms
  \\item mpd
  \\item album art
  \\item lyrics
  \\item notes
  \\end{itemize}

\\subsection{EMMS Mode}

  \\begin{itemize}
  \\item Refer to relevant bystar elisp modules
  \\end{itemize}

\\subsubsection{EMMS PlayList Generation}

  \\begin{itemize}
  \\item Make sure that ~/.emms-cache is deleted if /uniform/music hierarchy was
    modified.
  \\item ByStar Music Repository = /uniform/Audio
  \\item ByStar EMMS PlayLists = ~/BUE/PlayLists
  \\item mkdir -p ~/BUE/PlayLists/IR
  \\item (emms-playlist-current-clear)
  \\item M-x emms-add-directory-tree -- /uniform/Audio/IR
  \\item M-x emms-playlist-save -- native -- ~/BUE/PlayLists/IR/All.emms
  \\end{itemize}

And here we explain what is necessary


\\subsubsection{EMMS Scoring}

  \\begin{itemize}
  \\item ByStar EMMS Score File = ~/BUE/emms/
  \\end{itemize}

\\subsection{PlayList Generation}

Stored in bystarAcct/BUE/Playlists

  \\begin{itemize}
  \\item fapg
  \\item 00AudioProc.sh
  \\item emms Based
  \\end{itemize}

\\subsection{Listening (personal)}

  \\begin{itemize}
  \\item scoring
  \\item playlists
  \\item comments/notes
  \\end{itemize}

\\subsection{Exporting Music}

  \\begin{itemize}
  \\item to a CD
  \\item Subset for Car Listening
  \\end{itemize}

\\subsubsection{Burning Music CDs}

  \\begin{itemize}
  \\item make sure that ~/BUE/PlayLists/CD-Burn is in place
  \\item Create your playlist
  \\item Save your playlist to ~/BUE/PlayLists/CD-Burn/current.m3u
  \\item lcaAudioManage.sh -p playlist=\"~/BUE/PlayLists/CD-Burn/current.m3u\" -i cdBurn
  \\end{itemize}

%}}}

"
  (interactive)
  )




;; (bystar:insert:doc:howto:all-help)
(defun bystar:insert:doc:howto:all-help ()
  ""
  (interactive)
  (describe-function 'bystar:insert:doc:howto:all-desc)
  )

;; (bystar:insert:doc:howto:all-desc)
(defun bystar:insert:doc:howto:all-desc ()
  "
%{{{ ByStar insert Facilities

\\part{ByStar Insert / Template / Abbrev /DBlock Facilities}

\\section{Bystar Insert}

\\subsection{Moded / Language}

  \\begin{itemize}
  \\item NOTYET
  \\end{itemize}

\\section{Bystar Templates / Tempo}

\\subsection{Moded / Language}

  \\begin{itemize}
  \\item NOTYET
  \\end{itemize}

\\section{Bystar Abbrev / Dynamic Abbrev}

\\subsection{Dynamic Abbrev}

  \\begin{itemize}
  \\item NOTYET
  \\end{itemize}

\\section{Bystar Dynamic Blocks}

\\subsection{Dynamic Blocks}

  \\begin{itemize}
  \\item NOTYET
  \\end{itemize}

%}}}
"
  (interactive)
  )

;; (bystar:m17n:doc:howto:all-help)
(defun bystar:m17n:doc:howto:all-help ()
  ""
  (interactive)
  (describe-function 'bystar:m17n:doc:howto:all-desc)
  )

;; (bystar:m17n:doc:howto:all-desc)
(defun bystar:m17n:doc:howto:all-desc ()
  "
%{{{ ByStar m17n Facilities

\\part{ByStar Multi-Langualization Facilities}

\\section{Bystar M17n}

\\subsection{Farsi/Persian}

  \\begin{itemize}
  \\item Dictionary
  \\end{itemize}

%}}}
"
  (interactive)
  )


;; (bystar:org:doc:howto:all-help)
(defun bystar:org:doc:howto:all-help ()
  ""
  (interactive)
  (describe-function 'bystar:org:doc:howto:all-desc)
  )

;; (bystar:org:doc:howto:all-desc)
(defun bystar:org:doc:howto:all-desc ()
  "
%{{{ ByStar Personal Organizer Facilities

\\part{ByStar Personal Organizer Facilities}

\\section{Bystar Emacs Personal Organization Environment}

\\subsection{Org Mode}

  \\begin{itemize}
  \\item pointer to org mode docs and sites.
  \\end{itemize}

\\subsubsection{ToDo Lists}

  \\begin{itemize}
  \\item pointer to org mode docs and sites.
  \\end{itemize}

\\subsection{Address Book: bbdb}

  \\begin{itemize}
  \\item pointer to org mode docs and sites.
  \\end{itemize}

\\subsection{Calendar}

  \\begin{itemize}
  \\item pointer to org mode docs and sites.
  \\end{itemize}

%}}}
"
  (interactive)
  )


;; (bystar:sync:doc:howto:all-help)
(defun bystar:sync:doc:howto:all-help ()
  ""
  (interactive)
  (describe-function 'bystar:Personal Syncanization:doc:howto:all-desc)
  )

;; (bystar:sync:doc:howto:all-desc)
(defun bystar:sync:doc:howto:all-desc ()
  "

%{{{ ByStar Sync Facilities:

\\part{ByStar Sync Facilities}

\\section{cvs and svn}

%}}}
"
  (interactive)
  )




(provide 'blee-doc-howto)
