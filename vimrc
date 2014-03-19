" Use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nu " Line numbers

" Indentation
filetype plugin indent on
set ai " Autoident
set cindent

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

au FileType python set expandtab
au FileType python set tabstop=4
au FileType python set shiftwidth=4

set showmatch " Show matching brackets

" highlight searches
set hlsearch
set incsearch
set ignorecase
set smartcase


" Set 256 color mode
set t_Co=256
let base16colorspace=256

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Configuration for emmet (zen coding) - only enable for html, css, hbs
let g:user_emmet_install_global = 0
autocmd FileType html,css,hbs EmmetInstall

" Highlight things over 80 columns
highlight OverLength ctermbg=black
match OverLength /\%81v.\+/

set nowrap

" Undo buffer awesomeness
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
