"                     _ _     _              _                    
"                    (_) |   | |            (_)                   
"  ___  ___ _ __  ___ _| |__ | | ___  __   ___ _ __ ___  _ __ ___ 
" / __|/ _ \ '_ \/ __| | '_ \| |/ _ \ \ \ / / | '_ ` _ \| '__/ __|
" \__ \  __/ | | \__ \ | |_) | |  __/  \ V /| | | | | | | | | (__ 
" |___/\___|_| |_|___/_|_.__/|_|\___| (_)_/ |_|_| |_| |_|_|  \___|
"                                                                 
" A reasonably good .vimrc, for when you don't want a fatty .vimrc

set number           " Show line numbers
set linebreak        " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
set textwidth=100    " Line wrap (number of cols)
set showmatch        " Highlight matching brace
set errorbells       " Beep or flash screen on errors
set visualbell       " Use visual bell (no beeping)

colorscheme desert   " Nice default colour scheme
highlight Comment ctermfg=green

set hlsearch         " Highlight all search results
set smartcase        " Enable smart-case search
set ignorecase       " Always case-insensitive
set incsearch        " Searches for strings incrementally
 
set autoindent       " Auto-indent new lines
set shiftwidth=4     " Number of auto-indent spaces
set smartindent      " Enable smart-indent
set smarttab         " Enable smart-tabs
set softtabstop=4    " Number of spaces per Tab
 
set ruler            " Show row and column ruler information
 
set undolevels=1000  " Number of undo levels
 