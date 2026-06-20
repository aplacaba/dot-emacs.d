# Design: Replace vterm with ghostel

Date: 2026-06-20
Status: Approved

## Goal

Replace the `vterm` + `vterm-toggle` terminal backend with
[`ghostel`](https://github.com/dakra/ghostel) (libghostty-vt powered terminal
emulator, on MELPA). ghostel's native module auto-downloads on first use, so the
`libvterm` system dependency is no longer required.

## Constraints / decisions

- **Keybinding strategy: preserve muscle memory.** ghostel ships no toggle
  package, so small toggle/cycle helpers are added to keep `s-t`, `C-M-t`,
  `C-c t`, `s-n`, `s-p` working.
- Keep `:unless is-windows` guard (ghostel is macOS/Linux/FreeBSD only).
- Keep disabling `global-hl-line-mode` inside terminal buffers.
- No ghostel extensions (compile/eshell/comint), no evil-ghostel — out of scope.

## Changes

### `config/core.org` — "Vterm" section → "Ghostel"

- `use-package ghostel :ensure t :unless is-windows`.
- `ghostel-mode-hook` disables `global-hl-line-mode` locally.
- `my/ghostel-toggle` (mimics `vterm-toggle`): bury if in a ghostel buffer,
  else switch to an existing one, else create one. Bound to `s-t`.
- `my/ghostel-toggle-cd` (mimics `vterm-toggle-cd`): like toggle, but when
  creating, let-binds `default-directory` to the current buffer's directory.
  Bound to `C-M-t`. (Shell integration OSC 7 keeps tracking afterwards.)
- `my/ghostel-next` / `my/ghostel-prev`: cycle live ghostel buffers. Bound to
  `s-n` / `s-p` in `ghostel-semi-char-mode-map` (matches original mode-local
  scoping).
- `C-c t` → `ghostel-copy-mode` in `ghostel-semi-char-mode-map` (alias for the
  default `C-c C-t`), preserving the `vterm-copy-mode` shortcut.
- Dropped: `C-q`→`vterm-send-next-key` (ghostel semi-char mode + `C-c C-q`
  covers it), `vterm-max-scrollback` / `vterm-kill-buffer-on-exit` /
  `vterm-buffer-name-string` (ghostel has sensible defaults; buffer renamed via
  OSC 2 automatically).

### `readme.org`

- `Terminal: vterm + vterm-toggle` → `Terminal: ghostel`.
- Drop `libvterm` from `dnf`/`brew` install lines.
- Replace the Windows libvterm note with a ghostel note (skipped on Windows).
- Update module-tree comment (`vterm` → `ghostel`).
- Update keybindings table (`s-t`/`C-M-t`, `C-c t`).

### `CLAUDE.md`

- Module description `vterm` → `ghostel`.
- Keybinding note `vterm-toggle / vterm-toggle-cd` → `ghostel toggle / toggle-cd`.

## Out of scope

ghostel extensions, evil-ghostel, scrollback tuning, theme color customization.

## Verification

- Byte-compile-check the new `use-package` block (paren-balanced, valid
  keymaps).
- `rg vterm` across the repo returns zero matches in tracked files.
- Re-read each edited section for prose/structural consistency.
