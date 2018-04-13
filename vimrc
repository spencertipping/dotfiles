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
  au Syntax * syn match TodoExtra /\v<(NB|WARNING|Q):|\v<(\d+)\. /
     \ contained containedin=.*Comment,vimCommentTitle,perlPOD
augroup END

au BufNew,BufReadPost *.md syn sync fromstart
au BufNew,BufReadPost *.pm syn sync fromstart
au BufNew,BufReadPost *.pl syn sync fromstart

au Syntax * syn keyword cppType let

if &term == "screen"
  set term=rxvt-unicode-256color
  hi Comment cterm=none
else
  hi Comment cterm=italic
endif

hi def link TodoExtra Todo

hi Normal       ctermfg=0
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=8
hi Statement    ctermfg=2
hi Type         ctermfg=8
hi SpecialKey   ctermfg=7

hi NonText      ctermfg=2 cterm=none

hi Todo         ctermfg=12 ctermbg=none cterm=italic

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

autocmd BufReadPost,BufNew *.phi set syntax=perl
