;;; dirvish.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package dirvish
  :ensure t
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("p" "~/src/"                      "Projects")
     ("t" "~/.local/share/Trash/files/" "TrashCan")))

  :config
  ;; (dirvish-peek-mode)             ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode)      ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes           ; The order *MATTERS* for some attributes
        '(vc-state subtree-state nerd-icons collapse git-msg file-time file-size)
        dirvish-side-attributes
        '(vc-state nerd-icons collapse file-size))
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  :bind ; Bind `dirvish-fd|dirvish-side|dirvish-dwim' as you see fit
  ((:map dirvish-mode-map          ; Dirvish inherits `dired-mode-map'
         ;; ("M-?"   . dirvish-dispatch)     ; contains most of sub-menus in dirvish extensions
         ("M-a"   . dirvish-quick-access)
         ("M-f"   . dirvish-file-info-menu)
         ("M-y"   . dirvish-yank-menu)
         ;; ("N"   . dirvish-narrow)
         ;; ("^"   . dirvish-history-last)
         ("M-h" . dired-up-directory)
         ("M-n" . dired-create-empty-file)
         ;; ("H"   . dirvish-history-jump) ; remapped `describe-mode'
         ;; ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
         ("M-v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
         ("M-o" . dirvish-subtree-toggle)
         ;; ("M-f" . dirvish-history-go-forward)
         ;; ("M-b" . dirvish-history-go-backward)
         ("M-l" . dirvish-ls-switches-menu)
         ("M-m" . dirvish-mark-menu)
         ("M-t" . dirvish-layout-toggle)
         ("M-s" . dirvish-setup-menu)
         ("M-e" . dirvish-emerge-menu)
         ("M-q" . dirvish-quit)
         ("M-j" . dirvish-fd-jump))))

(add-hook 'dirvish-setup-hook (lambda ()
                                (visual-line-mode -1)
                                (setq-local truncate-lines t)))
