;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; suur.emacs - Copyright (C) 1996--2003 Hannu Koivisto <azure@iki.fi>.
;; All rights reserved.
;;
;; Module:   suur-sexp.el
;; Abstract: Selected Lisp editing enhancements from suur.emacs.
;; License:  GPL
;;
;; $Id: suur-sexp.el,v 1.1 2005/01/08 02:29:34 hjlee Exp $
;;
;; Dead to the world, alive for the journey.
;;
;; While all functions here are interactive, se:replace-outer-sexp,
;; se:lisp-append-to-current-list, se:move-past-close-and-just-one-space and
;; se:kill-ring-save-sexp (in that order of usefulness) are the real meat
;; here.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)

(defun se:beginning-of-current-sexp ()
  "Move to the beginning of the sexp `forward-sexp' would move end to."
  (interactive)
  (forward-sexp)
  (backward-sexp))

(defun se:end-of-previous-sexp ()
  "Move to the end of the sexp `backward-sexp' would move beginning to."
  (interactive)
  (backward-sexp)
  (forward-sexp))


(defun se:replace-enclosing-sexp (&optional prefix)
  "Replace the enclosing sexp with some or all of the enclosed sexps.
Indent the replacement sexps afterwards.

With no argument the following sexp is used as the replacement.
With C-u all the contained sexps following the point are used.
With an argument 0, all the contained sexps are used.
With a positive argument N, the following N sexps are used.
With a negative argument N, the preceding N sexps are used.

Does not handle comments in the following kind of situations:

\(foo
 baz bar  ; hum
 )

Copyright (c) 2001--2003 Hannu Koivisto <azure@iki.fi>.
All rights reserved.  License: GPL."
  (interactive "P")
  (let ((sexps-to-leave
         (let ((prefix (cond ((null prefix) 1)
                             ((and (numberp prefix) (zerop prefix))
                              (backward-up-list)
                              (down-list)
                              '(4))
                             (t prefix))))
           (if (or (consp prefix)
                   (plusp prefix))
               (se:beginning-of-current-sexp)
             (se:end-of-previous-sexp))
           (buffer-substring
            (point)
            (progn (cond ((consp prefix)
                          (up-list)
                          (down-list -1)
                          (se:end-of-previous-sexp))
                         (t
                          (forward-sexp prefix)))
                   (when (looking-at "\\s-*\\s<\\S>*$")
                     (setf (point) (match-end 0)))
                   (point))))))
    (backward-up-list)
    (kill-sexp)
    (let ((point (point)))
      (insert sexps-to-leave)
      (let ((end-point (point-marker)))
        (setf (point) point)
        (loop while (< (point) end-point)
              do (se:beginning-of-current-sexp)
                 (when (= (current-indentation)
                          (current-column))
                   (funcall indent-line-function))
                 (indent-sexp)
                 (forward-sexp))
        (setf (marker-position end-point) nil))
      (setf (point) point))))


(defun se:lisp-append-to-current-list ()
  "Insert a new line with indentation to the end of the current list
\(just before the closing paren).

Copyright (c) 2001--2003 Hannu Koivisto <azure@iki.fi>.
All rights reserved.  License: GPL."
  (interactive)
  (up-list)
  (let ((point (point)))
    (multiple-value-bind (comment comment-col)
        (let ((eol (save-excursion
                     (end-of-line)
                     (point))))
          (if (not (search-forward-regexp "\\s<" eol t))
              (values nil nil)
            (let ((col (1- (current-column))))
              (values (prog1
                          (buffer-substring (1- (point)) eol)
                        (delete-region (1- (point)) eol)
                        (delete-horizontal-space))
                      col))))
      (setf (point) point)
      (backward-char)
      (newline-and-indent)
      (when comment
        (save-excursion
          (forward-line -1)
          (move-to-column comment-col t)
          (insert comment))))))


(defun se:kill-ring-save-sexp (&optional arg)
  "Save the current sexp as if killed, but do not kill it.
ARG affects as with `mark-sexp'.  Except for what is saved, this
behaves like `copy-region-as-kill'.

Copyright (c) 2002--2003 Hannu Koivisto <azure@iki.fi>.
All rights reserved.  License: GPL."
  (interactive "p")
  (save-excursion
    (se:beginning-of-current-sexp)
    (mark-sexp arg)
    (copy-region-as-kill (region-beginning) (region-end))))


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
