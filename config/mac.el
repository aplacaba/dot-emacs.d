;;; mac.el --- Mac specific config
;;; Commentary:
;;; Code:

(setopt mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none)

  ;; override fontconfig
(set-face-attribute 'default nil
                    ;;:family "Iosevka Comfy"
                    :family "DejavuSansM Nerd Font"
                    :weight 'regular
                    :height 140)

(setq-default line-spacing 1)

;; works flawlessly on mac
;; ultra-scroll

(use-package ultra-scroll
  :init
  (setq scroll-conservatively 3 ; or whatever value you prefer, since v0.4
        scroll-margin 0)        ; important: scroll-margin>0 not yet supported
  :config
  (add-hook 'ultra-scroll-hide-functions 'hl-line-mode)
  (ultra-scroll-mode 1))

(provide 'mac)
;;; mac.el ends here
