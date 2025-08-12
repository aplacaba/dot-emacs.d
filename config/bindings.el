;;; bindings.el --- Bindings
;;; Commentary:
;;; Keybindings
;;; Code:

;; Colemak goodies
(define-key key-translation-map [?\C-t] [?\C-x])

;; Splits
(defun vertical-split ()
  (interactive)
  (split-window-vertically) (other-window 1))

(defun horizontal-split ()
  (interactive)
  (split-window-horizontally) (other-window 1))

(global-set-key "\C-x2" #'vertical-split)
(global-set-key "\C-x3" #'horizontal-split)
(global-set-key (kbd "M-o") 'other-window)

;; buffer
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "C-c v") 'vundo)
(define-key global-map [remap list-buffers] 'ibuffer)

;; themes
(global-set-key (kbd "C-c m m") 'modus-themes-toggle)

;;
(global-set-key (kbd "C-h d") 'devdocs-lookup)

;; denote shortcuts
(global-set-key (kbd "C-x C-n") 'find-file)
(global-set-key (kbd "C-c n n") 'denote)
(global-set-key (kbd "C-c n o") 'denote-open-or-create)

;; remove ctrl-click
(global-unset-key (kbd "C-<down-mouse-1>"))

(provide 'bindings)
;;; bindings.el ends here
