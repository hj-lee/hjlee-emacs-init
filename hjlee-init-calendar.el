;;; -*-mode: emacs-lisp; coding:euc-kr;-*-
;;;;;
;;;; calendar


;; tell holiday-chinese is function
(defun holiday-chinese (month day string)
  nil)

(setq general-holidays
      '((holiday-fixed 1 1 "����")
	(holiday-fixed 3 1 "������")
	(holiday-fixed 4 5 "�ĸ���")
	(holiday-fixed 5 1 "�ٷ����� ��")
	(holiday-fixed 5 5 "��̳�")
	(holiday-fixed 6 6 "������")
	(holiday-fixed 7 17 "������")
	(holiday-fixed 8 15 "������")
	(holiday-fixed 10 1 "������ ��")
	(holiday-fixed 10 3 "��õ��")
;	(holiday-fixed 12 25 "��ź��") ;; it's in christian-holidays
	(holiday-chinese 8 15 "�߼�")
	(holiday-chinese 4 8 "����ź����")
	)
      )


(setq solar-holidays nil)
(setq islamic-holidays nil)
(setq hebrew-holidays nil)
;(setq christian-holidays nil)

;;;;

(require 'cal-china)

(defun holiday-chinese (month day string)
  "Holiday on MONTH, DAY (Chinese) called STRING.
If MONTH, DAY (Chinese) is visible, the value returned is corresponding
Gregorian date in the form of the list (((month day year) STRING)).  Returns
nil if it is not visible in the current calendar window."
  (let ((m1 displayed-month)
	(y1 displayed-year)
	(m2 displayed-month)
	(y2 displayed-year)
	(year))
    (increment-calendar-month m1 y1 -1)
    (increment-calendar-month m2 y2 1)
    (let* ((start-date (calendar-absolute-from-gregorian
			(list m1 1 y1)))
	   (end-date (calendar-absolute-from-gregorian
		      (list m2 (calendar-last-day-of-month m2 y2) y2)))
	   (chinese-start (calendar-chinese-from-absolute start-date))
	   (chinese-end (calendar-chinese-from-absolute end-date))
	   (chinese-y1-1 (car chinese-start))
	   (chinese-y1-2 (cadr chinese-start))
	   (chinese-y2-1 (car chinese-end))
	   (chinese-y2-2 (cadr chinese-end))
	   )
;      (setq year-1 (if (< 6 month) chinese-y2-1 chinese-y1-1))
;      (setq year-2 (if (< 6 month) chinese-y2-2 chinese-y1-2))
      (let ((date-1 (calendar-gregorian-from-absolute
		     (calendar-absolute-from-chinese
		      (list chinese-y1-1 chinese-y1-2 month day))))
	    (date-2 (calendar-gregorian-from-absolute
		     (calendar-absolute-from-chinese
		      (list chinese-y2-1 chinese-y2-2 month day)))))
	(if (calendar-date-is-visible-p date-1)
	    (list (list date-1 string))
	  (if (calendar-date-is-visible-p date-2)
	      (list (list date-2 string)))
	  )
	))))


(setq cal-tex-diary t)



(load-library "cal-korea")

(korean-calendar)

;;;;;;;;;;;;;;;;;;;;
;;;;
; diary

;(display-time)
;(add-hook 'diary-hook 'appt-make-list)
;(diary 0)


