" ----------------------------------------------------------------------------
" Minimal color scheme
" author: Emili Parreno
" source: https://github.com/eparreno/vimfiles
" ----------------------------------------------------------------------------

" Reset Highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name = "softdark"

" General colors
hi Normal         ctermfg=007   ctermbg=233   cterm=none
hi Visual         ctermfg=none  ctermbg=008   cterm=none

hi VertSplit      ctermfg=234   ctermbg=234   cterm=none
hi SignColumn     ctermfg=none  ctermbg=008   cterm=none
hi NonText        ctermfg=237   ctermbg=233   cterm=none
hi LineNr         ctermfg=237   ctermbg=none  cterm=none
hi CursorLine     ctermfg=none  ctermbg=none  cterm=none
hi CursorLineNr   ctermfg=007   ctermbg=234  cterm=none
hi ColorColumn    ctermfg=000   ctermbg=234   cterm=none
hi StatusLine     ctermfg=007   ctermbg=234   cterm=bold
hi StatusLineNC   ctermfg=008   ctermbg=234   cterm=none
hi Pmenu          ctermfg=015   ctermbg=008   cterm=none
hi PmenuSel       ctermfg=000   ctermbg=015   cterm=none

" Syntax highlighting
hi Statement      ctermfg=039   ctermbg=none  cterm=bold
hi PreProc        ctermfg=039   ctermbg=none  cterm=bold
hi String         ctermfg=028   ctermbg=none  cterm=none

hi Comment        ctermfg=243   ctermbg=none  cterm=none
hi! link Todo     Comment

hi Type           ctermfg=222   ctermbg=none  cterm=bold
hi Identifier     ctermfg=222   ctermbg=none  cterm=bold
hi Special        ctermfg=028   ctermbg=none  cterm=bold
hi Constant       ctermfg=015   ctermbg=none  cterm=bold
