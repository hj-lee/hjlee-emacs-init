;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(add-to-list 'load-path "~hjlee/.emacs.d/el-get/el-get")


(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; (setq el-get-recipe-path-emacswiki
;;       "~hjlee/.emacs.d/el-get/el-get/recipes/emacswiki/")

;; (add-to-list 'el-get-recipe-path "~hjlee/hjlee-emacs-init/el-get-recipes")

;; leave slime to be managed by quicklisp
(setq my:el-get-packages
      '(
	magit
        paredit
        ;; nxhtml
        yasnippet
        redshank
        edit-server
        yaml-mode
        ;; auto-complete
        markdown-mode
        dtrt-indent
        ;;;; python 
        python-mode
        pymacs
        rope
        ropemacs
        ropemode
        ;;;; scala
        scala-mode2
        ensime
        ;;;; html
        web-mode
        ;;;; php
        php-mode
        php-mode-improved
        php-completion
        php-doc
        php-eldoc
        ))

(el-get 'sync my:el-get-packages)
