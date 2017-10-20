set foldenable foldcolumn=0 foldlevel=10
set expandtab shiftwidth=2 tabstop=8 softtabstop=2
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
let g:markdown_fenced_languages = ["perl", "sh", "c", "ocaml"]

if has('gui')
  set guioptions=Pc
endif

if &term == "screen"
  set term=rxvt-unicode-256color
endif

hi Normal       ctermfg=0
hi Comment      cterm=italic
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=8
hi Statement    ctermfg=2
hi Type         ctermfg=8

hi perlSubName  ctermfg=12
hi perlOperator ctermfg=4

hi markdownHeadingThing ctermfg=4 cterm=bold

hi link markdownH1 markdownHeadingThing
hi link markdownH2 markdownHeadingThing
hi link markdownH3 markdownHeadingThing
hi link markdownH4 markdownHeadingThing
hi link markdownH5 markdownHeadingThing
hi link markdownH6 markdownHeadingThing
hi link markdownHeadingDelimiter markdownHeadingThing
hi link markdownCodeDelimiter Comment
hi link markdownCode Special
