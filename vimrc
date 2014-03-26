" Use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Line numbers
set nu

" Indentation
filetype plugin indent on
set ai " Autoident
set cindent

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

au FileType python set tabstop=4
au FileType python set shiftwidth=4

au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2

au FileType markdown set tw=80
au FileType markdown set formatoptions+=t
au FileType markdown set wm=2

set showmatch " Show matching brackets

" highlight searches
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set 256 color mode
set t_Co=256
" let base16colorspace=256

" Color scheme
syntax enable
set background=dark
color twilight

" Configuration for emmet (zen coding) - only enable for html, css, hbs

set nowrap

" Undo buffer awesomeness
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" load tags file if found
set tags=./tags;/

" Highlight things over 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
call matchadd('OverLength', '\%>80v.\+')

" show column number, etc. on bottom right
set ruler

" disable JSDoc comment highlighting in javascript
let javascript_ignore_javaScriptdoc=1

""""""""""""""""""""""""""
"       plugins          "
""""""""""""""""""""""""""

" vim-markdown
let g:vim_markdown_folding_disabled=1

