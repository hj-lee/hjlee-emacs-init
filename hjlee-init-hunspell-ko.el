;;;
;;;   
;;;
;;;   Author: Hwijae Lee. 
;;;

(setq ispell-program-name "hunspell")
(setq ispell-really-hunspell t)

;; 사전 목록에 한국어("korean") 추가
(if (>= emacs-major-version 23)
    (setq ispell-local-dictionary-alist
          '(("korean"
             "[가-힣]"
             "[^가-힣]"
             "[0-9a-zA-Z]" nil
             ("-d" "ko_KR")
             nil utf-8)))
  (setq  ispell-local-dictionary-alist
         '(("korean"
            "[가-힝]"
            "[^가-힝]"
            "[0-9a-zA-Z)]" nil
            ("-d" "ko_KR")
            nil utf-8))))

;; 한국어를 기본 사전으로 지정
(setq ispell-dictionary "korean")
