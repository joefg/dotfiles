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
├── i3
│   └── .config
│       └── i3
│           └── config
├── i3status
│   └── .config
│       └── i3status
│           └── config
├── ranger
│   └── .config
│       └── ranger
│           ├── commands_full.py
│           ├── commands.py
│           ├── rc.conf
│           ├── rifle.conf
│           └── scope.sh
└── tmux
    └── .tmux.conf
```

## Installation

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage symbolic links from this dotfiles repository to their locations in your home directory.

To install each config, run `stow $CONFIG` from this repository.

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
