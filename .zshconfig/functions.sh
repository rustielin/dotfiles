#######################################
# spawn and cd into a temp (scratch) directory in /tmp
# borrowed from https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.zsh/functions
#######################################
function scratch() {
  local SCRATCH=$(mktemp -d)
  echo 'Spawing subshell in scratch directory:'
  echo "  $SCRATCH"
  (cd $SCRATCH; zsh)
  echo "Removing scratch directory"
  rm -r "$SCRATCH"
}

#######################################
# an alias for sorting git branches by date
# short for: git branch log
#######################################
function glog() {
  if ! command -v column &> /dev/null
  then
    echo "column command could not be found"
  fi
  git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads \
      | sed -e 's-refs/heads/--' | column -t
}
