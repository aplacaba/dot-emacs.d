;;; init.el --- Emacs Config
;;; Commentary:
;;; Code:
(require 'package)

(defvar my/pkg-source
  '(("melpa" . "http://melpa.org/packages/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa stable" . "http://stable.melpa.org/packages/")))

(defvar my/emacs-source-path "~/.emacs.d/config")
(defvar is-windows (eq system-type 'windows-nt))
(defvar is-mac (eq system-type 'darwin))

;; configure use-package

(setopt package-archives my/pkg-source)
(setq use-package-always-ensure t)

(add-to-list 'load-path my/emacs-source-path)

;; load config
(progn
  (require 'core)        ;; emacs
  (require 'rice)        ;; looks
  (require 'nav)         ;; navigation
  (require 'notes)       ;; note taking
  (require 'devops)      ;; devops config
  (require 'programming) ;; programming
  (require 'llisp)       ;; lisp config
  (require 'bindings)    ;; key bindings

  (when is-windows
    (require 'windows))

  (when is-mac
    (require 'mac)))

;; load custom file (set in core.el)
(load custom-file 'noerror 'nomessage)

(provide 'init)
;;; init.el ends here
