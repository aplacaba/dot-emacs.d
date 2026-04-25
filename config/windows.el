;;; -*- lexical-binding: t; -*- windows.el --- Windows Specific
;;; Commentary:
;;; Code:

(defun wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "clip.exe")
  (deactivate-mark))

(load (expand-file-name "C:/Users/A/.roswell/helper.el"))
(setq ispell-program-name "aspell")

;; best performing windows font
(set-face-attribute 'default nil
                    :family "CommitMono"
		    ;;:family "DejavuSans Mono"
                    :weight 'regular
                    :height 130)

(setq-default line-spacing 3)
(setq tramp-default-method "plink")
(setq tramp-auto-save-directory "c:\\Users\\A\\tmp")

(provide 'windows)
;;; windows.el ends here
