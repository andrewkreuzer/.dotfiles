# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_shortcuts" ] && source "$HOME/.config/zsh/zsh_shortcuts"
[ -f "$HOME/.config/zsh/zsh_alias" ] && source "$HOME/.config/zsh/zsh_alias"

#lf completion
fpath=($HOME/.config/zsh/ $fpath)
# Autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Terraform autocomplete
autoload bashcompinit
bashcompinit
complete -C /usr/bin/terraform terraform

# oh-my-zsh
export ZSH="$HOME/.config/.oh-my-zsh"
ZSH_CUSTOM=$HOME/.config/zsh/themes
ZSH_THEME="bubblified"
plugins=(git history)
source $ZSH/oh-my-zsh.sh

bindkey -v

# Load zoxide
eval "$(zoxide init zsh)"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
