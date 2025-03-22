;;; typescript.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flymake-mode +1)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)

;; for js-ts-mode with eglot
(use-package js-ts-mode
  :after eglot
  :hook (js-ts-mode . eglot-ensure)
  :mode
  (("\\.js\\'" . js-ts-mode)
   ("\\.ts\\'" . js-ts-mode)))
