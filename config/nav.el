;;; -*- lexical-binding: t; -*- nav.el --- Navigation
;;; Commentary:
;;; Moving around
;;; Code:

(pixel-scroll-precision-mode)

(use-package rg
  :init
  (rg-enable-default-bindings))

(use-package avy
  :bind
  ("M-g e" . avy-goto-word-0)
  ("C-c C-j" . avy-resume)
  ("C-:" . avy-goto-char))

(use-package switch-window
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-input-style 'minibuffer)
  (global-set-key (kbd "C-x o") 'switch-window))

(use-package vundo)

(provide 'nav)
;;; nav.el ends here
