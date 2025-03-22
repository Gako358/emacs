;;; java.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Java language server
(use-package eglot-java
  :init
  :hook (java-ts-mode . eglot-java-mode)
  :config
  (define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
  (define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
  (define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
  (define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
  (define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
  (define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh))

(with-eval-after-load 'eglot-java)
