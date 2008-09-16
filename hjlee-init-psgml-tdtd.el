;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; psgml (for xml)


;; ; installed as debian package

;; but I have psgml-1.2.2 and debian package version is psgml-1.2.1 (at 2001.3.3)
;; now 1.2.2 in debian package.(2001.4.23)


; (setq load-path (cons "~/usr/share/emacs/site-lisp/psgml" load-path))

; (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
; (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

; (setq sgml-catalog-files
;       '("catalog" "/usr/lib/sgml/catalog"))


; (or (assoc "\\.xml$" auto-mode-alist)
;     (setq auto-mode-alist (cons '("\\.xml$" . xml-mode)
; 				auto-mode-alist)))


; (or (assoc "\\.html$" auto-mode-alist)
; 	(setq auto-mode-alist (cons '("\\.html$" . sgml-html-mode)
; 								auto-mode-alist)))


(or (assoc "\\.HTML$" auto-mode-alist)
	(setq auto-mode-alist (cons '("\\.HTML$" . html-mode)
								auto-mode-alist)))

(or (assoc "\\.HTM$" auto-mode-alist)
	(setq auto-mode-alist (cons '("\\.HTM$" . html-mode)
								auto-mode-alist)))

; (setq
;  sgml-always-quote-attributes   t
;  sgml-auto-insert-required-elements t
;  sgml-auto-activate-dtd         t

;  sgml-indent-data               t
;  sgml-indent-step               2

; ; sgml-indent-data               nil
; ; sgml-indent-step               nil

;  sgml-minimize-attributes       nil
;  sgml-omittag                   nil
;  sgml-shorttag                  nil

;  sgml-validate-command   "onsgmls -s %s %s"

;  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; tdtd

;; debian default package

;; (setq load-path (cons "~/usr/share/emacs/site-lisp/tdtd" load-path))

;; ;; Start DTD mode for editing SGML-DTDs
;; (autoload 'dtd-mode "tdtd" "Major mode for SGML and XML DTDs.")
;; (autoload 'dtd-etags "tdtd"
;;   "Execute etags on FILESPEC and match on DTD-specific regular expressions."
;;   t)
;; (autoload 'dtd-grep "tdtd" "Grep for PATTERN in files matching FILESPEC." t)

;; ;; Turn on font lock when in DTD mode
;; (add-hook 'dtd-mode-hooks
;; 		  'turn-on-font-lock)

;; (setq auto-mode-alist
;; 	  (append
;; 	   (list
;; 		'("\\.dcl$" . dtd-mode)
;; 		'("\\.dec$" . dtd-mode)
;; 		'("\\.dtd$" . dtd-mode)
;; 		'("\\.ele$" . dtd-mode)
;; 		'("\\.ent$" . dtd-mode)
;; 		'("\\.mod$" . dtd-mode))
;; 	   auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'html-mode-hook
          (lambda ()
            (define-key html-mode-map
              "\C-c\C-c"
              'comment-region)
            ))
