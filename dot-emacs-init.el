;;;
;;;   $Id: dot-emacs-init.el,v 1.7 2005/01/21 11:11:39 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee.
;;;

(require 'cl)

(load-library "hjlee-init-el-get")

(unless (boundp 'debian-emacs-flavor)
  (load-library "hjlee-init-read-debian"))

(load-library "hjlee-init-korean")

(load-library "hjlee-init-basic-editing")

(load-library "hjlee-init-basic-keybinding")

(load-library "hjlee-init-cc-mode")

(load-library "hjlee-init-autoinsert")

(load-library "hjlee-init-my-initial")

(load-library "hjlee-init-calendar")

(load-library "hjlee-init-timestamp")

(load-library "hjlee-init-slime")

(load-library "hjlee-init-python")

;;;; chromium browser edit plug-in
(require 'edit-server)
(edit-server-start)

;; (load-library "hjlee-init-hunspell-ko")
;; ;; (setq ispell-program-name "enchant") 
;; ;; (setq ispell-program-name "ispell") 

;; for experiment with emacs-cvs
(let ((path "/usr/share/emacs/site-lisp/gnuserv"))
  (unless (find path load-path :test 'equal)
    (add-to-list 'load-path path)
    (autoload (quote gnuserv-start) "gnuserv-compat"
    "Allow this Emacs process to be a server for client processes.
This starts a gnuserv communications subprocess through which
client \"editors\" (gnuclient and gnudoit) can send editing commands to
this Emacs job.  See the gnuserv(1) manual page for more details.

Prefix arg means just kill any existing server communications subprocess."

    t nil)))


(setq gnuserv-frame t)
(gnuserv-start)

;;;;;;;;;;;;;
;;; emacs customize setting

(when is-gnu-emacs
  (global-font-lock-mode t))

