;;;
;;;   $Id: dot-emacs-init.el,v 1.7 2005/01/21 11:11:39 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee.
;;;

;; (when (= emacs-major-version 22)
;;   (push
;;    (expand-file-name "fonts/bdf" "/mnt/archive/usr/emacs-fonts")
;;    bdf-directory-list)
;;   (load-library "hjlee-init-emacs22"))


(unless (boundp 'debian-emacs-flavor)
  (load-library "hjlee-init-read-debian"))

(load-library "hjlee-init-korean")

(load-library "hjlee-init-basic-editing")

(load-library "hjlee-init-basic-keybinding")

;; (load-library "hjlee-init-gnus-bbdb")

(load-library "hjlee-init-cc-mode")

;; (load-library "hjlee-init-psgml-tdtd")

;; (load-library "hjlee-init-python")

;; (load-library "hjlee-init-cedet")

;(load-library "hjlee-init-ecb")

;(load-library "hjlee-init-follow-mouse")

;(load-library "hjlee-init-mswindows")

;; (load-library "hjlee-init-darcs")

(load-library "hjlee-init-www")

(load-library "hjlee-init-autoinsert")

(load-library "hjlee-init-my-initial")

(when (< emacs-major-version 22)
  (load-library "hjlee-init-calendar")
  )

(load-library "hjlee-init-timestamp")

;; (load-library "hjlee-init-ilisp")
(load-library "hjlee-init-slime")

(load-library "hjlee-init-git")

(load-library "hjlee-init-nxhtml")

(load-library "hjlee-init-rinari")

(load-library "hjlee-init-ruby")

(load-library "hjlee-init-clojure")


;; (load-library "keywiz")
(require 'cl)

;; (when (= emacs-major-version 22)
;;   (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;   (define-key global-map "\C-cl" 'org-store-link)
;;   (define-key global-map "\C-ca" 'org-agenda)
;;   )

;; (when (= emacs-major-version 22)
;;   (load-library "hjlee-init-emacs-rails"))



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

;; (when is-gnu-emacs
;;   (load-library "hjlee-init-mailcrypt"))


;;;;;;;;;;;;;
;;; emacs customize setting

(when is-gnu-emacs
  (global-font-lock-mode t))

