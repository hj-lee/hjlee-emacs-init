;;
;; simlink or copy to ~/.emacs.el or ~/.emacs.d/init.el


(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq load-path (cons "~/hjlee-emacs-init" load-path))
(load-library "dot-emacs-init.el")

(setq custom-file "~/hjlee-emacs-init/local-custom.el")
(load custom-file t)


(desktop-read)
