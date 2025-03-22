;;; dslide.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Programmable Org Presentation
(use-package dslide
  :defer t
  :config
  ;; Add any additional configuration for dslide here
  )

(with-eval-after-load 'dslide
  (define-key org-mode-map (kbd "C-c d s") 'dslide-start)
  (define-key org-mode-map (kbd "C-c d n") 'dslide-next)
  (define-key org-mode-map (kbd "C-c d p") 'dslide-prev))

;; Function to enable dslide-mode manually
(defun enable-dslide-mode ()
  "Enable dslide-mode manually."
  (interactive)
  (dslide-mode 1))

;; Bind a key to enable dslide-mode manually
(define-key org-mode-map (kbd "C-c d e") 'enable-dslide-mode)
