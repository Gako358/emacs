;;; undo.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; The undo-fu-session package is configured for global session management, maintaining undo history across sessions.
(use-package undo-fu-session
  :ensure t
  :config
  (undo-fu-session-global-mode))
