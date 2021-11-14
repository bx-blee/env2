;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;;
;;;

;;; (blee:blee:menu)
(defun bystar:mail:send:menu:define ()
  (easy-menu-define 
    bystar:mail:send:menu:definition 
    nil 
    "Global ByStar Send Mail Menu"
    '("ByStar Send Mail"
      ["Compose Message" compose-mail t]
      "---"
      ["Mail Sending Current Status" (message "NOTYET") t]  ;; Generate a help buffer, show smtpmail-queue-mail, current envelop
      "---"
      ["Off-line -- Queue Mail For Later" (setq smtpmail-queue-mail t) t]
      ["Send Queued Mail" (smtpmail-send-queued-mail) t]
      ["On-line -- Dont Queue -- Send Immediately" (setq smtpmail-queue-mail nil) t]
      "---"
      ("Select Originator Profie"
       ["Choose" notyet t]
       )
      ("Select Envelope Address"
       ["Choose" notyet t]
       ["Specify" notyet t]
       )
      ("Select Submission Agent"
       ["Emacs SMTP" notyet t]
       ["Resident MTA" notyet t]
       )
      "---"
      ("Compose In Primary Language (Globish)"
       ["office" (bystar:mail:compose:from "office") t]
       ["desk" (bystar:mail:compose:from "desk") t]
       ["friend" (bystar:mail:compose:from "friend") t]
       ["test" (bystar:mail:compose:from-test) t]
       )
      "---"
      ("Compose In Alternate Language (Farsi/Persian)"
       ["office" (bystar:mail:compose:alt:from "office") t]
       ["desk" (bystar:mail:compose:alt:from "desk") t]
       ["friend" (bystar:mail:compose:alt:from "friend") t]
       )
      "---"
      "---"
      ("Mail Send Help"
       ["Help: Mail Send Overview" (message "NOTYET") t]
       "---"
       ["Pointer: Emacs Message Manual" (message "NOTYET") t]
       "---"
       ["Kbd: F3 Key Bindings" bystar:mail:send:menu:global-kbd-help t]
       "---"
       ["RevDoc: Mail Send Intro" bystar:mail:send:doc:howto:introduction-help t]
       )
      ))
  )


;;(easy-menu-add-item nil '("Blee") 'bystar:mail:send:menu:definition "Blee Help")


;; (bystar:mail:send:menu:global-kbd)  
(defun bystar:mail:send:menu:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f3)] nil)

  (define-key global-map [(f3) (s)] 'compose-mail)

  ;;;
  ;;; Compose Email In Globish 
  ;;;
  (define-key global-map [(f3) (c)] nil)
  (define-key global-map [(f3) (c) (o) ] 'bystar:mail:compose:from-office)
  (define-key global-map [(f3) (c) (d) ] 'bystar:mail:compose:from-desk)
  (define-key global-map [(f3) (c) (f) ] 'bystar:mail:compose:from-friend)

  ;;;
  ;;; Compose Email In Alt Language
  ;;;
  (define-key global-map [(f3) (l)] nil)
  (define-key global-map [(f3) (l) (o) ] 'bystar:mail:compose:alt:from-office)
  (define-key global-map [(f3) (l) (d) ] 'bystar:mail:compose:alt:from-desk)
  (define-key global-map [(f3) (l) (f) ] 'bystar:mail:compose:alt:from-friend)


  (defun blee:activities:mailCompose () (interactive) (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/mailCompose"))
  (define-key global-map [(f3) (X) ] 'blee:activities:mailCompose)

  (define-key global-map [(f3) (\?)  ] 'bystar:mail:send:menu:global-kbd-help)
  (define-key global-map [(f3) (H)  ] 'bystar:mail:send:menu:global-kbd-help)
  )


;; (bystar:mail:send:menu:global-kbd-help)
(defun bystar:mail:send:menu:global-kbd-help ()
  "Display a  help"
  (interactive)
  (describe-bindings [(f3)])
  )


;;; (blee:blee:menu)
;;; (bystar:mail:menu:define)
(defun bystar:mail:menu:define ()
  (easy-menu-define 
    bystar:mail:menu:definition 
    nil 
    "Global ByStar Read Mail Menu"
    '("ByStar Read/Proc Mail"
      ["Read Mail" gnus t]
      "---"
      ["Subscribe to GMANE Groups" (gnus-group-browse-foreign-server (quote (nntp "news.gmane.org"))) t]
      "---"
      ("Read Gnus Groups at Level and Below"
       ["Level 1 (Urgent and/or Important)" (gnus-level-and-below-all-1:bx) t]
       ["Level 2 (Important)" (gnus-level-and-below-all-2:bx) t]
       ["Level 3 (Less Important)" (gnus-level-and-below-all-3:bx) t]
       ["Level 4 (Subscribed Mailing Lists)" (gnus-level-and-below-all-4:bx) t]
       ["Level 5 (Spam Detected/Training)" (gnus-level-and-below-all-5:bx) t]
       ["Level 6 (Gmane and News Groups)" (gnus-level-and-below-all-6:bx) t]
       ["Level 7 (Archives)" (gnus-level-and-below-all-7:bx) t]
       ["Level 8 (Zombie)" (gnus-level-and-below-all-8:bx) t]
       ["Level 9 (Killed)" (gnus-level-and-below-all-9:bx) t]
       )
      "---"
      ("Read Gnus Group at Level"
       ["Level 1 (Urgent and/or Important)" (gnus-level-1:bx) t]
       ["Level 2 (Important)" (gnus-level-2:bx) t]
       ["Level 3 (Less Important)" (gnus-level-3:bx) t]
       ["Level 4 (Subscribed Mailing Lists)" (gnus-level-4:bx) t]
       ["Level 5 (Spam Detected/Training)" (gnus-level-5:bx) t]
       ["Level 6 (Gmane and News Groups)" (gnus-level-6:bx) t]
       ["Level 7 (Archives)" (gnus-level-7:bx) t]
       ["Level 8 (Zombie)" (gnus-level-8:bx) t]
       ["Level 9 (Killed)" (gnus-level-9:bx) t]
       )
      "---"
      ("Frame's Windows And Colors Configuration"
       ["Wide" bystar:mail:display:frame-wide t]
       ["Basic" bystar:mail:display:frame-basic t]
       ["Gnus Faces/Colors" (bystar:mail:faces:background-dark) t]
       )
      "---"
      "---"
      ("Mail Read/Proc Help"
       ["Help: Mail Overview" (message "NOTYET") t]
       "---"
       ["Pointer: Gnus Manual" (message "NOTYET") t]
       ["Pointer: Emacs Message Manual" (message "NOTYET") t]
       "---"
       ["Kbd: F2 Key Bindings" bystar:mail:menu:global-kbd-help t]
       "---"
       ["RevDoc: Mail Read/Proc Intro" bystar:mail:doc:howto:introduction-help t] 
       ["RevDoc: ByStar Gnus Levels Policy" bystar:mail:doc:howto:levels-policy-help t]
       ["RevDoc: FDMB/Addrs Desc and Mappings" bystar:mail:doc:howto:fdmb-names-help t]
       ["RevDoc: Maintenance and Archiving" bystar:mail:doc:howto:maintenance-help t]
       ["RevDoc: Spam/Ham Detection/Training" bystar:mail:doc:howto:spam-proc-help t]
       )
      )
    )
  )


;;;(easy-menu-add-item nil '("Blee") 'bystar:mail:menu:definition "Blee Help")


;; (bystar:mail:menu:global-kbd)  
(defun bystar:mail:menu:global-kbd ()
  ""
  ;;(interactive)
  (define-key global-map [(f3)] nil)

  (define-key global-map [(f3) (f3) ] 'gnus)

  (define-key global-map [(f3) (\1) ] 'gnus-level-and-below-1:bx)
  (define-key global-map [(f3) (\2) ] 'gnus-level-and-below-2:bx)
  (define-key global-map [(f3) (\3) ] 'gnus-level-and-below-3:bx)
  (define-key global-map [(f3) (\4) ] 'gnus-level-and-below-4:bx)
  (define-key global-map [(f3) (\5) ] 'gnus-level-and-below-5:bx)
  (define-key global-map [(f3) (\6) ] 'gnus-level-and-below-6:bx)
  (define-key global-map [(f3) (\7) ] 'gnus-level-and-below-7:bx)
  (define-key global-map [(f3) (\8) ] 'gnus-level-and-below-8:bx)
  (define-key global-map [(f3) (\9) ] 'gnus-level-and-below-9:bx)


  ;;;
  ;;; List All At Level and Below
  ;;;
  (define-key global-map [(f3) (a)] nil)
  (define-key global-map [(f3) (a) (\1) ] 'gnus-level-and-below-all-1:bx)
  (define-key global-map [(f3) (a) (\2) ] 'gnus-level-and-below-all-2:bx)
  (define-key global-map [(f3) (a) (\3) ] 'gnus-level-and-below-all-3:bx)
  (define-key global-map [(f3) (a) (\4) ] 'gnus-level-and-below-all-4:bx)
  (define-key global-map [(f3) (a) (\5) ] 'gnus-level-and-below-all-5:bx)
  (define-key global-map [(f3) (a) (\6) ] 'gnus-level-and-below-all-6:bx)
  (define-key global-map [(f3) (a) (\7) ] 'gnus-level-and-below-all-7:bx)
  (define-key global-map [(f3) (a) (\8) ] 'gnus-level-and-below-all-8:bx)
  (define-key global-map [(f3) (a) (\9) ] 'gnus-level-and-below-all-9:bx)

  ;;;
  ;;; List All At Level
  ;;;
  (define-key global-map [(f3) (l)] nil)
  (define-key global-map [(f3) (l) (\1) ] 'gnus-level-1:bx)
  (define-key global-map [(f3) (l) (\2) ] 'gnus-level-2:bx)
  (define-key global-map [(f3) (l) (\3) ] 'gnus-level-3:bx)
  (define-key global-map [(f3) (l) (\4) ] 'gnus-level-4:bx)
  (define-key global-map [(f3) (l) (\5) ] 'gnus-level-5:bx)
  (define-key global-map [(f3) (l) (\6) ] 'gnus-level-6:bx)
  (define-key global-map [(f3) (l) (\7) ] 'gnus-level-7:bx)
  (define-key global-map [(f3) (l) (\8) ] 'gnus-level-8:bx)
  (define-key global-map [(f3) (l) (\9) ] 'gnus-level-9:bx)

  ;;;
  ;;; List Unread At Level
  ;;;
  (define-key global-map [(f3) (u)] nil)
  (define-key global-map [(f3) (u) (\1) ] 'gnus-unread-level-1:bx)
  (define-key global-map [(f3) (u) (\2) ] 'gnus-unread-level-2:bx)
  (define-key global-map [(f3) (u) (\3) ] 'gnus-unread-level-3:bx)
  (define-key global-map [(f3) (u) (\4) ] 'gnus-unread-level-4:bx)
  (define-key global-map [(f3) (u) (\5) ] 'gnus-unread-level-5:bx)
  (define-key global-map [(f3) (u) (\6) ] 'gnus-unread-level-6:bx)
  (define-key global-map [(f3) (u) (\7) ] 'gnus-unread-level-7:bx)
  (define-key global-map [(f3) (u) (\8) ] 'gnus-unread-level-8:bx)
  (define-key global-map [(f3) (u) (\9) ] 'gnus-unread-level-9:bx)

  ;;;
  ;;; Get New At Level
  ;;;
  (define-key global-map [(f3) (g)] nil)
  (define-key global-map [(f3) (g) (g) ] 'gnus-group-get-new-news-5:bx)
  (define-key global-map [(f3) (g) (\1) ] 'gnus-group-get-new-news-1:bx)
  (define-key global-map [(f3) (g) (\2) ] 'gnus-group-get-new-news-2:bx)
  (define-key global-map [(f3) (g) (\3) ] 'gnus-group-get-new-news-3:bx)
  (define-key global-map [(f3) (g) (\4) ] 'gnus-group-get-new-news-4:bx)
  (define-key global-map [(f3) (g) (\5) ] 'gnus-group-get-new-news-5:bx)
  (define-key global-map [(f3) (g) (\6) ] 'gnus-group-get-new-news-6:bx)
  (define-key global-map [(f3) (g) (\7) ] 'gnus-group-get-new-news-7:bx)
  (define-key global-map [(f3) (g) (\8) ] 'gnus-group-get-new-news-8:bx)
  (define-key global-map [(f3) (g) (\9) ] 'gnus-group-get-new-news-9:bx)

  (define-key global-map [(f3) (f)] nil)
  (define-key global-map [(f3) (f) (w) ]  'bystar:mail:display:frame-wide)
  (define-key global-map [(f3) (f) (b) ]  'bystar:mail:display:frame-basic)

  (define-key global-map [(f3) (w)] 'my-gnus-summary-view-html-alternative)

  (defun blee:activities:mailRead () (interactive) (blee:bnsm:panel-goto "/libre/ByStar/InitialTemplates/activeDocs/blee/mailRead"))
  (define-key global-map [(f3) (x) ] 'blee:activities:mailRead)

  (define-key global-map [(f3) (\?)  ] 'bystar:mail:menu:global-kbd-help)
  (define-key global-map [(f3) (h)  ] 'bystar:mail:menu:global-kbd-help)

  )

;; (bystar:mail:menu:global-kbd-help)
(defun bystar:mail:menu:global-kbd-help ()
  "Display a  help"
  (interactive)
  (describe-bindings [(f3)])
  )


(defun gnus-level-and-below-1:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 1)
  )

(defun gnus-level-and-below-2:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 2)
   (gnus-group-sort-groups-by-level)
  )

(defun gnus-level-and-below-3:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 3)
   (gnus-group-sort-groups-by-level)
  )

(defun gnus-level-and-below-4:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 4)
   (gnus-group-sort-groups-by-level)
  )

(defun gnus-level-and-below-5:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 5)
   (gnus-group-sort-groups-by-level)
  )

(defun gnus-level-and-below-6:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 6)
   (gnus-group-sort-groups-by-level)
  )


(defun gnus-level-and-below-7:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 7)
   (gnus-group-sort-groups-by-level)
  )


(defun gnus-level-and-below-8:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 8)
   (gnus-group-sort-groups-by-level)
  )


(defun gnus-level-and-below-9:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-groups 9)
   (gnus-group-sort-groups-by-level)
  )



(defun gnus-level-and-below-all-1:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 1)
  )

(defun gnus-level-and-below-all-2:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 2)
  )

(defun gnus-level-and-below-all-3:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 3)
   (gnus-group-list-groups 3)
  )

(defun gnus-level-and-below-all-4:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 4)
  )

(defun gnus-level-and-below-all-5:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 5)
  )

(defun gnus-level-and-below-all-6:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 6)
  )

(defun gnus-level-and-below-all-7:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 7)
  )

(defun gnus-level-and-below-all-8:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 8)
  )

(defun gnus-level-and-below-all-9:bx ()
  "List Groups at Level and Below"
  (interactive)
   (gnus-group-list-all-groups 9)
  )


(defun gnus-level-1:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 1 'ALL)
  )

(defun gnus-level-2:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 2 'ALL)
  )

(defun gnus-level-3:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 3 'ALL)
;;;  (gnus-group-list-level 3)
  )

(defun gnus-level-4:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 4 'ALL)
  )

(defun gnus-level-5:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 5 'ALL)
  )

(defun gnus-level-6:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 6 'ALL)
  )

(defun gnus-level-7:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 7 'ALL)
  )

(defun gnus-level-8:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 8 'ALL)
  )

(defun gnus-level-9:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 9 'ALL)
  )


(defun gnus-unread-level-1:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 1)
  )

(defun gnus-unread-level-2:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 2)
  )

(defun gnus-unread-level-3:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 3)
  )

(defun gnus-unread-level-4:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 4)
  )

(defun gnus-unread-level-5:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 5)
  )

(defun gnus-unread-level-6:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 6)
  )

(defun gnus-unread-level-7:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 7)
  )

(defun gnus-unread-level-8:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 8)
  )

(defun gnus-unread-level-9:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-list-level 9)
  )

;;;
;;; (gnus-group-get-new-news &optional ARG)
;;;

(defun gnus-group-get-new-news-1:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 1)
  )

(defun gnus-group-get-new-news-2:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 2)
  )

(defun gnus-group-get-new-news-3:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 3)
  )

(defun gnus-group-get-new-news-4:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 4)
  )

(defun gnus-group-get-new-news-5:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 5)
  )

(defun gnus-group-get-new-news-6:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 6)
  )

(defun gnus-group-get-new-news-7:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 7)
  )

(defun gnus-group-get-new-news-8:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 8)
  )

(defun gnus-group-get-new-news-9:bx ()
  "List Groups at Level"
  (interactive)
  (gnus-group-get-new-news 9)
  )


(provide 'bystar-mail-menu)
