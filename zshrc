# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$PATH:Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/shayan/.lmstudio/bin"
export PATH="$PATH:/Users/shayan/go/bin"

# Conda
_CONDA_ROOT="/Users/shayan/miniconda3"
. "$_CONDA_ROOT/etc/profile.d/conda.sh"
# conda activate base  # Optional

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
command -v eza &>/dev/null && alias ls="eza -l --icons=always --group-directories-first"
alias gl="git log --graph --stat --decorate --all"
alias tree="tree -I '.git'"

autoload -Uz compinit && compinit
setopt autopushd
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Vim mode
bindkey -v
bindkey '^ ' autosuggest-accept  # Optional

DOTFILES=$HOME/dotfiles

# AeroSpace
[ ! -L "$HOME/.config/aerospace/aerospace.toml" ] && ln -sfn $DOTFILES/aerospace.toml $HOME/.config/aerospace/aerospace.toml

# Neovim
[ ! -L "$HOME/.config/nvim" ] && ln -sfn $DOTFILES/nvim $HOME/.config/nvim

# VIM
[ ! -L "$HOME/.vimrc" ] && ln -sfn $DOTFILES/vimrc $HOME/.vimrc


# Ghostty
[ ! -L "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ] && ln -sfn $DOTFILES/ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# Tmux
[ ! -L "$HOME/.tmux.conf" ] && ln -sfn $DOTFILES/tmux.conf $HOME/.tmux.conf

# Zsh itself
[ ! -L "$HOME/.zshrc" ] && ln -sfn $DOTFILES/zshrc $HOME/.zshrc


# Export all proxies to hiddify default port (:12334)
# export http_proxy=socks5://127.0.0.1:12334
# export https_proxy=socks5://127.0.0.1:12334
# export all_proxy=socks5://127.0.0.1:123334
