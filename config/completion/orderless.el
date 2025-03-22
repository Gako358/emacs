;;; orderless.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Flexible Matching:
;; Orderless: Provides flexible matching capabilities for completion, allowing multiple patterns to be matched in any order.

;; Space-separated matching components matching in any order.
(use-package orderless
  ;; Vertico leverages Orderless' flexible matching capabilities, allowing users
  ;; to input multiple patterns separated by spaces, which Orderless then
  ;; matches in any order against the candidates.
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

