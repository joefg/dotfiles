"                     _ _     _              _                    
"                    (_) |   | |            (_)                   
"  ___  ___ _ __  ___ _| |__ | | ___  __   ___ _ __ ___  _ __ ___ 
" / __|/ _ \ '_ \/ __| | '_ \| |/ _ \ \ \ / / | '_ ` _ \| '__/ __|
" \__ \  __/ | | \__ \ | |_) | |  __/  \ V /| | | | | | | | | (__ 
" |___/\___|_| |_|___/_|_.__/|_|\___| (_)_/ |_|_| |_| |_|_|  \___|
"                                                                 
" A reasonably good .vimrc, for when you don't want a fatty .vimrc
"
" Nothing in here requires a plugin, making it a good start for
" building a better .vimrc

set title
set number           " Show line numbers
set ruler            " Show row and column ruler information
set cursorline       " Show a cursor line
set linebreak        " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
set textwidth=100    " Line wrap (number of cols)
set showmatch        " Highlight matching brace
set errorbells       " Beep or flash screen on errors
set visualbell       " Use visual bell (no beeping)

" folds
set foldmethod=indent
set foldlevel=99

" redrawing
set lazyredraw
set shortmess+=I
set bomb
set binary
set ttyfast
syntax on

" encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix

" fix backspace indent
set backspace=indent,eol,start

" tabs. May be overriten by autocmd rules
set autoindent       " Auto-indent new lines
set shiftwidth=4     " Number of auto-indent spaces
set smartindent      " Enable smart-indent
set smarttab         " Enable smart-tabs
set softtabstop=4    " Number of spaces per Tab

" searching
set hlsearch         " Highlight all search results
set smartcase        " Enable smart-case search
set ignorecase       " Always case-insensitive
set incsearch        " Searches for strings incrementally

" directories for swp files
set nobackup
set noswapfile

set undolevels=999