# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal Emacs configuration targeting Fedora Linux (primary), macOS, and Windows 11. This is a **literate config** — modules are org files containing prose documentation alongside elisp code blocks, loaded via `org-babel-load-file`.

## Architecture

**How it works**: `init.el` and `early-init.el` are thin bootstraps that use `org-babel-load-file` to tangle and load `config/*.org` files. The generated `.el` files are gitignored.

**Load order** (defined in `init.el`):
1. `early-init.el` → loads `early-init.org` — GUI defaults, GC tuning
2. `init.el` — package setup, then loads each module via `my/load-config`:
   - `config/core.org` — built-in settings, magit, ghostel, vertico/corfu/orderless/consult/cape completion stack, perspective, which-key
   - `config/rice.org` — modus themes, fonts, doom-modeline, diminish, marginalia
   - `config/nav.org` — avy, switch-window, ripgrep, vundo
   - `config/notes.org` — org-mode, denote (notes in `~/.notes/`), org-download
   - `config/devops.org` — terraform, docker, cfn-mode, pg/pgmacs (via vc)
   - `config/programming.org` — language modes, treesit grammars, flycheck, yasnippet, gptel (Gemini), devdocs
   - `config/llisp.org` — SLIME/SBCL for Common Lisp
   - `config/bindings.org` — global keybindings (Colemak-aware: `C-t` → `C-x` translation)
   - `config/mac.org` / `config/windows.org` — OS-specific overrides (loaded conditionally)

**Platform detection** uses `is-windows` / `is-mac` defvars in `init.el`.

## Conventions

- Edit the `.org` files, not the generated `.el` files
- Package management via `use-package` with `:ensure t` (set globally)
- Tree-sitter grammars are listed in `programming.org`; install by eval'ing the commented-out `(mapc #'treesit-install-language-grammar ...)` form
- Custom theme/settings go to `~/.emacs.d/custom.el` (gitignored)
- Commit style: conventional commits (`feat`, `fix`, `refactor`, `style`) with scope in parens
- API keys sourced from `~/.authinfo` or environment variables (see `my/gemini-api-key` in `programming.org`)

## Keybindings of Note

- `C-t` is translated to `C-x` (Colemak layout)
- `M-o` — other-window
- `C-M-g` / `C-x g` — magit-status
- `C-s` — consult-line-literal (replaces isearch)
- `C-c s` — consult-ripgrep
- `C-x C-b` — persp-ibuffer
- `s-t` / `C-M-t` — ghostel toggle / ghostel toggle-cd
- `C-c n n` / `C-c n o` — denote create / open
- `C-c m m` — modus-themes-toggle
