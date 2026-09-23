# kevan-dotfiles

Dotfiles personales de Kevin (`kevan1`).

Repo: https://github.com/kevan1/dotfiles

## Qué incluye

- Shell: `.zshrc`, `.zprofile`, `.zshenv` (sanitizados)
- Git / editores: `.gitconfig`, `.gitignore`, `.inputrc`, `.vimrc`
- macOS: `.osx` + `docs/macos-defaults.md`
- Ghostty: `ghostty/` (config vacío al recolectar; se usa Ghostty, no Warp)
- Raycast: notas en `raycast/README.md`
- Login items: `docs/login-items.md`

## Qué NO va aquí

- **Claves privadas SSH** — solo en la Mac: `~/Documents/kevan-reinstall-backup/`
- Tokens / PATs / API keys
- Overlays secretos (walter-os, etc.)
- Bases de Raycast con secretos

## Restaurar

1. El playbook clona este repo y aplica `dotfiles_files`.
2. Restaurar SSH desde `~/Documents/kevan-reinstall-backup/ssh/` (nunca desde GitHub).
3. Reponer secretos locales a mano.

Ver `MANIFEST.md` para orígenes.
