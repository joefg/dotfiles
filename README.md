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

## private aliases, functions, and credentials

I've parted out `.bash_aliases` from `.bashrc` and for good reason: It would not be fun if you accidentally pushed private stuff to GitHub. Keep anything you *don't* want tracked inside .bash_aliases_private, please. I've added it to the gitignore.

As yet, I have not figured this out for `.gitconfig`.
