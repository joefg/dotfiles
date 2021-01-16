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

" html
Plug 'gorodinskiy/vim-coloresque'

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
set number
set ruler
set cursorline
set foldmethod=indent
set foldlevel=99
set lazyredraw
set shortmess+=I
syntax on

" encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" fix backspace indent
set backspace=indent,eol,start

" tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" map leader to ,
let mapleader=','

" enable hidden buffers
set hidden

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" directories for swp files
set nobackup
set noswapfile

set fileformats=unix

" because, let's face it, vim can be really pedantic
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

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

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
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

" html
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
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
