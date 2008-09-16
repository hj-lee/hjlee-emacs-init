;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee.
;;;

(push "/mnt/archive/usr/site-lisp/misc" load-path)


;; find-recursive
(require 'find-recursive)


;; ;; it's in debian ruby-mode
;; ;; inf-ruby
;; ;; ruby-mode required

;; (autoload 'run-ruby "inf-ruby"
;;   "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;        '(lambda ()
;;           (inf-ruby-keys)
;;           ))



;; emacs-rails

(push "/mnt/archive/usr/site-lisp/emacs-rails" load-path)
(require 'rails)


;; ;; in emacs-rails
;; ;; ri-emacs

;; (setq ri-ruby-script "/mnt/archive/usr/site-lisp/ri-emacs/ri-emacs.rb")
;; (autoload 'ri "/mnt/archive/usr/site-lisp/ri-emacs/ri-ruby.el" nil t)

;; yaml-mode

(push "/mnt/archive/usr/site-lisp/yaml-mode-0.0.3" load-path)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
