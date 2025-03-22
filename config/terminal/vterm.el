;;; vterm.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; A terminal via libvterm
(use-package vterm
  :defer t
  :preface
  (defvar vterms (make-hash-table :test 'equal))
  (defvar vterm-layout-active nil "Flag to indicate if vterm layout is active.")
  (defvar previous-window-configuration nil "Stores the previous window configuration.")
  (defvar vterm-right-buffer nil "Holds the current right-side vterm buffer.")

  (defun toggle-vterm (&optional n)
    (interactive)
    (let* ((project (projectile-project-name))
           (project-vterms (gethash project vterms))
           (default-directory (or (vc-root-dir) default-directory)))
      (setq project-vterms (seq-filter 'buffer-live-p project-vterms))
      (puthash project project-vterms vterms)
      (cond ((numberp n)
             (let ((buf (vterm (generate-new-buffer-name (format "*vterm-%s-%d*" project n)))))
               (push buf project-vterms)
               (puthash project project-vterms vterms)
               (switch-to-buffer buf)))
            ((null project-vterms)
             (let ((buf (vterm (generate-new-buffer-name (format "*vterm-%s-1*" project)))))
               (push buf project-vterms)
               (puthash project project-vterms vterms)
               (switch-to-buffer buf)))
            ((seq-contains-p project-vterms (current-buffer))
             (switch-to-buffer (car (seq-difference (buffer-list) project-vterms))))
            (t
             (switch-to-buffer (car (seq-intersection (buffer-list) project-vterms)))))))

  (defun vterm-layout ()
    "Toggle a layout with three vterm buffers: one to the left and two to the right."
    (interactive)
    (let* ((project (projectile-project-name))
           (project-vterms (gethash project vterms))
           (default-directory (or (vc-root-dir) default-directory)))
      (if vterm-layout-active
          (progn
            (set-window-configuration previous-window-configuration)
            (setq vterm-layout-active nil))
        (setq previous-window-configuration (current-window-configuration))
        (delete-other-windows)
        (let ((left-vterm (vterm (generate-new-buffer-name (format "*vterm-%s-1*" project)))))
          (push left-vterm project-vterms)
          (puthash project project-vterms vterms)
          (split-window-right)
          (other-window 1)
          (let ((top-right-vterm (vterm (generate-new-buffer-name (format "*vterm-%s-2*" project)))))
            (push top-right-vterm project-vterms)
            (puthash project project-vterms vterms)
            (split-window-below)
            (other-window 1)
            (let ((bottom-right-vterm (vterm (generate-new-buffer-name (format "*vterm-%s-3*" project)))))
              (push bottom-right-vterm project-vterms)
              (puthash project project-vterms vterms)
              (balance-windows)
              (select-window (get-buffer-window left-vterm))
              (setq vterm-layout-active t)))))))

  (defun toggle-vterm-right ()
    "Toggle a vterm buffer on the right side of the screen."
    (interactive)
    (let* ((project (projectile-project-name))
           (default-directory (or (vc-root-dir) default-directory))
           (project-vterms (gethash project vterms)))
      (if (and vterm-right-buffer (buffer-live-p vterm-right-buffer))
          (if (eq (current-buffer) vterm-right-buffer)
              (progn
                (delete-window)
                (bury-buffer vterm-right-buffer)
                (balance-windows))
            (select-window (display-buffer vterm-right-buffer)))
        (split-window-right)
        (other-window 1)
        (setq vterm-right-buffer (vterm (generate-new-buffer-name (format "*vterm-%s-right*" project))))
        (push vterm-right-buffer project-vterms)
        (puthash project project-vterms vterms)
        (switch-to-buffer vterm-right-buffer))))

  (defun kill-all-vterms-in-project ()
    "Kill all vterm buffers associated with the current project."
    (interactive)
    (let* ((project (projectile-project-name))
           (project-vterms (gethash project vterms))
           (project-root (or (vc-root-dir) default-directory)))
      (setq project-vterms (seq-filter 'buffer-live-p project-vterms))
      (dolist (vterm-buffer project-vterms)
        (with-current-buffer vterm-buffer
          (when (string-prefix-p project-root default-directory)
            (kill-buffer vterm-buffer))))
      (puthash project (seq-filter 'buffer-live-p project-vterms) vterms)))

  :config
  ;; Don't query about killing vterm buffers, just kill it
  (defadvice vterm (after kill-with-no-query nil activate)
    (set-process-query-on-exit-flag (get-buffer-process ad-return-value) nil)))
