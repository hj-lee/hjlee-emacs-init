;;; -*-mode: emacs-lisp; coding:utf-8;-*-

;;;;
;; hj-insert-time-stamp
;; it insert timestamp format (HH:MM) into buffer

(defun hj-insert-timestamp ()
  (interactive)
  (insert-string "(")
  (insert-string 
   (substring (current-time-string (current-time)) 11 16))
  (insert-string ")\n" ))

(defun hj-insert-start-timestamp ()
  (interactive)
  (let* ((now (current-time))
	 (time (current-time-string now))
	 (year (substring time 20 24))
	 (monthname (substring time 4 7))
	 (month
	  (cdr
	   (assoc
	    monthname
	    '(("Jan" . "01") ("Feb" . "02") ("Mar" . "03") ("Apr" . "04")
	      ("May" . "05") ("Jun" . "06") ("Jul" . "07") ("Aug" . "08")
	      ("Sep" . "09") ("Oct" . "10") ("Nov" . "11") ("Dec" . "12")))))
	 (day-1 (substring time 8 9))
	 (day-1-0 
	  (if (string-equal " " day-1)
	      "0"
	    day-1))
	 (day-2 (substring time 9 10))
	 (day (concat day-1-0 day-2))
	 (dayname (substring time 0 3))
	 (dayname-kr
	  (cdr
	   (assoc
	    dayname
	    '(("Sun" . "일") ("Mon" . "월") ("Tue" . "화") ("Wed" . "수")
	      ("Thu" . "목") ("Fri" . "금") ("Sat" . "토")))))
	 (hj-date-string (concat year "." month "." day " " dayname-kr)))
    (insert-string hj-date-string)
    (insert-string "\n=============\n출근(")
    
    (insert-string (substring time 11 16))
    (insert-string ")\n")))

(defun hj-insert-diary-date ()
  (interactive)
  (let* ((now (current-time))
	 (time (current-time-string now))
	 (year (substring time 20 24))
	 (monthname (substring time 4 7))
	 (month
	  (cdr
	   (assoc
	    monthname
	    '(("Jan" . "1") ("Feb" . "2") ("Mar" . "3") ("Apr" . "4")
	      ("May" . "5") ("Jun" . "6") ("Jul" . "7") ("Aug" . "8")
	      ("Sep" . "9") ("Oct" . "10") ("Nov" . "11") ("Dec" . "12")))))
	 (day-1 (substring time 8 9))
	 (day-1-0 
	  (if (string-equal " " day-1)
	      "0"
	    day-1))
	 (day-2 (substring time 9 10))
	 (day (concat day-1-0 day-2))
	 (dayname (substring time 0 3))
	 (dayname-kr
	  (cdr
	   (assoc
	    dayname
	    '(("Sun" . "일") ("Mon" . "월") ("Tue" . "화") ("Wed" . "수")
	      ("Thu" . "목") ("Fri" . "금") ("Sat" . "토")))))
	 (hj-date-string (concat year "년 " month "월 " day "일 " 
				 dayname-kr "요일")))
    (insert-string hj-date-string)
    (insert-string "\n\n")))
    
