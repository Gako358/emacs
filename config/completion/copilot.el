;;; copilot.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; AI-Powered Code Completion:
;; Copilot: Integrates GitHub Copilot for AI-powered code completion, with custom keybindings and configuration for different modes.

(use-package dash :ensure t)
(use-package s :ensure t)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
(use-package f :ensure t)
(use-package copilot
  :ensure t
  :bind (:map copilot-completion-map
  	    ("C-e" . copilot-accept-completion)
  	    ("C-S-e" . copilot-accept-completion-by-word))
  :config
  (defun toggle-copilot-mode ()
    "Toggle Copilot mode on and off."
    (interactive)
    (if (bound-and-true-p copilot-mode)
        (copilot-mode -1)
      (copilot-mode 1)))

  (global-set-key (kbd "C-c C-p") 'toggle-copilot-mode)

  (add-to-list 'copilot-indentation-alist '(prog-mode . 2))
  (add-to-list 'copilot-indentation-alist '(org-mode . 2))
  (add-to-list 'copilot-indentation-alist '(text-mode . 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode . 2))
  (add-to-list 'copilot-indentation-alist '(nix-ts-mode . 2))
  (add-to-list 'copilot-indentation-alist '(nix-mode . 2))
  (add-to-list 'copilot-indentation-alist '(scala-ts-mode . 2))
  (add-to-list 'copilot-indentation-alist '(scala-mode . 2))
  (add-to-list 'copilot-indentation-alist '(java-ts-mode . 2))
  (add-to-list 'copilot-indentation-alist '(java-mode . 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2)))
