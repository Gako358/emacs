;;; evil-visual-star.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package evil-visualstar
  :after evil
  :ensure t
  :defer t
  :commands global-evil-visualstar-mode
  :hook (after-init . global-evil-visualstar-mode))
