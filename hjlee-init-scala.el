;;;
;;;   Scala mode settings
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(add-to-list 'load-path "~hjlee/usr/scala/misc/scala-tool-support/emacs/")

(require 'scala-mode-auto)

;; (setq yas/my-directory "~hjlee/usr/scala/misc/scala-tool-support/emacs/")
;; (yas/load-directory yas/my-directory)

(add-hook 'scala-mode-hook
	  '(lambda ()
	     (yas/minor-mode-on)
	     (c-toggle-auto-hungry-state 1)
	     ))

(load "~hjlee/usr/elisp/scallap/tools/emacs/sbt.el")

