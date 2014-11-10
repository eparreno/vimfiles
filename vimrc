" vimrc
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles

set nocompatible      " use Vim settings, rather than Vi settings

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Plugins ----------------------------
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0 " open in new buffer

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=1

"filetype on     "DO WE NEED THIS???

" Config ------------------------------
set encoding=utf-8              " utf-8 encoding
set fileformat=unix             " force unix file format
set ruler                       " show cursor position in the statusbar
set number                      " show line numbers
set showmode                    " show the current mode of the editor
set showcmd                     " display incomplete commands
set cursorline                  " show cursorline
set autoread                    " auto-reload buffers when file changed on disk
set hidden                      " switch between buffers without saving them
set visualbell                  " no sounds
set backspace=indent,eol,start  " make backspace work as expected
set clipboard+=unnamed          " use system clipboard
set re=1                        " use old regex engine http://goo.gl/ql7BtI

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

" Mappings ----------------------------
noremap H ^             " move to beginning of line
noremap L $             " move to end of line
inoremap jj <Esc>
inoremap kk <Esc>

map Y y$                " act like D and C, i.e. to yank until EOL
noremap Q gq            " dont use Ex mode, use Q for formatting

" Disable arrow keys in normal mode
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Improve window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" Clear search highlight
nmap <silent> <SPACE> :noh<CR>

" Autocommands ------------------------
" Autodelete trailing whitespace
autocmd BufWritePre * :silent! %s/\s\+$//e

" Set cursorline only for current window
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 |
  \   exe "normal g`\"" |
  \ endif

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
