# dotfiles

A collection of some of my dotfiles using [this guide](https://www.atlassian.com/git/tutorials/dotfiles) by Atlassian. Basically allows easy management and migration of dotfiles using a git alias working around a repository in `$HOME/.cfg`.

Some configs borrowed from others, and unfortunately this hasn't been under version control for too long, so credit to original authors. Might have lost a few.

## installation

Requires [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) firstly.

```
# from https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then install some plugins to emulate fish lol

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## zshconfig 

Not sure if a tool exists already for something like this, but storing some custom zsh configs in `.zshconfig`. This holds a number of shell scripts to be run on start (e.g. for aliases, utility functions, etc.) The `.zshrc` sources all of these files contained inside `.zshconfig`.

## installation

Something along the lines of the following, though expecting a lot of the stuff in `.zshrc` etc to break since they depend on some system-dependent files and directories... oh well good enough for now.

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
