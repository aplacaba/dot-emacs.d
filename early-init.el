;;; -*- lexical-binding: t; -*- early-init.el --- Bootstrap
;;; Commentary:
;;; Loads literate early-init configuration
;;; Code:
(require 'org)
(require 'ob-tangle)
(org-babel-load-file "~/.emacs.d/early-init.org")
;;; early-init.el ends here
