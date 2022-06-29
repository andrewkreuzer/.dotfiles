# load time tester
# don't initialize a new terminal with this (it loops infinitely), only run the
# command in a new terminal
# for i in $(seq 1 10); do time /bin/zsh -i -c exit; done;
# uncomment this and run zprof after initialized
# zmodload zsh/zprof

# Shared history
setopt share_history
export HISTFILE="$HOME/.cache/zsh/history"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zsh_shortcuts" ] && source "$HOME/.config/zsh/zsh_shortcuts"
[ -f "$HOME/.config/zsh/zsh_alias" ] && source "$HOME/.config/zsh/zsh_alias"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -Uz compinit
compinit -d $HOME/.cache/zsh/zcompdump
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=10
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' file-sort access
zstyle :compinstall filename '/home/akreuzer/.config/zsh/.zshrc'
setopt LIST_PACKED
setopt COMPLETE_IN_WORD

fpath=(~/.config/zsh/completion/zsh-completions/src/ $fpath)
source ~/.config/zsh/completion/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

bindkey -v

# Load zoxide
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
