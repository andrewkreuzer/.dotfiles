# vim:ft=zsh ts=2 sw=2 sts=2

prompt() {
  echo -n "%F{yellow}%n@%m%f" # User@host

}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta} %F{white}(%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{white})%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red} %f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{cyan} %f"

PROMPT=' $(prompt)%F{green} ﱮ %F{green}%~%f
%{$fg[white]%} >%f '

RPROMPT='$(git_prompt_info)'

