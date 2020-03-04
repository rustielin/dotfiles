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