syntax on " Syntax highlighting
set ai " Autoident
set nu " Line numbers

set cindent

set tabstop=4
set smarttab
set shiftwidth=4
set expandtab

set showmatch " Show matching brackets

filetype plugin indent on

au FileType python set expandtab
au FileType python set tabstop=4
au FileType python set shiftwidth=4

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set ruler
" set colorcolumn=80
" set backspace=indent,eol,start

" highlight searches
set hlsearch
set incsearch
set ignorecase
set smartcase

execute pathogen#infect()

