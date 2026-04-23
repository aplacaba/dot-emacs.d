;;; devops.el --- Devops configuration
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

;; Requires Emacs 29 and git
(unless (package-installed-p 'pg)
   (package-vc-install "https://github.com/emarsden/pg-el" nil nil 'pg))
(unless (package-installed-p 'pgmacs)
   (package-vc-install "https://github.com/emarsden/pgmacs" nil nil 'pgmacs))

(require 'pgmacs)

(provide 'devops)
;;; devops.el ends here
