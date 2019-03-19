(add-hook 'kotlin-mode-hook
	  (lambda ()
;	    (font-lock-mode nil)
	    (setq ; tab-width 8
	          kotlin-tab-width 4
		  ;; nil will make sure spaces are used instead of tabs
		  indent-tabs-mode nil)
	    ))

(add-to-list 'auto-mode-alist
	     '("\\.kts$" . kotlin-mode))
