;;; evil-mode.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; evil-want-keybinding must be declared before Evil and Evil Collection
(setq evil-want-keybinding nil)

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :custom
  (evil-want-Y-yank-to-eol t)
  :config
  (evil-select-search-module 'evil-search-module 'evil-search)
  (evil-mode 1))

;; Define scroll up
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
    	    (lambda ()
    	      (interactive)
    	      (evil-delete (point-at-bol) (point))))

;; Evil numbers inc and dec
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)


;; Unbind default window management keys
;; (define-key evil-normal-state-map (kbd "C-w") nil)
;; (define-key evil-motion-state-map (kbd "C-w") nil)

;; Bind new keys for window management
;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-normal-state-map (kbd "C-x") 'evil-window-split)
;; (define-key evil-normal-state-map (kbd "C-v") 'evil-window-vsplit)

;; Optionally, you can also bind in motion state if you prefer
;; (define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)
;; (define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-motion-state-map (kbd "C-x") 'evil-window-split)
;; (define-key evil-motion-state-map (kbd "C-v") 'evil-window-vsplit)

;; Optionally bind in insert state if you want the same behavior while editing text
;; (define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)
;; (define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-insert-state-map (kbd "C-x") 'evil-window-split)
;; (define-key evil-insert-state-map (kbd "C-v") 'evil-window-vsplit))
