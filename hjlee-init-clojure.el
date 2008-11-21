;;;
;;;   Author: Hwi-Jae. Lee. 
;;;


(add-to-list 'load-path "~hjlee/usr/elisp/clojure-mode")
(add-to-list 'load-path "~hjlee/usr/elisp/slime")
(add-to-list 'load-path "~hjlee/usr/elisp/swank-clojure")

(require 'clojure-auto)

(require 'slime)
(slime-setup)

(setq swank-clojure-binary "clojure")

(require 'swank-clojure-autoload)

;; or if you use paredit, uncomment the following
;; (require 'clojure-paredit)

;;; swank-clojure


;; (setq swank-clojure-jar-path (expand-file-name "~hjlee/usr/clojure_git/clojure.jar"))

