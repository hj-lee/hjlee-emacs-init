
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
;;; package list
;;;
(defmacro my-use-package (name &rest args)
  `(use-package ,name
     :ensure t
     ,@args))

;; macro test
;(macroexpand-1 '(my-use-package paredit ))
;(macroexpand-1 '(my-use-package js2-mode :mode "\\.js\\'"))

(my-use-package compat)
(my-use-package transient)

;;;; magit is dependant on newer transient and compat
(my-use-package magit
  :after (transient compat))


(my-use-package paredit)

(my-use-package yasnippet)

(my-use-package redshank)

(my-use-package edit-server)

(my-use-package yaml-mode)

(my-use-package markdown-mode)

(my-use-package python-mode)
;; (my-use-package pymacs)


(my-use-package scala-mode)
(my-use-package sbt-mode)

(my-use-package web-mode)
(my-use-package js2-mode
  :mode "\\.js\\'")

;;;;;;;;;;;;;;;;;;;

(my-use-package groovy-mode)

(my-use-package groovy-imports)

(my-use-package gradle-mode)

(my-use-package feature-mode)

(my-use-package helm)
(my-use-package helm-gtags)

(my-use-package kotlin-mode)

(my-use-package julia-mode)
(my-use-package julia-repl)
(my-use-package julia-shell)

(my-use-package typescript-mode)

(my-use-package rust-mode)

(my-use-package rust-playground)

;; (my-use-package rustic)

(my-use-package flycheck
  :config (global-flycheck-mode))

;;;;;;;;;
;; react

(my-use-package rjsx-mode)

(my-use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;;

(my-use-package cuda-mode)

(my-use-package google-c-style)

(my-use-package swift-mode)

(my-use-package scad-mode)


(elpaca-wait)

