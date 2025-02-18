;;;
;;;   Author: Hwijae Lee
;;;

;;;;

(setq custom-file "~/hjlee-emacs-init/local-custom.el")
(load custom-file t)

;;;;

(load-library "hjlee-init-korean")

(load-library "hjlee-init-basic-keybinding")

(load-library "hjlee-init-basic-editing")

(load-library "hjlee-init-elpaca")

;;;;

(load-library "hjlee-init-cc-mode")

(load-library "hjlee-init-web")

(load-library "hjlee-init-groovy")

(load-library "hjlee-init-helm")
(load-library "hjlee-init-helm-gtags")

;;;;

(server-start)

;;;; chromium browser edit plug-in
(require 'edit-server)
(edit-server-start)

;;;;;;;;;;;;;
;;; emacs customize setting

(global-font-lock-mode t)

(desktop-read)

