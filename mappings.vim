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
nmap <leader>v :vsp<CR>  " New vertical window
nmap <leader>s :sp<CR>   " New horizontal window
nmap <silent> <Tab> :BufSurfBack<CR> " Previous buffer
nmap <silent> <S-Tab> :BufSurfForward<CR> " Next buffer
nmap <C-c> :bnext\|bdelete #<CR>

nmap <leader>0 :NERDTreeToggle<CR>

" recursively open/close current fold
nmap <leader>t <leader>zA<CR>
