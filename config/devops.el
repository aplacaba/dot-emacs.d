;;; -*- lexical-binding: t; -*- devops.el --- Devops configuration
;;; Commentary:
;;; Code:

;; terraform
(use-package terraform-mode
  :init
  (setopt terraform-format-on-save t)
  (defun my-terraform-mode-init ()
    ;; if you want to use outline-minor-mode
    (outline-minor-mode 1))
  :hook
  (terraform-mode . my-terraform-mode-init))

;; docker
(use-package docker
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

;; cloudformation
(use-package cfn-mode)

;; postgres
;; Auto-installed via use-package :ensure with vc support
(use-package pg
  :ensure (pg :vc "https://github.com/emarsden/pg-el")
  :defer t)

(use-package pgmacs
  :ensure (pgmacs :vc "https://github.com/emarsden/pgmacs")
  :commands pgmacs)

(provide 'devops)
;;; devops.el ends here
