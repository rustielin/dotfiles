# dotfiles

A collection of some of my dotfiles using [this guide](https://www.atlassian.com/git/tutorials/dotfiles) by Atlassian. Basically allows easy management and migration of dotfiles using a git alias working around a repository in `$HOME/.cfg`.

Some configs borrowed from others, and unfortunately this hasn't been under version control for too long, so credit to original authors. Might have lost a few.

## installation

Just run the install script, and dependencies will be pulled in automatically:

```
source <(curl -s https://raw.githubusercontent.com/rustielin/dotfiles/master/install.sh)
```

Cloned:
```
# pulls in ohmyzsh and plugins
# sets git alias
./install.sh
```

## zshconfig 

Not sure if a tool exists already for something like this, but storing some (small) custom zsh configs in `.zshconfig`. This holds a number of shell scripts to be run on start (e.g. for aliases, utility functions, etc.) The `.zshrc` sources all of these files contained inside `.zshconfig`.

## note on git alias

```
git clone --bare https://github.com/rustielin/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
