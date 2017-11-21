" Plugins will be downloaded under the secified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'Raimondi/delimitMate'
Plug 'beautify-web/js-beautify'
Plug 'chrisbra/colorizer'
Plug 'ervandew/ag'
Plug 'junegunn/fzf'
Plug 'junegunn/seoul256.vim'
Plug 'kien/ctrlp.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

if !exists("g:syntax_on")
	syntax enable
endif

filetype plugin indent on

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo', 'code', 'coverage', 'node_modules', 'tmp']
let NERDTreeHijackNetrw = 0
let g:user_emmet_leader_key='<C-M>'
let g:ale_linters = {'javascript': ['eslint']}

set autoindent
set background=dark
set backspace=indent,eol,start
set complete+=kspell
set cursorline		"highlight current line
set encoding=utf-8
set expandtab
set formatoptions=qrn1
set gdefault
set hidden
set ignorecase
set incsearch		"search as characters are entered
set laststatus=2
set lazyredraw		"redraw only when we need to
set linebreak
set list
set listchars=tab:▸\ ,eol:¬,space:·
set modelines=0
set mouse=a
set nocompatible
set noerrorbells
set noexpandtab
set nohlsearch
set number		"show line numbers
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd		"show command in bottom bar
set showmatch		" highlight matching [{()}]}]
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set textwidth=79
set title
set ttyfast
set undofile
set visualbell
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/coverage/*,*/node_modules/*,*/vendor/*
set wildmenu		"visual autocomplete for command menu
set wildmode=list:longest
set wrap
setlocal spell spelllang=en_us
"Invisible character colors
highlight NonText guifg=#1a4a59
highlight SpecialKey guifg=#4a4a59

" NERDTree
map <silent> <LocalLeader>t :NERDTreeToggle<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

".vimrc
autocmd FileType javascript noremap <buffer>	<c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType hbs noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Fast saving
nmap <leader>w :w!<cr>
" Fast quitting
nmap <leader>q :q<cr>
" Fast save + quit
nmap <leader>wq :wqa!<cr>
" Alt Fast save + quit
nmap <leader>x :x<cr>
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>

nmap <leader>s :set spell!<CR>

function TabToggle()
	if &expandtab
		set noexpandtab
	else
		set expandtab
	endif
	retab!
endfunction

nmap <leader>e :execute TabToggle()<CR>
imap <C-c> <CR><Esc>O

