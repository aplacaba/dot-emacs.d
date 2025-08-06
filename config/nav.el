;;; nav.el --- Navigation
;;; Commentary:
;;; Moving around
;;; Code:

(use-package rg
  :ensure t)

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (global-set-key (kbd "C-c C-j") 'avy-resume)
  (global-set-key (kbd "C-:") 'avy-goto-char))

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-input-style 'minibuffer)
  (global-set-key (kbd "C-x o") 'switch-window))

(provide 'nav)
