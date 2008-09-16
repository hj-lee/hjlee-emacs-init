;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee.
;;;

(push "/etc/emacs-snapshot" load-path)
(push "/etc/emacs" load-path)

(push "/usr/local/share/emacs/site-lisp" load-path)

(push "/usr/share/emacs/site-lisp" load-path)
(push "/usr/share/emacs/emacs-snapshot/site-lisp" load-path)

(load-library "/usr/share/emacs/site-lisp/debian-startup.el")

(load-library "/etc/emacs/site-start.el")

;; I don't know why. but it need to be called twice.

(debian-startup 'emacs-snapshot)
(debian-startup 'emacs-snapshot)
