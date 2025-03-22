;;; marginalia.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Annotations for Completion Candidates:
;; Marginalia: Adds rich annotations to completion candidates, enhancing the completion experience with additional context.

;; Annotations for completion candidates.
(use-package marginalia
  ;; Marginalia allows Embark to offer you preconfigured actions in more contexts.
  ;; In addition to that, Marginalia also enhances Vertico by adding rich
  ;; annotations to the completion candidates displayed in Vertico's interface.
  :ensure t
  :defer t
  :commands (marginalia-mode marginalia-cycle)
  :hook (after-init . marginalia-mode))
