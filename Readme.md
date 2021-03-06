# vimfiles

My new vimfiles

## Installation

    git clone https://github.com/eparreno/vimfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qa!

## Base Customizations

- leader set to <space>
- line numbers
- soft 2-space tabs and default hard tabs to 2 spaces
- incremental, case-insensitive search
- vertical split goes right, horizontal split goes below
- cursor keys for movement are disabled!
- mouse support

## Mappings

- **<space>** Leader key

### Normal mode

- **\<C-j/k/h/l\>** - Switch between splits (no need to prepend <C-w>)
- **Y**     - Act like D and C**<leader> i.e. to yank until EOL
- **<leader>e**    - Appends an edit command with the path of the currently edited file filled in
- **<leader>c**    - Comment/Uncomment current line or selected lines in visual mode
- **<C-p>** - Open CtrlP

### Insert mode

- **jj** - Back to normal mode

### Command mode

## Plugins

Check vimrc.bundles file

## Customization

Create ~/.vimrc.local for any local customizations.
