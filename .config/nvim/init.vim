"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("nvim")
  call plug#begin('~/.vim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'rbgrouleff/bclose.vim'
else
  call plug#begin('~/.config/nvim/plugged')
endif

" THEMES
Plug 'DemonCloud/J'
Plug 'devnul1/heman'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'beigebrucewayne/skull-vim'
Plug 'morhetz/gruvbox'

Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dmdque/solidity.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'chiel92/vim-autoformat'
Plug 'ervandew/ag'
Plug 'ervandew/supertab'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf'
Plug 'lilydjwg/colorizer'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "must be last

call plug#end()

if !exists("g:syntax_on")
  syntax enable
endif

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeIgnore=['\.pyc']
let NERDTreeHijackNetrw =0

let g:livedown_port = 1337
let g:livedown_browser = 'safari'

let g:NERDTreeLimitedSyntax = 1
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:autoformat_verbosemode=1
let g:ctrlp_working_path_mode = 0
let g:deoplete#enable_at_startup = 1
let g:indentLine_fileTypeExclude = ['json', 'md', 'markdown']
let g:indentLine_setConceal = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog  = '/usr/local/bin/python2'
let g:seoul256_background = 235
let g:user_emmet_leader_key='<C-M>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set complete+=kspell
set cursorline    "highlight current line
set encoding=utf-8
set expandtab
set formatoptions=qrn1
set hidden
set ignorecase
set incsearch   "search as characters are entered
set laststatus=2
set lazyredraw    "redraw only when we need to
set linebreak
set listchars=tab:▸\ ,eol:¬,space:·,extends:»,precedes:«,trail:•,nbsp:+
set modelines=0
set mouse=a
set nocompatible
set noerrorbells
set noexpandtab
set nohlsearch
set number    "show line numbers
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd   "show command in bottom bar
set showmatch   " highlight matching [{()}]}]
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
"set textwidth=79
set title
set ttyfast
set undofile
set visualbell
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/coverage/*,*/node_modules/*,*/vendor/*
set wildmenu    "visual autocomplete for command menu
set wildmode=list:longest
set wrap linebreak nolist

setlocal spell spelllang=en_us
set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colo seoul256
"colorscheme J
"colorscheme dracula
colorscheme gruvbox
"colorscheme heman
"colorscheme skull

highlight NonText guifg=#1a4a59   "Invisible character colors
highlight SpecialKey guifg=#4a4a59
highlight Comment cterm=italic

highlight i cterm=italic
highlight b cterm=bold
call matchadd('b', '\*\*.\{-}\*\*')
call matchadd('i', '__.\{-}__')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
map <silent> <LocalLeader>t :NERDTreeToggle<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"vim tab navigation
nnoremap th :tabnext<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

"easier vim splits C-w j => c-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

"auto format ie beautify
noremap <C-f> :Autoformat<CR>

" start markdown preview
nmap <leader>p :LivedownToggle<CR>

"faster system copy
vnoremap <C-c> "+y

"faster system cut
vnoremap <C-x> "+d

function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
  retab!
endfunction

nmap <leader>e :call TabToggle()<CR>

"this lets you type CTRL-C to add a newline between brackets
imap <C-c> <CR><Esc>O

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[s          moves to the last spelling mistake
"z=          see spelling suggestions
