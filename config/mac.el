;;; mac.el --- Mac specific config
;;; Commentary:
;;; Code:

(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none)

  ;; override fontconfig
  (set-face-attribute 'default nil
                      ;;:family "Iosevka Comfy"
                      :family "DejavuSansM Nerd Font"
                      :weight 'regular
                      :height 200)

  (setq-default line-spacing 1))

(provide 'mac)
;;; mac.el ends here
