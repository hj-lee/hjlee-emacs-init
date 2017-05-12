;;;
;;;   $Id: elisp-insert.el,v 1.1 1996/12/10 12:25:00 hjlee Exp $
;;;
;;;   Author: Hwi-Jae. Lee. 
;;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; (require 'use-package)

(require 'diminish)
(require 'bind-key)

;;;;;;;;;;;;;;;;

(use-package magit
  :ensure t
  ;; :pin melpa-stable
  )

(use-package paredit
  :ensure t
  ;; :pin melpa-stable
  )

(use-package yasnippet
  :ensure t
  ;; :pin melpa-stable
  )

(use-package redshank
  :ensure t
  ;; :pin melpa-stable
  )

(use-package edit-server
  :ensure t
  ;; :pin melpa-stable
  )

(use-package yaml-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package markdown-mode
  :ensure t
  ;; :pin melpa-stable
  )

;;;; python

(use-package python-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package pymacs
  :ensure t
  ;; :pin melpa-stable
  )

;;;; scala

(use-package scala-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package sbt-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package ensime
  :ensure t
  ;; :pin melpa-stable
  )

(use-package web-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package js2-mode
  :ensure t
  ;; :pin melpa-stable
  )

;;;;;;;;;;;;;;;;;;;

(use-package groovy-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package groovy-imports
  :ensure t
  ;; :pin melpa-stable
  )

(use-package gradle-mode
  :ensure t
  ;; :pin melpa-stable
  )

(use-package feature-mode
  :ensure t
  ;; :pin melpa-stable
  )
