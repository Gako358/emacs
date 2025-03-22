;;; appearance.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Using the dashboard package with the kaolin-theme to enhance the startup experience and overall look of Emacs.
;; All-the-icons: Provides a rich set of icons for various file types and modes.
(use-package all-the-icons
  :ensure t)

;; All-the-icons-ivy-rich: Enhances Ivy's minibuffer completion with icons, activated on startup.
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; The dashboard package is configured to display a welcoming startup screen with a custom banner, recent files, bookmarks, projects, and agenda items.
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'logo
	dashboard-banner-logo-title "Welcome back Master"
	dashboard-set-file-icons t
	dashboard-center-content t
	dashboard-items '((recents  . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5))
	initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :init
  :hook (after-init . dashboard-setup-startup-hook))

;; Custom fonts are set using "Iosevka Nerd Font" for both the main text and the mode-line, ensuring a consistent and visually appealing interface across all frames.
(add-hook 'after-make-frame-functions
	  (lambda (f)
	    (with-selected-frame f
	      (set-frame-font "Iosevka Nerd Font 11" nil t)
	      (set-face-attribute 'mode-line nil :font "Iosevka Nerd Font 12" :height 100))))

(add-to-list 'default-frame-alist '(height . 64))
(add-to-list 'default-frame-alist '(width . 370))

;; The kaolin-themes package is used with specific settings for a personalized look, loading the "kaolin-ocean" theme.
(use-package kaolin-themes
  :config
  (setq kaolin-ocean-alt-bg t)
  (setq kaolin-themes-italic-comments t
	kaolin-themes-hl-line-colored t
	kaolin-themes-git-gutter-solid t)
  (load-theme 'kaolin-ocean t))

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

;; The vim-tab-bar package is used for managing tabs, activated after initialization.
(use-package vim-tab-bar
  :ensure t
  :commands vim-tab-bar-mode
  :hook (after-init . vim-tab-bar-mode))

;; The undo-fu-session package is configured for global session management, maintaining undo history across sessions.
(use-package undo-fu-session
  :ensure t
  :config
  (undo-fu-session-global-mode))
