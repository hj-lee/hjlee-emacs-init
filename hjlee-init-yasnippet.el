;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(add-to-list 'load-path "~hjlee/usr/elisp/yasnippet")

(require 'yasnippet)
(yas/initialize)

(yas/load-directory "~hjlee/usr/elisp/yasnippet/snippets")
