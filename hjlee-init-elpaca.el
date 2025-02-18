
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

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
	(elpaca-use-package-mode))


;;;
;;; package list
;;;

;; magit is dependant on transient
(use-package transient  :ensure (:wait t) :demand t)

(use-package magit  :ensure (:wait t) :demand t)

(use-package paredit :ensure (:wait t) :demand t)

(use-package yasnippet :ensure (:wait t) :demand t)

(use-package redshank :ensure (:wait t) :demand t)

(use-package edit-server :ensure (:wait t) :demand t)

(use-package yaml-mode :ensure (:wait t) :demand t)

(use-package markdown-mode :ensure (:wait t) :demand t)

(use-package python-mode :ensure (:wait t) :demand t)
;; (use-package pymacs :ensure (:wait t) :demand t)


(use-package scala-mode :ensure (:wait t) :demand t)
(use-package sbt-mode :ensure (:wait t) :demand t)

(use-package web-mode :ensure (:wait t) :demand t)
(use-package js2-mode :ensure (:wait t) :demand t
  :mode "\\.js\\'")

;;;;;;;;;;;;;;;;;;;

(use-package groovy-mode :ensure (:wait t) :demand t)

(use-package groovy-imports :ensure (:wait t) :demand t)

(use-package gradle-mode :ensure (:wait t) :demand t)

(use-package feature-mode :ensure (:wait t) :demand t)

(use-package helm :ensure (:wait t) :demand t)
(use-package helm-gtags :ensure (:wait t) :demand t)

(use-package kotlin-mode :ensure (:wait t) :demand t)

(use-package julia-mode :ensure (:wait t) :demand t)
(use-package julia-repl :ensure (:wait t) :demand t)
(use-package julia-shell :ensure (:wait t) :demand t)

(use-package typescript-mode :ensure (:wait t) :demand t)

(use-package rust-mode :ensure (:wait t) :demand t)

(use-package rust-playground :ensure (:wait t) :demand t)

;; (use-package rustic :ensure (:wait t) :demand t)

(use-package flycheck :ensure (:wait t) :demand t
  :config (global-flycheck-mode))

;;;;;;;;;
;; react

(use-package rjsx-mode :ensure (:wait t) :demand t)

(use-package tide :ensure (:wait t) :demand t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;;

(use-package cuda-mode :ensure (:wait t) :demand t)

(use-package google-c-style :ensure (:wait t) :demand t)

(use-package swift-mode :ensure (:wait t) :demand t)

(use-package scad-mode :ensure (:wait t) :demand t)
