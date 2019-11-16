;;;
;;;   $Id: dot-emacs-init.el,v 1.7 2005/01/21 11:11:39 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee.
;;;

(require 'cl)

(load-library "hjlee-init-korean")

(load-library "hjlee-init-basic-keybinding")

(load-library "hjlee-init-basic-editing")

;;;
;; (load-library "hjlee-init-el-get")
(load-library "hjlee-init-packages")

(load-library "hjlee-init-cc-mode")

(load-library "hjlee-init-autoinsert")

(load-library "hjlee-init-my-initial")

(load-library "hjlee-init-calendar")

(load-library "hjlee-init-timestamp")

;; (load-library "hjlee-init-slime")

;; (load-library "hjlee-init-python")

(load-library "hjlee-init-web")

(load-library "hjlee-init-groovy")

(load-library "hjlee-init-helm")
(load-library "hjlee-init-helm-gtags")

(server-start)

;;;; chromium browser edit plug-in
(require 'edit-server)
(edit-server-start)

;; (load-library "hjlee-init-hunspell-ko")
;; ;; (setq ispell-program-name "enchant") 
;; ;; (setq ispell-program-name "ispell") 


;;;;;;;;;;;;;
;;; emacs customize setting

(when is-gnu-emacs
  (global-font-lock-mode t))

