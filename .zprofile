
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# >>> Colosseum Copilot >>>
# SECRET REDACTED — set COLOSSEUM_COPILOT_PAT locally; do not commit tokens.
# export COLOSSEUM_COPILOT_API_BASE="https://copilot.colosseum.com/api/v1"
# export COLOSSEUM_COPILOT_PAT="REDACTED"
# <<< Colosseum Copilot <<<

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
