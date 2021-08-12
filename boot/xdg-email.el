;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-


(lambda () "
* A wrapper on top of browse-url-mail.
")


;; (xdp:email|act-on-url "'mailto:user@example.com'")
(defun xdp:email|act-on-url (<url)
  "This is the primary function to be used in xdg-email MimeType=x-scheme-handler/mailto.

The <url is typically in this format \"'mailto:user@example.com'\"
There is a single quote, which stops mailto: from being recognized by browse-url-mail.
The single quotes are inserted by %u of xdg machinary.

So, we remove the single quotes first and then act on $urlAsString.

The action on the url, need not just be browse-url-mail.
NOTYET, It is controllable by a function that can for example insert mailUrl into bbdb.
"
  (let* (
	 ($urlAsString (s-chop-suffix "'" (s-chop-prefix "'" <url)))	 
	 )
    ;;(message $urlAsString)    
    (browse-url-mail $urlAsString)    
  ))

(provide 'xdg-email)
