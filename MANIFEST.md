# MANIFEST

| Destino en repo | Origen en Mac | Notas |
|-----------------|---------------|-------|
| `.zshrc` | `~/.zshrc` (6092 B) | Sanitizado: OMZ/nvm comentados (dirs ausentes); walter-os → placeholder; Colosseum PAT redactado. Se mantienen starship, zoxide, bun, android, solana, aiken, revyl. |
| `.zprofile` | `~/.zprofile` (980 B) | Sanitizado: Colosseum PAT redactado. Se mantienen brew, solana, OrbStack. |
| `.zshenv` | `~/.zshenv` (410 B) | Sanitizado: walter-os comentado; `GEMINI_API_KEY` redactado. Se mantienen cargo, openjdk, orbstack PATH. |
| `.gitconfig` | `~/.gitconfig` | user.name=kevan, user.email=kevan@kevan.com.ar + git-lfs |
| `.gitignore` | `~/.gitignore` → symlink `Development/GitHub/dotfiles/.gitignore` | Copia del target |
| `.inputrc` | `~/.inputrc` → symlink `.../dotfiles/.inputrc` | Copia del target |
| `.vimrc` | `~/.vimrc` → symlink `.../dotfiles/.vimrc` | Copia del target |
| `.osx` | `~/.osx` → symlink `.../dotfiles/.osx` | Script completo (~274 líneas), no stub |
| `ghostty/config.ghostty` | `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` | Presente pero 0 bytes |
| `ghostty/config` | (mismo) | Copia convencional vacía |
| `ghostty/README.md` | (generado) | Ubicación y estado |
| `raycast/README.md` | (generado) | Sin DBs; brew cask + sync + login item |
| `docs/login-items.md` | (generado) | Raycast, Bitwarden, Cloudflare WARP |
| `docs/macos-defaults.md` | (generado) | Documenta `.osx` |
| `README.md` | (generado) | Intro del repo |
| `MANIFEST.md` | (generado) | Este archivo |

## Skipped / no en box

| Ítem | Motivo |
|------|--------|
| `~/.ssh/**` (privadas y resto) | Solo en `~/Documents/kevan-reinstall-backup/ssh/` |
| `COLOSSEUM_COPILOT_PAT` | Secreto redactado |
| `GEMINI_API_KEY` | Secreto redactado |
| Sourcing `~/.config/walter-os/**` | Overlay secreto → placeholder |
| Raycast Application Support / DBs | Riesgo de tokens |
| Clone de repos git | Prohibido por la tarea |

## Backup LOCAL (solo Mac)

`/Users/kevan/Documents/kevan-reinstall-backup/`

- `ssh/` — copia de `~/.ssh/` (chmod go-rwx)
- `notes/README.md` — instrucciones ES
- `notes/git-identity.txt` — kevan / kevan@kevan.com.ar
- `notes/gitconfig.backup` — copia de `.gitconfig`
