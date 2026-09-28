# kevan-dotfiles

Personal macOS development environment configuration for Kevin Anrique (`kevan1`).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

Production-grade dotfiles for a macOS development workstation, managing shell configuration, system defaults, and terminal emulator settings. Designed for reproducibility, safety, and integration with automated provisioning workflows.

**Companion Repository:** [kevan-setup-mac-playbook](https://github.com/kevan1/kevan-setup-mac-playbook) — Ansible playbook for full system provisioning

## Contents

```
.
├── .gitconfig              # Git identity and LFS configuration
├── .gitignore              # Global ignore patterns (DS_Store, LSOverride, etc.)
├── .inputrc                # Readline bindings (history search, case-insensitive completion)
├── .osx                    # macOS system defaults automation script (~274 lines)
├── .vimrc                  # Vim editor configuration (syntax, indentation, keybindings)
├── .zshenv                 # Zsh environment variables (loaded first, all shells)
├── .zprofile               # Zsh profile (login shells: Homebrew, PATH setup)
├── .zshrc                  # Zsh interactive configuration (Oh My Zsh, aliases, tooling)
├── docs/
│   ├── login-items.md      # macOS login items documentation (Raycast, Bitwarden, WARP)
│   └── macos-defaults.md   # .osx script usage and coverage notes
├── ghostty/
│   ├── config              # Ghostty terminal configuration
│   ├── config.ghostty      # Symlink target for ~/Library/Application Support
│   └── README.md           # Ghostty setup and keybinding notes
├── raycast/
│   └── README.md           # Raycast installation, sync strategy, and security notes
└── MANIFEST.md             # File provenance and sanitization audit trail
```

## What's Configured

### Shell Environment (Zsh)

**`.zshrc`** — Interactive shell configuration:
- **Oh My Zsh framework** with `git`, `zsh-syntax-highlighting`, and `zsh-autosuggestions` plugins
- **Starship prompt** for rich Git status and environment context
- **Modern CLI tools**: `eza` (ls replacement with icons), `zoxide` (smart cd), `bun`, `yarn`
- **Development toolchains**:
  - Java (Zulu 17 + OpenJDK 17 via Homebrew)
  - Android SDK with emulator/platform-tools
  - Solana, Aiken, Revyl
  - Rust (Cargo)
  - Node.js ecosystem (NVM placeholder for future setup)
- **Rationale**: Optimized for full-stack development (React Native, blockchain, web) with fast navigation and visual feedback

**`.zshenv`** — Environment setup:
- Cargo (Rust) initialization
- Java home configuration
- Local binaries (`~/.local/bin`, `~/.orbstack/bin`)
- **Security note**: Secret overlays (Walter-OS, API keys) commented out with clear instructions for local-only setup

**`.zprofile`** — Login shell setup:
- Homebrew environment detection (Apple Silicon + Intel Mac support)
- Solana CLI path
- Python 2.7 legacy support (if needed)
- OrbStack integration

### Git Configuration

**`.gitconfig`**:
- User identity: `kevan` / `kevan@kevan.com.ar`
- Git LFS filter configuration

**`.gitignore`**:
- macOS-specific ignores: `.DS_Store`, `.LSOverride`
- Windows thumbnail cache: `Thumbs.db`
- Ruby Bundler artifacts

### Editor Configuration

**`.vimrc`** — Optimized for code editing:
- Syntax highlighting, line numbers, and cursorline
- Smart indentation (2 spaces, expandtab)
- Visual column guide at 80 characters
- Persistent search highlighting
- Clipboard integration with macOS
- Auto-closing braces
- **Rationale**: Lightweight, SSH-friendly editing without heavy IDE dependencies

**`.inputrc`** — Readline enhancements:
- Up/down arrow history search (context-aware)
- Case-insensitive tab completion
- Show all completions on ambiguity

### macOS System Configuration

**`.osx`** — Automated system defaults script (based on Jeff Geerling's pattern):
- **UI/UX**: Expanded save/print panels, disk-first (not iCloud), disabled smart quotes/dashes
- **Input devices**: Trackpad haptic feedback, fast key repeat (20ms initial, 1ms repeat)
- **Screenshots**: PNG format, saved to Downloads, no shadows
- **Finder**: Column view, show extensions, hidden files, POSIX paths, no .DS_Store on network
- **Dock**: 30px icons, fast Mission Control, translucent hidden apps
- **Hot corners**: Bottom-right (Mission Control), top-right (sleep display), bottom-left (Desktop)
- **Safari**: Developer menu and Web Inspector enabled
- **Mail**: Plain email addresses on copy
- **Activity Monitor**: Show all processes by default
- **App Store**: Disabled in-app review prompts
- **Safety**: Requires review before running; `--no-restart` flag supported; some commands need sudo

### Terminal Emulator

**Ghostty** — Minimal configuration:
- Custom keybinding: `Shift+Enter` → newline (useful for Claude Code and multiline prompts)
- Config location: `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`
- **Rationale**: Fast, native, defaults-first terminal; not using Warp

### Application Notes

**Raycast** (`raycast/README.md`):
- Installed via Homebrew cask: `brew install --cask raycast`
- Configuration synced via official Raycast cloud sync (not exported to repo)
- Configured as login item alongside Bitwarden and Cloudflare WARP
- **Security**: Local databases intentionally excluded (may contain tokens/secrets)

## Installation

### Automated (Recommended)

Use the [kevan-setup-mac-playbook](https://github.com/kevan1/kevan-setup-mac-playbook) Ansible playbook, which:
1. Clones this repository to `~/Development/GitHub/dotfiles`
2. Creates symlinks from `~/.zshrc`, `~/.gitconfig`, etc. to repo files
3. Installs Homebrew packages and casks
4. Applies `dotfiles_files` role

### Manual Installation

#### Prerequisites

```bash
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Dotfiles Setup

1. **Clone the repository:**
   ```bash
   mkdir -p ~/Development/GitHub
   cd ~/Development/GitHub
   git clone https://github.com/kevan1/dotfiles.git
   cd dotfiles
   ```

2. **Backup existing configuration:**
   ```bash
   # Create backup directory
   mkdir -p ~/Documents/dotfiles-backup-$(date +%Y%m%d)
   
   # Backup existing files (if they exist)
   for file in .zshrc .zshenv .zprofile .gitconfig .vimrc .inputrc .osx; do
     if [ -f ~/$file ] || [ -L ~/$file ]; then
       cp -L ~/$file ~/Documents/dotfiles-backup-$(date +%Y%m%d)/ 2>/dev/null || true
     fi
   done
   ```

3. **Create symlinks:**
   ```bash
   # Symlink shell configuration
   ln -sf ~/Development/GitHub/dotfiles/.zshrc ~/.zshrc
   ln -sf ~/Development/GitHub/dotfiles/.zshenv ~/.zshenv
   ln -sf ~/Development/GitHub/dotfiles/.zprofile ~/.zprofile
   
   # Symlink Git configuration
   ln -sf ~/Development/GitHub/dotfiles/.gitconfig ~/.gitconfig
   ln -sf ~/Development/GitHub/dotfiles/.gitignore ~/.gitignore
   
   # Symlink editor configuration
   ln -sf ~/Development/GitHub/dotfiles/.vimrc ~/.vimrc
   ln -sf ~/Development/GitHub/dotfiles/.inputrc ~/.inputrc
   
   # Symlink macOS defaults script
   ln -sf ~/Development/GitHub/dotfiles/.osx ~/.osx
   
   # Ghostty configuration (if Ghostty is installed)
   mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
   ln -sf ~/Development/GitHub/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
   ```

4. **Install shell dependencies:**
   ```bash
   # Install Oh My Zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   
   # Install Zsh plugins
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   
   # Install modern CLI tools
   brew install eza zoxide starship
   ```

5. **Apply shell configuration:**
   ```bash
   source ~/.zshrc
   ```

6. **(Optional) Apply macOS defaults:**
   ```bash
   # IMPORTANT: Review the script first
   less ~/.osx
   
   # Run without restarting apps (safer for first run)
   ~/.osx --no-restart
   
   # Or run with automatic app restarts
   # sudo ~/.osx
   ```

#### Restoring SSH Keys (Local Only)

SSH keys are **never** stored in this repository. Restore from local backup:

```bash
# Restore from backup (adjust path as needed)
cp -r ~/Documents/kevan-reinstall-backup/ssh/* ~/.ssh/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_* ~/.ssh/config
chmod 644 ~/.ssh/*.pub
```

#### Secrets and Environment Variables

This repository intentionally excludes:
- SSH private keys
- API tokens (Colosseum Copilot PAT, Gemini API key, etc.)
- Walter-OS secret overlays

**To configure secrets locally:**

1. Create a local-only environment file:
   ```bash
   mkdir -p ~/.config/walter-os/overlay
   touch ~/.config/walter-os/overlay/personal.env
   chmod 600 ~/.config/walter-os/overlay/personal.env
   ```

2. Add your secrets:
   ```bash
   # Example content for ~/.config/walter-os/overlay/personal.env
   export COLOSSEUM_COPILOT_PAT="your-token-here"
   export GEMINI_API_KEY="your-key-here"
   ```

3. Source in your shell (add to `.zshrc` or `.zshenv` if needed):
   ```bash
   [[ -f "$HOME/.config/walter-os/overlay/personal.env" ]] && source "$HOME/.config/walter-os/overlay/personal.env"
   ```

## Safety and Idempotency

### Backup Before Applying

- **Always backup existing configurations** before symlinking (see installation steps)
- Keep backups in `~/Documents/dotfiles-backup-YYYYMMDD/`
- SSH keys: Maintain a separate backup in `~/Documents/kevan-reinstall-backup/ssh/`

### Idempotency

- **Symlinking**: `ln -sf` is idempotent (safe to run multiple times)
- **Oh My Zsh installation**: Script detects existing installation
- **Homebrew formulas**: `brew install` skips already-installed packages
- **`.osx` script**: Most `defaults write` commands are idempotent; some require logout/restart to take effect

### Dry Run / Review

Before applying system defaults:
```bash
# Review what will change
less .osx

# Test specific sections by commenting out unwanted parts
vim .osx

# Run without app restarts first
./.osx --no-restart
```

## Usage

### Daily Workflow

After installation, your shell environment will automatically:
- Load Oh My Zsh with syntax highlighting and autosuggestions
- Display Starship prompt with Git status
- Provide modern aliases: `ls` → `eza`, `cd` → `zoxide`
- Configure development toolchains (Java, Android, Rust, Node, etc.)

### Updating Dotfiles

```bash
cd ~/Development/GitHub/dotfiles
git pull origin main
source ~/.zshrc  # Reload shell configuration
```

### Modifying Configuration

1. Edit files in the repository (not the symlink targets in `~/`)
2. Changes take effect immediately for new shell sessions
3. For current shell: `source ~/.zshrc` (or restart terminal)
4. Commit and push changes to keep repository in sync

### Applying macOS Defaults to a New Machine

```bash
# Full run with sudo (some settings require root)
sudo ~/.osx

# Or staged approach:
./.osx --no-restart  # Apply settings without restarting apps
# Review changes
# Logout and login, or reboot
```

## Sanitization and Security

This repository contains **sanitized configurations**:

- ✅ **Included**: Configuration structure, tool choices, safe defaults
- ❌ **Excluded**: SSH keys, API tokens, private credentials, Walter-OS overlays
- 🔒 **Redacted**: `COLOSSEUM_COPILOT_PAT`, `GEMINI_API_KEY`, proprietary overlays

**See `MANIFEST.md`** for complete file provenance and sanitization audit trail.

## Continuous Integration

This repository is designed to integrate with:

- **[kevan-setup-mac-playbook](https://github.com/kevan1/kevan-setup-mac-playbook)** — Full system provisioning via Ansible
- **Local backup strategy** — `~/Documents/kevan-reinstall-backup/` for sensitive files
- **Raycast cloud sync** — Application-specific settings synchronized externally

## Documentation

- **[MANIFEST.md](MANIFEST.md)** — File origins, sizes, and sanitization notes
- **[docs/macos-defaults.md](docs/macos-defaults.md)** — macOS defaults script usage and coverage
- **[docs/login-items.md](docs/login-items.md)** — macOS login items (Raycast, Bitwarden, Cloudflare WARP)
- **[ghostty/README.md](ghostty/README.md)** — Ghostty terminal configuration notes
- **[raycast/README.md](raycast/README.md)** — Raycast installation and security strategy

## System Requirements

- **OS**: macOS (tested on macOS 11.3+; compatible with Apple Silicon and Intel)
- **Shell**: Zsh (default since macOS Catalina)
- **Package Manager**: Homebrew
- **Dependencies**: Oh My Zsh, Starship, eza, zoxide, Git LFS

## Contributing

This is a personal configuration repository. If you find issues or have suggestions, feel free to open an issue or pull request.

## License

MIT License - see individual files for any specific attributions (e.g., `.osx` based on Jeff Geerling's work).

## Author

**Kevin Anrique** (`kevan1`)  
Email: `kevan@kevan.com.ar`  
GitHub: [@kevan1](https://github.com/kevan1)

## Acknowledgments

- `.osx` script inspired by [Jeff Geerling's dotfiles](https://github.com/geerlingguy/dotfiles)
- Oh My Zsh framework and community plugins
- Homebrew ecosystem and cask maintainers
