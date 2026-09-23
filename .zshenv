[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
export PATH="$HOME/.local/bin:$HOME/.orbstack/bin:/opt/homebrew/opt/openjdk/bin:$PATH"
# Walter-OS secret overlay — do not source into public dotfiles.
# [[ -f "$HOME/.config/walter-os/env" ]] && . "$HOME/.config/walter-os/env"
# SECRET REDACTED — set GEMINI_API_KEY in a local-only env file; do not commit.
# export GEMINI_API_KEY="REDACTED"
