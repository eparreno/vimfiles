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

let g:colors_name = "minimal"

" General colors
hi Normal         ctermfg=007   ctermbg=232   cterm=none
hi Visual         ctermfg=none  ctermbg=008   cterm=none

hi VertSplit      ctermfg=235   ctermbg=235   cterm=none
hi SignColumn     ctermfg=none  ctermbg=008   cterm=none
hi NonText        ctermfg=000   ctermbg=232   cterm=none
hi LineNr         ctermfg=235   ctermbg=none  cterm=none
hi CursorLine     ctermfg=none  ctermbg=none cterm=none
hi CursorLineNr   ctermfg=007   ctermbg=none  cterm=none
hi StatusLine     ctermfg=000   ctermbg=015   cterm=bold
hi StatusLineNC   ctermfg=007   ctermbg=235   cterm=none
hi Pmenu          ctermfg=015   ctermbg=008   cterm=none
hi PmenuSel       ctermfg=000   ctermbg=015   cterm=none

" Syntax highlighting
hi Statement      ctermfg=033   ctermbg=none  cterm=bold
hi String         ctermfg=028   ctermbg=none  cterm=none
hi PreProc        ctermfg=166   ctermbg=none cterm=bold

hi Comment        ctermfg=240   ctermbg=none  cterm=none
hi! link Todo     Comment

hi Type           ctermfg=015   ctermbg=none cterm=bold
hi! link Special    Type
hi! link Constant   Type
hi! link Identifier Type
