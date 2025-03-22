;;; consult.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Commands Compatible with Completing-read:
;; Consult: Provides various commands that integrate with completing-read for enhanced navigation and search capabilities.

;; Commands compatible with completing-read.
(use-package consult
  :ensure t
  :bind (;; C-c bindings in `mode-specific-map'
	 ("C-c M-x" . consult-mode-command)
	 ("C-c h" . consult-history)
	 ("C-c k" . consult-kmacro)
	 ("C-c m" . consult-man)
	 ("C-c i" . consult-info)
	 ([remap Info-search] . consult-info)
	 ;; C-x bindings in `ctl-x-map'
	 ("C-x M-:" . consult-complex-command)
	 ("C-x 4 b" . consult-buffer-other-window)
	 ("C-x 5 b" . consult-buffer-other-frame)
	 ("C-x t b" . consult-buffer-other-tab)
	 ("C-x r b" . consult-bookmark)
	 ("C-x b" . consult-buffer)
	 ("C-x p b" . consult-project-buffer)
	 ;; Custom M-# bindings for fast register access
	 ("M-#" . consult-register-load)
	 ("M-'" . consult-register-store)
	 ("C-M-#" . consult-register)
	 ;; Other custom bindings
	 ("M-y" . consult-yank-pop)
	 ;; M-g bindings in `goto-map'
	 ("M-g e" . consult-compile-error)
	 ("M-g f" . consult-flymake)
	 ("M-g g" . consult-goto-line)
	 ;; ("M-g M-g" . consult-goto-line)
	 ("M-g o" . consult-outline)
	 ("M-g m" . consult-mark)
	 ("M-g k" . consult-global-mark)
	 ("M-g i" . consult-imenu)
	 ("M-g I" . consult-imenu-multi)
	 ;; M-s bindings in `search-map'
	 ("M-s d" . consult-find)
	 ("M-s c" . consult-locate)
	 ("M-s g" . consult-ripgrep)
	 ("M-s G" . consult-git-grep)
	 ("M-s l" . consult-line)
	 ("M-s L" . consult-line-multi)
	 ("M-s u" . consult-focus-lines)
	 ("M-s v" . kristian/consult-ripgrep-from-visual-selection)
	 ;; Isearch integration
	 :map isearch-mode-map
	 ("M-s L" . consult-line-multi)
	 )

  ;; Enable automatic preview at point in the *Completions* buffer.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  :init
  ;; Optionally configure the register formatting. This improves the register
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<"))
