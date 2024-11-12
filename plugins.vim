call plug#begin()
" Common plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ton/vim-bufsurf'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'dense-analysis/ale'
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_lsp_suggestions = 1
let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

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

" Show filename in the status bar
function! LightLineFilename()
  return expand('%#')
endfunction


" Neovim only plugins
if has('nvim')
  Plug 'Mofiqul/dracula.nvim'
endif

" Vim only plugins
if !has('nvim')
Plug 'christoomey/vim-tmux-navigator'
Plug 'Townk/vim-autoclose'
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'slim-template/vim-slim'

Plug 'Townk/vim-autoclose'
let g:AutoClosePairs_add = "|"

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
endif

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
