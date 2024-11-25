# vimfiles

My vimfiles

## Installation

```
git clone https://github.com/eparreno/vimfiles.git ~/.vim
```

That's it. Really. You don't even need to link `.vimrc`

## Base Customizations

- leader set to '<space>'
- line numbers
- soft 2-space tabs and default hard tabs to 2 spaces
- incremental, case-insensitive search
- vertical split goes right, horizontal split goes below
- cursor keys for movement are disabled!
- mouse support

## Mappings

- '<space>' Leader key

### Normal mode

- '<C-j/k/h/l\>' - Switch between splits (no need to prepend <C-w>)
- 'Y'     - Act like D and C i.e. to yank until EOL
- '<leader>e'    - Appends an edit command with the path of the currently edited file filled in
- '<leader>c'    - Comment/Uncomment current line or selected lines in visual mode
- '<C-p>' - Open CtrlP

### Insert mode

- 'jj' - Back to normal mode

### Command mode

## Plugins

Check vimrc file for the list of installed plugins
Execute `:PlugInstall` to install plugins

## Customization

Create ~/.vimrc.local for any local customizations.
