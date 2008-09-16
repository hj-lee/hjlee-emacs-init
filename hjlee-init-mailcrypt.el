;;;
;;;   $Id: hjlee-init-mailcrypt.el,v 1.1 2003/09/18 13:18:14 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(setq load-path (cons "/usr/share/emacs/site-lisp/mailcrypt" load-path))
;(load-library "mailcrypt")

(require 'mailcrypt-init)

;; Autoloads as per README
(autoload 'mc-install-write-mode "mailcrypt" "Part of MailCrypt" t)
(autoload 'mc-install-read-mode "mailcrypt" "Part of MailCrypt" t)
(autoload 'mc-setversion "mailcrypt" "Part of MailCrypt" t)

;; mail-mode hook
(add-hook 'mail-mode-hook 'mc-install-write-mode)

;; rmail hooks
(if (and (boundp 'emacs-version)
	 (>= emacs-major-version 20)
	 (>= emacs-minor-version 3))
    (add-hook 'rmail-show-message-hook 'mc-install-read-mode)
  (add-hook 'rmail-mode-hook 'mc-install-read-mode))
(add-hook 'rmail-summary-mode-hook 'mc-install-read-mode)
  
;; vm hooks
(add-hook 'vm-mode-hook 'mc-install-read-mode)
(add-hook 'vm-summary-mode-hook 'mc-install-read-mode)
(add-hook 'vm-virtual-mode-hook 'mc-install-read-mode)
(add-hook 'vm-mail-mode-hook 'mc-install-write-mode)

;; mh hooks
(add-hook 'mh-folder-mode-hook 'mc-install-read-mode)
(add-hook 'mh-letter-mode-hook 'mc-install-write-mode)

;; gnus hooks
(add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)
(add-hook 'message-setup-hook 'mc-install-write-mode)
(add-hook 'news-reply-mode-hook 'mc-install-write-mode)

(mc-setversion "gpg")
(autoload 'mc-install-write-mod "mailcrypt" nil t)
(autoload 'mc-install-read-mode "mailcrypt" nil t)

(setq mc-gpg-user-id "hwijae_lee@zionex.com")

;; 보내는 메시지에 자동으로 sign을 보내기 위해...

; (add-hook 'message-send-hook 'my-sign-message)
; (defun my-sign-message ()
; (if (yes-or-no-p "Sign message? ")
; (mc-sign-message)))
