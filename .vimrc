" Plugins will be downloaded under the specified directory.
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

" CONFIG STUFF HERE

if !exists("g:syntax_on")
    syntax enable
endif

let g:ale_linters = {'javascript': ['eslint']}

filetype plugin indent on
let NERDTreeShowHidden=1

set mouse=a
set incsearch
"set hlsearch
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,*/coverage/*,*/node_modules/*,*/vendor/*
set listchars=tab:>-     " > is shown at the beginning, - throughout

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" NERDTree
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo', 'code', 'coverage', 'node_modules', 'tmp']
let NERDTreeHijackNetrw = 0
map <silent> <LocalLeader>t :NERDTreeToggle<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for hbs
autocmd FileType hbs noremap <buffer> <
" for css or scss
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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>

setlocal spell spelllang=en_us
set complete+=kspell
nmap <leader>s :set spell!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,space:·
set list

set number

" Use spaces
"set expandtab
" Use 2 characters per indent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent


set noexpandtab
function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
	retab!
endfunction

nmap <leader>e :execute TabToggle()<CR>

let g:user_emmet_leader_key='<C-M>'

imap <C-c> <CR><Esc>O

