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

- **,** Leader key

### Normal mode

- **<C-j/k/h/l>** Switch between splits (no need to prepend <C-w>)
- **Y** - Act like D and C, i.e. to yank until EOL
- **,e** - Appends an edit command with the path of the currently edited file filled in
- **,c** - Comment/Uncomment current line or selected lines in visual mode
- **,,** - Switch to previous window
- **,n** - Toggle NERDTree

### Insert mode

- **,p** - Toggle paste mode
- **jj** - Back to normal mode

### Command mode

- **,p** - Insert current path

## Plugins

Check vimrc.bundles file

## Customization

Create ~/.vimrc.local for any local customizations.
