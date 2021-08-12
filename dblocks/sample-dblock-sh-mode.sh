####+BEGIN: bx:dblock:menuChoice :types "unknownCommand"
New New! Here is a menu choice. The label is set by :tag, and the default item is
the child item that :value match the :value of the menu choice.
_Menu choices_ item

####+END:

####+BEGIN: blee:bxPanel:runResult :style ("openBlank" "closeFull") :stdErr nil :comment "Suppress stdErr" :command "baddCommand"
* [[elisp:(show-all)][->]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]     [[elisp:(org-cycle)][| *= Command Results: =* | ]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] /Suppress stdErr/ || [[elisp:(lsip-local-run-command "baddCommand")][baddCommand]] |

* [[elisp:(org-shifttab)][<-]] [[elisp:(describe-function 'org-dblock-write:blee:bxPanel:runResult)][dblock-func)]]  E|
####+END:


####+BEGIN: bx:dblock:global:run-result :command "unknownCommand"
/bin/bash: unknownCommand: command not found

####+END:


####+BEGIN: bx:dblock:global:run-result-stdout :command "tail -5 /etc/passwd"
cvsd:x:116:123:cvs pserver daemon:/var/lib/cvsd:/bin/false
ea-59019:x:59019:59000:ea-59019:/acct/smb/com/neda:/bin/false
ea-59009:x:59009:59000:ea-59009:/acct/smb/net/by-star:/bin/false
debian-tor:x:117:125::/var/lib/tor:/bin/bash
mysql:x:118:126:MySQL Server,,,:/var/lib/mysql:/bin/false

####+END:
####+BEGIN: blee:bxPanel:runResult :comment "Example Of ls" :command "ls -ldt *"
_CommentBegin_
* [[elisp:(show-all)][->]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]     [[elisp:(org-cycle)][| *= Results: =* | ]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] /Example Of ls/ || [[elisp:(lsip-local-run-command "ls -ldt *")][ls -ldt *]] |
Last Executed at: 201910-02-10:13:17  by: lsipusr on: bisp0024
----------------------------
-rw-rw-r-- 1 lsipusr employee   6453 Oct  2 10:12 #dblock-governor.el#
-rw-rw-r-- 1 lsipusr employee  23558 Oct  2 10:00 #dblock-org-general.el#
-rw-rw-r-- 1 lsipusr employee  23323 Oct  2 09:40 dblock-org-general.el
-rw-rw-r-- 1 lsipusr employee   6919 Oct  1 16:35 #sample-dblock-sh-mode.sh#
-rw-rw-r-- 1 lsipusr employee   6901 Oct  1 15:31 sample-dblock-sh-mode.sh
-rw-rw-r-- 1 lsipusr employee  20709 Sep 30 10:27 dblock-org-general.el~
-rw-rw-r-- 1 lsipusr employee    631 Sep 28 18:47 sample-dblock-org-mode.org
-rw-rw-r-- 1 lsipusr employee   6453 Sep 27 17:40 dblock-governor.el
-rw-rw-r-- 1 lsipusr employee   5700 Sep 22 12:38 dblock-begin-examples.el
-rw-rw-r-- 1 lsipusr employee 141109 Sep 22 12:38 dblock-lcnt-latex.el
-rw-rw-r-- 1 lsipusr employee  30830 Sep 21 17:14 dblock-global.el
-rw-rw-r-- 1 lsipusr employee   3236 Sep 21 12:13 dblock-controller.el
-rw-rw-r-- 1 lsipusr employee  20162 Aug 26 10:27 dblock-iim-python.el
-rw-rw-r-- 1 lsipusr employee  11633 Aug  8 14:29 dblock-iim-bash.el
-rw-rw-r-- 1 lsipusr employee    743 Jul 12 11:49 sample-dblock-emacs-lisp.el
-rw-rw-r-- 1 lsipusr employee  68029 Jun 12 10:58 dblock-lcnt-latex-new.el
-rw-rw-r-- 1 lsipusr employee  10563 Jun 12 10:37 dblock-emacs-lisp.el
-rw-rw-r-- 1 lsipusr employee  24066 Jun 12 09:30 dblock-lcnt-latex-front.el
-rw-rw-r-- 1 lsipusr employee  10217 Apr 20 13:29 dblock-org-bnsm.el
-rw-rw-r-- 1 lsipusr employee  20242 Apr 20 13:29 dblock-org-iims.el
-rw-rw-r-- 1 lsipusr employee   2867 Apr 20 13:29 dblock-ploneProc-bash.el
-rw-rw-r-- 1 lsipusr employee   3156 Apr 20 13:29 dblock-widget-example.el
-rw-rw-r-- 1 lsipusr employee      0 Apr 20 13:29 sample-dblock-latex-mode.tex
-rw-rw-r-- 1 lsipusr employee  19333 Apr 20 13:29 dblock-iims-panel.el
-rw-rw-r-- 1 lsipusr employee   3100 Apr 20 13:29 dblock-lcnt-bash.el
-rw-rw-r-- 1 lsipusr employee  26120 Apr 20 13:29 dblock-lcnt-latex-body.el
-rw-rw-r-- 1 lsipusr employee  20658 Apr 20 13:29 dblock-lcnt-latex-front-1210.el
-rw-rw-r-- 1 lsipusr employee  12062 Apr 20 13:29 dblock-lcnt-latex-panel.el
-rw-rw-r-- 1 lsipusr employee  26787 Apr 20 13:29 dblock-lcnt-latex-pres.el
-rw-rw-r-- 1 lsipusr employee   9702 Apr 20 13:29 dblock-lcnt-pres-panel.el
-rw-rw-r-- 1 lsipusr employee    798 Apr 20 13:29 dblock-global-run-results.el

* [[elisp:(org-shifttab)][<-]] [[elisp:(describe-function 'org-dblock-write:blee:bxPanel:runResult)][dblock-func)]]  E|
_CommentEnd_
####+END:

####+BEGIN: blee:bxPanel:runResult :comment "Changing Date As Example" :command "date"
* [[elisp:(show-all)][->]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]     [[elisp:(org-cycle)][| *= Results: =* | ]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] /Changing Date As Example/ || [[elisp:(lsip-local-run-command "date")][date]] |
Last Executed at: 201910-02-10:06:34  by: lsipusr on: bisp0024
----------------------------
Wed Oct  2 10:06:34 PDT 2019

* [[elisp:(org-shifttab)][<-]] [[elisp:(describe-function 'org-dblock-write:blee:bxPanel:runResult)][dblock-func)]]  E|
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMailingProc.sh"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedMailingProc.sh -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
####+END:
