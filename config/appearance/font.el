;;; font.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

;; Custom fonts are set using "Iosevka Nerd Font" for both the main text and the mode-line, ensuring a consistent and visually appealing interface across all frames.
(add-hook 'after-make-frame-functions
	  (lambda (f)
	    (with-selected-frame f
	      (set-frame-font "Iosevka Nerd Font 11" nil t)
	      (set-face-attribute 'mode-line nil :font "Iosevka Nerd Font 12" :height 100))))

(add-to-list 'default-frame-alist '(height . 64))
(add-to-list 'default-frame-alist '(width . 370))
