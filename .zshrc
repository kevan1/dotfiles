# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
if [[ -s "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# User configuration

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# configuración de eza y alias
if command -v eza >/dev/null 2>&1; then
  export EZA_ICONS_AUTO=always
  alias ls='eza --icons'
  alias ll='eza -l --icons --git'
  alias la='eza -la --icons --git'
  alias lt='eza --tree --level=2 --icons'
  alias l='eza -l --icons'
  alias lg='eza -l --git --icons'
  alias ldot='eza -ld .* --icons'
fi

# configuración de starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# configuración de zoxide (z / zi)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# NOTE: ~/.nvm was absent on collection (2026-09-23); keep commented until reinstalled.
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="$PATH:$HOME/.yarn/bin"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Aiken
export PATH="$HOME/.aiken/bin:$PATH"

# >>> Colosseum Copilot >>>
# SECRET REDACTED — set COLOSSEUM_COPILOT_PAT locally; do not commit tokens.
# export COLOSSEUM_COPILOT_API_BASE="https://copilot.colosseum.com/api/v1"
# export COLOSSEUM_COPILOT_PAT="REDACTED"
# <<< Colosseum Copilot <<<

# Walter-OS secret overlays — do not source into public dotfiles.
# Place secrets in a local-only file, e.g. ~/.config/walter-os/overlay/personal.env
# [[ -f "$HOME/.config/walter-os/env" ]] && source "$HOME/.config/walter-os/env"
# [[ -f "$HOME/.config/walter-os/overlay/personal.env" ]] && source "$HOME/.config/walter-os/overlay/personal.env"

export PATH="$HOME/.revyl/bin:$PATH"
# Android SDK (Expo/Gradle)
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export ANDROID_SDK_ROOT=$ANDROID_HOME
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$JAVA_HOME/bin"
