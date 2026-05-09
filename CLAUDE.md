# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal Emacs configuration targeting Fedora Linux (primary), macOS, and Windows 11. Uses a modular `config/` directory loaded via `require` from `init.el`.

## Architecture

**Load order** (defined in `init.el`):
1. `early-init.el` — GUI defaults, GC tuning, disables chrome before frame creation
2. `init.el` — sets `load-path` to `config/`, requires each module in order
3. Config modules (`config/*.el`), each ending with `(provide '<name>)`:
   - `core.el` — built-in Emacs settings, magit, vterm, vertico/corfu/orderless/consult/cape completion stack, perspective, which-key
   - `rice.el` — modus themes, fonts, doom-modeline, diminish, marginalia
   - `nav.el` — avy, switch-window, ripgrep, vundo
   - `notes.el` — org-mode, denote (notes in `~/.notes/`), org-download
   - `devops.el` — terraform, docker, cfn-mode, pg/pgmacs (via vc)
   - `programming.el` — language modes (TS, web, clojure, ruby, elixir, nix), treesit grammars, flycheck, yasnippet, gptel (Gemini), devdocs
   - `llisp.el` — SLIME/SBCL for Common Lisp
   - `bindings.el` — global keybindings (Colemak-aware: `C-t` → `C-x` translation), splits, denote/org shortcuts
   - `mac.el` / `windows.el` — OS-specific overrides (fonts, meta key, tramp method)

**Platform detection** uses `is-windows` / `is-mac` defvars in `init.el`. OS modules load conditionally.

## Conventions

- All files use `;; -*- lexical-binding: t; -*-` header
- Package management via `use-package` with `:ensure t` (set globally). Packages install from MELPA/GNU ELPA automatically
- Tree-sitter grammars are listed in `treesit-language-source-alist` in `programming.el`; install by eval'ing the commented-out `(mapc #'treesit-install-language-grammar ...)` form
- Custom theme/settings go to `~/.emacs.d/custom.el` (set as `custom-file` in `core.el`, gitignored)
- Commit style: conventional commits (`feat`, `fix`, `refactor`, `style`) with scope in parens
- API keys sourced from `~/.authinfo` or environment variables (see `my/gemini-api-key` in `programming.el`)

## Keybindings of Note

- `C-t` is translated to `C-x` (Colemak layout)
- `M-o` — other-window
- `C-M-g` / `C-x g` — magit-status
- `C-s` — consult-line-literal (replaces isearch)
- `C-c s` — consult-ripgrep
- `C-x C-b` — persp-ibuffer
- `s-t` / `C-M-t` — vterm-toggle / vterm-toggle-cd
- `C-c n n` / `C-c n o` — denote create / open
- `C-c m m` — modus-themes-toggle
