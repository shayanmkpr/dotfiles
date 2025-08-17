# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/vs-code/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/shayan/.lmstudio/bin"

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
command -v eza &>/dev/null && alias ls="eza --icons=always"

# Vi mode
bindkey -v
bindkey '^ ' autosuggest-accept  # Optional

DOTFILES=$HOME/dotfiles

# AeroSpace
[ ! -L "$HOME/.config/aerospace/aerospace.toml" ] && ln -sfn $DOTFILES/aerospace.toml $HOME/.config/aerospace/aerospace.toml

# Neovim
[ ! -L "$HOME/.config/nvim" ] && ln -sfn $DOTFILES/nvim $HOME/.config/nvim

# Ghostty
[ ! -L "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ] && ln -sfn $DOTFILES/ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
# Tmux
[ ! -L "$HOME/.tmux.conf" ] && ln -sfn $DOTFILES/tmux.conf $HOME/.tmux.conf

# Zsh itself
[ ! -L "$HOME/.zshrc" ] && ln -sfn $DOTFILES/zshrc $HOME/.zshrc
