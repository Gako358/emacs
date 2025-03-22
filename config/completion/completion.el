;;; completion.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; General Completion: Configures Emacs to enable indentation and completion with the TAB key, and sets completion cycle threshold for better usability.

;; Enable indentation and completion with the TAB key.
(setq tab-always-indent 'complete)

;; Cycle with the TAB key if there are only few candidates.
(setq completion-cycle-threshold 3)
