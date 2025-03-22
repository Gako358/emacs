;;; nix.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package nix-ts-mode
  :mode "\\.nix\\'"
  :hook ((nix-ts-mode . eglot-ensure)
         (before-save . nixpkgs-fmt-before-save)))

(defun nixpkgs-fmt-before-save ()
  "Format the current buffer with nixpkgs-fmt before saving."
  (when (eq major-mode 'nix-ts-mode)
    (let ((current-point (point))) ;; Save the current point
      (shell-command-on-region (point-min) (point-max) "nixpkgs-fmt" nil t)
      (goto-char current-point)))) ;; Restore the point after formatting
