
;;; disable package.el
(setq package-enable-at-startup nil)

;;; elpaca init from https://github.com/progfolio/elpaca?tab=readme-ov-file#installation

(defvar elpaca-installer-version 0.9)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))


;;;
;;; Enable no-symlink-mode for windows

(if (eq system-type 'windows-nt)
    (elpaca-no-symlink-mode)
)

;;;

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))


;;;
(setq use-package-always-ensure t)

;;;
;;; package list
;;;

(use-package compat)
(use-package transient)

;;;; magit is dependant on newer transient and compat
(use-package magit
  :after (transient compat))


(use-package paredit)

(use-package yasnippet)

(use-package redshank)

(use-package edit-server)

(use-package yaml-mode)

(use-package markdown-mode)

(use-package python-mode)
;; (use-package pymacs)


(use-package scala-mode)
(use-package sbt-mode)

(use-package web-mode)
(use-package js2-mode
  :mode "\\.js\\'")

;;;;;;;;;;;;;;;;;;;

(use-package groovy-mode)

(use-package groovy-imports)

(use-package gradle-mode)

(use-package feature-mode)

(use-package helm)
;; (use-package helm-gtags)

(use-package kotlin-mode)

(use-package julia-mode)
(use-package julia-repl)
(use-package julia-shell)

(use-package typescript-mode)

(use-package rust-mode)

(use-package rust-playground)

;; (use-package rustic)

(use-package flycheck
  :config (global-flycheck-mode))

;;;;;;;;;
;; react

(use-package rjsx-mode)

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;;

(use-package cuda-mode)

(use-package google-c-style)

(use-package swift-mode)

(use-package scad-mode)

(use-package mise
  :config (global-mise-mode))


(elpaca-wait)

