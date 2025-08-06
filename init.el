;;; init.el --- Emacs Config
;;; Commentary:
;;; Code:
(require 'package)

(defvar my/pkg-source
  '(("melpa" . "http://melpa.org/packages/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa stable" . "http://stable.melpa.org/packages/")))

(defvar my/emacs-source-path "~/projects/emacs/config")

;; configure use-package

(setopt package-archives my/pkg-source)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
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

  (when (eq system-type 'windows)
    (require 'windows))

  (when (eq system-type 'darwin)
    (require 'mac)))

(provide 'init)
;;; init.el ends here
