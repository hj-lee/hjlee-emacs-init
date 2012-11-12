;;;;;;;;;;;;;;;;;
;;; slime


(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(slime-setup '(slime-fancy slime-asdf))

(load "~/quicklisp/clhs-use-local.el" t)

;;; paredit

(require 'paredit)

;;; 

(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)


;; (defvar electrify-return-match
;;   "[\]}\)\"]"
;;   "If this regexp matches the text after the cursor, do an \"electric\"
;; return.")

;; (defun electrify-return-if-match (arg)
;;   "If the text after the cursor matches `electrify-return-match' then
;; open and indent an empty line between the cursor and the text.  Move the
;; cursor to the new line."
;;   (interactive "P")
;;   (let ((case-fold-search nil))
;;     (if (looking-at electrify-return-match)
;; 	(save-excursion (newline-and-indent)))
;;     (newline arg)
;;     (indent-according-to-mode)))

;; (defun my-lisp-related-hook ()
;;   (paredit-mode +1)
;;   (local-set-key (kbd "RET") 'electrify-return-if-match))

(custom-set-variables
 '(slime-complete-symbol*-fancy t)
 '(slime-complete-symbol-function 'slime-complete-symbol*))


(defun my-lisp-related-hook ()
  (paredit-mode +1)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'paredit-newline))


(add-hook 'emacs-lisp-mode-hook 'my-lisp-related-hook)
(add-hook 'lisp-mode-hook 'my-lisp-related-hook)
(add-hook 'slime-repl-mode-hook 'my-lisp-related-hook)

;;; reshank

;; (add-to-list 'load-path "~hjlee/usr/elisp/redshank")
(require 'redshank-loader
	 "~hjlee/usr/elisp/redshank/redshank-loader")

(eval-after-load "redshank-loader"
  `(redshank-setup '(lisp-mode-hook
		     slime-repl-mode-hook) t))


;;;;



;; ;; (add-to-list 'load-path "~hjlee/usr/elisp/slime")
;; (add-to-list 'load-path "~hjlee/other-repos/anoncvs/slime")

;; (require 'slime)

;; (setq inferior-lisp-program "sbcl")
;; ;; (setq inferior-lisp-program "lisp") ;; cmu lisp
;; ;; (setq inferior-lisp-program "clisp")

;; (setq slime-net-coding-system 'utf-8-unix)


;; ;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)
;; ;; 			    (local-set-key "\r" 'newline-and-indent)
;; ;; 			    (setq lisp-indent-function 'common-lisp-indent-function)
;; ;; 			    (setq indent-tabs-mode nil)))

;; (slime-setup)


;; ;; (setq lisp-indent-function 'common-lisp-indent-function)

;; ;;
;; ;; slime-cvs (2004.12.31) 

;; ;; (set-variable 'slime-net-coding-system 'utf-8-unix)


;; ;;;
;; ;;; for cmucl

;; ;; (set-variable 'slime-net-coding-system 'iso-latin-1-unix)

;; (defun hj.d.lee:set-lisp-maps (key command)
;;   (define-key slime-mode-map key command)
;; ;;   (define-key slime-repl-mode-map key command)
;;   (define-key lisp-mode-map key command)
;;   (define-key lisp-interaction-mode-map key command)
;;   (define-key emacs-lisp-mode-map key command))

;; ;; (defun hj.d.lee:set-lisp-non-repl-maps (key command)
;; ;;   (define-key slime-mode-map key command)
;; ;; ;;   (define-key lisp-mode-map key command)
;; ;;   (define-key emacs-lisp-mode-map key command))

;; ;; (load-library "suur-sexp")

;; ;; (hj.d.lee:set-lisp-maps [(?\()] 'insert-parentheses)
;; ;; (hj.d.lee:set-lisp-maps [(?\))] 'se:move-past-close-and-just-one-space)

;; ;; (hj.d.lee:set-lisp-non-repl-maps [(return)] 'newline-and-indent)
;; (define-key slime-mode-map [(return)] 'newline-and-indent)
;; (define-key lisp-interaction-mode-map [(return)] 'newline-and-indent)
;; (define-key emacs-lisp-mode-map [(return)] 'newline-and-indent)

;; ;; C-c <return>
;; (define-key slime-mode-map [3 return] 'slime-macroexpand-1)
;; ;; (define-key slime-repl-mode-map [3 return] 'slime-macroexpand-1)

;; ;; (load-library "balanced-parens")

;; (hj.d.lee:set-lisp-maps (kbd "C-t") 'transpose-sexps)
;; (hj.d.lee:set-lisp-maps (kbd "C-M-t") 'transpose-chars)
;; (hj.d.lee:set-lisp-maps (kbd "C-b") 'backward-sexp)
;; (hj.d.lee:set-lisp-maps (kbd "C-M-b") 'backward-char)
;; (hj.d.lee:set-lisp-maps (kbd "C-f") 'forward-sexp)
;; (hj.d.lee:set-lisp-maps (kbd "C-M-f") 'forward-char)

;; ;; (defun mwe:skeleton-pair-insert-maybe (&optional arg)
;; ;;   (interactive "P")
;; ;;   (save-excursion (skeleton-pair-insert-maybe arg))
;; ;;   (forward-char))


;; ;; (hj.d.lee:set-lisp-maps [(?\()] 'mwe:skeleton-pair-insert-maybe)


;; (defun mb:unwrap-next-sexp (&optional kill-n-sexps)
;;   "Convert (x ...) to ..."
;;   (interactive "P")
;;   (forward-sexp)
;;   (backward-delete-char 1)
;;   (backward-up-list)
;;   (delete-char 1)
;;   (let ((start-region-to-kill (point)))
;;     (kill-sexp kill-n-sexps)
;;     (down-list)
;;     (delete-region start-region-to-kill (1- (point)))
;;     (backward-up-list))
;;   (lisp-indent-line))

;; (defun cliki:lift-sexp (&optional arg)
;;   "Convert (x ... y) to ..."
;;   (interactive "P")
;;   (kill-sexp arg)
;;   (up-list)
;;   (backward-list)
;;   (kill-sexp)
;;   (yank 2)
;;   (backward-sexp arg))

;; (hj.d.lee:set-lisp-maps (kbd "M-_") 'mb:unwrap-next-sexp)
