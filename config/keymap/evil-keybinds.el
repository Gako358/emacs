;;; evil-keybinds.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(with-eval-after-load "evil"
  (evil-define-operator my-evil-comment-or-uncomment (beg end)
    "Toggle comment for the region between BEG and END."
    (interactive "<r>")
    (comment-or-uncomment-region beg end))
  (evil-define-key 'normal 'global (kbd "gc") 'my-evil-comment-or-uncomment))

(defun move-right-and-open-todo ()
  (interactive)
  (split-window-right)
  (windmove-right)
  (find-file "~/Documents/notes/org/todo.org"))

(defun replace-word-at-point ()
  "Replace all occurrences of the word at point with a user-provided word in the current buffer."
  (let ((old-word (thing-at-point 'word))
        (new-word (read-string "Enter new word: ")))
    (save-excursion
      (goto-char (point-min))
      (while (search-forward old-word nil t)
        (replace-match new-word)))))

(global-set-key (kbd "C-S-i") 'move-right-and-open-todo)

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
      (forward-line -1)))))

(defun move-text-down (arg)
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "S-<up>") 'move-text-up)
(global-set-key (kbd "S-<down>") 'move-text-down)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)
(global-set-key (kbd "C-<tab>") 'evil-switch-to-windows-last-buffer)
