;;; vertico.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Vertical Interactive Completion UI:
;; Vertico: Offers a vertical completion interface, improving the user experience for navigating and selecting completion candidates.

;; Vertical interactive completion UI.
;; Tip: You can remove the `vertico-mode' use-package and replace it
;;      with the built-in `fido-vertical-mode'.
(use-package vertico
  ;; (Note: It is recommended to also enable the savehist package.)
  :ensure t
  :defer t
  :commands vertico-mode
  :hook (after-init . vertico-mode))
