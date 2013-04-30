;;;
;;;   
;;;
;;;   Author: Hwijae. Lee. 
;;;

;;
;; (setq ispell-program-name "enchant")
(setq ispell-program-name "hunspell")
(setq ispell-really-hunspell t)

(if (>= emacs-major-version 23)
    (setq ispell-local-dictionary-alist
          '("korean"
            "[가-힣]"
            "[^가-힣]"
            "[0-9a-zA-Z]" nil
            ("-d" "ko_KR")
            nil utf-8))
    (setq  ispell-local-dictionary-alist
           '("korean"
             "[가-힝]"
             "[^가-힝]"
             "[0-9a-zA-Z)]" nil
             ("-d" "ko_KR")
             nil utf-8)))

(setq ispell-dictionary "korean")

;; (setq ispell-program-name "hunspell") 
;; (setq ispell-dictionary "english")	
