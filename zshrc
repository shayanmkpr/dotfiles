# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$PATH:Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/shayan/.lmstudio/bin"
export PATH="$PATH:/Users/shayan/go/bin"


# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
command -v eza &>/dev/null && alias ls="eza -l --icons=always --group-directories-first"
alias godebug='dlv debug --headless --listen=:2345 --api-version=2 --log'
alias sdlocal="ssh adminsh@192.168.16.51"
alias sdlocalsrvc="ssh root@192.168.30.14"

autoload -Uz compinit && compinit
setopt autopushd
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Vim mode
bindkey -v
bindkey '^ ' autosuggest-accept  # Optional

DOTFILES=$HOME/dotfiles

[ ! -L "$HOME/.config/aerospace/aerospace.toml" ] && ln -sfn $DOTFILES/aerospace.toml $HOME/.config/aerospace/aerospace.toml
[ ! -L "$HOME/.config/nvim" ] && ln -sfn $DOTFILES/nvim $HOME/.config/nvim
[ ! -L "$HOME/.vimrc" ] && ln -sfn $DOTFILES/vimrc $HOME/.vimrc
[ ! -L "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ] && ln -sfn $DOTFILES/ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
[ ! -L "$HOME/.tmux.conf" ] && ln -sfn $DOTFILES/tmux.conf $HOME/.tmux.conf
[ ! -L "$HOME/.zshrc" ] && ln -sfn $DOTFILES/zshrc $HOME/.zshrc
[ ! -L "$HOME/.config/opencode/agent" ] && ln -sfn $DOTFILES/opencode/agent "$HOME/.config/opencode/agent"
[ ! -L "$HOME/.config/opencode/opencode.json" ] && ln -sfn $DOTFILES/opencode/opencode.json "$HOME/.config/opencode/opencode.json"

# CGO flags for LibRaw and JPEG libraries
export CGO_CFLAGS="-I/opt/homebrew/opt/libraw/include -I/opt/homebrew/opt/jpeg-turbo/include"
export CGO_LDFLAGS="-L/opt/homebrew/opt/libraw/lib -L/opt/homebrew/opt/jpeg-turbo/lib"

# Export all proxies to hiddify default port (:12334)
# export http_proxy=socks5://127.0.0.1:12334
# export https_proxy=socks5://127.0.0.1:12334
# export all_proxy=socks5://127.0.0.1:123334

# opencode
export PATH=/Users/shayan/.opencode/bin:$PATH
ai() {
	opencode "$@"
}

openrouter-api() {
	source ~/.secrets
	echo "Open router api key is set to path. This is the api key:"
	echo $OPENROUTER_API_KEY
}

#Python crap
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Override Claude Code to use OpenRouter API
open-claude() {
	source ~/.secrets
    export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
    export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
    export ANTHROPIC_API_KEY=""

    export ANTHROPIC_DEFAULT_OPUS_MODEL="moonshotai/kimi-k2.6"
    export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek/deepseek-v4-flash"
    export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek/deepseek-v4-flash"
    export CLAUDE_CODE_SUBAGENT_MODEL="deepseek/deepseek-v4-flash"

    claude ""
}

claude_reset() {
    unset ANTHROPIC_BASE_URL ANTHROPIC_AUTH_TOKEN ANTHROPIC_API_KEY
    unset ANTHROPIC_CUSTOM_HEADERS ANTHROPIC_MODEL ANTHROPIC_SMALL_FAST_MODEL
    echo "Claude environment has been reset to default."
}
