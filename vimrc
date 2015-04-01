set nonu sta et sc fdc=0 sw=2 ai mouse=a nowrap nojs hls is foldlevel=10 enc=utf8
set tenc=utf8 title visualbell noerrorbells hidden pastetoggle=<F2> foldenable tags=tags;/
set wildmenu wildmode=list:longest scrolloff=3 shortmess=atI incsearch hlsearch hidden
set history=1000 list listchars=tab:>-,trail:. wm=1

nnoremap ' `
nnoremap ` '

map <F3> :if &tw == 192 \| set tw=80 \| echo "tw is 80" \| else \| set tw=192 \| echo "tw is 192" \| endif<CR>
map <F4> :if &nu == 1 \| set nonu \| else \| set nu \| endif<CR>
map <F5> :if &spell == 1 \| set nospell \| else \| set spell \| endif<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map <C-@> :161vsplit \| :80vsplit <CR>

map q :x<CR>
map Q :xa<CR>

filetype plugin on
syntax on
let perl_extended_vars=1

if $TERM == 'screen' || $TERM == 'rxvt-unicode-256color'
  set term=rxvt-unicode
endif

set fillchars+=vert:·

hi Folded     ctermbg=none
hi FoldColumn ctermbg=none

hi Todo        ctermfg=5 ctermbg=3

hi LineNr      ctermfg=3
hi Keyword     ctermfg=3 cterm=bold
hi Operator    ctermfg=3 cterm=bold
hi Conditional ctermfg=3 cterm=bold
hi Label       ctermfg=3 cterm=bold
hi Exception   ctermfg=3 cterm=bold
hi Repeat      ctermfg=3 cterm=bold
hi Statement   ctermfg=3 cterm=bold

hi NonText     ctermfg=16 cterm=bold
hi SpecialKey  ctermfg=0  cterm=bold

hi StatusLine   ctermbg=15 ctermfg=4 cterm=none
hi StatusLineNC ctermbg=15 ctermfg=0 cterm=none
hi VertSplit    ctermbg=15 ctermfg=4 cterm=none

hi DiffAdd    ctermfg=4 ctermbg=15 cterm=bold
hi DiffChange ctermfg=6 ctermbg=15 cterm=bold
hi DiffDelete ctermfg=1 ctermbg=15 cterm=bold
hi DiffText   ctermfg=8 ctermbg=15 cterm=bold

" Custom syntax stuff
au BufRead,BufReadPost,BufNewFile *.js        set syntax=caterwaul
au BufRead,BufReadPost,BufNewFile *.waul      set syntax=caterwaul
au BufRead,BufReadPost,BufNewFile *.caterwaul set syntax=caterwaul
au BufRead,BufReadPost,BufNewFile *.cltex     set syntax=cltex
au BufRead,BufReadPost,BufNewFile *.perltex   set syntax=perltex
au BufRead,BufReadPost,BufNewFile *.gnarly    set syntax=gnarly
au BufRead,BufReadPost,BufNewFile *.scala     set syntax=scala
au BufRead,BufReadPost,BufNewFile *.hx        set syntax=haxe
au BufRead,BufReadPost,BufNewFile *.fig       set syntax=figment
au BufRead,BufReadPost,BufNewFile *.pickle    set syntax=pickle
au BufRead,BufReadPost,BufNewFile *.havoc     set syntax=havoc
au BufRead,BufReadPost,BufNewFile *.mh        set syntax=mh
au BufRead,BufReadPost,BufNewFile *.binary    set syntax=binary
au BufRead,BufReadPost,BufNewFile *.fth       set syntax=forth
au BufRead,BufReadPost,BufNewFile *.canard    set syntax=canard
au BufRead,BufReadPost,BufNewFile *.coffee    set syntax=coffee
au BufRead,BufReadPost,BufNewFile *.jade      set syntax=jade
au BufRead,BufReadPost,BufNewFile *.rho       set syntax=rho
au BufRead,BufReadPost,BufNewFile *.x         set syntax=ld
au BufRead,BufReadPost,BufNewFile *.md        set syntax=markdown
au BufRead,BufReadPost,BufNewFile *.xh        set syntax=xh
au BufRead,BufReadPost,BufNewFile *.ni        set syntax=ni
au BufRead,BufReadPost,BufNewFile *.ledger    set syntax=ledger
au BufRead,BufReadPost,BufNewFile *.se        set syntax=synecdoche

au BufRead,BufReadPost,BufNewFile *.gdb       set syntax=gdb

au BufRead,BufReadPost,BufNewFile *.S         set syntax=gas
au BufRead,BufReadPost,BufNewFile *.s         set syntax=gas
