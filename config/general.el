;;; general.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Ensure Emacs loads the most recent byte-compiled files.
(setq load-prefer-newer t)

;; Ensure JIT compilation is enabled for improved performance by
;; native-compiling loaded .elc files asynchronously
(setq native-comp-jit-compilation t)
					;(setq native-comp-deferred-compilation t) ; Deprecated in Emacs > 29.1

					;(use-package compile-angel
					;  :ensure t
					;  :demand t
					;  :config
					;  (compile-angel-on-load-mode)
					;  (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode))

;; Auto-revert in Emacs is a feature that automatically updates the
;; contents of a buffer to reflect changes made to the underlying file
;; on disk.
(add-hook 'after-init-hook #'global-auto-revert-mode)

;; recentf is an Emacs package that maintains a list of recently
;; accessed files, making it easier to reopen files you have worked on
;; recently.
(add-hook 'after-init-hook #'recentf-mode)

;; savehist is an Emacs feature that preserves the minibuffer history between
;; sessions. It saves the history of inputs in the minibuffer, such as commands,
;; search strings, and other prompts, to a file. This allows users to retain
;; their minibuffer history across Emacs restarts.
(add-hook 'after-init-hook #'savehist-mode)

;; save-place-mode enables Emacs to remember the last location within a file
;; upon reopening. This feature is particularly beneficial for resuming work at
;; the precise point where you previously left off.
(add-hook 'after-init-hook #'save-place-mode)

;; Turn on which-key-mode
(add-hook 'after-init-hook 'which-key-mode)

;; Turn off autosave-mode
;; turn off backup-files
(auto-save-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)

  ;;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

  ;;; Direnv integration
(use-package envrc
  :hook (after-init . envrc-global-mode))
