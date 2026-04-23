;;; -*- lexical-binding: t; -*- Commentary:
;;; Code:

;; commonlisp tooling

;; (if is-windows
;;     (load (expand-file-name "C:/Users/A/.roswell/helper.el"))
;;   (load (expand-file-name "~/.roswell/helper.el")))

(add-to-list 'load-path "~/.slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "sbcl")

  ;; slime-lisp-implementations '((qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix)
  ;; 			       (sbcl ("ros" "dynamic-space-size=4096" "-Q" "run") :coding-system utf-8-unix)))

(defun g-slime-start ()
  (interactive)
  (let ((current-prefix-arg '-))
    (call-interactively 'slime)))

(provide 'llisp)
;;; llisp.el ends here
