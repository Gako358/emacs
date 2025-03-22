;;; c.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; C language server
(use-package c-ts-mode
  :hook (c-ts-mode . eglot-ensure)
  :mode (("\\.c\\'" . c-ts-mode)
	 ("\\.h\\'" . c-ts-mode)))
