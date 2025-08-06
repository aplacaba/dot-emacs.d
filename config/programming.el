;;; programming.el --- Programming Config
;;; Commentary:
;;; Coding setup
;;; Code:

;; Indent hints
(use-package indent-bars
  :custom
  (indent-bars-no-descend-lists t) ; no extra bars in continued func arg lists
  (indent-bars-treesit-support t)
  (indent-bars-treesit-ignore-blank-lines-types '("module"))
  ;; Add other languages as needed
  (indent-bars-treesit-scope '((python function_definition class_definition for_statement
	  if_statement with_statement while_statement)))
  :ensure t
  :hook
  ((yaml-mode python-mode). indent-bars-mode))

;; yaml support
(use-package yaml-mode
  :mode "\\.yml\\'"
  :mode "\\.yaml\\'"
  :ensure t
  :hook
  (yaml-ts-mode . yaml-mode))

;; web / js
(use-package json-mode
  :ensure t
  :init
  (setopt js-indent-level 2))

(use-package web-mode
  :mode "\\.tsx\\'"
  :mode "\\.jsx\\'"
  :mode "\\.html\\'"
  :mode "\\.css?\\'"
  :mode "\\.scss?\\'"
  :ensure t
  :commands web-mode
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(use-package js2-mode
  :ensure t)

(use-package emmet-mode
  :ensure t)

;; clojure
(use-package cider
 :ensure t)

(use-package clojure-mode
  :ensure t
  :hook
  (clojure-mode . cider-mode))

;; ruby

(use-package ruby-end
  :ensure t)

(use-package ruby-ts-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :bind (:map ruby-ts-mode-map
              ("C-c r b" . 'treesit-beginning-of-defun)
              ("C-c r e" . 'treesit-end-of-defun))
  :hook
  (ruby-ts-mode . ruby-end-mode))

;; elixir
(use-package elixir-ts-mode
  :ensure t)

(add-to-list 'elixir-ts-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
               (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
               (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
               (ruby-end-mode +1)))


;; tressitter mode grammars
(setopt treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
     (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")))

;; uncomment and eval block below on treesitter list update
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(use-package treesit-auto
  :ensure t
  :init
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'programming)
