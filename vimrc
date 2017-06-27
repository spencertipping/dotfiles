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
let g:markdown_fenced_languages = ["perl", "sh"]

if has('gui')
  set guioptions=Pc
endif

if &term == "screen"
  set term=rxvt-unicode-256color
endif

hi Folded      ctermbg=none
hi FoldColumn  ctermbg=none

hi Todo        ctermfg=4 ctermbg=none cterm=bold

hi LineNr      ctermfg=3
hi Keyword     ctermfg=3 cterm=bold
hi Operator    ctermfg=3
hi Conditional ctermfg=3
hi Label       ctermfg=3
hi Exception   ctermfg=3
hi Repeat      ctermfg=3
hi Statement   ctermfg=3 cterm=bold

hi Comment     ctermfg=4 cterm=italic
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

hi link markdownH1 Comment
hi link markdownH2 Comment
hi link markdownH3 Comment
hi link markdownH4 Comment
hi link markdownH5 Comment
hi link markdownH6 Comment
hi link markdownHeadingDelimiter Comment
