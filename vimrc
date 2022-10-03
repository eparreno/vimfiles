" vimrc
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles

set nocompatible      " use Vim settings, rather than Vi settings


" Plugins (vim-plug) https://github.com/junegunn/vim-plug

" Automatic installation.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('vim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'Townk/vim-autoclose'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ervandew/supertab'
Plug 'elixir-lang/vim-elixir'
Plug 'ton/vim-bufsurf'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'slim-template/vim-slim'

let g:AutoClosePairs_add = "|"

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ },
      \ 'active': {
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ }
      \}

Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1

Plug 'ngmy/vim-rubocop'
let g:vimrubocop_config = '.rubocop.yml'

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = -1 " open in new buffer

Plug 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
" let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map={ 'mode': 'active','active_filetypes': [],'passive_filetypes': ['html', 'cucumber', 'scss'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['flake8']

" End of Plugins

" Config ------------------------------
set encoding=utf-8              " utf-8 encoding
set ruler                       " show cursor position in the statusbar
set number                      " show line numbers
set noshowmode                  " do not show the current mode of the editor
set showcmd                     " display incomplete commands
set cursorline                  " show cursorline
set autoread                    " auto-reload buffers when file changed on disk
set hidden                      " switch between buffers without saving them
set visualbell                  " no sounds
set backspace=indent,eol,start  " make backspace work as expected
set clipboard=unnamed           " use system clipboard
set re=1                        " use old regex engine http://goo.gl/ql7BtI
set colorcolumn=80              " vertical ruler

" Backup & swap
set nobackup
set nowritebackup
set noswapfile

" Whitespace stuff
set expandtab                   " use spaces, not tabs
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set nowrap                      " disable text wrapping
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Tab completion
set wildmenu                    " better file/command completion
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.png,*.jpg,*.gif,tags
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**
set wildignore+=log/**,tmp/**,*.scssc,*.sassc,*sass-cache*,coverage/**

" Splitting
set splitright              " put new vertical windows right of the current one
set splitbelow              " put new horizontal windows below of the current one

" Search
set hlsearch                " highlight matches
set ignorecase              " searches are case insensitive...
set smartcase               " ... unless they contain at least one capital letter
set gdefault                " /g flag on :s substitutions by default

" Look & Feel
set t_Co=256                " use 256 colors terminal
set background=dark 		    " dark background
set ttyfast                 " fast terminal connection
set scrolloff=5             " min. number of screen lines above and below the cursor.
set laststatus=2            " show status line
syntax enable 			        " enable syntax highlight
colorscheme softdark

set pastetoggle=<F2>        " toggle paste  mode

set tags=.tags,tags

" Folding
" setl foldmethod=indent

" Mappings ----------------------------
map <space> <leader>

" Use ; for commands
nnoremap ; :
" Go to beginning of line
nnoremap H ^
" Go to end of line
nnoremap L $
" Go to beginning of line
vnoremap H ^
" Go to end of line
vnoremap L $

inoremap jj <Esc>     " Map jj to ESC
inoremap kk <Esc>     " Map kk to ESC

map Y y$              " act like D and C, i.e. to yank until EOL
noremap Q gq          " dont use Ex mode, use Q for formatting

nnoremap ! :!

" Disable arrow keys in normal mode
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Resize using arrow keys
noremap <up>    <C-W>-
noremap <down>  <C-W>+
noremap <left>  5<C-W>>
noremap <right> 5<C-W><

" Improve window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" Comment a line/block
map <leader>c gcc<CR>

" Appends an edit command with the path of the currently edited file filled in
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Clear search highlight hitting space twice
nmap <silent> <space><space> :noh<CR>

nmap <leader>w :w<CR>       " Save
nmap <leader>q :q<CR>       " Quit
nmap <leader>v :vsp<SPACE>  " New vertical window
nmap <leader>s :sp<SPACE>   " New horizontal window
nmap <silent> <Tab> :BufSurfBack<CR> " Previous buffer
nmap <silent> <S-Tab> :BufSurfForward<CR> " Next buffer
nmap <C-c> :bnext\|bdelete #<CR>

nmap <leader>0 :NERDTreeToggle<CR>

" recursively open/close current fold
nmap <leader>t <leader>zA<CR>

" Autocommands ------------------------
" Autodelete trailing whitespaces when saving
autocmd BufWritePre * :silent! %s/\s\+$//e

" Set cursorline only for current window
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

au BufRead,BufNewFile *.md set textwidth=80
au BufRead,BufNewFile {Gemfile,Capfile,Rakefile,config.ru} set ft=ruby

" let terminal resize the internal windows
autocmd VimResized * :wincmd =

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 |
  \   exe "normal g`\"" |
  \ endif

" Show filename in the status bar
function! LightLineFilename()
  return expand('%#')
endfunction

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
