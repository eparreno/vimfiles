# vimfiles

My new vimfiles

## Installation

    git clone https://github.com/eparreno/vimfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qa!

## Base Customizations

- leader set to ","
- line numbers
- soft 2-space tabs, and default hard tabs to 2 spaces
- incremental, case-insensitive search
- vertical split goes right, horizontal split goes below
- cursor keys for movement are disabled!
- mouse support

## Mappings

- _,_ - Leader key

### Normal mode

- _<C-j/k/h/l>_ - switch between splits (no need to prepend <C-w>)
- _Y_ - Act like D and C, i.e. to yank until EOL
- _,e_ - Appends an edit command with the path of the currently edited file filled in
- _,c_ - Comment/Uncomment current line or selected lines in visual mode
- _,,_ - Switch to previous window
- _,n_ - Toggle NERDTree

### Insert mode

- _,p_ - Toggle paste mode
- _jj_ - Back to normal mode

### Command mode

- _,p_ - Insert current path

## Customization

Create ~/.vimrc.local for any local customizations.
