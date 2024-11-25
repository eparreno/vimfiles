" vimrc
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles

" Plugins (vim-plug) https://github.com/junegunn/vim-plug
" Automatic installation.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
 let data_dir = has('vim') ? stdpath('data') . '/site' : '~/.vim'
 if empty(glob(data_dir . '/autoload/plug.vim'))
   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif

source ~/.vim/plugins.vim
source ~/.vim/config.vim
source ~/.vim/mappings.vim

colorscheme nord

" Autocommands ------------------------

" Set cursorline. Only for current window
" set cursorline                  " show cursorline
" autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

au BufRead,BufNewFile *.md set textwidth=80
au BufRead,BufNewFile {Gemfile,Capfile,Rakefile,config.ru} set ft=ruby

" let terminal resize the internal windows
autocmd VimResized * :wincmd =

" Local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
