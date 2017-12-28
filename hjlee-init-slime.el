;;;;;;;;;;;;;;;;;
;;; slime


(load (expand-file-name "~hjlee/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(slime-setup '(slime-fancy slime-asdf))

(load "~hjlee/quicklisp/clhs-use-local.el" t)

;;; paredit

(require 'paredit)

;;; 

(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)


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

;; ;; (add-to-list 'load-path "~hjlee/usr/elisp/redshank")
;; (require 'redshank-loader
;; 	 "~hjlee/usr/elisp/redshank/redshank-loader")

(eval-after-load "redshank-loader"
  `(redshank-setup '(lisp-mode-hook
		     slime-repl-mode-hook) t))

