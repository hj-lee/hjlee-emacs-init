;;;
;;;
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-hide-leading-stars t)
