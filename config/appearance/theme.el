;;; theme.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; The kaolin-themes package is used with specific settings for a personalized look, loading the "kaolin-ocean" theme.
(use-package kaolin-themes
  :config
  (setq kaolin-ocean-alt-bg t)
  (setq kaolin-themes-italic-comments t
	kaolin-themes-hl-line-colored t
	kaolin-themes-git-gutter-solid t)
  (load-theme 'kaolin-ocean t))
