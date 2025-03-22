;;; evil-leader.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; Project
  "fb" 'counsel-find-file
  "ff" 'projectile-find-file
  "fg" 'projectile-ripgrep
  "pp" 'projectile-switch-project
  "pc" 'projectile-cleanup-known-projects

  "<SPC>" 'projectile-switch-to-buffer

  ;; Buffers
  "bb" 'switch-to-buffer
  "bd" 'kill-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer

  ;; Git
  "/" 'magit-status
  "bm" 'blamer-mode

  ;; LSP
  "lo" 'eglot
  "la" 'eglot-code-actions
  "lf" 'apheleia-format-buffer
  "lr" 'eglot-rename
  "lH" 'gelot-nlay-hints-mode
  "ld" 'eglot-find-declaration
  "li" 'egliot-find-implementation
  "lt" 'eglot-find-typeDefinition
  "lI" 'eglot-organize-import
  "ln" 'flymake-goto-next-error
  "lh"  'eldoc-box-help-at-point
  "lwd" 'flymake-show-project-diagnostics
  "lbd" 'flymake-show-buffer-diagnostics

  ;; Dirvish
  "rf" 'dirvish

  ;; Vterm
  "tl" 'vterm-layout
  "tr" 'toggle-vterm-right
  "tk" 'kill-all-vterms-in-project
  "tt" 'toggle-vterm
  "t1" (lambda () (interactive) (toggle-vterm 1))
  "t2" (lambda () (interactive) (toggle-vterm 2))
  "t3" (lambda () (interactive) (toggle-vterm 3))
  "t4" (lambda () (interactive) (toggle-vterm 4))
  "t5" (lambda () (interactive) (toggle-vterm 5))
  "t6" (lambda () (interactive) (toggle-vterm 6))
  "t7" (lambda () (interactive) (toggle-vterm 7))
  "t8" (lambda () (interactive) (toggle-vterm 8))
  "t9" (lambda () (interactive) (toggle-vterm 9)))
