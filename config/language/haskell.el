;;; haskell.el --- Consult configuration -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package haskell-ts-mode
  :mode (("\\.hs\\'" . haskell-ts-mode)
	 ("\\.cabal\\'" . haskell-ts-mode)))
