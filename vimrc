execute pathogen#infect()

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
set textwidth=80
set novisualbell

set number relativenumber

vnoremap <C-c> "+y

map q :x<CR>
map Q :xa<CR>

let perl_extended_vars=1
let g:markdown_fenced_languages = ["perl", "sh", "c", "ocaml"]

if has('gui')
  set guioptions=Pc
endif

augroup vimrc_todo
  au!
  au Syntax * syn match TodoExtra /\v<(NB|WARNING|Q):|\v^(\d+)\. /
     \ contained containedin=.*Comment,vimCommentTitle,perlPOD
augroup END

au BufNew,BufReadPost * syn sync fromstart

au BufNew,BufReadPost *.binary set syntax=binary
au BufNew,BufReadPost *.waul   set syntax=caterwaul tw=0
au BufNew,BufReadPost *.tex    set tw=0

au Syntax * syn keyword cppType let

if &term == "screen"
  set term=rxvt-unicode-256color
  hi Comment cterm=none
else
  hi Comment cterm=italic
endif

hi def link TodoExtra Todo

let perl_fold=1
let perl_nofold_packages=1
let perl_nofold_subs=1

if &term == "xterm-color" || &term == "rxvt-unicode"
  hi Normal ctermfg=0
endif

hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=8
hi Statement    ctermfg=2
hi Type         ctermfg=8
hi SpecialKey   ctermfg=7

hi NonText      ctermfg=2 cterm=none

hi Todo         ctermfg=12 ctermbg=none cterm=italic

hi Pmenu ctermbg=none ctermfg=4

hi perlSubName     ctermfg=12
hi perlConditional ctermfg=5
hi perlRepeat      ctermfg=5

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

hi link perlPOD Comment
