; ;(standard-display-ascii ?\r "")

(quietly-read-abbrev-file)


;; diff-mode activation

(when (< emacs-major-version 21)
  (autoload 'diff-mode "diff-mode" "Diff major mode" t)
  (add-to-list 'auto-mode-alist 
	       '("\\.\\(diffs?\\|patch\\|rej\\)\\'" . diff-mode))
  )

(add-to-list 'auto-mode-alist 
	     '("\\.h$" . c++-mode))

(if is-gnu-emacs 
    (when (= emacs-major-version 21)
      (mouse-wheel-mode))
  (mwheel-install))
