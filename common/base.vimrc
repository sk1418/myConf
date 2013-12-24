"this is the very simple vim initialization script, 
"used for plugin testing, or resolving/locating problems
autocmd!
set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming
 
set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column
 
set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present
set splitright
 
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
 
set backspace=indent,eol,start  " make that backspace key work the way it should
 
syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type
 

"mappings

" set mapleader
let mapleader        = ","
let g:mapleader      = ","
let maplocalleader   = ","
let g:maplocalleader = ","


nnoremap j gj
nnoremap k gk
"switch to normal mode
inoremap jk <esc>l
inoremap kj <esc>l
inoremap jj <esc>l

"insert mode <c-u> and <c-w> undoable 
inoremap <c-u> <c-g>u<c-u> 
inoremap <c-w> <c-g>u<c-w> 

"clear hl search by pressing ,/
nnoremap <silent> <Leader>/  :noh<cr>
        
"easy Edit .vimrc
nnoremap <Leader>rc :vsplit $HOME/base.vimrc<cr>

"Fast saving
nnoremap <Leader>x :xa!<cr>
nnoremap <Leader>w :w!<cr>
"save as root
nnoremap <Leader>su :w !sudo tee %>/dev/null <cr>


"Switch to current dir
nnoremap <Leader>cd :cd %:p:h<cr>

" Easy window jnavigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"====================
"Help in vertical split (right)
"====================
autocmd FileType help wincmd L

"audo load .vimrc
if has("autocmd")
    autocmd bufwritepost .vimrc source $HOME/base.vimrc
endif
