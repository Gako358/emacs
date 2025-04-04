{ customPkgs }:

epkgs: with epkgs; [
  # Appearance
  dashboard # A startup screen extracted from Spacemacs
  kaolin-themes # A low contrast color theme for Emacs
  nerd-icons # Nerd icons for Emacs
  nerd-icons-completion # Nerd icons for completion
  nerd-icons-corfu # Nerd icons for corfu
  all-the-icons-completion
  rainbow-delimiters # Highlight delimiters such as parentheses, brackets or braces according to their depth
  rainbow-mode # Colorize color names in buffers
  all-the-icons # A package for inserting developer icons
  all-the-icons-ivy-rich # More friendly display transformer for ivy

  # Completion
  orderless # Space-separated matching components.
  vertico # Vertical interactive completion UI.
  marginalia # Annotations for completion candidates.
  embark # Context-sensitive actions.
  embark-consult # Integration between embark and consult.
  consult # Commands compatible with completing-read.
  corfu # Completion Overlay Region Function.
  cape # Completion At Point Extensions.
  yasnippet # Template system for Emacs.
  wgrep # Writable grep buffer.
  copilot # AI code completion.

  # Evil
  evil # Extensible vi layer for Emacs
  evil-collection # A set of keybindings for evil-mode
  evil-commentary # Comment stuff out
  evil-leader # A set of keybindings for evil-mode
  evil-matchit # Matchit for evil-mode
  evil-org # Org-mode keybindings for evil-mode
  evil-snipe # Snipe text objects
  evil-surround # Surround text objects with punctuation
  evil-visualstar # Start a * or # search from the visual selection
  evil-numbers # Increment and decrement numbers in Emacs
  vim-tab-bar # Tab bar for Vim
  undo-fu # Undo framework for Emacs
  undo-fu-session # Persistent undo for Emacs

  # Env
  envrc # .envrc support for Emacs

  # Edit
  apheleia # A universal formatter interface
  markdown-mode # Major mode for editing Markdown files

  # Filetree
  dirvish # Directory viewer for Emacs

  # General
  dash # A modern list library for Emacs
  editorconfig # EditorConfig Emacs Plugin
  f # A modern API for working with files and directories in Emacs
  general # Provides a more convenient way to define keybindings
  ligature # Ligature support for Emacs
  s # The long lost Emacs string manipulation library
  password-store # Emacs interface for pass, the standard Unix password manager

  # Grammars
  treesit-grammars.with-all-grammars # Tree-sitter grammars

  # Programming language packages
  eglot-java # Java development environment
  haskell-ts-mode # Haskell development environment
  nix-ts-mode # Major mode for editing Nix files
  scala-ts-mode # Scala development environment
  sql-indent # Indentation for SQL files
  tide # TypeScript Interactive Development Environment
  web-mode # Major mode for editing web templates
  customPkgs.vueTsMode # Major mode for editing Vue3 files
  yaml-pro # Major mode for editing YAML files

  # LSP
  customPkgs.eglotBooster # Eglot booster
  eldoc-box # Display function signatures at point

  # Org
  dslide # A presentation tool for Emacs
  org # For keeping notes, maintaining TODO lists, and project planning
  org-drill # A spaced repetition system for Emacs
  org-modern # A modern org-mode distribution
  org-pomodoro # Pomodoro technique implementation
  org-present # A simple org-mode presentation tool
  org-roam # A note-taking tool based on the principles of networked thought
  org-roam-ui # A graphical user interface for org-roam

  # Project
  counsel # Various completion functions using Ivy
  counsel-projectile # Ivy integration for Projectile
  projectile # Project Interaction Library for Emacs

  # Terminal
  vterm # A terminal emulator for Emacs

  # Version
  blamer # Show git blame information in the fringe
  git-gutter # Show git diff in the fringe
  git-gutter-fringe # Fringe version of git-gutter.el
  magit # A Git porcelain inside Emacs
]
