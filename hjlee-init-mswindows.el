;;;;;;;
;;; Windows settings

(setq load-path (cons "c:/usr/gnuserv" load-path))

(require 'gnuserv)
(gnuserv-start)

;;; this makes gnuserv to uses initial frmae
(setq gnuserv-frame (selected-frame))

;;;;;;;


; ;(global-set-key [mouse-wheel] 'mouse-wheel-handler)
; (global-set-key [mouse-wheel] 'mouse-wheel-scroll-line)
; (setq shell-command-switch "-c")
; (setq win32-quote-process-args t)
; (setq win32-num-mouse-buttons 2)
; ;(using-unix-filesystems t)
; ;(setenv "SHELL" "c:/usr/local/gnuwin32/b18/H-i386-cygwin32/bin/bash.exe")
; ;(setq shell-file-name "c:/usr/local/gnuwin32/b18/H-i386-cygwin32/bin/bash.exe")
; (setenv "SHELL" "E:/CYGNUS/CYGWIN-B20/H-I586-CYGWIN32/BIN/bash.exe")
; (setq shell-file-name "E:/CYGNUS/CYGWIN-B20/H-I586-CYGWIN32/BIN/bash.exe")
; (add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)
; ; (setq default-frame-alist
; ;       '((cursor-color . "blue")
; ;         (foreground-color . "black")
; ;         (background-color . "white")
; ;         (top . 5) (left . 600)
; ;         (width . 80) (height . 87)
; ;         (font . "-*-6X13-medium-r-*-*-13-97-*-*-p-60-*-ansi-")))
; ;(setq initial-frame-alist '((top . 5) (left . 70)))

; ;(set-default-font "-*-Lucida Console-normal-r-*-*-13-97-*-*-p-70-*-ansi-")
; (add-hook 'shell-mode-hook
;           '(lambda () (setq comint-completion-addsuffix '("/" . ""))) t)

;;;

