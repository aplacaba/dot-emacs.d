;;; -*- lexical-binding: t; -*- init.el --- Emacs Config
;;; Commentary:
;;; Loads literate configuration from org files
;;; Code:
(require 'package)
(require 'org)
(require 'ob-tangle)

(defvar my/pkg-source
  '(("melpa" . "https://melpa.org/packages/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa stable" . "https://stable.melpa.org/packages/")))

(defvar is-windows (eq system-type 'windows-nt))
(defvar is-mac (eq system-type 'darwin))

;; configure use-package
(setopt package-archives my/pkg-source)
(setq use-package-always-ensure t)

(defun my/load-config (name)
  "Load a literate config module from config/NAME.org."
  (org-babel-load-file
   (expand-file-name (concat "config/" name ".org") user-emacs-directory)))

;; load config
(my/load-config "core")
(my/load-config "rice")
(my/load-config "nav")
(my/load-config "notes")
(my/load-config "devops")
(my/load-config "programming")
(my/load-config "llisp")
(my/load-config "bindings")

(when is-windows
  (my/load-config "windows"))

(when is-mac
  (my/load-config "mac"))

;; load custom file (set in core.org)
(load custom-file 'noerror 'nomessage)

(provide 'init)
;;; init.el ends here
