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
Plug 'Yggdroot/indentLine'

" versioning - git, the only version control that matters ;)
Plug 'airblade/vim-gitgutter'

" does markdown count as a language?
Plug 'plasticboy/vim-markdown'

"     __                                             
"    / /___ _____  ____ ___  ______ _____ ____  _____
"   / / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \/ ___/
"  / / /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __(__  ) 
" /_/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/____/  
"               /____/            /____/             
"
" polyglot
Plug 'sheerun/vim-polyglot'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'

" javascript
Plug 'jelera/vim-javascript-syntax'

" python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" sql (Postgres)
Plug 'lifepillar/pgsql.vim'

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

" statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

function! ModeCurrent() abort
  let l:modecurrent = mode()
  " use get() -> fails safely, since ^V doesn't seem to register
  " 3rd arg is used when return of mode() == 0, which is case with ^V
  " thus, ^V fails -> returns 0 -> replaced with 'V Block'
  let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
  let l:current_status_mode = l:modelist
  return l:current_status_mode
endfunction

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\%{StatuslineGit()}\                  " git status
set statusline+=%1*\ %<%F%m%r%h%w\                       " filepath, modified, ro, helpfile, preview
set statusline+=%3*│                                     " separator
set statusline+=%2*\%Y\                                  " filetype
set statusline+=%3*│                                     " separator
set statusline+=%2*\%{''.(&fenc!=''?&fenc:&enc).''}      " encoding
set statusline+=\ (%{&ff})                               " fileformat (dos/unix..)
set statusline+=%=                                       " right Side
set statusline+=%3*│                                     " separator
set statusline+=%1*\ %l/%L\                              " line number / total lines
set statusline+=%0*\ %{ModeCurrent()}\                   " current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4

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

" markdown
augroup vimrc-markdown
  autocmd!
  autocmd FileType markdown setlocal noexpandtab shiftwidth=4 tabstop=4 colorcolumn=79 nonumber
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
