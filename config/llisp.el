;;; llisp.el --- Lisp Config
;;; Commentary:
;;; Code:

;; commonlisp tooling
(load (expand-file-name "~/.roswell/helper.el"))
(setq
  inferior-lisp-program ""
  slime-lisp-implementations '((sbcl ("ros" "-Q" "run") :coding-system utf-8-unix)
			       (qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix)))

(defun g-slime-start ()
  (interactive)
  (let ((current-prefix-arg '-))
    (call-interactively 'slime)))

(provide 'llisp)
;;; llisp.el ends here
