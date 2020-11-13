# dotfiles

## Structure
```
dotfiles
├── bash
│   ├── .bash_aliases
│   └── .bashrc
│── git
│   └── .gitconfig
├── nvim
│   └── .config
│       └── nvim
│           └── init.vim
├── vim
│   └── .vimrc
├── i3
│   └── .config
│       └── i3
│           └── config
├── i3status
│   └── .config
│       └── i3status
│           └── config
├── newsboat
│   └── .newsboat
│       └── config
└── tmux
    └── .tmux.conf
```

## Installation
I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage symbolic links from this dotfiles repository to their locations in your home directory.

To install each config, run `stow $CONFIG` from this repository.

If you wish to make any changes, I recommend doing them on a feature branch, making sure to merge `master` into this feature branch as often as you can. There are some things that you have to change to get things working on other platforms, like hardware monitoring for `i3status`.

## Theming
I'm alternating between two themes:
- [gruvbox](https://github.com/morhetz/gruvbox), for terminals that run natively;
- [jellybeans](https://github.com/nanotech/jellybeans.vim), for terminals over ssh.

### tmux
I'm using a source-file directive to import a .conf file, with a rough "theme" loaded from there.
```
source-file ~/dotfiles/tmux/gruvbox.conf # gruvbox
```

### nvim
For this, we're using `vim-plug` to fetch two sets of themes: gruvbox and jellybeans, and then using `colorscheme` to set the scheme.

## Private Aliases, Functions, and Credentials
In the interests of avoiding the embarrassment of accidentally committing some private credentials or somesuch, these dotfiles have the ability to read aliases from non-tracked files.

| Config | Private                 |
| ------ | ----------------------- |
| bash   | `.bash_aliases_private` |
| git    | `.gitconfig.private`    |

### Bash
This is imported via `.bashrc`, the same way that `~/.bash_aliases` is imported.

```
if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
```

### Git
This is imported via `.gitconfig`, through an `[include]` directive.

```
[include]
    path = ~/.gitconfig.private
```
