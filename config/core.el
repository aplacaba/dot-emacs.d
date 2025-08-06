;;; core.el --- Core configuration
;;; Commentary:
;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)
(setenv "PAGER" "cat")

(use-package emacs
  :ensure nil
  :hook
  (before-save . delete-trailing-whitespace)
  :config
  (setq
   custom-safe-themes t
   kill-whole-line t
   case-fold-search nil
   ring-bell-function 'ignore
   create-lockfiles nil
   auto-save-default nil
   make-backup-files nil
   case-fold-search  nil
   global-auto-revert-mode nil
   initial-major-mode 'org-mode
   global-hl-line-mode t
   electric-pair-mode t
   column-number-mode t
   cursor-type 'box
   pixel-scroll-precision-mode t
   warning-minimum-level :emergency
   tab-always-indent 'complete
   display-time-default-load-average nil
   auth-sources "~/.authinfo"
   custom-file "~/projects/emacs/custom.el"))

;; magit
(use-package magit
  :ensure t
  :defer t
  :config
  ;;(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (setq transient-default-level 7)
  :bind
  (("C-M-g" . magit-status)
   ("C-x g" . magit-status)))


;; vterm
(use-package vterm
  :ensure t
  :config
  (setq vterm-max-scrollback 10000)
  (setq vterm-kill-buffer-on-exit t)
  (global-set-key (kbd "C-c t") 'vterm-copy-mode))

(use-package vterm-toggle
  :ensure t
  :config
  (add-hook 'vterm-mode-hook (lambda () (setq-local global-hl-line-mode nil)))
  (global-set-key (kbd "s-t") 'vterm-toggle)
  (global-set-key (kbd "C-M-t") 'vterm-toggle-cd)
  (define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)
  (define-key vterm-mode-map (kbd "s-n")   'vterm-toggle-forward)
  (define-key vterm-mode-map (kbd "s-p")   'vterm-toggle-backward))


;; corfu, orderless, consult, dabbrev, cape
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (setq orderless-component-separator "[ &]")
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :ensure t
  :bind
  ("C-x b" . consult-buffer)
  ("C-c s" . consult-ripgrep)
  ("C-c h" . consult-history)
  ("C-c k" . consult-kmacro)
  ("C-c i" . consult-info)
  ("C-s" . consult-line-literal)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format))

;; Use Dabbrev with Corfu!
(use-package dabbrev
  :ensure nil
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Available since Emacs 29 (Use `dabbrev-ignored-buffer-regexps' on older Emacs)
  (add-to-list 'dabbrev-ignored-buffer-modes 'authinfo-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

;; Add extensions
(use-package cape
  :ensure t
  ;; Bind prefix keymap providing all Cape commands under a mnemonic key.
  ;; Press C-c p ? to for help.
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
  ;; Alternatively bind Cape commands individually.
  ;; :bind (("C-c p d" . cape-dabbrev)
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ...)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;; (add-hook 'completion-at-point-functions #'cape-history)
  ;; ...
)

(defun consult-line-literal ()
  "Use this instead of isearch."
  (interactive)
  (let ((completion-styles '(substring))
        (completion-category-defaults nil)
        (completion-category-overrides nil))
    (consult-line)))


;; ultra-scroll
(use-package ultra-scroll
  :ensure t
  :init
  (setq scroll-conservatively 3 ; or whatever value you prefer, since v0.4
        scroll-margin 0)        ; important: scroll-margin>0 not yet supported
  :config
  (ultra-scroll-mode 1))


;; which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))


;; terminal goodies
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))


(provide 'core)
