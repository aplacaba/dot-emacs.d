;;; -*- lexical-binding: t; -*- early-init.el --- Pre-init setup
;;; Commentary:
;;; GUI defaults, GC tuning, disables chrome before frame creation
;;; Code:
(setq package-enable-at-startup t)

(defvar package-quickstart)

(setq frame-inhibit-implied-resize t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024))
(setq default-frame-alist '((fullscreen . maximized)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 100000000)))
;;; early-init.el ends here
