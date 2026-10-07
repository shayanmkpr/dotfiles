# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
command -v eza &>/dev/null && alias ls="eza -l --header --icons=always --group-directories-first"

autoload -Uz compinit && compinit
setopt autopushd
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Vim mode
bindkey -v
bindkey '^ ' autosuggest-accept  # Optional
