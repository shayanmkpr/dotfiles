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
[ ! -L "$HOME/.config/zed/keymap.json" ] && ln -sfn $DOTFILES/zed/keymap.json
[ ! -L "$HOME/.config/zed/settings.json" ] && ln -sfn $DOTFILES/zed/settings.json

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
