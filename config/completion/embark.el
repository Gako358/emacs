;;; embark.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Context Menu for Actions:
;; Embark: Offers a context menu for performing actions on selected items directly from the completion interface.

(use-package embark
  ;; Embark is an Emacs package that acts like a context menu, allowing
  ;; users to perform context-sensitive actions on selected items
  ;; directly from the completion interface.
  :ensure t
  :defer t
  :commands (embark-act
	     embark-dwim
	     embark-export
	     embark-collect
	     embark-bindings
	     embark-prefix-help-command)
  :init
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))


;; Integration with Consult:
;; Embark-consult: Enhances Embark by integrating it with Consult, providing additional context-sensitive actions during completion.

(use-package embark-consult
  :after embark consult
  :bind (:map minibuffer-mode-map
	      ("C-e Ce" . embark-export))
  :hook (embark-collect-mode . consult-preview-at-point-mode))
