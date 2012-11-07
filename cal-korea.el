;;; -*-mode: emacs-lisp; coding:euc-kr;-*-
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

(setq calendar-day-name-array
      ["일요일" "월요일" "화요일" "수요일" "목요일" "금요일" "토요일"])

(setq calendar-month-name-array
      ["1월 " "2월 " "3월 " "4월 " "5월 " "6월 " "7월 " "8월 " "9월 " "10월" "11월" 
       "12월"])

(defun korean-calendar ()
  "Set the interpretation and display of dates to the Korean style."
  (interactive)
  (setq european-calendar-style nil)
  (setq calendar-date-display-form korean-calendar-display-form)
  (setq diary-date-forms korean-date-diary-pattern)
  ;; (update-calendar-mode-line)
)

;;;
;;; re-defun calendar-date-string
;;;     change abbreviate dayname size from 3 to 2.
;;;

; (defun calendar-date-string (date &optional abbreviate nodayname)
;   "A string form of DATE, driven by the variable `calendar-date-display-form'.
; An optional parameter ABBREVIATE, when t, causes the month and day names to be
; abbreviated to three characters.  An optional parameter NODAYNAME, when t,
; omits the name of the day of the week."
;   (let* ((dayname
;           (if nodayname
;               nil
;             (if abbreviate
;                 (substring (calendar-day-name date) 0 2)
;               (calendar-day-name date))))
;          (month (extract-calendar-month date))
;          (monthname
;           (if abbreviate
;               (substring
;                (calendar-month-name month) 0 3)
;             (calendar-month-name month)))
;          (day (int-to-string (extract-calendar-day date)))
;          (month (int-to-string month))
;          (year (int-to-string (extract-calendar-year date))))
;     (mapconcat 'eval calendar-date-display-form "")))

(defun calendar-date-string (date &optional abbreviate nodayname)
  "A string form of DATE, driven by the variable `calendar-date-display-form'.
An optional parameter ABBREVIATE, when t, causes the month and day names to be
abbreviated to three characters.  An optional parameter NODAYNAME, when t,
omits the name of the day of the week."
  (let* ((dayname
          (if nodayname
              nil
            (if abbreviate
                (calendar-day-name date 1)
              (calendar-day-name date))))
         (month (extract-calendar-month date))
         (monthname
          (if abbreviate
              (calendar-month-name month 2)
            (calendar-month-name month)))
         (day (int-to-string (extract-calendar-day date)))
         (month (int-to-string month))
         (year (int-to-string (extract-calendar-year date))))
    (mapconcat 'eval calendar-date-display-form "")))

;;;
;;; re-defun generate-calendar-month 
;;;          change month line.
;;;

(defun generate-calendar-month (month year indent)
  "Produce a calendar for MONTH, YEAR on the Gregorian calendar.
The calendar is inserted in the buffer starting at the line on which point
is currently located, but indented INDENT spaces.  The indentation is done
from the first character on the line and does not disturb the first INDENT
characters on the line."
  (let* ((blank-days;; at start of month
          (mod
           (- (calendar-day-of-week (list month 1 year))
              calendar-week-start-day)
           7))
	 (last (calendar-last-day-of-month month year)))
   (goto-char (point-min))
   (calendar-insert-indented
    (calendar-string-spread
     (list (format "%d년 %s" year (calendar-month-name month))) ?  20)
    indent t)
   (calendar-insert-indented "" indent);; Go to proper spot
   (calendar-for-loop i from 0 to 6 do
      (insert (substring (aref calendar-day-name-array 
                               (mod (+ calendar-week-start-day i) 7))
                         0 1))
      (insert " "))
   (calendar-insert-indented "" 0 t);; Force onto following line
   (calendar-insert-indented "" indent);; Go to proper spot
   ;; Add blank days before the first of the month
   (calendar-for-loop i from 1 to blank-days do (insert "   "))
   ;; Put in the days of the month
   (calendar-for-loop i from 1 to last do
      (insert (format "%2d " i))
      (put-text-property (- (point) 3) (1- (point))
			 'mouse-face 'highlight)
      (and (zerop (mod (+ i blank-days) 7))
           (/= i last)
           (calendar-insert-indented "" 0 t)    ;; Force onto following line
           (calendar-insert-indented "" indent)))));; Go to proper spot

;;;
;;; re-defun fts in diary-lib
;;;

(require 'diary-lib)

(defun insert-yearly-diary-entry (arg)
  "Insert an annual diary entry for the day of the year indicated by point.
Prefix arg will make the entry nonmarking."
  (interactive "P")
  (let* ((calendar-date-display-form
	  '(monthname " " day "일")))
    (make-diary-entry (calendar-date-string (calendar-cursor-to-date t) t)
                      arg)))


;;;
;;; modification for chinese-date
;;;

(require 'cal-china)

;; (defun calendar-chinese-date-string (&optional date)
;;   "String of Chinese date of Gregorian DATE.
;; Defaults to today's date if DATE is not given."
;;   (let* ((a-date (calendar-absolute-from-gregorian
;; 		  (or date (calendar-current-date))))
;; 	 (c-date (calendar-chinese-from-absolute a-date))
;; 	 (cycle (car c-date))
;; 	 (year (car (cdr c-date)))
;; 	 (month (car (cdr (cdr c-date))))
;; 	 (day (car (cdr (cdr (cdr c-date)))))
;; 	 (this-month (calendar-absolute-from-chinese
;; 		      (list cycle year month 1)))
;; 	 (next-month (calendar-absolute-from-chinese
;; 		      (list (if (= year 60) (1+ cycle) cycle)
;; 			    (if (= (floor month) 12) (1+ year) year)
;; 			    (calendar-mod (1+ (floor month)) 12)
;; 			    1)))
;; 	 (m-cycle (% (+ (* year 5) (floor month)) 60)))
;;     (format "%s %s.%s"
;; 	    (if (not (integerp month))
;; 		"second "
;; 	      (if (< 30 (- next-month this-month))
;; 		  "first "
;; 		""))
;; 	    (floor month)
;; 	    day )))

;; (defun diary-chinese-date ()
;;   "Chinese calendar equivalent of date diary entry."
;;   (format "(-)%s" (calendar-chinese-date-string date)))
      
;;;
;;; modification for cal-tex
;;;
(require 'cal-tex)

(defun cal-tex-list-diary-entries (d1 d2)
  "Generate a list of all diary-entries from absolute date D1 to D2."
  (let ((diary-display-hook nil))
    (reverse 
     (list-diary-entries
      (calendar-gregorian-from-absolute d1)
      (1+ (- d2 d1))))))

(setq cal-tex-cal-one-month
      "\\def\\calmonth#1#2%
{\\begin{center}%
\\Huge\\bf #2년 #1 \\\\[1cm]%
\\end{center}}% 
\\vspace*{-1.5cm}%
%
")


(defun cal-tex-preamble (&optional args)
  "Insert the LaTeX preamble.
Preamble Includes initial definitions for various LaTeX commands.
Optional ARGS are included."
  (set-buffer (get-buffer-create cal-tex-buffer))
  (erase-buffer)
  (insert "\\documentclass")
  (if args
      (insert "[" args "]"))
  (insert "{article}\n"
	  "\\usepackage{hangul}
\\hbadness 20000
\\hfuzz=1000pt
\\vbadness 20000
\\marginparwidth 0pt
\\oddsidemargin  -2.2cm
\\evensidemargin -2.2cm
\\marginparsep   0pt
\\topmargin      0pt
\\textwidth      7.5in
\\textheight     9.5in
\\newlength{\\cellwidth}
\\newlength{\\cellheight}
\\newlength{\\boxwidth}
\\newlength{\\boxheight}
\\newlength{\\cellsize}
\\newcommand{\\myday}[1]{}
\\newcommand{\\caldate}[6]{}
\\newcommand{\\nocaldate}[6]{}
\\newcommand{\\calsmall}[6]{}
%
"
	  ))

(defun cal-tex-insert-preamble (weeks landscape size &optional append)
  "Initialize the output buffer.
Select the output buffer, and insert the preamble for a calendar of 
WEEKS weeks.  Insert code for landscape mode if LANDSCAPE is true. 
Use pointsize SIZE.  Optional argument APPEND, if t, means add to end of
without erasing current contents."
  (let ((width "18cm")
	(height "24cm"))
    (if landscape
	(progn
	  (setq width "24cm")
	  (setq height "18cm")))
    (if (not append)
	(progn
	  (cal-tex-preamble size)
	  (if (not landscape) 
	      (progn
		(cal-tex-cmd "\\oddsidemargin -1.95cm")
		(cal-tex-cmd "\\def\\holidaymult{.06}"))
	    (cal-tex-cmd "\\special{landscape}")
	    (cal-tex-cmd "\\textwidth  9.5in")
	    (cal-tex-cmd "\\textheight 7in")
	    (cal-tex-comment)
	    (cal-tex-cmd "\\def\\holidaymult{.08}"))
	  (cal-tex-cmd  cal-tex-caldate)
	  (cal-tex-cmd  cal-tex-myday)
	  (cal-tex-b-document)
	  (cal-tex-cmd "\\pagestyle{empty}")))
    (cal-tex-cmd "\\setlength{\\cellwidth}" width)
    (insert (format "\\setlength{\\cellwidth}{%f\\cellwidth}\n"
		    (/ 1.1 (length cal-tex-which-days))))
    (cal-tex-cmd "\\setlength{\\cellheight}" height)
    (insert (format "\\setlength{\\cellheight}{%f\\cellheight}\n"
		    (/ 1.0 weeks)))              
    (cal-tex-cmd "\\ \\par")
    (cal-tex-vspace "-3cm")))

(provide 'cal-korea)
