;;; projectile.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-enable-caching t
        projectile-completion-system 'ivy
        projectile-indexing-method 'alien
        projectile-sort-order 'recently-active
        projectile-project-search-path '("~/Projects/" ("~/Projects/workspace/" . 1))))

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode))
