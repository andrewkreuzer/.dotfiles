# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/opt/android-studio/bin"
export PATH="$PATH:/opt/idea/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools/"
export PATH=$PATH:$HOME/.pulumi/bin
#export PATH="$PATH:$HOME/dev/pebble/pebble-sdk-4.5-linux64/bin"
#export PATH="$PATH:/opt/miniconda3/bin"

if [[ -d $HOME/.Garmin ]];then
  GARMIN_SDK=$(cat $HOME/.Garmin/ConnectIQ/current-sdk.cfg)
  export PATH="$PATH:$GARMIN_SDK/bin"
fi

export DOTFILES="$HOME/.dotfiles"
export GOPATH="$HOME/go"
export HISTFILE="$HOME/.cache/zsh/history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export GO111MODULE=on
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
