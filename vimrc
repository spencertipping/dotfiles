set foldenable foldcolumn=0 foldlevel=10
set expandtab shiftwidth=2 tabstop=2
set autoindent
set mouse=a
set nowrap nojoinspaces
set hlsearch incsearch
set enc=utf8 tenc=utf8
set visualbell noerrorbells
set title
set tags=tags;/
set wildmenu wildmode=list:longest
set scrolloff=3
set shortmess=atI
set history=1000
set list listchars=tab:>-,trail:.
set fillchars+=vert:·

vnoremap <C-c> "+y

map q :x<CR>
map Q :xa<CR>

let perl_extended_vars=1

if has('gui')
  set guioptions=Pc
endif

if &term == "screen"
  set term=rxvt-unicode-256color
endif

hi Folded      ctermbg=none
hi FoldColumn  ctermbg=none

hi Todo        ctermfg=5 ctermbg=3

hi LineNr      ctermfg=3
hi Keyword     ctermfg=3 cterm=bold
hi Operator    ctermfg=3 cterm=bold
hi Conditional ctermfg=3 cterm=bold
hi Label       ctermfg=3 cterm=bold
hi Exception   ctermfg=3 cterm=bold
hi Repeat      ctermfg=3 cterm=bold
hi Statement   ctermfg=3 cterm=bold

hi Comment     ctermfg=4
hi Special     ctermfg=5
hi Constant    ctermfg=1

hi SpecialKey  ctermfg=0 cterm=bold

hi StatusLine   ctermbg=15 ctermfg=4 cterm=none
hi StatusLineNC ctermbg=15 ctermfg=0 cterm=none
hi VertSplit    ctermbg=15 ctermfg=4 cterm=none

hi DiffAdd    ctermfg=4 ctermbg=none cterm=bold
hi DiffChange ctermfg=6 ctermbg=none cterm=bold
hi DiffDelete ctermfg=1 ctermbg=none cterm=bold
hi DiffText   ctermfg=8 ctermbg=none cterm=bold

hi link markdownValid Comment
hi link markdownLineStart Comment
hi link markdownH1 Special
hi link markdownH2 Special
hi link markdownH3 Special
hi link markdownH4 Special
hi link markdownH5 Special
hi link markdownH6 Special
