;;
;; Simlink or copy this file to ~/.emacs.el
;;
;; ln -s ~/hjlee-emacs-init/basic.emacs.el ~/.emacs.el
;;

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq load-path (cons "~/hjlee-emacs-init" load-path))
(load-library "dot-emacs-init.el")
