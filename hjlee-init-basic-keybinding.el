;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key bindings

;; emacs 21 default binding
(when (< emacs-major-version 21)
  (global-set-key [delete] 'delete-char)
  (global-set-key [home] 'beginning-of-line)
  (global-set-key [end] 'end-of-line)
  )

;; (setq f1-function 'where-is)
(setq f2-function 'find-file)
(setq f3-function 'other-window)
(setq f4-function 'delete-other-windows)
(setq f5-function 'split-window-vertically)
(setq f6-function 'switch-to-buffer)
(setq f7-function 'switch-to-buffer-other-frame)
(setq f8-function 'find-file-other-frame)
;; (setq f9-function 'other-frame)
(setq f10-function 'goto-line)
(setq f11-function 'new-frame)
(setq f12-function 'delete-frame)

; (global-set-key [f1] f1-function)       ; F1
(global-set-key [f2] f2-function)       ; F2
(global-set-key [f3] f3-function)       ; F3
(global-set-key [f4] f4-function)       ; F4
(global-set-key [f5] f5-function)       ; F5
(global-set-key [f6] f6-function)       ; F6
(global-set-key [f7] f7-function)       ; F7
(global-set-key [f8] f8-function)       ; F8
;; hanja 
; (global-set-key [f9] f9-function)       ; F9
(global-set-key [f10] f10-function)     ; F10
(global-set-key [f11] f11-function)     ; F11
(global-set-key [f12] f12-function)     ; F12

;;;;
(if is-gnu-emacs
    (global-set-key [C-f7] 'compile)
  (global-set-key '(control f7) 'compile))

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-z") 'undo)

;; (when
;;     window-system
;;   (keyboard-translate ?\( ?\[)
;;   (keyboard-translate ?\[ ?\()
;;   (keyboard-translate ?\) ?\])
;;   (keyboard-translate ?\] ?\)))
