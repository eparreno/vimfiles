" Config ------------------------------
set nocompatible                " use Vim settings, rather than Vi settings
set encoding=utf-8              " utf-8 encoding
set ruler                       " show cursor position in the statusbar
" set cursorline                  " show line under cursor
set number                      " show line numbers
set noshowmode                  " do not show the current mode of the editor
set showcmd                     " display incomplete commands
set autoread                    " auto-reload buffers when file changed on disk
set hidden                      " switch between buffers without saving them
" set visualbell                  " no sounds
set backspace=indent,eol,start  " make backspace work as expected
set clipboard=unnamed           " use system clipboard
set re=1                        " use old regex engine http://goo.gl/ql7BtI
" set colorcolumn=80              " vertical ruler

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
" set incsearch               " incremental search
set ignorecase              " searches are case insensitive...
set smartcase               " ... unless they contain at least one capital letter
set gdefault                " /g flag on :s substitutions by default

" Look & Feel
set t_Co=256                " use 256 colors terminal
set background=dark 		    " dark background
set ttyfast                 " fast terminal connection
set scrolloff=2             " min. number of screen lines above and below the cursor.
set laststatus=2            " show status line
syntax enable 			        " enable syntax highlight

filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on

set pastetoggle=<F2>        " toggle paste  mode

set tags=.tags,tags

" Folding
" setl foldmethod=indent

" Autodelete trailing whitespaces when saving
autocmd BufWritePre * :silent! %s/\s\+$//e

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 |
  \   exe "normal g`\"" |
  \ endif
