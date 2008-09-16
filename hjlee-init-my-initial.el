;;;
;;;   $Id: hjlee-init-my-initial.el,v 1.1 2003/09/18 13:18:14 hjlee Exp $
;;;
;;;   Insert buffer name at proper location for the recently made file.
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

;;;   my-initial --- Insert buffer name at leading comment.

;;;   my-initial-header --- In C++(or C) header file, excute my-initial,
;;;                         and then make proper pre-processor statement.
;;;                         It can be used only with auto-insert.h 



(defun my-initial ()
  (interactive)
  (let () 
    (beginning-of-buffer)
    (next-line 2)
    (end-of-line)
    (insert "   ")
    ;(insert (buffer-name))
    ;(insert " : ")
    ))

(defalias 'my-initial-header (read-kbd-macro
"C-s _ C-d M-: SPC (insert SPC (buffer-name)) RET <down> <left> DEL
 C-x <escape> ESC RET 2*<up> M-% . RET _ RET 2*SPC <down>"))


;(defun my-initial-header ()
;  (interactive)
;  (let ()
;    (my-initial)
;    (next-line 5)
;    (end-of-line)
;    (backward-char 3)
;    (insert (buffer-name))
;    (delete-backward-char 2)
;    (next-line 1)
;    (end-of-line)
;    (backward-char 3)
;    (insert (buffer-name))
;    (delete-backward-char 2)
;    (previous-line 6)
;    (end-of-line)))





