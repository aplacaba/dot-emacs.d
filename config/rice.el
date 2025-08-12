;;; rice.el --- Ricing
;;; Commentary:
;;; Code:

;; modus themes and org improvements
(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-to-toggle '(modus-operandi-tritanopia modus-vivendi-tritanopia)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

(load-theme 'modus-operandi-tritanopia)
(fringe-mode +1)

;; font
(set-face-attribute 'default nil
                    ;;:family "Iosevka Comfy"
		    :family "DejavuSansMNerdFont"
                    :weight 'regular
                    :height 105)

(setq-default line-spacing 2)

;; doom modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; all the icons
(use-package all-the-icons)


;; hide these modes
(use-package diminish
  :commands diminish
  :init
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  (diminish 'which-key-mode))


;; rainbow delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; fullscreen on start
(toggle-frame-maximized)

;; display time

(setopt display-time-format "%H:%M"
        display-time-mode t)

(provide 'rice)
;;; rice.el ends here
