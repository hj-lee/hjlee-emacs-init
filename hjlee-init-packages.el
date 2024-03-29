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

;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (require 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
;;;;;;;;;;;;;;;;

(use-package magit
  ;; :pin melpa-stable
  )

(use-package paredit
  ;; :pin melpa-stable
  )

(use-package yasnippet
  ;; :pin melpa-stable
  )

(use-package redshank
  ;; :pin melpa-stable
  )

(use-package edit-server
  ;; :pin melpa-stable
  )

(use-package yaml-mode
  ;; :pin melpa-stable
  )

(use-package markdown-mode
  ;; :pin melpa-stable
  )

;;;; python

(use-package python-mode
  ;; :pin melpa-stable
  )

;; (use-package pymacs
;;   ;; :pin melpa-stable
;;   )

;;;; scala

(use-package scala-mode
  ;; :pin melpa-stable
  )

(use-package sbt-mode
  ;; :pin melpa-stable
  )

(use-package web-mode
  ;; :pin melpa-stable
  )

(use-package js2-mode
  :mode "\\.js\\'"
  ;; :pin melpa-stable
  )

;;;;;;;;;;;;;;;;;;;

(use-package groovy-mode
  ;; :pin melpa-stable
  )

(use-package groovy-imports
  ;; :pin melpa-stable
  )

(use-package gradle-mode
  ;; :pin melpa-stable
  )

(use-package feature-mode
  ;; :pin melpa-stable
  )

(use-package helm
  ;; :pin melpa-stable
  )

(use-package kotlin-mode
  ;; :pin melpa-stable
  )

(use-package julia-mode
  ;; :pin melpa-stable
  )
(use-package julia-repl
  ;; :pin melpa-stable
  )
(use-package julia-shell
  ;; :pin melpa-stable
  )

(use-package typescript-mode
  ;; :pin melpa-stable
  )

(use-package rust-mode
  ;; :pin melpa-stable
  )

(use-package rust-playground
  ;; :pin melpa-stable
  )

;; (use-package rustic
;;   :pin melpa-stable
;;   )

;;;;;;;;;
;; react

(use-package web-mode
  ;; :pin melpa-stable
  )

(use-package rjsx-mode
  ;; :pin melpa-stable
  )

(use-package tide
  ;; :pin melpa-stable
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package flycheck
  ;; :pin melpa-stable
  :ensure t
  :init (global-flycheck-mode))

(use-package cuda-mode
  ;; :pin melpa-stable
  )

(use-package google-c-style
  ;; :pin melpa-stable
  )

(use-package swift-mode
  ;; :pin melpa-stable
  )
