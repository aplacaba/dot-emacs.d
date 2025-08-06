;;; rice.el --- Ricing
;;; Commentary:
;;; Code:

;; theme
(load-theme 'modus-vivendi-tritanopia)
(fringe-mode +1)


;; font
(set-face-attribute 'default nil
                    ;;:family "Iosevka Comfy"
                    :family "JetBrains Mono"
                    :weight 'regular
                    :height 170)

(setq-default line-spacing 3)

;; doom modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))


;; all the icons
(use-package all-the-icons
  :ensure t)


;; hide these modes
(use-package diminish
  :ensure t
  :commands diminish
  :init
  (diminish 'auto-revert-mode)
  (diminish 'flycheck-mode)
  (diminish 'eldoc-mode)
  (diminish 'which-key-mode))


;; rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))


(provide 'rice)
;;; rice.el ends here
