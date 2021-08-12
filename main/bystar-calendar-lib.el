;; 
;; 
;; 

;;
;;  TOP LEVEL Entry Point: (bystar:calendar:all-defaults-set)
;;
;; bystar:calendar  

;;; requires
;;; ########

(require 'calendar)


;; (bystar:calendar:all-defaults-set)
(defun bystar:calendar:all-defaults-set ()
  ""
  (interactive)

;;;(autoload 'diary-include-todo-file "diary-todo"
;;;  "Include `to do' list in diary.")
;;;(add-hook 'list-diary-entries-hook 'diary-include-todo-file t)

;;; CALENDAR MODE

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
