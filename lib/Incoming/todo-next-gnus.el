

     (setq gnus-posting-styles
           '((".*" ;;default
              (name "Frank Schmitt")
              (organization "Hamme net, kren mer och nimmi")
              (signature-file "~/.signature"))
             ((message-news-p) ;;Usenet news?
              (address "mySpamTrap@Frank-Schmitt.invalid")
              (reply-to "hereRealRepliesOnlyPlease@Frank-Schmitt.invalid"))
             ((message-mail-p) ;;mail?
              (address "usedForMails@Frank-Schmitt.invalid"))
             ("^gmane" ;;this is mail, too in fact
              (address "usedForMails@Frank-Schmitt.invalid")
              (reply-to nil))
             ("^gmane\\.mail\\.spam\\.spamassassin\\.general$"
              (eval (set (make-local-variable 'message-sendmail-envelope-from)
                         "Azzrael@rz-online.de")))))

