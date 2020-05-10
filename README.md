# joefg's dotfiles

mah configs

## what's in here?
```

dotfiles
├── bash
│   ├── .bash_aliases
│   └── .bashrc
│─ git
│   └── .gitconfig
├── nvim
│   └── .config
│       └── nvim
│           └── init.vim
├── ranger
│   └── .config
│       └── ranger
│           ├── commands_full.py
│           ├── commands.py
│           ├── rc.conf
│           ├── rifle.conf
│           └── scope.sh
└── tmux
    └── .tmux.conf
```

## how to use

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage symbolic links from this dotfiles repository to their locations in your home directory.

To install each config, run this from the dotfiles folder:

```
$ stow $CONFIG
```

## private aliases, functions, and credentials

I've parted out `.bash_aliases` from `.bashrc` and for good reason: It would not be fun if you accidentally pushed private stuff to GitHub. Keep anything you *don't* want tracked inside `.bash_aliases_private`, please. I've added it to the `.gitignore`.

I'm also now importing `~/.gitconfig.private` from your home directory. Put your user.name, user.email, and anything you don't want tracked in there. Like above, I'm adding that file to the gitignore.
