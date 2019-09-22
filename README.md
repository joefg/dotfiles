# joefg's dotfiles

mah configs

## what's in here?

* bash
    - .bashrc
    - .bash_aliases
* git
    - .gitconfig
* nvim
    - init.vim
* tmux
    - .tmux.conf

## how to use

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage symbolic links from this dotfiles repository to their locations in your home directory.

To install each config, run this from the dotfiles folder:

```
$ stow $CONFIG
```
