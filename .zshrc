#######################################
# oh-my-zsh installation
#######################################

# Path to oh-my-zsh installation.
export ZSH="/Users/rustie/.oh-my-zsh"

ZSH_THEME="avit"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

plugins=(
    git
    z
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#######################################
# custom config zsh stuff
#######################################

ZSH_CONFIG="$HOME/.zshconfig"
if [ -d $ZSH_CONFIG ]; then
    for f in $ZSH_CONFIG/*.sh; do source $f; done
fi

#######################################
# other stuff
#######################################

# for tracking dotfiles using https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/Users/rustie/.cfg/ --work-tree=/Users/rustie'


# ruby stuff
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# added by travis gem
[ -f /Users/rustie/.travis/travis.sh ] && source /Users/rustie/.travis/travis.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
