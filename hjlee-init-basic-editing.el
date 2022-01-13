; ;(standard-display-ascii ?\r "")

;; diff-mode activation

(when (< emacs-major-version 21)
  (autoload 'diff-mode "diff-mode" "Diff major mode" t)
  (add-to-list 'auto-mode-alist 
	       '("\\.\\(diffs?\\|patch\\|rej\\)\\'" . diff-mode))
  )

(add-to-list 'auto-mode-alist 
	     '("\\.h$" . c++-mode))

(setq column-number-mode t)
(setq case-fold-search nil)
(setq show-paren-mode t)
(setq tool-bar-mode nil)
(setq vc-follow-symlinks t)

(setq version-control t)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq kept-new-versions 3)

;; (setq ido-default-buffer-method 'selected-window)
;; (setq ido-everywhere t)

