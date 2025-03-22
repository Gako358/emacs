;;; scala.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Scala language server
(use-package scala-ts-mode
  :init
  (setq scala-ts-indent-offset 2)
  :hook ((scala-ts-mode . eglot-ensure)
	 (before-save . eglot-format-buffer)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(scala-ts-mode . ("metals"))))
