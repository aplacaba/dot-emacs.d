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
  (terraform-mode-hook . my-terraform-mode-init))

;; docker
(use-package docker
  :bind ("C-c d" . docker))

;; cloudformation
(use-package cfn-mode)


(provide 'devops)
;;; devops.el ends here
