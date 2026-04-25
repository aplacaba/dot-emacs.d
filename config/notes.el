;;; -*- lexical-binding: t; -*- notes.el --- Note Taking
;;; Commentary:
;;; Code:

(use-package org
  :init
  (setopt
   org-display-remote-inline-images 'download
   org-agenda-files '("~/.notes/20250523T112215--tasks__work.org")
   org-todo-keywords '((sequence "TODO" "DOING" "WAITING" "DONE")))
  :config
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c C-;") 'org-todo))

(use-package org-download)

(use-package denote
  :init
  (setopt
   denote-directory (expand-file-name "~/.notes/")
   denote-sort-keywords t
   denote-known-keywords '("work" "personal" "finance" "urgent"))
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories))

(provide 'notes)
;;; notes.el ends here
