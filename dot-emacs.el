
;; should be (sym)linked to ~/.emacs.el

(if (getenv "DOOM_EMACS")
    (load-file "~/doom-emacs/init.el")
  (load-file "~/.emacs.d-normal/init.el"))

