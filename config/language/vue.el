;;; vue.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Vue language support
(use-package vue-ts-mode
  :after eglot
  :hook (vue-ts-mode . eglot-ensure)
  :mode
  (("\\.vue\\'" . vue-ts-mode)))
