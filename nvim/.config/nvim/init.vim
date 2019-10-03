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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'

" versioning - git, the only version control that matters ;)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"     __                                             
"    / /___ _____  ____ ___  ______ _____ ____  _____
"   / / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \/ ___/
"  / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __(__  ) 
" /_/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/____/  
"               /____/            /____/             
"
" polyglot
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'

" javascript
Plug 'jelera/vim-javascript-syntax'

" perl
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'

" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" sql (Postgres)
Plug 'lifepillar/pgsql.vim'

"               __                     
"   _________  / /___  __  ____________
"  / ___/ __ \/ / __ \/ / / / ___/ ___/
" / /__/ /_/ / / /_/ / /_/ / /  (__  ) 
" \___/\____/_/\____/\__,_/_/  /____/  
"                                      
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

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

" tabs that don't suck
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" nerdtree settings
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" lightline settings
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

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

" JEDI settings
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" rainbow-parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" fugitive settings
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" indentline
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" autocmd rules
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

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

" c/c++ because why not
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

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
