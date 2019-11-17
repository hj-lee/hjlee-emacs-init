;;;;
;; Korean setting

(setq default-korean-keyboard "3")

; use custom
(set-language-environment "Korean")

;;; for gnus mail writer
(put-charset-property 'korean-ksc5601 'preferred-coding-system 'euc-kr)

(unless window-system
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (define-key encoded-kbd-mode-map [27] nil)
  )

(prefer-coding-system 'utf-8)
