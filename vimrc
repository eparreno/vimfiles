" vimrc
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles

set nocompatible      " use Vim settings, rather than Vi settings

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

filetype plugin indent on

" Settings -----------------------------------------------
set encoding=utf-8              " utf-8 encoding
set fileformat=unix             " force unix file format
set ruler                       " show cursor position in the statusbar
set number                      " show line numbers
set cursorline                  " show cursorline
set showcmd                     " display incomplete commands
set showmode                    " show the current mode of the editor
set showmatch                   " set show matching parenthesis
set backspace=indent,eol,start  " make backspace work as expected
set autoread                    " auto-reload buffers when file changed on disk
set hidden                      " switch between buffers without saving them
set visualbell                  " no sounds

" Mouse
set mouse=a
set ttymouse=xterm2

" Search
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " /g flag on :s substitutions by default

" Backup & swap
set nobackup
set nowritebackup
set noswapfile

" Tab completion
set wildmenu                    " better file/command completion
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.png,*.jpg,*.gif
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**
set wildignore+=log/**,tmp/**,*.scssc,*.sassc,*sass-cache*

" Whitespace stuff
set nowrap                      " disable text wrapping
set expandtab                   " use spaces, not tabs
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Splitting
set splitright                  " put new vertical windows right of the current one
set splitbelow                  " put new horizontal windows below of the current one

" Look & Feel
set t_Co=256                    " use 256 colors terminal
set background=dark
set ttyfast                     " fast terminal connection
set scrolloff=3                 " min. number of screen lines above and below the cursor.
set laststatus=2                " show status line
syntax enable
colorscheme softdark

"" Statusline
if has("statusline")
  let &stl=''                  " clear the statusline for when vimrc is reloaded
  let &stl.='%.50f'             " buffers's file name
  let &stl.='%h%m%r%w'          " flags
  let &stl.='%='                " right align
  let &stl.='%{&ft!=""?&ft:""} '       " file type
  let &stl.='%{&fenc!=""?&fenc:&enc} ' " encoding
  let &stl.='%{&ff!=""?&ff:""}'       " file format
  let &stl.='%8.(%l,%v%)'      " cursor's current line
  let &stl.='%5.(%p%%%)'       " percentage through file in lines, as in <c-g>
endif

"" Syntastic
" let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=1

" Mappings -------------------------------------------------
let mapleader = ","

" Disable arrow keys in normal mode
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

map Y y$                        " act like D and C, i.e. to yank until EOL
set pastetoggle=<leader>p       " toggle paste  mode
map <leader>= <C-w>=            " adjust viewports to the same size
imap jj <Esc>
noremap Q gq                    " dont use Ex mode, use Q for formatting

" Keep visual mode after indenting
vmap < <gv
vmap > >gv

" Improve window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" switch to previous window
nmap <leader><leader> <c-^>

" Clear search highlight
nmap <silent> <SPACE> <SPACE>:noh<CR>

" Appends an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Inserts current path
cmap <C-p> <C-R>=expand("%:p:h") . "/" <CR>

" Comment a line/block
map <leader>c \\\<CR>

" Open NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" Autocommands  -------------------------------------------------
if has("autocmd")
  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " For all text & markdown files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType markdown setlocal textwidth=78

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/  )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Autodelete trailing whitespace
  autocmd BufWritePre * :silent! %s/\s\+$//e

  " Set cursorline only for current window
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" Local config -------------------------------------------------
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
