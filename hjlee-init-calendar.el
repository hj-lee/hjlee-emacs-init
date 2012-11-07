;;; -*-mode: emacs-lisp; coding:utf-8;-*-
;;;;;
;;;; calendar


(require 'calendar)

;; ;; tell holiday-chinese is function
;; (defun holiday-chinese (month day string)
;;   nil)

(setq general-holidays
      '((holiday-fixed 1 1 "신정")
	(holiday-fixed 1 2 "신정2")
	(holiday-fixed 3 1 "삼일절")
	(holiday-fixed 4 5 "식목일")
	(holiday-fixed 5 1 "근로자의 날")
	(holiday-fixed 5 5 "어린이날")
	(holiday-fixed 6 6 "현충일")
	(holiday-fixed 7 17 "제헌절")
	(holiday-fixed 8 15 "광복절")
	(holiday-fixed 10 1 "국군의 날")
	(holiday-fixed 10 3 "개천절")
	(holiday-fixed 10 9 "한글날")	
	(holiday-fixed 12 25 "성탄절") ;; it's in christian-holidays
	(holiday-chinese 8 14 "추석-")
	(holiday-chinese 8 15 "추석")
	(holiday-chinese 8 16 "추석+")
	(holiday-chinese 4 8 "석가탄신일")
	)
      )


(setq solar-holidays nil)
(setq bahai-holidays nil)
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq oriental-holidays nil)

(setq cal-tex-diary t)

(load-library "cal-korea")

(korean-calendar)



;;;;;;;;;;;;;;;;;;;;
;;;;
; diary

;(display-time)
;(add-hook 'diary-hook 'appt-make-list)
;(diary 0)


(defface sunday
  '((((class color) (background light))
     :background "#ff3a3a")
    (((class color) (background dark))
     :background "red")
    (t
     :inverse-video t))
  "Face for indicating in the calendar dates that have holidays.
See `calendar-holiday-marker'."
  :group 'calendar-faces)


(defface saturday
  '((((class color) (background light))
     :background "cyan")
    (((class color) (background dark))
     :background "blue")
    (t
     :inverse-video t))
  "Face for indicating in the calendar dates that have holidays.
See `calendar-holiday-marker'."
  :group 'calendar-faces)



(defun calendar-generate-month (month year indent)
  "Produce a calendar for MONTH, YEAR on the Gregorian calendar.
The calendar is inserted at the top of the buffer in which point is currently
located, but indented INDENT spaces.  The indentation is done from the first
character on the line and does not disturb the first INDENT characters on the
line."
  (let ((blank-days                     ; at start of month
         (mod
          (- (calendar-day-of-week (list month 1 year))
             calendar-week-start-day)
          7))
         (last (calendar-last-day-of-month month year))
         (trunc (min calendar-intermonth-spacing
                     (1- calendar-left-margin)))
         (day 1)
         string)
   (goto-char (point-min))
   (calendar-move-to-column indent)
   (insert
    (calendar-string-spread
     (list (format "%d년 %s" year (calendar-month-name month)))
     ?\s calendar-month-digit-width))
   (calendar-ensure-newline)
   (calendar-insert-at-column indent calendar-intermonth-header trunc)
   ;; Use the first two characters of each day to head the columns.
   (dotimes (i 7)
     (insert
      (progn
        (setq string
              (calendar-day-name (mod (+ calendar-week-start-day i) 7) nil t))
        (if enable-multibyte-characters
            (truncate-string-to-width string calendar-day-header-width)
          (substring string 0 calendar-day-header-width)))
      (make-string (- calendar-column-width calendar-day-header-width) ?\s)))
   (calendar-ensure-newline)
   (calendar-insert-at-column indent calendar-intermonth-text trunc)
   ;; Add blank days before the first of the month.
   (insert (make-string (* blank-days calendar-column-width) ?\s))
   ;; Put in the days of the month.
   (dotimes (i last)
     (setq day (1+ i))
     ;; TODO should numbers be left-justified, centered...?
     (insert (format (format "%%%dd%%s" calendar-day-digit-width) day
                     (make-string
                      (- calendar-column-width calendar-day-digit-width) ?\s)))
     ;; 'date property prevents intermonth text confusing re-searches.
     ;; (Tried intangible, it did not really work.)
     (set-text-properties
      (- (point) (1+ calendar-day-digit-width)) (1- (point))
      `(mouse-face highlight help-echo ,(eval calendar-date-echo-text)
                   date t))

     (when (= 1 (mod (+ day blank-days) 7))
       (overlay-put
	(make-overlay (- (point) 3) (- (point) 1)) 'face 'sunday))

     (when (zerop (mod (+ day blank-days) 7))
       (overlay-put
	(make-overlay (- (point) 3) (- (point) 1)) 'face 'saturday))


     (when (and (zerop (mod (+ day blank-days) 7))
                (/= day last))
       (calendar-ensure-newline)
       (setq day (1+ day))              ; first day of next week
       (calendar-insert-at-column indent calendar-intermonth-text trunc)))))
