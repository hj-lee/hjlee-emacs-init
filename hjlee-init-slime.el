;;;;;;;;;;;;;;;;;
;;; slime

;; use debian slime package

;; (add-to-list 'load-path (expand-file-name "~hjlee/usr/share/emacs/site-lisp/slime-cvs"))


(require 'slime)

(setq inferior-lisp-program "sbcl")
;; (setq inferior-lisp-program "lisp") ;; cmu lisp
;; (setq inferior-lisp-program "clisp")

(setq slime-net-coding-system 'utf-8-unix)


(add-hook 'lisp-mode-hook (lambda () (slime-mode t)
			    (local-set-key "\r" 'newline-and-indent)
			    (setq lisp-indent-function 'common-lisp-indent-function)
			    (setq indent-tabs-mode nil)))
(slime-setup)

;; (load "cl-indent") ; contrary to my earlier instruction, 
                      ; require doesn't work, and
                      ; load isn't needed

;; (setq lisp-indent-function 'common-lisp-indent-function)

;;
;; slime-cvs (2004.12.31) 

;; (set-variable 'slime-net-coding-system 'utf-8-unix)


;;;
;;; for cmucl

;; (set-variable 'slime-net-coding-system 'iso-latin-1-unix)


;;
;;
;;


(defun hj.d.lee:set-lisp-maps (key command)
  (define-key slime-mode-map key command)
  (define-key slime-repl-mode-map key command)
  (define-key lisp-mode-map key command)
  (define-key lisp-interaction-mode-map key command)
  (define-key emacs-lisp-mode-map key command))

;; (defun hj.d.lee:set-lisp-non-repl-maps (key command)
;;   (define-key slime-mode-map key command)
;; ;;   (define-key lisp-mode-map key command)
;;   (define-key emacs-lisp-mode-map key command))

(load-library "suur-sexp")

(hj.d.lee:set-lisp-maps [(?\()] 'insert-parentheses)
(hj.d.lee:set-lisp-maps [(?\))] 'se:move-past-close-and-just-one-space)

;; (hj.d.lee:set-lisp-non-repl-maps [(return)] 'newline-and-indent)
(define-key slime-mode-map [(return)] 'newline-and-indent)
(define-key lisp-interaction-mode-map [(return)] 'newline-and-indent)
(define-key emacs-lisp-mode-map [(return)] 'newline-and-indent)

;; C-c <return>
(define-key slime-mode-map [3 return] 'slime-macroexpand-1)
(define-key slime-repl-mode-map [3 return] 'slime-macroexpand-1)

;; (load-library "balanced-parens")

(hj.d.lee:set-lisp-maps (kbd "C-t") 'transpose-sexps)
(hj.d.lee:set-lisp-maps (kbd "C-M-t") 'transpose-chars)
(hj.d.lee:set-lisp-maps (kbd "C-b") 'backward-sexp)
(hj.d.lee:set-lisp-maps (kbd "C-M-b") 'backward-char)
(hj.d.lee:set-lisp-maps (kbd "C-f") 'forward-sexp)
(hj.d.lee:set-lisp-maps (kbd "C-M-f") 'forward-char)

;; (defun mwe:skeleton-pair-insert-maybe (&optional arg)
;;   (interactive "P")
;;   (save-excursion (skeleton-pair-insert-maybe arg))
;;   (forward-char))


;; (hj.d.lee:set-lisp-maps [(?\()] 'mwe:skeleton-pair-insert-maybe)


(defun mb:unwrap-next-sexp (&optional kill-n-sexps)
  "Convert (x ...) to ..."
  (interactive "P")
  (forward-sexp)
  (backward-delete-char 1)
  (backward-up-list)
  (delete-char 1)
  (let ((start-region-to-kill (point)))
    (kill-sexp kill-n-sexps)
    (down-list)
    (delete-region start-region-to-kill (1- (point)))
    (backward-up-list))
  (lisp-indent-line))

(defun cliki:lift-sexp (&optional arg)
  "Convert (x ... y) to ..."
  (interactive "P")
  (kill-sexp arg)
  (up-list)
  (backward-list)
  (kill-sexp)
  (yank 2)
  (backward-sexp arg))

(hj.d.lee:set-lisp-maps (kbd "M-_") 'mb:unwrap-next-sexp)

