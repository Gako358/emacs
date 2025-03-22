;;; rust.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Rust language server
(use-package rust-ts-mode
  :mode "\\.rs\\'"
  :hook
  (rust-ts-mode-hook . eglot-ensure)
  :init
  (with-eval-after-load 'org
    (cl-pushnew '("rust" . rust-ts-mode) org-src-lang-modes :test #'equal)))
