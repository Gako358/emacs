;;; bar.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; The vim-tab-bar package is used for managing tabs, activated after initialization.
(use-package vim-tab-bar
  :ensure t
  :commands vim-tab-bar-mode
  :hook (after-init . vim-tab-bar-mode))
