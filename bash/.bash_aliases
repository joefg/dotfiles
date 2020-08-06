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

# shortcuts
alias ..='cd ../'
alias ~='cd ~'

# quick 'uns
alias reload='source ~/.bashrc'
alias serve='python -m SimpleHTTPServer 8000'
alias untar='tar -zxvf'
alias ping='ping -c 5 '
alias aliases='nvim ~/.bash_aliases_private'
alias dotfiles='cd ~/dotfiles'
alias wget='wget -c'

# web apps
alias myip='curl -s http://ifconfig.co'
alias coord='curl -s ipinfo.io/8.8.8.8/loc'
alias climap='telnet mapscii.me'
alias ncity='curl -s ifconfig.co/city'
alias coinz='curl -s cmc.rjldev.com'
alias moon='curl wttr.in/Moon'

# dump colours into terminal-- for development?
function dumpcolours(){
    for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done
}

# comedy
alias party='curl -s parrot.live'
alias shrug='echo "¯\_(ツ)_/¯"'
