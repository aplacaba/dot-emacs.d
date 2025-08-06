;; Put mac specific config here

(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none))

(provide 'mac)
