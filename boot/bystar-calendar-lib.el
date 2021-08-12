; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:calendar:all-defaults-set)
;;
;; bystar:calendar  

;;; requires
;;; ########

(setq holiday-bahai-holidays nil)

(require 'calendar)
(require 'cal-persia)
(require 'cal-islam)

(load "cal-moslem")

;; (bystar:calendar:all-defaults-set)
(defun bystar:calendar:all-defaults-set ()
  ""
  (interactive)

;;;(autoload 'diary-include-todo-file "diary-todo"
;;;  "Include `to do' list in diary.")
;;;(add-hook 'list-diary-entries-hook 'diary-include-todo-file t)

;;; CALENDAR MODE

;;(setq holiday-general-holidays nil)
;;(setq holiday-christian-holidays nil)
;;(setq holiday-hebrew-holidays nil)
;;(setq holiday-islamic-holidays nil)
  (setq holiday-bahai-holidays nil)
;;(setq holiday-oriental-holidays nil)

  
;; ByWhere Related Parameters For Bellevue, WA
;;

(setq calendar-latitude 47.611468)
(setq calendar-longitude -122.116173)
(setq calendar-location-name "Bellevue, WA")

(setq calendar-time-zone -480)
(setq calendar-standard-time-zone-name "PST")
(setq calendar-daylight-time-zone-name "PDT")

;;; Cal Tex Parameters
(setq cal-tex-diary t)

(calendar-frame-setup "two-frames")

;;; Order is important -- Should be done at this point
(display-time)

;; Appointment Parameters
(require 'appt)
;;(appt-initialize)
(add-hook 'diary-hook 'appt-make-list)
;;(add-hook 'diary-hook 'appt-diary-entries)

(setq appt-message-warning-time 20)  ;;; minutes

(setq appt-audible t)
(setq appt-visible t)
(setq appt-display-mode-line t)
(setq appt-msg-window t)
(setq appt-display-duration 10) ;; seconds

;;; NOTYET, set appts up, so that I also get an 
;;; email about them.
;;;(setq appt-announce-method 'newFunctionToBe Written)
(setq appt-announce-method 'appt-persistant-message-announce)

(appt-activate 1)

;;; More Diary Paramters
(setq view-diary-entries-initially t)
;;(setq view-diary-entries-initially nil)

(add-hook 'list-diary-entries-hook 'sort-diary-entries t)
;;(calendar)

;;(setq view-calendar-holidays-initially t)

(setq mark-diary-entries-in-calendar t)

(setq mark-holidays-in-calendar t)

;;(setq calendar-holiday-marker 'holiday-face)

;;(setq diary-entry-marker 'diary-face)

;;(setq calendar-load-hook nil)

;;(setq initial-calendar-window-hook nil)

(add-hook 'today-visible-calendar-hook 'calendar-star-date)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)


;;; DIARY MODE

(add-hook 'diary-display-hook 'fancy-diary-display)


;;;(add-hook 'list-diary-entries-hook 'sort-diary-entries nil)

;;; To Allow for file inclusion (e.g., todo) in diary
(add-hook 'list-diary-entries-hook 'include-other-diary-files)
(add-hook 'mark-diary-entries-hook 'mark-included-diary-files)

(setq number-of-diary-entries 7)

(setq diary-mail-days 7)
;;(setq european-calendar-style t)
(setq diary-mail-addr "urgent@mohsen.banan.1.byname.net")

;;; DIARY NOTYET, How do appts work?, Daily emails of 
;;; upcoming events, Connection to crontab, bbdb
;;; person's birthday and anniversary, ...
;;;

;;; Make sure that buffer calendar.tex exists
;(save-excursion (find-file "~/tmp/calendar.tex"))

;;; 23 changes -- NOTYET, needs cleaning up
(setq diary-display-function 'diary-fancy-display)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-list-entries-hook 'diary-sort-entries)


(save-excursion 
  (get-buffer-create "calendar.tex")
  (set-buffer "calendar.tex")
  (set-visited-file-name (expand-file-name "~/tmp/calendar.tex") t t)
  )


  (message "bystar:calendar:defaults-set -- Done." )
  )

(defun calendar-bahai-date-string (&optional date)
  "Disabling Bahai calendar"
  "")

;;;
;;; Should be done after  loading calendar
;;; 
(setq calendar-persian-month-name-array
      ["فروردین" "اردیبهشت" "خرداد" "تیر" "مرداد" "شهریور" "مهر" "آبان" "آذر" "دی" "بهمن" "اسفند" ]
      )

;;; Begin perso-arabic.el

(defun blee:translate|init ()
  "Create needed translation tables"

  ;;; latin to persian numbers table
  (let ((map '((?0 . ?۰)
               (?1 . ?۱)
               (?2 . ?۲)
               (?3 . ?۳)
               (?4 . ?۴)
               (?5 . ?۵)
               (?6 . ?۶)
               (?7 . ?۷)
               (?8 . ?۸)
               (?9 . ?۹))))
    (define-translation-table 'latin-persian-translation-table map))

  ;;; latin to arabic numbers table
  (let ((map '((?0 . ?٠)
               (?1 . ?١)
               (?2 . ?٢)
               (?3 . ?٣)
               (?4 . ?٤)
               (?5 . ?٥)
               (?6 . ?٦)
               (?7 . ?٧)
               (?8 . ?٨)
               (?9 . ?٩))))
    (define-translation-table 'latin-arabic-translation-table map))
  )

(blee:translate|init)


;;;
;;; (latin-to-persian "1399")
;;;
(defun latin-to-persian (inStr)
  (with-temp-buffer
    (insert inStr)
    (translate-region (point-min) (point-max) 'latin-persian-translation-table)
    (buffer-string)))


;;;
;;; (blee:translate|latin-to-persian "345")
;;;
(defun blee:translate|latin-to-persian (inStr)
  (with-temp-buffer
    (insert inStr)
    (translate-region (point-min) (point-max) 'latin-persian-translation-table)
    (buffer-string)))


;;;
;;; (blee:translate|latin-to-arabic "345")
;;;
(defun blee:translate|latin-to-arabic (inStr)
  (with-temp-buffer
    (insert inStr)
    (translate-region (point-min) (point-max) 'latin-arabic-translation-table)
    (buffer-string)))

;;; End perso-arabic.el


;;; (calendar-persian-to-absolute '(3 18 1339))

;;;(calendar-extract-day  (calendar-gregorian-from-absolute (calendar-persian-to-absolute '(3 18 1339))))
;;;(calendar-extract-month  (calendar-gregorian-from-absolute (calendar-persian-to-absolute '(3 18 1339))))
;;;(calendar-extract-year  (calendar-gregorian-from-absolute (calendar-persian-to-absolute '(3 18 1339))))


;;;
;;; (calendar--date-string)
;;;
(defun calendar-persian-date-string (&optional date)
  "String of Persian date of Gregorian DATE, default today."
  (let* ((persian-date (calendar-persian-from-absolute
                        (calendar-absolute-from-gregorian
                         (or date (calendar-current-date)))))
         (y (calendar-extract-year persian-date))
         (m (calendar-extract-month persian-date))
         (monthname (aref calendar-persian-month-name-array (1- m)))
         (day (latin-to-persian (number-to-string (calendar-extract-day persian-date))))
         (year (latin-to-persian (number-to-string y)))
         (month (number-to-string m))
         dayname)
    ;;; There is an invisible &rlm; in front of the %2s
    (mapconcat 'eval
	       '((format "‏%2s %s %4s"  day monthname year))
	       "")))

(defun diary-persian-date ()
  "Persian calendar equivalent of date diary entry."
  ;;;(format "Persian date: %s" (calendar-persian-date-string date))
  (format "DPD: %s" (calendar-persian-date-string date))  
  )

(defun calendar-persian-print-date ()
  "Show the Persian calendar equivalent of the selected date."
  (interactive)
  ;;(message "Persian date: %s"
  (message "CPD: %s"	   
           (calendar-persian-date-string (calendar-cursor-to-date t))))


;;;
;;; (calendar-islamic-date-string)
;;;
(defun calendar-islamic-date-string (&optional date)
  "String of Islamic date before sunset of Gregorian DATE.
Returns the empty string if DATE is pre-Islamic.
Defaults to today's date if DATE is not given.
Driven by the variable `calendar-date-display-form'."
  (let* ((calendar-month-name-array calendar-islamic-month-name-array)
        (islamic-date (calendar-islamic-from-absolute
                       (calendar-absolute-from-gregorian
                        (or date (calendar-current-date)))))
        (y (calendar-extract-year islamic-date))
        (m (calendar-extract-month islamic-date))
        (monthname (aref calendar-islamic-month-name-array (1- m)))
        (day (blee:translate|latin-to-arabic (number-to-string (calendar-extract-day islamic-date))))
        (year (blee:translate|latin-to-arabic (number-to-string y)))
        (month (number-to-string m))
        dayname)
	
    (if (< (calendar-extract-year islamic-date) 1)
        ""
      (progn
	;; There is an invisible &rlm; in front of the %2s
	(mapconcat 'eval
	       '((format "‏%2s %s %4s"  day monthname year))
	       "")))
    ))

(defun calendar-islamic-print-date ()
  "Show the Islamic calendar equivalent of the date under the cursor."
  (interactive)
  (let ((i (calendar-islamic-date-string (calendar-cursor-to-date t))))
    (if (string-equal i "")
        (message "Date is pre-Islamic")
      ;;(message "Islamic date (until sunset): %s" i))
      (message "CID: %s" i))    
    ))

(defun diary-islamic-date ()
  "Islamic calendar equivalent of date diary entry."
  (let ((i (calendar-islamic-date-string date)))
    (if (string-equal i "")
        "Date is pre-Islamic"
      ;;(format "Islamic date (until sunset): %s" i))))
      (format "DID: %s" i))))

(require 'calfw-cal)
;;;(require 'calfw-ical)
;;;(require 'calfw-howm)
(require 'calfw-org)

(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    ;;;(cfw:howm-create-source "Blue")  ; howm source
    (cfw:cal-create-source "blue") ; diary source
    ;;;(cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    ;;;(cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
   ))) 

;;;(my-open-calendar)

(setq cfw:fchar-junction ?╋
      cfw:fchar-vertical-line ?┃
      cfw:fchar-horizontal-line ?━
      cfw:fchar-left-junction ?┣
      cfw:fchar-right-junction ?┫
      cfw:fchar-top-junction ?┯
      cfw:fchar-top-left-corner ?┏
      cfw:fchar-top-right-corner ?┓)

;; (custom-set-faces
;;  '(cfw:face-title ((t (:foreground "#f0dfaf" :weight bold :height 2.0 :inherit variable-pitch))))
;;  '(cfw:face-header ((t (:foreground "#d0bf8f" :weight bold))))
;;  '(cfw:face-sunday ((t :foreground "#cc9393" :background "grey10" :weight bold)))
;;  '(cfw:face-saturday ((t :foreground "#8cd0d3" :background "grey10" :weight bold)))
;;  '(cfw:face-holiday ((t :background "grey10" :foreground "#8c5353" :weight bold)))
;;  '(cfw:face-grid ((t :foreground "DarkGrey")))
;;  '(cfw:face-default-content ((t :foreground "#bfebbf")))
;;  '(cfw:face-periods ((t :foreground "cyan")))
;;  '(cfw:face-day-title ((t :background "grey10")))
;;  '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
;;  '(cfw:face-annotation ((t :foreground "RosyBrown" :inherit cfw:face-day-title)))
;;  '(cfw:face-disable ((t :foreground "DarkGray" :inherit cfw:face-day-title)))
;;  '(cfw:face-today-title ((t :background "#7f9f7f" :weight bold)))
;;  '(cfw:face-today ((t :background: "grey10" :weight bold)))
;;  '(cfw:face-select ((t :background "#2f2f2f")))
;;  '(cfw:face-toolbar ((t :foreground "Steelblue4" :background "Steelblue4")))
;;  '(cfw:face-toolbar-button-off ((t :foreground "Gray10" :weight bold)))
;;  '(cfw:face-toolbar-button-on ((t :foreground "Gray50" :weight bold))))

(custom-set-faces
 '(cfw:face-title ((t (:foreground "#f0dfaf" :weight bold :height 2.0 :inherit variable-pitch))))
 '(cfw:face-header ((t (:foreground "#d0bf8f" :weight bold)))) 
 '(cfw:face-sunday ((t :foreground "orange" :background "black" :weight bold)))
 '(cfw:face-saturday ((t :foreground "yellow" :background "black" :weight bold)))
 '(cfw:face-holiday ((t :background "black" :foreground "red" :weight bold)))
 '(cfw:face-grid ((t :foreground "DarkGrey")))
 '(cfw:face-default-content ((t :foreground "yellow")))
 '(cfw:face-periods ((t :foreground "cyan")))
 '(cfw:face-day-title ((t :background "brown")))
 '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
 '(cfw:face-annotation ((t :foreground "green" :inherit cfw:face-day-title)))
 '(cfw:face-disable ((t :foreground "DarkGray" :inherit cfw:face-day-title)))
 '(cfw:face-today-title ((t :background "blue" :weight bold)))
 '(cfw:face-today ((t :background: "grey10" :weight bold)))
 '(cfw:face-select ((t :background "red")))
 '(cfw:face-toolbar ((t :foreground "blue" :background "magenta")))
 '(cfw:face-toolbar-button-off ((t :foreground "Gray50" :weight bold)))
 '(cfw:face-toolbar-button-on ((t :foreground "white" :weight bold))))

(setq cfw:render-line-breaker 'cfw:render-line-breaker-wordwrap)


(defun diary-schedule (m1 d1 y1 m2 d2 y2 dayname)
  "Entry applies if date is between dates on DAYNAME.  
    Order of the parameters is M1, D1, Y1, M2, D2, Y2 if
    `european-calendar-style' is nil, and D1, M1, Y1, D2, M2, Y2 if
    `european-calendar-style' is t. Entry does not apply on a history."
  (let ((date1 (calendar-absolute-from-gregorian
		(if european-calendar-style
		    (list d1 m1 y1)
		  (list m1 d1 y1))))
	(date2 (calendar-absolute-from-gregorian
		(if european-calendar-style
		    (list d2 m2 y2)
		  (list m2 d2 y2))))
	(d (calendar-absolute-from-gregorian date)))
    (if (and 
	 (<= date1 d) 
	 (<= d date2)
	 (= (calendar-day-of-week date) dayname)
	 (not (check-calendar-holidays date))
	 )
	entry)))

;;; %%(diary-remind '(diary-date 1 8 2004) '(1 2 3) t) really-important-event-i-have-to-prepare-days-in-advance
;;; Then: "&%%(diary-schedule 22 4 2003 1 8 2003 2) 18:00 History"
;;; Countdown

;;; This uses diary-schedule (defined above) and diary-remind to produce a daily countdown to a deadline:

 (defun diary-countdown (m1 d1 y1 n)
   "Reminder during the previous n days to the date.
    Order of parameters is M1, D1, Y1, N if
    `european-calendar-style' is nil, and D1, M1, Y1, N otherwise."
   (diary-remind '(diary-date m1 d1 y1) (let (value) (dotimes (number n value) (setq value (cons number value))))))

;;;; Then: "&%%(diary-countdown 22 4 2003 15) Conference deadline" shows the reminder during the last 15 days before 22 4 2003.


;;; NOTYET, APPT and Calendar and Diary setup
;;;
;(if (file-readable-p diary-file)
;    (progn
;      (require 'appt)
;      (require 'time)
;      (appt-initialize)
;      (setq appt-msg-countdown-list '(20 15 10 5 3 1)
;	    appt-announce-method 'appt-window-announce
;	    appt-display-duration 5
;            diary-list-include-blanks t)
;;(if emacsx
;;				     'appt-frame-announce
;;				   'appt-window-announce)
;;;;'appt-message-announce 'appt-persistent-message-announce
;      (add-hook 'diary-display-hook 'fancy-diary-display)
;      (add-hook 'list-diary-entries-hook 'include-other-diary-files)
;      (add-hook 'diary-hook #'(lambda ()
;                                        (let ((b (get-buffer "diary")))
;                                          (if b
;                                              (kill-buffer b)))
;                                        ))
;      (diary)
;      ))


(provide 'bystar-calendar-lib)

;; Local Variables:
;; no-byte-compile: t
;; End:
