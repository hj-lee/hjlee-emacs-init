;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-recipe-path-emacswiki
      "~/.emacs.d/el-get/el-get/recipes/emacswiki/")

;; ;; (push "~/.emacs.d/el-get-dev/recipes" el-get-recipe-path)
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-dev/recipes")
(add-to-list 'el-get-recipe-path "~/hjlee-emacs-init/el-get-recipes")

;;


;; leave slime to be managed by quicklisp
(setq my:el-get-packages
      '(magit
        paredit
        ;; nxhtml
        yasnippet
        redshank
        edit-server
        yaml-mode
        ;; auto-complete
        markdown-mode
        ;;;; python 
        python-mode
        pymacs
        rope
        ropemacs
        ropemode
        ;;;; scala
        scala-mode2
        ensime
        ))

(el-get 'sync my:el-get-packages)
