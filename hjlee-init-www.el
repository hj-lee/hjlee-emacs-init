;;;
;;; WWW
;;;


(push "/mnt/archive/usr/site-lisp/misc" load-path)


;;; css
(autoload 'css-mode "css-mode")
(setq auto-mode-alist       
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))



;;; js
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)