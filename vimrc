" vimrc
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles
set nocompatible      " use Vim settings, rather than Vi settings

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Plugins ----------------------------
" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Townk/vim-autoclose'
let g:AutoClosePairs_add = "|"
Plugin 'majutsushi/tagbar'
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ },
      \ 'active': {
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \}
Plugin 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1

function! LightLineFilename()
  return expand('%#')
endfunction

Plugin 'dag/vim-fish'
Plugin 'ton/vim-bufsurf'
Plugin 'ngmy/vim-rubocop'
let g:vimrubocop_config = '.styleguides/ruby.yml'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = -1 " open in new buffer

Plugin 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
" let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map={ 'mode': 'active','active_filetypes': [],'passive_filetypes': ['html', 'cucumber', 'scss'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['flake8']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Config ------------------------------
set encoding=utf-8              " utf-8 encoding
set fileformat=unix             " force unix file format
set ruler                       " show cursor position in the statusbar
set number                      " show line numbers
" set showmode                    " show the current mode of the editor
set noshowmode                    " show the current mode of the editor
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
" set background=dark 		    " dark background
set ttyfast                 " fast terminal connection
set scrolloff=5             " min. number of screen lines above and below the cursor.
set laststatus=2            " show status line
syntax enable 			        " enable syntax highlight
colorscheme softdark

set pastetoggle=<F2>        " toggle paste  mode

:set tags=.tags,tags

" Mappings ----------------------------
map <space> <leader>

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

inoremap jj <Esc>
inoremap kk <Esc>

map Y y$                " act like D and C, i.e. to yank until EOL
noremap Q gq            " dont use Ex mode, use Q for formatting

nnoremap ! :!

" Disable arrow keys in normal mode
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Resize using arrow keys
noremap <up>    <C-W>+
noremap <down>  <C-W>-
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

" Clear search highlight
nmap <silent> <space><space> :noh<CR>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>v :vsp<SPACE>
nmap <leader>s :sp<SPACE>
" nmap <Tab> :b#<CR>
nmap <silent> <Tab> :BufSurfBack<CR>
nmap <silent> <S-Tab> :BufSurfForward<CR>
nmap <C-c> :bnext\|bdelete #<CR>
nmap <leader>gg :Ggrep

nmap <F7> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>

" Vimux -------------------------------
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>
" Repeat last command
map <Leader>vr :VimuxRunLastCommand<CR>
" Close pane
map <leader>vc :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vi :VimuxInterruptRunner<CR>

" Autocommands ------------------------
" Autodelete trailing whitespace
autocmd BufWritePre * :silent! %s/\s\+$//e

" Set cursorline only for current window
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

au BufRead,BufNewFile *.md set textwidth=80
au BufRead,BufNewFile {Gemfile,Capfile,Rakefile,config.ru} set ft=ruby

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 |
  \   exe "normal g`\"" |
  \ endif

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
