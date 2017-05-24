"-------[ General Options ]----------------------------------------"{{{1

set nocompatible
"remove all autocommand
autocmd!  
set listchars=eol:¬,tab:┊\ 
set list
"backup and undos
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo 
set undofile
set undodir=$HOME/.vim/undos
set backup
set backupdir=$HOME/.vim/backups
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), "p")
endif

"set autochdir            " auto change to buffer's directory
syntax on 
syntax enable
set encoding=utf-8
"file encodings
set fileencodings=utf-8,iso-8859-1,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936 
" auto indent setting
set smartindent
set cindent
"set copyindent    " copy the previous indentation on autoindenting

" tab 4 characters
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set backspace option
set backspace=indent,eol,start
" have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open. 
set hidden

" set show matching parenthesis
set showmatch     

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase
set smartcase    

set mouse=a
set hlsearch
set incsearch
set linebreak " don't break word
set ruler  " ruler
set number  " show the line number
set display=lastline " show complete content, without @ 
"set ttimeoutlen=100
"set dictionary +=/usr/share/dict/cracklib-small "enable the dictionary

"filetype indent plugin on
"vertical split open new window on right
set splitright
set fillchars=diff:⣿,vert:║  "split and diff splitchar (old vert split char:│)
set concealcursor=nc "hide concealed chars in N & C mode
set synmaxcol=1000 "don't highlight line longer than 1000

"gvim settings
set guioptions-=m              " GUI: Disable Menu 
set guioptions-=r              " GUI: Disable right scrollbar
set guioptions-=T              " GUI: Disable Toolbar

"-------[ wildmenu settings ]----------------------------------------{{{1
set wildmenu
set wildmode=list:longest,longest:full,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

"java files
set wildignore+=classes
set wildignore+=target
set wildignore+=lib
"-------[ Tags ]----------------------------------------{{{1

" search tags file from opened file directory up to / (root)
set tags+=./tags;/,
"-------[ Folding Settings ]----------------------------------------{{{1
set foldmethod=marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

"autocmd FileType java set fdm=syntax
let g:xml_syntax_folding=1
autocmd FileType java,javascript,vim,xml,html,xhtml set fdm=syntax
"-------[ Auto-Completion Settings ]----------------------------------------{{{1
"leave autocompletion setting to neocomplete plugin

"increment completion (keep the options when typing)
set completeopt=longest,menuone
"inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
"inoremap <expr> <c-n> pumvisible() ? "\<c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
"inoremap <expr> <m-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""

"-------[ Abbreviation ]----------------------------------------{{{1
"
" Date time
iabbrev dt <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iabbrev dd <c-r>=strftime("%Y-%m-%d ")<cr>
iabbrev teh the
iabbrev appl application
iabbrev ky@ kent.yuan@gmail.com

"
"highlight groups
iabbrev imp! !Important!
iabbrev mk1 !MARK1
iabbrev mk2 !MARK2
iabbrev mk3 !MARK3

"-------[ key mappying ]----------------------------------------{{{1

" set mapleader
let mapleader        = ","
let g:mapleader      = ","
let maplocalleader   = ","
let g:maplocalleader = ","


"<F1> to check if the file was changed outside vim
nnoremap <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>
"reload current file
nnoremap <F5> :e!<cr>
"show/hide list
nnoremap <leader>l :set list!<cr>:IndentLinesToggle<cr>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Source
vnoremap <leader>so y:execute @@<cr>:echo 'selection Sourced .'<cr>
nnoremap <leader>so ^vg_y:execute @@<cr>:echo 'line Sourced.'<cr>

"insert mode <c-u> and <c-w> undoable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"fold mappings
"space to toggle fold
nnoremap <space> za
vnoremap <space> za
"close all folds and leave the current fold open
nnoremap <leader>zz zMzvzz

"clear hl search by pressing ,/
nnoremap <silent> <Leader>/  :noh<cr>
"Alt-j/k moving selected lines up and down only in visual mode
set timeout timeoutlen=1000 ttimeoutlen=0
"nmap <F14> :m+<CR>==
"nmap <F15> :m-2<CR>==
vnoremap <c-j> :m'>+<CR>gv=gv
vnoremap <c-k> :m-2<CR>gv=gv
"inoremap <F14> <Esc>:m+<CR>==gi
"inoremap <F15> <Esc>:m-2<CR>==gi
"reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

"quick Editing .vimrc
nnoremap <Leader>rc :vsplit $MYVIMRC<cr>
nnoremap <Leader>rt :vsplit $HOME/.tmux.conf<cr>
nnoremap <Leader>rz :vsplit $HOME/.zshrc<cr>

"easier copy paste to clipboard
vnoremap <C-C> "+y
nnoremap <Leader>p :silent set paste<cr>"+P:set nopaste<cr>

"format codes without changing screen
nnoremap <Leader>= moHmpgg=G`pzt`o

"move current line to top+5 line (zt +5) zl -> zt lower
nnoremap zl zt4<c-y>
"Fast saving
nnoremap <Leader>x :xa!<cr>
nnoremap <Leader>w :w!<cr>
nnoremap <Leader>su :w !sudo tee %>/dev/null <cr>

"add empty line above/below current line
nnoremap <leader>o mzo<ESC>`z
nnoremap <leader>O mzO<ESC>`z
" highlight/syntax info
nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> color:" 
		  \ . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")<CR>

"TODO map tc to show color
"tab new,close,move (commented out, because buffer is more conveniet)
"map <Leader>tn :tabnew<cr>
"map <Leader>tc :tabclose<cr>
"map <Leader>tm :tabmove
"map <Leader>te :tabedit

"Switch to current dir
nnoremap <Leader>cd :cd %:p:h<cr>
" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"c-a in command line move to the BOL:
cnoremap <C-A> <Home>

"quick visual select whole buffer (comment out, since ggVG not hard either)
"nnoremap vaa ggVG

" moving cursor out of (right of ) autoClosed brackets
inoremap <c-l> <esc>%%a
"-------[ Plugins / Bundles ]----------------------------------------{{{1

filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#begin()

" color schemes
Plugin 'gmarik/vundle'

Plugin 'fugalh/desert.vim'
Plugin 'vim-scripts/desert256.vim'
Plugin 'sk1418/last256'
Plugin 'altercation/vim-colors-solarized'
Plugin 'L9'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'othree/xml.vim'
Plugin 'vim-scripts/Align'
"Plugin 'Townk/vim-autoclose'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/cecutil'
Plugin 'vim-scripts/DrawIt'
Plugin 'mbbill/fencview'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'


"dependencies for snipmate
"Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/FuzzyFinder'
Plugin 'Lokaltog/vim-easymotion'
"
"Plugin 'Mark%1238'
Plugin 'vim-scripts/ShowMarks'
"Plugin 'vim-scripts/Conque-Shell'
Plugin 'kana/vim-scratch'
Plugin 'vim-scripts/fcitx.vim'

Plugin 'mattn/calendar-vim'
Plugin 'vim-scripts/vimwiki'

"Plugin 'lilydjwg/colorizer'
"Plugin 'vim-scripts/lilypink'
Plugin 'scrooloose/syntastic'
"Plugin 'kien/ctrlp.vim'
Plugin 'tommcdo/vim-exchange'

Plugin 'Yggdroot/indentLine'
Plugin 'sk1418/DirDiff.vim'
Plugin 'sk1418/QFGrep'
Plugin 'sk1418/HowMuch'
Plugin 'sk1418/Join'
Plugin 'sk1418/blockit'
Plugin 'bootleq/vim-cycle'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'dbakker/vim-projectroot'

call vundle#end()
filetype plugin indent on  

"-------[ plugin mappings/settings ]-------------------------------------{{{1

"-----------[ syntastic plugin ]------------{{{2
"syntastic is nice, but not for java
let g:syntastic_ignore_files = ['\.java$']
"-----------[ vim-cycle plugin ]------------{{{2
let g:cycle_default_groups = [
			\   [['true', 'false']],
			\   [['yes', 'no']],
			\   [['on', 'off']],
			\   [['and', 'or']],
			\   [['+', '-']],
			\   [['>', '<']],
			\   [['"', "'"]],
			\   [['==', '!=']],
			\   [['0', '1']],
			\   [['是', '否']],
			\   [["in", "out"]],
			\   [["min", "max"]],
			\   [["get", "post"]],
			\   [["to", "from"]],
			\   [["read", "write"]],
			\   [["only", "except"]],
			\   [['with', 'without']],
			\   [["exclude", "include"]],
			\   [["asc", "desc"]],
			\   [['{:}', '[:]', '(:)'], 'sub_pairs'],
			\   [['(:)', '「:」', '『:』'], 'sub_pairs'],
			\   [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
			\     'Friday', 'Saturday'], 'hard_case', {'name': 'Days'}],
			\ ]

"-----------[ Scratch.vim ]------------{{{2
nmap <F3> :ScratchOpen<cr>

"-----------[ TagBar plugin ]------------{{{2

nmap <F4> :TagbarToggle<CR>

" tagbar supports for vimwiki & markdown
" vimwiki
let g:tagbar_type_vimwiki = { 'ctagstype' : 'vimwiki', 'kinds'     : [ 'h:header', ], 'sort'    : 0 }
" markdown
"let g:tagbar_type_md = { 'ctagstype' : 'markdown', 'kinds' : [ 'h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3' ] } 
let g:tagbar_type_markdown = { 'ctagstype' : 'markdown', 'kinds' : ['h:headings',], 'sort' :0 } 


"-----------[ MRU plugin      ]------------{{{2
" MRU plugin still here, since not yet get used to ctrlP 
"let MRU_Max_Entries=49
"nnoremap <Leader>fr :MRU<cr>

"-----------[ NERDTree plugin      ]------------{{{2
"open current file in NERDTree
nnoremap <silent> <Leader>n :NERDTree<CR><C-w>p:NERDTreeFind<CR>

"toggle nerdtree
nnoremap <F2> :NERDTreeToggle<cr>


"-----------[ AutoClose plugin     ]------------{{{2
"nnoremap <Leader>ac :AutoCloseToggle<CR>
"" with this variable true(default), <space> was imapped. it disables abbrevation 
"let g:AutoCloseExpandSpace = 0
""disable autoclose handle popup menu
"let g:AutoClosePumvisible ={"ESC":"\<ESC>"}

"-----------[ Gundo plugin      ]------------{{{2
nnoremap <Leader>u :GundoToggle<CR>


"-----------[ Unite plugin     ]------------{{{2
call unite#custom#profile('default', 'context', {
\   'prompt': '>>>',
\   'start_insert': 1,
\   'winheight': 20,
\   'direction': 'botright'
\ })
call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file_rec', 'ignore_globs', split(&wildignore, ','))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
autocmd FileType unite call s:unite_my_setting()
function! s:unite_my_setting() 
	nmap <buffer> <ESC> <Plug>(unite_exit)
	nmap <buffer> <c-c> <Plug>(unite_exit)
	imap <buffer> <c-c> <Plug>(unite_exit)
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
	imap <buffer> <C-n>   <Plug>(unite_rotate_next_source)
	imap <buffer> <C-b>   <Plug>(unite_rotate_previous_source)

	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

nnoremap <c-p> :<c-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <Leader>fb :<c-u>Unite buffer<CR>
nnoremap <Leader>fr :<c-u>Unite file_mru<CR>
nnoremap <Leader>fo :<c-u>Unite outline<CR>
nnoremap <Leader>fa :<c-u>Unite -start-insert file_rec/async:! buffer file_mru outline<CR>

"-----------[ CtrlP plugin     ]------------{{{2

"let g:ctrlp_max_height = 20
"let g:ctrlp_mruf_max =140 
"let g:ctrlp_custom_ignore = {
			"\ 'dir':  '\v[\/]\.(git|svn|hg)$',
			"\ 'file': '\v\.(zip|gz|pdf|exe|so|dat|class|pyc|jar|swpr|png|jpg|gif)$'
			"\ }

"nnoremap <Leader>fb :CtrlPBuffer<cr>
"nnoremap <Leader>ft :CtrlPTag<cr>
"nnoremap <Leader>fr :CtrlPMRU<cr>

"-----------[ neocomplete   ]------------{{{2

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#disable_auto_complete=0

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-j>     neocomplete#complete_common_string()

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_prefetch = 0
" disable text mode completely
let g:neocomplete#text_mode_filetypes = {}
let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'

" Close popup and back to INSERT by <ctrl-k>.
inoremap <expr><c-k> pumvisible() ? neocomplete#close_popup() : "\<c-k>"


"-----------[ neosnippet   ]------------{{{2

if has('conceal')
	"set conceallevel=2 concealcursor=i
endif

"=======================================================
"the following two variables are for using vim-snippets
"commented out because now using the default neosnippet-snippets
"=======================================================
" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

autocmd Filetype *
			\ if &omnifunc == "" |
			\   setlocal omnifunc=syntaxcomplete#Complete |
			\ endif


"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"

imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

imap <expr><cr> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<c-y>" : "\<cr>"




"-----------[ EasyMotion   ]------------{{{2
hi EasyMotionTarget ctermbg=none ctermfg=red guifg=red
hi EasyMotionShade  ctermbg=none ctermfg=gray guifg=grey

"-----------[ vimwiki      ]------------{{{2
" ctrl-space trigger IM, so <leader>space check todo list
nmap <Leader><space> <Plug>VimwikiToggleListItem
"reset wiki code block highlights
hi link VimwikiCode String
hi link VimwikiCodeT String
hi link VimwikiPre String
hi link VimwikiPreT String

let g:vimwiki_list = [{'path': '~/vimwiki/',
			\ 'path_html'        : '$HOME/MyStuff/myCodes/wikipages/',
			\ 'template_path'    : '$HOME/MyStuff/myCodes/vim/wiki_template',
			\ 'template_default' : 'default',
			\ 'template_ext'     : '.tpl',
			\ 'css_name'         : 'template/style/main.css'}]
" \ 'syntax': 'markdown', 'ext':'.md',

"the line below lets vimwiki don't overwrite ft option
"let g:vimwiki_ext2syntax={}

augroup ft_vimwiki
	autocmd!
	autocmd Filetype vimwiki  iabbrev  jcode {{{class="brush: java"
	autocmd Filetype vimwiki  iabbrev  bcode {{{class="brush: bash"
	autocmd Filetype vimwiki  iabbrev  vcode {{{class="brush: vim"
augroup END

"-------[ cursor shape ]--{{{1
"From urxvt man page:
"Ps = 0   Blink Block
"Ps = 1   Blink Block
"Ps = 2   Steady Block
"Ps = 3   Blink Underline
"Ps = 4   Steady Underline
"Ps = 5   Blink Bar (XTerm)
"Ps = 6   Steady Bar (XTerm)

if exists('$TMUX')
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
	let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
	let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
	autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
elseif $COLORTERM !~ '^xfce4' 
	"if it is xfce4-terminal don't change cursor. 
	"or we have to sed -i the terminalrc every time entering/leaving insert
	" still there is problem, if in xfce4-terminal attach a tmux session created
	" in urxvt, the $COLORTERM will be rxvt
	let &t_SI .="\<Esc>[5 q"
	let &t_EI .="\<Esc>[2 q"
	autocmd VimLeave * silent !echo -ne "\033[2 q"
endif
"here set the cursor shape only for urxvt terminal. for more info man 7
"urxvt then search Cursor Style
"-------[ color scheme ]--{{{1

set background=dark
if $DISPLAY == ""
	colorscheme desert
else
	set t_Co=256
	colorscheme last256

	" below are solarized settings
	"let g:solarized_termcolors = 256
	"let g:solarized_termtrans = 1
	"colorscheme solarized
endif
set gfn=Monaco\ 12
"set gfn=Inconsolata-g\ 12
set gfw=WenQuanYi\ Micro\ Hei\ 12
"-------[ Status bar ]------------------------------------❱----{{{1

set statusline =%7*[%n]%*
set statusline +=%1*%F\ %*%8*%m%r%*%1*%h%w%* "filename
set statusline +=%7*\|%*
set statusline+=%2*\ %Y: "filetype
set statusline+=%{&ff}:  "dos/unix
set statusline+=%{&fenc!=''?&fenc:&enc}\ %* "encoding

"fugitve branch
set statusline +=%8*%{fugitive#head()!=''?'['.fugitive#head().']':''}%2*\ 

set statusline +=%7*\|%*
set statusline+=%2*\ ASCII:%b\ %*  " ascii 
set statusline +=%7*\|%*
set statusline+=%2*\ row:%l/%*%1*%L%*%2*\ %*%1*%p%%%*%2*\ \ col:%v\ %*
set statusline +=%7*\|%*

"color in terminal
hi User1 cterm=bold ctermfg=black ctermbg=67
hi User2 ctermfg=black ctermbg=246
hi User7 cterm=bold ctermfg=245 ctermbg=237
hi User8 ctermfg=black ctermbg=167

"color in gvim
hi User1  gui=bold guifg=#000000 guibg=#5B89C7
hi User2  guifg=#000000 guibg=#949494
hi User7  gui=bold guifg=#8a8a8a guibg=#3a3a3a
hi User8  guifg=#000000 guibg=#d75f5f
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}G\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

"set cursor line color
set cul "highlighting cusor line
"-------[ plugins need color settings ]-------------------------------------{{{1

"===========================================================================
" Ag (silver searcher)
"===========================================================================
command! AGG exe 'Ag -Q ' . expand('<cword>')

"===========================================================================
" showmarks
"===========================================================================
let showmarks_enable=0
"lower case marker hl
hi ShowMarksHLl ctermfg=16 ctermbg=107 cterm=bold guifg=blue guibg=lightblue gui=bold
"upper case marker hl
hi ShowMarksHLu ctermfg=16 ctermbg=107 cterm=bold guifg=blue guibg=lightblue gui=bold
"other marker hl
hi ShowMarksHLo ctermfg=16 ctermbg=107 cterm=bold guifg=blue guibg=lightblue gui=bold
"when multi markers on sameline
"hi ShowMarksHLm ctermfg=black ctermbg=green cterm=bold guifg=blue guibg=lightblue gui=bold
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Hilight lower & upper marks
"let showmarks_hlline_lower = 0
"let showmarks_hlline_upper = 0

"===========================================================================
" IndentLine settings
"===========================================================================
let g:indentLine_char='┊'
let g:indentLine_color_term='darkgray'
let g:indentLine_color_gui='darkgray'
"don't let indentLine change the concealCursor option
let g:indentLine_noConcealCursor='true'
let g:indentLine_fileTypeExclude=['help']
"nnoremap <Leader>in = :IndentLinesToggle<cr>

"-------[ Functions ]-------------------------------------{{{1

"do chmod +x if the first line of the buffer beginning with #!
"this would be called on autocmd event BufWritePost
function! AutoCmd_chmodx()
	if getline(1) =~ '#!'
		let f = shellescape(@%,1)
		if stridx(getfperm(f), 'x') != 2
			call system("chmod +x ".f)
			e!
			filetype detect
		endif
	endif
endfunction

" function for autocmd python filetype
fun! AutoCmd_python()
	setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
	nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
	" code
endf
"---------------------------------------------------------
" center non empty text between spaces
" (To describe the function is really a test of my english)
" starting border : the ending of the first group of non-empty chars
" ending border   : the starting of the last group of non-empty chars

" do centering between the two border
" 
" e.g. (^ is beginning of line, $ is eol) 'x' is centered.

" ^    sss              x eee     $

" will changed into:

" ^    sss       x        eee     $
"---------------------------------------------------------
fun! CenterInSpaces()
	let l = getline('.')
	let lre = '\v^\s*\S+\zs\s*\ze'
	let rre = '\v\zs\s*\ze\S+\s*$'
	let sp= matchstr(l,lre)
	let sp = sp.matchstr(l,rre)
	let ln=len(sp)
	let l = substitute(l,lre,sp[:ln/2-1],'')
	let l = substitute(l,rre,sp[ln/2:],'')
	call setline('.',l)
endf
nnoremap <silent> <Leader>ms :call CenterInSpaces()<cr>


"---------------------------------------------------------
"make * and # work for visual selection
"direction parameter is either '/' or '?'
"---------------------------------------------------------
function! VwordSearch(direction)
  let temp = @v
  normal! gv"vy
	let v = @v
  let @v = temp
  let @/ = '\V' . substitute(escape(v, a:direction.'\'), '\n', '\\n', 'g')
endfunction
xnoremap * :<C-u>call VwordSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VwordSearch('?')<CR>?<C-R>=@/<CR><CR>

"---------------------------------------------------------
"toggle relativeline number
"---------------------------------------------------------
function! ToggleRelativeNumber()
	let &relativenumber = &relativenumber?0:1
	"let &number = &relativenumber? 0:1
endfunction
"map <leader> rn to the function
nnoremap <silent> <Leader>nu :call ToggleRelativeNumber()<cr>


function! ToggleVirtualEdit()
	if &ve == 'all'
		echo 'Virtual Edit was disabled'
		let &ve=''
	else
		echo 'Virtual Edit was set with "all"'
		let &ve='all'
	endif
endfunction
nnoremap <silent> <Leader>ve :call ToggleVirtualEdit()<cr>

function! ToggleSpell()
	let &spell=&spell?0:1
endfunction
nnoremap <silent> <Leader>sp :call ToggleSpell()<CR>

"idea taken from sjl's Interestingwords
" add <leader>1-6 toggle the highlighting
" and <leader>0 to clear all

"---------------------------------------------------------
" quick open diary file
" The file location: g:diary_dir/$year/YYYYMM.g:diary_ft
" E.g. /home/kent/diary/2015/201501.md
" one month one file. default extention:md (markdown)
"---------------------------------------------------------
" set default variables
let g:diary_dir= '$HOME/MyStuff/myDiary'
let g:diary_ft = 'md'
function! OpenDiaryFile()
	let year = strftime("%Y")
	let month = printf("%02d", strftime("%m"))
	let path = g:diary_dir . '/' . year
	if !isdirectory(path)
		if Mkdir(path)!=0
			return
		endif
	endif
	let diary_file = path . '/' . year . month . '.' . g:diary_ft
	exec 'vsplit + ' . diary_file
endfunction

"create directory on *nix box
function! Mkdir(dir)
	call system("mkdir -p " . a:dir)
	let rc = v:shell_error
	if rc != 0
		call confirm("can't create directory : " . a:dir, "&OK")
	endif
	return rc
endfunc
nnoremap <silent> <F6> :call OpenDiaryFile()<cr>


"------------------------------------------------------------
" update ctags under the project root
"------------------------------------------------------------
function! UpdateTags()
	let tag_file=ProjectRootGuess().'/tags'
	if filereadable(tag_file) 
		call system('ctags -a -o "'. tag_file .'" '.expand('%:p'))
	else
		call system('ctags -R -o "'. tag_file .'" '.expand('%:p:h').'/.')
	endif
endfunction

function! HiInterestingWord(n) " {{{2
	" Save our location.
	normal! mz
	" Yank the current word into the z register.
	normal! "zyiw
	" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
	let mid = 77750 + a:n
	" Clear existing matches, but don't worry if they don't exist.
	"silent! call matchdelete(mid)
	try
		call matchdelete(mid)
	catch 'E803'
		" Construct a literal pattern that has to match at boundaries.
		let pat = '\V\<' . escape(@z, '\') . '\>'
		" Actually match the words.
		call matchadd("InterestingWord" . a:n, pat, 1, mid)
	endtry
	" Move back to our original location.
	normal! `z
endfunction 

"clear all highlighting
function! ClearAllHi()
	for i in range(1,6)
		let mid = 77750 + i
		silent! call matchdelete(mid)
	endfor
endfunction

nnoremap <silent> <leader>0 :call ClearAllHi()<cr>
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

"---------------------------------------------------------
" color test functions
"
" Then enter one of following commands:
"   :VimColorTest    "(for console/terminal Vim)
"   :GvimColorTest   "(for GUI gvim)
"  source http://vim.wikia.com/wiki/View_all_colors_available_to_gvim
"---------------------------------------------------------
"
function! VimColorTest(outfile, fgend, bgend)
	let result = []
	for fg in range(a:fgend)
		for bg in range(a:bgend)
			let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
			let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
			let s = printf('syn keyword %s %s', kw, kw)
			call add(result, printf('%-32s | %s', h, s))
		endfor
	endfor
	call writefile(result, a:outfile)
	execute 'edit '.a:outfile
	source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('/tmp/vim-color-test.tmp', 1, 256)

function! GvimColorTest(outfile)
	let result = []
	for red in range(0, 255, 16)
		for green in range(0, 255, 16)
			for blue in range(0, 255, 16)
				let kw = printf('%-13s', printf('c_%d_%d_%d', red, green, blue))
				let fg = printf('#%02x%02x%02x', red, green, blue)
				let bg = '#fafafa'
				let h = printf('hi %s guifg=%s guibg=%s', kw, fg, bg)
				let s = printf('syn keyword %s %s', kw, kw)
				call add(result, printf('%s | %s', h, s))
			endfor
		endfor
	endfor
	call writefile(result, a:outfile)
	execute 'edit '.a:outfile
	source %
endfunction
command! GvimColorTest call GvimColorTest('/tmp/gvim-color-test.tmp')


"---------------------------------------------------------
"search vimwiki articles
"---------------------------------------------------------

"predefined hi-group for the prompt
let g:wikiDir='~/vimwiki/'
let search_hi='ctermbg=113 ctermfg=16 guibg=#87d75f guifg=black'
execute 'hi promptHL '. search_hi
function! SearchWiki()
	call inputsave()
	echohl promptHL
	let pat = input('Search wiki :')
	echohl None
	call inputrestore()
	execute 'silent! Ack! -i "' . pat . '" ' . g:wikiDir . '**/*.wiki'
endfunction
nnoremap <leader><leader>s :call SearchWiki()<cr>


" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
	" Save the cursor position and turn on diff for all windows
	let l:save_cursor = getpos('.')
	windo :diffthis
	" Turn off diff for the specified window (but keep scrollbind) and move
	" the cursor to the left-most diff window
	exe a:window . "wincmd w"
	diffoff
	set scrollbind
	set cursorbind
	exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
	" Update the diff and restore the cursor position
	diffupdate
	call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>

"-------[ Command ]-------------------------------------{{{1
"delete current file
command! Delete if delete(expand('%')) |echohl WarningMsg | echo 'deleting file failed' |echohl None | endif

"find matched count 
command! -range=% -nargs=1 Count <line1>,<line2>s/<args>//gn|nohls

"-------[ AutoCmd ]------------------------------------- {{{1
"add chmod+x if a shbang was found
autocmd BufWritePost * call AutoCmd_chmodx()
"resize split when vim-window was resize
autocmd VimResized * :wincmd =


augroup file_types
	au!
	"python
	autocmd FileType python call AutoCmd_python()

	"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

	"Help in vertical split (right)
	autocmd FileType help  wincmd L|setlocal nolist

	"Java
	autocmd FileType java set tags+=$HOME/.jdkTags
	autocmd FileType java hi link javaDocComment String
augroup END

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
	autocmd!
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\     execute 'normal! g`"zvzz' |
				\ endif
augroup END
autocmd bufwritepost .vimrc source $MYVIMRC

" autocmd for fugitive plugin
augroup fugitive
	autocmd!
	autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
	autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" autocmd for python project to update tags
autocmd BufWritePost *.py call UpdateTags()

"-------[ Machine Specific stuff ]------------------------------------- {{{1
"quick open  my timesheet
nnoremap <leader>rh :vs /home/kent/Desktop/Projects/mje/ts.csv<cr>
"
" vim: fdm=marker ts=2 sw=2
