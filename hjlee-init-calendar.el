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


