;;;;;;;;;;;;;
;;; cc-mode 5.28
(when (< emacs-major-version 21)
  (setq load-path (cons "~/usr/share/emacs/site-lisp/cc-mode" load-path))
  )

;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; c mode common hook

(defun my-c-mode-common-hook ()
  ;(c-set-style "Stroustrup")
;;   (c-set-offset (quote statement-case-open) (quote +) nil)
  ;; error on java mode
;;   (setq c-cleanup-lisp '(defun-close-semi scope-operator))

;;   (setq tab-width 8)
        ;; nil will make sure spaces are used instead of tabs
  (setq indent-tabs-mode t)
  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
  ;(font-lock-mode 1)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  (setq c-echo-syntactic-information-p t)
  )


(defun my-c-mode-common-key-binding-for-gnu-emacs ()
  (define-key c-mode-base-map "\C-m"
    'newline-and-indent)
  (define-key c-mode-base-map "\r"
    'newline-and-indent) 
  (define-key c-mode-base-map [C-right] 
    'c-forward-into-nomenclature)
  (define-key c-mode-base-map [C-left] 
    'c-backward-into-nomenclature)
  )

(defun my-c-mode-common-key-binding-for-xemacs ()
  (define-key c-mode-base-map `return
    'newline-and-indent)
  ;; we like auto-newline and hungry-delete
  (define-key c-mode-base-map [(control right)]
	'c-forward-into-nomenclature)
  (define-key c-mode-base-map [(control left)] 
	'c-backward-into-nomenclature)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(if is-gnu-emacs 
    (add-hook 'c-mode-common-hook 'my-c-mode-common-key-binding-for-gnu-emacs)
  (add-hook 'c-mode-common-hook 'my-c-mode-common-key-binding-for-xemacs))
  
(add-hook 'c-mode-hook 
	  (lambda () 
	    (c-set-style "Stroustrup")))

(add-hook 'c++-mode-hook
	  (lambda () 
	    (c-set-style "Stroustrup")))

;; (add-hook 'java-mode-hook
;; 	  (lambda ()
;; ;	    (font-lock-mode nil)
;; 	    (setq ; tab-width 8
;; 		  ;; nil will make sure spaces are used instead of tabs
;; 		  indent-tabs-mode nil)
;; 	    ))

;;;;;
;;;;;
;;;;; MARK

;; /home/hjlee/t3plandll/scpdll:/home/hjlee/t3plandll/atpdll:/home/hjlee/t3plandll/scmbaselib/models:/home/hjlee/t3plandll/scmbaselib/galib/ga