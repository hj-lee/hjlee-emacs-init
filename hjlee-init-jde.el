
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jde 2.2.7.1

;;(setq load-path (cons "~/usr/share/emacs/site-lisp/jde/lisp" load-path))
;;(setq load-path (cons "~/usr/share/emacs/site-lisp/eieio" load-path))
;;(setq load-path (cons "~/usr/share/emacs/site-lisp/semantic" load-path))

;(when (>= emacs-major-version 21)
;   (setq load-path (cons "~/usr/share/emacs/site-lisp/elib" load-path))
;  )

;; (when (< emacs-major-version 21)
  (require 'jde)

  (add-hook 'jde-mode-hook
	    (lambda ()
;	    (c-set-offset 'arglist-cont-nonempty '+)
	      (c-set-offset 'substatement-open 0)
;	    (c-set-offset 'statement-cont '+)
	      (c-set-offset 'arglist-intro '+)
;	    (setq indent-tabs-mode t)
;	    (setq c-comment-only-line-offset 0)	      
	      )
	    )

;  (defun my-jde-keybinding
;    (define-key jde-mode-map "\C-m"
;      'newline-and-indent)
;    (define-key jde-mode-map [RET]
;      'newline-and-indent)
;    (define-key jde-mode-map [C-right] 
;      'c-forward-into-nomenclature)
;    (define-key jde-mode-map [C-left] 
;      'c-backward-into-nomenclature)
;    )
;  (add-hook 'jde-mode-hook 'my-jde-keybinding)

;;   )

;;;
; contrib

(setq load-path (cons "~/usr/share/emacs/site-lisp/jde-contrib" load-path))


;(setq load-path (cons "~/usr/share/emacs/site-lisp/jde-jcb-0.04" load-path))

;(require 'jde-jcb)

;;;; jdok now in part of jde as jde-javadoc
;(require 'jdok)

;;;; I don't use jpack, jsee, jmaker

; (require 'jpack)
; (require 'jsee)
; (setq jde-jsee-get-doc-url-function 'jsee-get-javadoc1.2-url)

; (require 'jmaker)

