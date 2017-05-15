
(defun my-groovy-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (c-toggle-auto-newline 0))

(add-hook 'groovy-mode-hook 'my-groovy-mode-hook)

(add-to-list 'auto-mode-alist
	     '("\\.gradle$" . groovy-mode))
