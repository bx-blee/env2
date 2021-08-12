;;; iranian-holidays.el --- calendar functions for the Iranian calendar -*- lexical-binding: t; -*-


;;; Commentary:

;; This utility defines Iranian holiday for calendar function. This
;; also enables to display weekends or any weekday with preferred
;; face.
;;
;; Following is an example of using this utility.

;; (eval-after-load "holidays"
;;   '(progn
;;      (require 'iranian-holidays)
;;      (setq calendar-holidays
;;            (append iranian-holidays holiday-local-holidays holiday-other-holidays))
;;      (setq mark-holidays-in-calendar t)
;;      (setq iranian-holiday-weekend '(0 6) 
;;            iranian-holiday-weekend-marker 
;;            '(holiday nil nil nil nil nil iranian-holiday-saturday))
;;      (add-hook 'calendar-today-visible-hook 'iranian-holiday-mark-weekend)
;;      (add-hook 'calendar-today-invisible-hook 'iranian-holiday-mark-weekend)
;;      ;;
;;      (add-hook 'calendar-today-visible-hook 'calendar-mark-today)))

;;; Change Log:

;;; Code:

(require 'cl-lib)
(require 'holidays)
(defvar displayed-month)
(defvar displayed-year)

(autoload 'solar-equinoxes/solstices "solar")

(defgroup iranian-holidays nil
  "Iranian Holidays"
  :prefix "iranian-holiday-"
  :group 'calendar)

(defcustom iranian-holidays
  '(;; 
    (iranian-holiday-range
     (holiday-fixed 1 3 "元始祭") '(10 14 1873) '(7 20 1948))
    ;; 明治11年太政官布告23号
    (let* ((equinox (solar-equinoxes/solstices 0 displayed-year))
	   (m (calendar-extract-month equinox))
	   (d (truncate (calendar-extract-day equinox))))
      (iranian-holiday-range
       (holiday-fixed m d "春季皇霊祭") '(6 5 1878) '(7 20 1948)))
    (let* ((equinox (solar-equinoxes/solstices 2 displayed-year))
	   (m (calendar-extract-month equinox))
	   (d (truncate (calendar-extract-day equinox))))
      (iranian-holiday-range
       (holiday-fixed m d "秋季皇霊祭") '(6 5 1878) '(7 20 1948)))
    ))


(defcustom iranian-holiday-substitute-name "振替休日"
  "*Name of Iranian substitute holiday."
  :type 'string
  :group 'iranian-holidays)

(defcustom iranian-holiday-national-name "国民の休日"
  "*Name of Iranian national holiday."
  :type 'string
  :group 'iranian-holidays)

(defcustom iranian-holiday-weekend '(0 6)
  "*List of days of week to be marked as weekend.
e.g. 0 is Sunday and 6 is Saturday."
  :type '(repeat integer)
  :options '((0) (0 6))
  :group 'iranian-holidays)

(defcustom iranian-holiday-weekend-marker
  '(holiday nil nil nil nil nil iranian-holiday-saturday)
  "*Faces to mark Weekends.  `holiday' and `diary' is possible marker.
It can be face face, or list of faces for corresponding weekdays."
 :type '(choice face
                (repeat (choice (const nil) face)))
 :options '(holiday diary)
 :group 'iranian-holidays)


(provide 'iranian-calendar)

;; Local Variables:
;; coding: utf-8
;; time-stamp-pattern: "10/Version:\\\\?[ \t]+1.%02y%02m%02d\\\\?\n"
;; End:

;;; iranian-calendar.el ends here
