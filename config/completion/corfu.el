;;; corfu.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Completion Overlay Region Function:
;; Corfu: Provides a completion overlay for better in-line completion, with custom keybindings for navigation and configuration for an improved user experience.

;; Completion Overlay Region Function.
(use-package corfu
  :init
  (global-corfu-mode 1)
  (setq global-corfu-minibuffer
	(lambda ()
	  (not (or (bound-and-true-p mct--active)
		   (bound-and-true-p vertico--input)
		   (eq (current-local-map) read-passwd-map)))))
  :bind (:map corfu-map
	      ("C-n" . corfu-next)
	      ("C-p" . corfu-previous)
	      ("C-h" . corfu-info-documentation)
	      ;; Remove the C-y binding from here since Evil intercepts it
	      )

  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-preview-current nil)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match t)

  :config
  ;; Add Evil-specific binding for C-y in Corfu
  (with-eval-after-load 'evil
    (define-key evil-insert-state-map (kbd "C-y")
                (lambda ()
                  (interactive)
                  (if (and (boundp 'corfu-mode) corfu-mode)
                      (corfu-insert)
                    (evil-paste-before 1)))))


  )
