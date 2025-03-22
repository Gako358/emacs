;;; sql.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; SQL syntax-based indentation
(use-package sql-indent
  :ensure t
  :hook (sql-mode . sqlind-minor-mode))

(with-eval-after-load 'sql-indent
  (add-hook 'sql-mode-hook 'sqlind-minor-mode))
