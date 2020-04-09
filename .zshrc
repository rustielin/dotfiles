#######################################
# oh-my-zsh installation
#######################################

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

plugins=(
    terraform
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# XXX: override avit theme
# adds terraform 
PROMPT='
$(_user_host)${_current_dir} $(git_prompt_info) $(ruby_prompt_info) %{$fg[white]%}$(tf_prompt_info)%{$reset_color%}
%{%(!.%F{red}.%F{white})%}▶%{$resetcolor%} '

#######################################
# custom config zsh stuff
#######################################

ZSH_CONFIG="$HOME/.zshconfig"
if [ -d $ZSH_CONFIG ]; then
    for f in $ZSH_CONFIG/*.sh; do source $f; done
fi

#######################################
# for version control
#######################################

# for tracking dotfiles using https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#######################################
# PATH
#######################################

export GOPATH=$HOME/go

export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="$PATH:/home/username/bin:/usr/local/homebrew"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$GOPATH/src/github.com/hyperledger/fabric/.build/bin" # fabric tools
# export PATH="$PATH:/usr/local/opt/ruby/bin"
export PATH="$HOME/.cargo/bin:$PATH"

#######################################
# misc 
#######################################

FB_DEVVM_RE="^devvm[0-9]+.*facebook\.com$"
if [[ $(uname -n) =~ $FB_DEVVM_RE ]]; then
    IS_FB_DEVVM=true
else
    IS_FB_DEVVM=false
fi

# Facebook devserver proxy
if [[ "$IS_FB_DEVVM" = "true" ]]; then
    export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
    export http_proxy=fwdproxy:8080
    export https_proxy=fwdproxy:8080
fi

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
export PATH="$HOME/.tfenv/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
