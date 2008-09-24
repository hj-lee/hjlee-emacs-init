
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jde 2.2.7.1


(setq load-path (cons "~/usr/elisp/jde-2.3.5.1/lisp" load-path))

(require 'jde)

;; (add-hook 'jde-mode-hook
;; 	    (lambda ()
;; ;	    (c-set-offset 'arglist-cont-nonempty '+)
;; 	      (c-set-offset 'substatement-open 0)
;; ;	    (c-set-offset 'statement-cont '+)
;; 	      (c-set-offset 'arglist-intro '+)
;; ;	    (setq indent-tabs-mode t)
;; ;	    (setq c-comment-only-line-offset 0)	      
;; 	      )
;; 	    )

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

