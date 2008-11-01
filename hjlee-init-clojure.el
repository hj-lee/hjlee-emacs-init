;;;
;;;   Author: Hwi-Jae. Lee. 
;;;


(add-to-list 'load-path "~hjlee/usr/elisp/clojure-mode")
(require 'clojure-auto)
;; or if you use paredit, uncomment the following
(require 'clojure-paredit) 

;;; swank-clojure

(add-to-list 'load-path "~hjlee/usr/elisp/swank-clojure")

(setq swank-clojure-jar-path (expand-file-name "~hjlee/usr/clojure/clojure.jar"))

(require 'swank-clojure-autoload)
