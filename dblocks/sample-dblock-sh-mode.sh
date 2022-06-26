####+BEGIN: bx:dblock:menuChoice :types "unknownCommand"

####+END:

####+BEGIN: blee:bxPanel:runResult :style ("openBlank" "closeFull") :stdErr nil :comment "Suppress stdErr" :command "baddCommand"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "baddCommand")][baddCommand]] *|*  =Suppress stdErr= |
Last Executed at: 202206-20-18:14:59  by: bystar on: HSS-1005.bx
----------------------------
/bin/bash: line 1: baddCommand: command not found

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:blee:bxPanel:runResult)][dbFunc)]]  E|
_CommentEnd_
####+END:


####+BEGIN: bx:dblock:global:run-result :command "unknownCommand"
/bin/bash: line 1: unknownCommand: command not found

####+END:


####+BEGIN: bx:dblock:global:run-result-stdout :command "tail -5 /etc/passwd"
qmails:x:64012:64010::/var/lib/qmail:/bin/sh
runit-log:x:998:998:Created by dh-sysuser for runit:/nonexistent:/usr/sbin/nologin
_runit-log:x:997:997:Created by dh-sysuser for runit:/nonexistent:/usr/sbin/nologin
debian-spamd:x:123:133::/var/lib/spamassassin:/usr/sbin/nologin
courier:x:124:134::/var/lib/courier:/usr/sbin/nologin

####+END:
####+BEGIN: blee:bxPanel:runResult :comment "Example Of ls" :command "ls -ldt *"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "ls -ldt *")][ls -ldt *]] *|*  =Example Of ls= |
Last Executed at: 202206-20-18:14:59  by: bystar on: HSS-1005.bx
----------------------------
-rw-rw-r--  1 bystar bisos  30885 Jun 11 20:05 dblock-emacs-lisp.el
-rw-rw-r--  1 bystar bisos   2570 May 15 20:15 newFile2.el
-rw-rw-r--  1 bystar bisos   3219 May 15 17:49 newFile.el
-rw-rw-r--  1 bystar bisos  40714 May 14 22:47 dblock-global.el
drwxrwsr-x+ 2 bystar bisos   4096 May 14 18:43 inserts
-rw-rw-r--  1 bystar bisos   5640 May  1 15:18 dblock-blee-mgmt.el
-rw-rw-r--  1 bystar bisos 168699 Apr 10 11:50 dblock-lcnt-latex.el
-rw-rw-r--  1 bystar bisos  72641 Apr 10 11:50 dblock-lcnt-latex-new.el
-rw-rw-r--  1 bystar bisos  12729 Apr 10 11:50 dblock-lcnt-latex-panel.el
-rw-rw-r--  1 bystar bisos  30269 Apr 10 11:50 dblock-lcnt-latex-pres.el
-rw-rw-r--  1 bystar bisos  10096 Apr 10 11:50 dblock-lcnt-pres-panel.el
-rw-rw-r--  1 bystar bisos  10599 Apr 10 11:50 dblock-org-bnsm.el
-rw-rw-r--  1 bystar bisos   3667 Apr 10 11:50 dblock-org-common.el
-rw-rw-r--  1 bystar bisos 108688 Apr 10 11:50 dblock-org-general.el
-rw-rw-r--  1 bystar bisos  21781 Apr 10 11:50 dblock-org-iims.el
-rw-rw-r--  1 bystar bisos   5182 Apr 10 11:50 dblock-org-mailings.el
-rw-rw-r--  1 bystar bisos  17086 Apr 10 11:50 dblock-org-realms.el
-rw-rw-r--  1 bystar bisos   2881 Apr 10 11:50 dblock-ploneProc-bash.el
-rw-rw-r--  1 bystar bisos   3198 Apr 10 11:50 dblock-widget-example.el
-rw-rw-r--  1 bystar bisos    743 Apr 10 11:50 sample-dblock-emacs-lisp.el
-rw-rw-r--  1 bystar bisos      0 Apr 10 11:50 sample-dblock-latex-mode.tex
-rw-rw-r--  1 bystar bisos    631 Apr 10 11:50 sample-dblock-org-mode.org
-rw-rw-r--  1 bystar bisos   5829 Apr 10 11:50 sample-dblock-sh-mode.sh
-rw-rw-r--  1 bystar bisos 146902 Apr 10 11:50 t1-dblock-lcnt-latex.el
-rw-rw-r--  1 bystar bisos   6206 Apr 10 11:50 dblock-begin-examples.el
-rw-rw-r--  1 bystar bisos   3299 Apr 10 11:50 dblock-controller.el
-rw-rw-r--  1 bystar bisos    812 Apr 10 11:50 dblock-global-run-results.el
-rw-rw-r--  1 bystar bisos   8015 Apr 10 11:50 dblock-governor.el
-rw-rw-r--  1 bystar bisos  20260 Apr 10 11:50 dblock-iim-bash.el
-rw-rw-r--  1 bystar bisos  39676 Apr 10 11:50 dblock-iim-python.el
-rw-rw-r--  1 bystar bisos  20843 Apr 10 11:50 dblock-iims-panel.el
-rw-rw-r--  1 bystar bisos   3368 Apr 10 11:50 dblock-lcnt-bash.el
-rw-rw-r--  1 bystar bisos  27483 Apr 10 11:50 dblock-lcnt-latex-body.el
-rw-rw-r--  1 bystar bisos  21589 Apr 10 11:50 dblock-lcnt-latex-front-1210.el
-rw-rw-r--  1 bystar bisos  25057 Apr 10 11:50 dblock-lcnt-latex-front.el

* [[elisp:(org-shifttab)][<)]] E|_CommentEnd_
####+END:

####+BEGIN: blee:bxPanel:runResult :comment "Changing Date As Example" :command "date"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "date")][date]] *|*  =Changing Date As Example= |
Last Executed at: 202206-20-18:14:59  by: bystar on: HSS-1005.bx
----------------------------
Mon 20 Jun 2022 06:14:59 PM PDT

* [[elisp:(org-shifttab)][<)]] E|_CommentEnd_
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMailingProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedMailingProc.sh]] | 
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/blee/env2/dblocks/sample-dblock-sh-mode.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedMailingProc.sh -l $0 "$@" 
    exit $?
fi
####+END:
