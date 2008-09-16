;;;
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

;; (add-to-list 'load-path (expand-file-name "~hjlee/usr/share/emacs/site-lisp/darcs-mode"))

;; (require 'darcs)




(add-to-list 'load-path (expand-file-name "~hjlee/usr/share/emacs/site-lisp/vc-darcs"))

(add-to-list 'vc-handled-backends 'DARCS)
(autoload 'vc-darcs-find-file-hook "vc-darcs")
(add-hook 'find-file-hooks 'vc-darcs-find-file-hook)




;; (add-to-list 'load-path (expand-file-name "~hjlee/archive/packages/darcs-related/emacs/"))

;; (load-library "darcsum")
