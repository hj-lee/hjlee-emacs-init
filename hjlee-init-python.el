;;;
;;;   Author: Hwi-Jae. Lee. 
;;;


;;; http://stackoverflow.com/questions/2855378/ropemacs-usage-tutorial

(require 'python-mode)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; to prevent annoying M-/ binding
;; must be set before load ropemacs
(setq ropemacs-enable-shortcuts nil)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; (require 'auto-complete)
;; (global-auto-complete-mode t)
