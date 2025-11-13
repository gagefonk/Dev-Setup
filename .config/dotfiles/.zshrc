# this needs to come before other plugins according to docs
# why didnt you include the links then?
autoload -U compinit; compinit
source ~/.config/fzf-tab/fzf-tab.plugin.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ll="ls -la"
alias so="source"
alias lg="lazygit"
alias vim="nvim"
alias zshrce="vim ~/.zshrc"
alias vime="cd ~/.config/nvim && nvim"
alias ghosttye="vim ~/.config/ghostty/config"
alias starshipe="vim ~/.config/starship.toml"
alias gotowork="cd ~/Developer/golfshot/Golfshot-iOS/GolfshotGPS/"
alias gotorust="cd ~/Developer/rust/"
alias gotoschool="cd ~/Developer/gatech/"


# HOMEBREW BASH
export PATH=/opt/homebrew/bin/bash:$PATH
# export scripts folder to PATH
export PATH=$PATH:/usr/local/bin/scripts

# android studio stuff for school
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"

