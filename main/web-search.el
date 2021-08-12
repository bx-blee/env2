;;; The custom search URLs
(defvar *internet-search-urls*
 (quote ("http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
         "http://en.wikipedia.org/wiki/Special:Search?search=")))

(defun search-in-google (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")))
  (search-in-internet arg)
  )

(defun search-in-dehkhoda (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://www.loghatnaameh.org/dehkhodasearchresult-fa.html?searchtype=0&word=%s")))
  (search-in-internet arg)
  )

(defun search-in-wikipedia (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://en.wikipedia.org/wiki/Special:Search?search=")))
  (search-in-internet arg)
  )

;;; (search-in-dict-en-fa 1)
(defun search-in-dict-en-fa (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://farsilookup.com/e2p/seek.jsp?lang=fa&word=%s")))
  (search-in-internet arg)
  )

;;; (search-in-dict-fa-en 1)
(defun search-in-dict-fa-en (arg)
  (interactive "p")
  (setq *internet-search-urls*  (quote ("http://farsilookup.com/p2e/seek.jsp?lang=fa&word=%s")))
  (search-in-internet arg)
  )

;;; "http://www.farsidic.com/")

;;; Search a query on the Internet using the selected URL.
(defun search-in-internet (arg)
 "Searches the internet using the ARGth custom URL for the marked text.

If a region is not selected, prompts for the string to search on.

The prefix number ARG indicates the Search URL to use. By default the search URL at position 1 will be used."
 (interactive "p")

 ;; Some sanity check.
 (if (> arg (length *internet-search-urls*))
      (error "There is no search URL defined at position %s" arg))

  (let ((query                          ; Set the search query first.
    (if (region-active-p)
      (buffer-substring (region-beginning) (region-end))
    (read-from-minibuffer "Search for: ")))

  ;; Now get the Base URL to use for the search
  (baseurl (nth (1- arg) *internet-search-urls*)))

  ;; Add the query parameter
  (let ((url
    (if (string-match "%s" baseurl)
      ;; If the base URL has a %s embedded, then replace it
         (replace-match query t t baseurl)
    ;; Else just append the query string at end of the URL
      (concat baseurl query))))
 
   (message "Searching for %s at %s" query url)
   ;; Now browse the URL
   (browse-url url))))

(provide 'web-search)
