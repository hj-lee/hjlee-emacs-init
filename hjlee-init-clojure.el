;;;
;;;   Author: Hwi-Jae. Lee. 
;;;


(add-to-list 'load-path "~hjlee/usr/elisp/clojure-mode")
(add-to-list 'load-path "~hjlee/usr/elisp/slime")
(add-to-list 'load-path "~hjlee/usr/elisp/swank-clojure")

(require 'clojure-mode)
(require 'clojure-test-mode)

(require 'slime)
(slime-setup)

(setq slime-net-coding-system 'utf-8-unix)

(setq swank-clojure-binary "clojure")

(require 'swank-clojure-autoload)

;; or if you use paredit, uncomment the following
(require 'paredit)
(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)

;;; swank-clojure


;; (setq swank-clojure-jar-path (expand-file-name "~hjlee/usr/clojure_git/clojure.jar"))

