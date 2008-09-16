;;; Written by Andreas Fuchs <asf@boinkor.net>
;;; Except se:move-past-close-and-just-one-space
;;;
;;; License: GPL.


;;; balanced paren stuff

(defun asf:in-comment-p ()
  (let ((orig (point)))
    (save-excursion
      (beginning-of-defun)
      (nth 4 (parse-partial-sexp (point) orig)))))

(defmacro asf:insert-unless-in-code (char &rest else-body)
  `(if (or (in-string-p) (asf:in-comment-p))
       (insert ,char)
       ,@else-body))

(defun asf:insert-parentheses (&optional arg)
  "Enclose following ARG sexps in parentheses, unless in a string or in a comment."
  (interactive "P")
  (asf:insert-unless-in-code ?\(
    (insert-pair arg ?\( ?\))))

(define-key lisp-mode-map [(?\()] 'asf:insert-parentheses)
(define-key emacs-lisp-mode-map [(?\()] 'asf:insert-parentheses)

(defun se:move-past-close-and-just-one-space ()
  "Move past next `)' and ensure just one space after it.

Copyright (c) 2002--2003 Hannu Koivisto <azure@iki.fi>.
All rights reserved.  License: GPL."
  (interactive)
  (when (eq 'se:move-past-close-and-just-one-space last-command)
    (undo))
  (push (point) buffer-undo-list)
  (undo-boundary)
  (up-list)
  (just-one-space)
  (setq this-command 'se:move-past-close-and-just-one-space))

(defun asf:at-toplevel ()
  (save-excursion
    (condition-case c
	 (progn (up-list 2)
		nil)
       (error t))))

(defun asf:in-body-operator ()
  (ignore-errors
    (save-excursion
      (up-list 1)
      (newline)
      (unwind-protect
	  (let ((current-op-col (save-excursion
				  (up-list -1)
				  (current-column))))
	    (= 2 (- (calculate-lisp-indent)
		    current-op-col))))
      (delete-char -1))))

(defun asf:move-past-close ()
  (interactive)
  (asf:insert-unless-in-code ?\)
    (cond ((or (asf:at-toplevel) (asf:in-body-operator))
	   (move-past-close-and-reindent))
	  (t
	   (se:move-past-close-and-just-one-space)))))

(define-key lisp-mode-map ")" 'asf:move-past-close)
(define-key emacs-lisp-mode-map ")" 'asf:move-past-close) 
