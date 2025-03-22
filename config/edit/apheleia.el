;;; apheleia.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Formatters:
;; - Apheleia: Provides on-the-fly code formatting using various formatters:
;;   -  Scalafmt for Scala
;;   -  Black for Python
;;   -  Prettier for TypeScript and JavaScript
;;   -  Google Java Format for Java
;;   -  nixpkgs-fmt for Nix

(use-package apheleia
  :config
  ;; Add scalafmt for Scala
  (push '(scalafmt . ("scalafmt" "--stdin" "--non-interactive" "--quiet" "--stdout")) apheleia-formatters)
  (push '(scala-ts-mode . scalafmt) apheleia-mode-alist)

  ;; Add black for Python
  (push '(black . ("black" "-")) apheleia-formatters)
  (push '(python-mode . black) apheleia-mode-alist)

  ;; Add prettier for TypeScript and JavaScript
  (push '(prettier . ("prettier" "--stdin-filepath" buffer-file-name)) apheleia-formatters)
  (push '(typescript-ts-mode . prettier) apheleia-mode-alist)
  (push '(js-ts-mode . prettier) apheleia-mode-alist)

  ;; Add google-java-format for Java
  (push '(google-java-format . ("google-java-format" "-")) apheleia-formatters)
  (push '(java-ts-mode . google-java-format) apheleia-mode-alist)

  ;; Add nixpkgs-fmt for Nix
  (push '(nixpkgs-fmt . ("nixpkgs-fmt")) apheleia-formatters)
  (push '(nix-mode . nixpkgs-fmt) apheleia-mode-alist))

(apheleia-global-mode +1)
