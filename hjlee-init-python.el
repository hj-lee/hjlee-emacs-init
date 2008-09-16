
;; python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; python-mode also in debian package (python2-elisp)

(when (>= emacs-major-version 21)
;;   (setq load-path (cons "~/usr/share/emacs/site-lisp/python-mode" load-path))
  (setq load-path (cons "/usr/share/emacs/site-lisp/python2.2-elisp" load-path))

  (autoload 'python-mode "python-mode" "Python editing mode." t)
  
  (setq auto-mode-alist
 	(cons '("\\.py$" . python-mode) auto-mode-alist))
  
  (setq interpreter-mode-alist
 	(cons '("python" . python-mode)
 	      interpreter-mode-alist))  
  )
  