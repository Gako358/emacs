;;; cape.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Completion At Point Extensions:
;; Cape: Provides extensions for completion-at-point-functions to enhance the completion experience for files and Emacs Lisp blocks.

;; Completion At Point Extensions.
(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;; (add-hook 'completion-at-point-functions #'cape-dabbrev) ;; Buffer completion
  ;; (add-hook 'completion-at-point-functions #'cape-history)
  )
