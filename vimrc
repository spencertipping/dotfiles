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
set list listchars=tab:>-,trail:·
set fillchars+=vert:·
set textwidth=80
set novisualbell

" set number relativenumber

vnoremap <C-c> "+y

map q :x<CR>
map Q :xa<CR>

let perl_extended_vars=1
let g:markdown_fenced_languages = [
  \ "perl", "sh", "c", "ocaml", "python", "ruby", "javascript", "haskell",
  \ "caterwaul"]

if has('gui')
  set guioptions=Pc
endif

augroup vimrc_todo
  au!
  au Syntax * syn match TodoExtra /\v<(NB|WARNING|Q):|\v^(\d+)\. /
     \ contained containedin=.*Comment,vimCommentTitle,perlPOD
augroup END

if &columns > 86
  set tw=192
endif

au BufNew,BufReadPost * syn sync fromstart

au BufNew,BufReadPost *.binary set syntax=binary
au BufNew,BufReadPost *.waul   set syntax=caterwaul
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

hi LineNr       ctermfg=7
hi CursorLineNr ctermfg=9
hi Statement    ctermfg=10
hi Type         ctermfg=8
hi SpecialKey   ctermfg=7
hi NonText      ctermfg=7 cterm=none
hi Todo         ctermfg=12 ctermbg=none cterm=italic

hi perlSubName     ctermfg=12
hi perlConditional ctermfg=11
hi perlRepeat      ctermfg=10

hi Pmenu ctermbg=none ctermfg=4

hi Folded term=standout ctermfg=4 ctermbg=none

hi markdownHeadingThing ctermfg=9 cterm=bold
hi link markdownLinkDelimiter NonText
hi link markdownLinkTextDelimiter NonText
hi link markdownLinkText Statement
hi link markdownUrl LineNr

hi link markdownH1 markdownHeadingThing
hi link markdownH2 markdownHeadingThing
hi link markdownH3 markdownHeadingThing
hi link markdownH4 markdownHeadingThing
hi link markdownH5 markdownHeadingThing
hi link markdownH6 markdownHeadingThing
hi link markdownHeadingDelimiter markdownHeadingThing
hi link markdownCodeDelimiter NonText
hi link markdownCode Special

hi link perlPOD Comment
