" Fix backspaces in vim 7.4 on mac
set nocompatible
set backspace=2

" Use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
Helptags

" Change .swp file location
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

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

au FileType markdown set formatoptions+=t
au FileType markdown set wm=2

let g:vim_json_syntax_conceal = 0

autocmd BufNewFile,BufReadPost .bash_aliases* set filetype=sh
autocmd BufNewFile,BufReadPost *.yml setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.js setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.coffee setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.hbs setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.html setl sw=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rs setl sw=4 ts=4 expandtab tw=99

" Highlight tmux conf (does not work)
" autocmd BufNewFile,BufRead,BufReadPost *.tmux.conf,*tmux.conf setf tmux set syntax=tmux

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
set tags+=~/tags

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
" set mouse=a

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_working_path_mode='c'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
let g:syntastic_java_javac_config_file_enabled = 1
" autocmd BufEnter *.js SyntasticCheck jshint

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

inoremap jj <Esc>

" Change listchars to something sensible
" set list listchars=tab:»·,trail:·
set list listchars=tab:»\ ,trail:·,nbsp:.


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quick window movement
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Color scheme
syntax enable
set background=dark
let g:solarized_termcolors=16
set t_Co=16
colorscheme solarized

if g:colors_name == 'solarized'
    " `Special` in solarized is red. It's distracting. Fix it.
    hi link jsThis Identifier
    hi link jsGlobalObjects Identifier
    hi link jsBuiltins Identifier
    hi link jsPrototype Identifier
endif

" Highlight things over 80 columns - run in autocmds so ctrl.p doesnt break.
" This MUST come after the color scheme declaration since most colorschemes
" begin with `hi clear`.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufNew,BufEnter,BufNewFile,BufReadPost * call matchadd('OverLength', '\%>80v.\+')

runtime ftplugin/man.vim

let mapleader="\<Space>"

" Clear search highlights
nnoremap <silent> <Leader><Leader> :let @/ = ""<CR>

nnoremap <Leader>g YcmCompleter GoTo<CR>

set cursorline
