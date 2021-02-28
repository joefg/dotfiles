"     ____     ____   ______    ______
"    / __ \   /  _/  / ____/   / ____/
"   / /_/ /   / /   / /       / __/   
"  / _, _/  _/ /   / /___    / /___   
" /_/ |_|  /___/   \____/   /_____/   
"                                     
" RICE: Rather Impressive Coding Environment
"
" Written for neovim (https://neovim.io/),
" may work for vim 8+
"

"            __            _           
"     ____  / /_  ______ _(_)___  _____
"    / __ \/ / / / / __ `/ / __ \/ ___/
"   / /_/ / / /_/ / /_/ / / / / (__  ) 
"  / .___/_/\__,_/\__, /_/_/ /_/____/  
" /_/            /____/                
"
call plug#begin('~/.config/nvim/plugged')

" general plugins
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/rainbow_parentheses.vim'

" statusline
Plug 'itchyny/lightline.vim'

" versioning - git, the only version control that matters ;)
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

"     __                                             
"    / /___ _____  ____ ___  ______ _____ ____  _____
"   / / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \/ ___/
"  / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __(__  ) 
" /_/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/____/  
"               /____/            /____/             
"
" polyglot (all the useful languages, loaded)
Plug 'sheerun/vim-polyglot'

" python+sql
Plug 'MathSquared/vim-python-sql'

"               __                     
"   _________  / /___  __  ____________
"  / ___/ __ \/ / __ \/ / / / ___/ ___/
" / /__/ /_/ / / /_/ / /_/ / /  (__  ) 
" \___/\____/_/\____/\__,_/_/  /____/  
"                                      
Plug 'nanotech/jellybeans.vim'
call plug#end()

colorscheme jellybeans

"               __  __  _                 
"    ________  / /_/ /_(_)___  ____ ______
"   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
"  (__  )  __/ /_/ /_/ / / / / /_/ (__  ) 
" /____/\___/\__/\__/_/_/ /_/\__, /____/  
"                           /____/        
" 
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

" closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ]
  \ },
  \ 'component_function' : {
  \     'gitbranch': 'GitBranch'
  \ },
  \}
set noshowmode

" git helper functions
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" netrw
let g:netrw_liststyle = 3

" rainbow_parentheses.vim settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" rainbow-parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" autocmd rules
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" sql - we use postgresql, accept no substitutes
let g:sql_type_default = 'pgsql'

"    ____ ___  ____ _______________  _____
"   / __ `__ \/ __ `/ ___/ ___/ __ \/ ___/
"  / / / / / / /_/ / /__/ /  / /_/ (__  ) 
" /_/ /_/ /_/\__,_/\___/_/   \____/____/
"
command -range=% Json <line1>,<line2>!python3 -m json.tool
"                 __           
"    ____  ____  / /____  _____
"   / __ \/ __ \/ __/ _ \/ ___/
"  / / / / /_/ / /_/  __(__  ) 
" /_/ /_/\____/\__/\___/____/  
"                              
" want the slick header text? http://patorjk.com/software/taag/#p=display&f=Slant
" there should be a plugin for that
