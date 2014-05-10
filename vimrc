" Use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
Helptags

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

autocmd BufNewFile,BufReadPost *.yml setl ts=2 sw=2 expandtab

au FileType javascript set tabstop=4
au FileType javascript set shiftwidth=4
au FileType javascript set noexpandtab

au FileType markdown set tw=80
au FileType markdown set formatoptions+=t
au FileType markdown set wm=2

let g:vim_json_syntax_conceal = 0

autocmd BufNewFile,BufReadPost *.coffee setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.hbs setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.html setl sw=2 ts=2 expandtab

set showmatch " Show matching brackets

" highlight searches
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set 256 color mode
" set t_Co=256
" let base16colorspace=256

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


" :noremap <C-T> :tnext<CR>

" load tags file if found
set tags=./tags;/

" show column number, etc. on bottom right
set ruler
set nowrap

" disable JSDoc comment highlighting in javascript
let javascript_ignore_javaScriptdoc=1

""""""""""""""""""""""""""
"       plugins          "
""""""""""""""""""""""""""

" vim-markdown
let g:vim_markdown_folding_disabled=1


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo

" Cursor restoring stuff
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Coffeescript folding -- why is this necessary?
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" Enable mouse scroll
set mouse=a

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Highlight things over 80 columns - run in autocmds so ctrl.p doesnt break
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufNew,BufEnter * call matchadd('OverLength', '\%>80v.\+')

" Fix backspaces in vim 7.4 on mac
set nocompatible
set backspace=2

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_conf = $HOME . '/.jshintrc'

" Custom status line. Matches `ruler` and adds fugitive#statusline()
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" syntastic error window toggle
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location
        Errors
    endif
endfunction
" bring up syntastic error list
nnoremap <silent> ; :<C-e>call ToggleErrors()<CR>

" Clear search highlights
nnoremap <Space> :let @/ = ""<CR>
