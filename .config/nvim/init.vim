"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:polyglot_disabled = []
let g:polyglot_is_disabled = 0

call pathogen#infect()

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
Plug 'beigebrucewayne/skull-vim'
Plug 'dracula/vim'
"Plug 'flazz/vim-colorschemes'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes' "https://vimawesome.com/plugin/awesome-vim-colorschemes
Plug 'sainnhe/vim-color-forest-night'
"Plug 'devnul1/heman'

Plug 'Raimondi/delimitMate' "provides automatic closing of quotes, parenthesis, brackets, etc
"Plug 'bling/vim-airline'
Plug 'chaoren/vim-wordmotion'
Plug 'chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/ag'
Plug 'ervandew/supertab'
Plug 'joereynolds/sqhell.vim'
Plug 'lilydjwg/colorizer' "colors hex values
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim' "emmet
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-test/vim-test'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons' "must be last

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

let g:typescript_indent_disable = 1
let g:NERDTreeLimitedSyntax = 1
let g:SuperTabDefaultCompletionType = '<c-n>'
"let g:airline#extensions#ale#enabled = 1
"let g:airline_powerline_fonts = 1

let g:ale_python_flake8_options = '--config ~/.config/nvim/plugin/flake8.cfg'
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8'], 'typescript': ['eslint', 'tsserver', 'typecheck'], 'haskell': ['cabal_ghc', 'cspell', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'hls', 'stack_build', 'stack_ghc'] }
"'ghc', removed linter b/c it was freaking about about not finding imports
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:autoformat_verbosemode=1
let g:deoplete#enable_at_startup = 1
let g:indentLine_fileTypeExclude = ['json', 'md', 'markdown']
let g:indentLine_setConceal = 0
let g:python3_host_prog='/usr/local/bin/python3'
"let g:python3_host_prog = '/usr/local/var/pyenv/versions/3.6.4/bin/python3'
"let g:python_host_prog = '/usr/local/var/pyenv/versions/2.7.8/bin/python'
"let g:ycm_server_python_interpreter = '/usr/local/var/pyenv/versions/2.7/bin/python'
let g:seoul256_background = 235
"let g:user_emmet_leader_key='<C-M>'

nmap <silent> t<C-f> :TestFile<CR>
"let test#strategy = "vimterminal"
let test#enabled_runners = ["elixir#exunit"]
let g:test#runner_commands = ["ExUnit"]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
set backspace=indent,eol,start
set colorcolumn=80,120
set complete+=kspell
set cursorline    "highlight current line
set encoding=utf-8
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
set number    "show line numbers
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd   "show command in bottom bar
set showmatch   " highlight matching [{()}]}]
set smartcase
"set textwidth=79
set title
set ttyfast
set undofile
set visualbell
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/coverage/*,*/node_modules/*,*/vendor/*
set wildmenu    "visual autocomplete for command menu
set wildmode=list:longest
set wrap linebreak nolist

set autoindent
"set smartindent "leave turned off - messes with autocmd
set softtabstop=0
set tabstop=4
set shiftwidth=4
set expandtab

setlocal spell spelllang=en_us
set list

"autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Favorite Colorschemes (Ranked order)
colorscheme everforest "forest-night
"colorscheme gruvbox
"colo seoul256
"colorscheme snow
"colorscheme dracula

highlight NonText guifg=#1a4a59   "Invisible character colors
highlight SpecialKey guifg=#4a4a59
highlight Comment cterm=italic

highlight i cterm=italic
highlight b cterm=bold
highlight MatchParen cterm=bold ctermbg=white ctermfg=black

call matchadd('b', '\*.\{-}\*')
call matchadd('i', '_.\{-}_')

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

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
"faster system copy
vnoremap <C-c> "+y
"faster system cut
vnoremap <C-x> "+d

nmap <leader>s :set spell!<CR>

"auto format ie beautify
noremap <C-b> :Autoformat<CR>

" start markdown preview
nmap <leader>p :LivedownToggle<CR>

"ab ip import ipdb; ipdb.set_trace()
"ab pu import pudb; pu.db
ab ep require IEx; IEx.pry

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

"highlight Normal ctermfg=white ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[s          moves to the last spelling mistake
"z=          see spelling suggestions
