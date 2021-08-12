;; 
;; bystar-dictem-lib.el
;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  DICTEM   --  ByStar Best of Bread in Dictionary Category
;;
;;  As of January 2011 the following packages were considered:
;; 
;;  dictionary.el
;;  lookup.el
;;  thesaurus.el
;;  dictem.el
;;
;; dictem was selected.
;;

;;; requires
;;; ########

(require 'dictem)
(require 'bystar-m17n-menu)

;; (bystar:dictem:all-defaults-set)
(defun bystar:dictem:all-defaults-set ()
  ""
  (interactive)


(autoload 'dictem-run-search "dictem" 
 "Asks a user about database name, search strategy and query,
creates new *dictem* buffer and
shows definitions in it." t)

(autoload 'dictem-run-match "dictem"  
"Asks a user about database name, search strategy and query,
creates new *dictem* buffer and
shows matches in it." t)


; For creating hyperlinks on database names and found matches.  Click on them
; with mouse-2
(add-hook 'dictem-postprocess-match-hook
          'dictem-postprocess-match)

; For highlighting the separator between the definitions found.  This also
; creates hyperlink on database names.
(add-hook 'dictem-postprocess-definition-hook
          'dictem-postprocess-definition-separator)

; For creating hyperlinks in dictem buffer that contains definitions.
(add-hook 'dictem-postprocess-definition-hook
          'dictem-postprocess-definition-hyperlinks)

; For creating hyperlinks in dictem buffer that contains information about a
; database.
(add-hook 'dictem-postprocess-show-info-hook
          'dictem-postprocess-definition-hyperlinks)


(setq dictem-use-user-databases-only t)



(setq dictem-user-databases-alist
      '(
        ("local:eng-eng" .
         ("dict://localhost/gcide"  ;  The Collaborative International
                                    ;  Dictionary of English
          ))

        ("local:eng-thesaurus" .
          ("dict://localhost/moby-thesaurus"     ;  WordNet
          ))

        ("local:eng-fra#full" .
         ("dict://localhost/gcide"  ;  The Collaborative International
                                   ;  Dictionary of English
          "dict://localhost/moby-thesaurus"     ;  WordNet
          "dict://localhost/jargon" ;  Jargon File
          "dict://localhost/foldoc" ;   The Free On-line Dictionary of Computing
          "dict://localhost/fd-eng-fra" ;   
          ))


        ("local:eng-fra" .
         ("dict://localhost/fd-eng-fra"  ;  English-French Freedict Dictionary
          ))

        ("local:fra-eng" .
         ("dict://localhost/fra-eng"  ;  English-French Freedict Dictionary
          ))

        ("local:eng-ara" .
         ("dict://localhost/eng-ara"  ;  English-Arabic Freedict Dictionary
          ))

        ("local:ara-eng" .
         ("dict://localhost/ara-eng"  ;  English-Arabic Freedict Dictionary
          ))

        ("org.dict:eng-eng" .
         ("dict://dict.org/gcide"  ;  The Collaborative International
                                   ;  Dictionary of English
          "dict://dict.org/wn"     ;  WordNet
          "dict://dict.org/vera"   ;  Virtual Entity of Relevant Acronyms
          "dict://dict.org/jargon" ;  Jargon File
          "dict://dict.org/foldoc" ;   The Free On-line Dictionary of Computing
          ))

        ("en-ru" .
         ("dict://mova.org/mueller7" ; mueller dictionary
          "dict://mova.org/magus"    ; new big en-ru dict
          "dict://mova.org/sc-abbr"  ; computer science abbreviation
          "dict://mova.org/korolew_en-ru"
          "dict://mova.org/sokrat_en-ru"
          "dict://mova.org/engcom"
          ))

        ("ru-en" .
          ("dict://mova.org/korolew_en-ru"
           "dict://mova.org/sokrat_en-ru"
           ))

        ("ru-ru" .
         ("dict://mova.org/brok_and_efr"
          "dict://mova.org/ozhegov"
          "dict://mova.org/ushakov"
          "dict://mova.org/dalf"
          "dict://mova.org/idioms"
          "dict://mova.org/beslov"
          ))
        ))

;; suis  vie life  الحياة


; Add to load-path variable a new directory with files of dictem
(add-to-list 'load-path "/usr/share/emacs/site-lisp/dictem");

; Loading dictem functions
(require 'dictem)

; Setting the server host and port
(setq dictem-server "localhost")
;(setq dictem-server "dict.org")
;(setq dictem-port   "2628")

; Code necessary to obtain database and strategy list
; from DICT server
(dictem-initialize)


; SEARCH = MATCH + DEFINE
; Ask for word, database and search strategy
; and show definitions found
;;(global-set-key [fxx] 'dictem-run-search)

; MATCH
; Ask for word, database and search strategy
; and show matches found
;;(global-set-key [fxx] 'dictem-run-match)

; DEFINE
; Ask for word and database name
; and show definitions found
;(global-set-key "\C-cd" 'dictem-run-define)


  (message "bystar:dictem:defaults-set -- Done." )
  )

;;
;; (dictem-run-define-at-point-with-database-bx "local:eng-thesaurus")
(defun dictem-run-define-at-point-with-database-bx (this-database)
  ""
  (dictem-run 'dictem-base-define
	       this-database
	       (thing-at-point 'word)
	       nil))
  
(defun dictem-thesarus-define-at-point-bx ()
  ""
  (interactive)
  (get 'blee:m17n:langs:sp: 'primary)
  (dictem-run-define-at-point-with-database-bx 
   (format "local:%s-thesaurus" (blee:m17n:langs:current-name-tag3)))
  )

(defun dictem-dictionary-define-at-point-bx ()
  ""
  (interactive)
  (dictem-run-define-at-point-with-database-bx 
   (format "local:%s-%s" (blee:m17n:langs:current-name-tag3) (blee:m17n:langs:current-name-tag3) ))
  )

(defun dictem-interpret-define-at-point-bx ()
  ""
  (interactive)
  (dictem-run-define-at-point-with-database-bx 
   (format "local:%s-%s" (blee:m17n:langs:current-name-tag3) (blee:m17n:langs:other-name-tag3)))
  )

(defun dictem-full-define-at-point-bx ()
  ""
  (interactive)
  (dictem-run-define-at-point-with-database-bx 
   (format "local:%s-%s#full" (blee:m17n:langs:current-name-tag3) (blee:m17n:langs:other-name-tag3)))
  )



;;
;; Bound to Shift F6 in beoe
;; (dictem-run-define-at-point-bx)
(defun dictem-run-define-at-point-bx ()
  ""
  (interactive)

  (setq this-database "local:eng-thesaurus")

  (dictem-run 'dictem-base-define
	       this-database
	       (thing-at-point 'word)
	       nil)

  ;; (dictem-run 'dictem-base-define
  ;; 	       dictem-last-database
  ;; 	       (thing-at-point 'word)
  ;; 	       nil)

;;(message "dictem-last-database=%s" dictem-last-database)

)

(provide 'bystar-dictem-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
