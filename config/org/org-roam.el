;;; org-roam.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/Documents/notes/src"))
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode))

(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize . org-modern-agenda)))

;; Define a prefix command for org-mode related commands
(define-prefix-command 'org-prefix-map)

;; Bind the prefix command to "C-x o"
(global-set-key (kbd "C-x o") 'org-prefix-map)

;; Bind org-roam-capture to "C-x o c"
(define-key org-prefix-map (kbd "c") 'org-roam-capture)
