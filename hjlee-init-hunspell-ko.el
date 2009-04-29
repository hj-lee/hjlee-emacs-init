;;;
;;;   
;;;
;;;   Author: Hwijae. Lee. 
;;;

(setq ispell-program-name "enchant") 

(if (>= emacs-major-version 23)
    (setq ispell-local-dictionary-alist
	  '(("korean"
	     "[가-힣]"
	     "[^가-힣]"
	     "" nil
	     ("-d" "ko_KR")
	     nil utf-8)))
    (setq ispell-local-dictionary-alist
	  '(("korean"
	     "[가-힝]"
	     "[^가-힝]"
	     "" nil
	     ("-d" "ko_KR")
	     nil utf-8))))

(setq ispell-dictionary "korean")
