;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(setq ispell-program-name "hunspell") 
(if (>= emacs-major-version 23)
    (setq ispell-local-dictionary-alist
	  '(("korean"
	     "[가-힟]"
	     "[^가-힟]"
	     "" nil
	     ("-d" "/usr/share/myspell/dicts/ko_KR")
	     nil utf-8)))
    (setq ispell-local-dictionary-alist
	  '(("korean"
	     "[가-힝]"
	     "[^가-힝]"
	     "" nil
	     ("-d" "/usr/share/myspell/dicts/ko_KR")
	     nil utf-8))))

(setq ispell-dictionary "korean")
