# programs
alias tmux="TERM=screen-256color-bce tmux"
alias vim='nvim'
alias wget='wget -c'

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# quick 'uns
alias reload='source ~/.bashrc'
alias serve='python -m SimpleHTTPServer 8000'
alias untar='tar -zxvf'
alias ping='ping -c 5 '
alias aliases='nvim ~/.bash_aliases_private'
alias dotfiles='cd ~/dotfiles'

# web apps
alias myip='curl -s http://ifconfig.co'
alias coord='curl -s ipinfo.io/8.8.8.8/loc'
alias climap='telnet mapscii.me'
alias ncity='curl -s ifconfig.co/city'
alias coinz='curl -s cmc.rjldev.com'
alias moon='curl wttr.in/Moon'

# comedy
alias party='curl -s parrot.live'
alias shrug='echo ¯\_(ツ)_/¯'
