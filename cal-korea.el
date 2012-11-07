;;; -*-mode: emacs-lisp; coding:utf-8;-*-
;;;
;;;   $Id: cal-korea.el,v 1.1 2003/09/26 08:54:33 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(require 'calendar)

;;;###autoload
(defvar korean-date-diary-pattern
  '((month "/" day "[^/0-9]")
    (year "/" month "/" day "[^0-9]")
    (month "\\." day "[^.0-9]")
    (year "\\." month "\\." day "[^0-9]")    
    (month "월 *" day "일" "[^.0-9]")
;    (month "월 *" day "[^.0-9]")
    (year "년 *" month "월 *" day "일" "[^0-9]")    
;    (year "년 *" month "월 *" day "[^0-9]")    
    (month " *" day "[^0-9]")
    (month "," day "[^0-9]")
    (dayname "\\W"))
  "*List of pseudo-patterns describing the Korean patterns of date used.
See the documentation of `diary-date-forms' for an explanation.")

;;;###autoload
(defvar korean-calendar-display-form
  '(year "년 " month "월 " day "일" 
    (if dayname (concat " " dayname))))

(defvar korean-calendar-day-name-array
      ["일요일" "월요일" "화요일" "수요일" "목요일" "금요일" "토요일"])

(defvar korean-calendar-month-name-array
      ["1월 " "2월 " "3월 " "4월 " "5월 " "6월 " "7월 " "8월 " "9월 " "10월" "11월" 
       "12월"])

(defun korean-calendar ()
  "Set the interpretation and display of dates to the Korean style."
  (interactive)
  (setq calendar-day-name-array korean-calendar-day-name-array)
  (setq calendar-month-name-array korean-calendar-month-name-array)

  (setq european-calendar-style nil)
  (setq calendar-date-display-form korean-calendar-display-form)
  (setq diary-date-forms korean-date-diary-pattern)
)

(provide 'cal-korea)
