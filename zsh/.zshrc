# load time tester
# for i in $(seq 1 10); do time /bin/zsh -i -c exit; done;
# zmodload zsh/zprof

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_shortcuts" ] && source "$HOME/.config/zsh/zsh_shortcuts"
[ -f "$HOME/.config/zsh/zsh_alias" ] && source "$HOME/.config/zsh/zsh_alias"

#lf completion
fpath=($HOME/.config/zsh/ $fpath)

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=10
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/akreuzer/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# History search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
# vi keybinds
bindkey -M vicmd 'k' history-beginning-search-backward-end
bindkey -M vicmd 'j' history-beginning-search-forward-end

# Shared history
setopt share_history

# Terraform autocomplete
autoload bashcompinit
bashcompinit
complete -C /usr/bin/terraform terraform

bindkey -v

# Load zoxide
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
