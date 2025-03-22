;;; icons.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Using the dashboard package with the kaolin-theme to enhance the startup experience and overall look of Emacs.
;; All-the-icons: Provides a rich set of icons for various file types and modes.
(use-package all-the-icons
  :ensure t)

;; All-the-icons-ivy-rich: Enhances Ivy's minibuffer completion with icons, activated on startup.
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; Nerd-icons: Sets "Iosevka Nerd Font" as the icon font family.
;; Nerd-icons-completion: Integrates with Marginalia for enhanced completion visuals.
;; Nerd-icons-corfu: Adds pretty icons to Corfu completion menus.
(use-package nerd-icons
  :ensure t
  :config
  (setq nerd-icons-font-family "Iosevka Nerd Font"))

;; Pretty icons for completion
(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-marginalia-setup)
  (nerd-icons-completion-mode 1))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
