
(add-hook 'lisp-mode-hook
	  (lambda ()
;; 	    (imenu-add-to-menubar "Symbols")
;; 	    (outline-minor-mode)
;; 	    (make-local-variable 'outline-regexp)
;; 	    (setq outline-regexp "^(.*")
;; 	    (ignore-errors (semantic-default-elisp-setup))
	    (set (make-local-variable lisp-indent-function)
		 'common-lisp-indent-function)))