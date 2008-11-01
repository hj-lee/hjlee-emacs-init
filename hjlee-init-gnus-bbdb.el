;;; -*-mode: emacs-lisp; coding:euc-kr;-*-

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;

;; (when (>= emacs-major-version 21)
;;   ;(setq load-path (cons "/usr/share/emacs/site-lisp/bbdb" load-path))
;;   (setq load-path (cons "/usr/share/emacs/site-lisp/bbdb/lisp" load-path))
;;   ;(setq load-path (cons "/usr/share/emacs/20.7/site-lisp/w3-el" load-path))
;;   )

(setq load-path (cons "~hjlee/usr/share/emacs/site-lisp/misc" load-path))
(require 'gnushush)

;;;;;;;;;;;;;
;;; bbdb

;(when (< emacs-major-version 21)
  (require 'bbdb)
  (bbdb-initialize 'gnus 'message)
  (add-hook 'mail-setup-hook 'bbdb-define-all-aliases)
;  )

