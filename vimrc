
let g:CommandTPreferredImplementation='ruby'

" ------------------------------------------------------------------------------
" color scheme and syntax highlighting
" ------------------------------------------------------------------------------

syntax enable
colorscheme Tomorrow-Night-Bright
set termguicolors
let ruby_no_expensive = 1

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" Enable underline colors (ANSI), see alacritty #4660
let &t_AU = "\<esc>[58;5;%dm"
" Enable underline colors (RGB), see alacritty #4660
let &t_8u = "\<esc>[58;2;%lu;%lu;%lum"
" Enable undercurls in terminal
let &t_Cs = "\e[4:3;58:2:213:78:83m"
let &t_Ce = "\e[4:0m"

hi clear SpellBad
hi SpellBad     gui=undercurl guisp=red term=undercurl cterm=undercurl

" This sets undercurls to Red
hi SpellCap       term=undercurl ctermbg=NONE gui=underline guisp=Red cterm=underline

" Ycm colors to match tomorrow-night-bright
hi YcmErrorSection ctermbg=NONE guibg=NONE cterm=undercurl gui=undercurl guisp=#df6566
hi YcmWarningSection  ctermbg=NONE guibg=NONE cterm=undercurl gui=undercurl guisp=#ecce58
hi YcmErrorSign ctermbg=Red guibg=#df6566 cterm=undercurl gui=undercurl guisp=#df6566
hi YcmWarningSign  ctermbg=Yellow guibg=#ecce58 cterm=undercurl gui=undercurl guisp=#ecce58 ctermfg=black guifg=#232323
hi SignColumn guibg=#111111 ctermbg=darkgrey

" Fix backspaces in vim 7.4 on mac
set backspace=2

set belloff=all

" Use pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
Helptags

let mapleader="\<Space>"

set backupdir=~/.vim/backup// " backup files go here
set directory=~/.vim/swap//   " swap files go here

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set autoindent " Autoident
set cindent    " indent with C indentation rules

set re=1                " Use the old regex engine
set tabstop=4           " columns per tab
set shiftwidth=4        " tabs expand to spaces with expandtab on
set smarttab            " backspace tabwidths at start of line
set expandtab           " expand tabs into spaces
" set cursorline          " Hightlights current line of cursor
set completeopt=menu    " shows completions in popup
set modeline            " read modelines at start of files
set colorcolumn=81      " add ruler at column
set textwidth=80        " wrap text starting here
set number              " show linenumbers
set hlsearch            " highlight searches
set incsearch           " show results while typing
set ignorecase          " case insensitive
set smartcase           " if search string has case, be case sensitive
set showmatch           " Show matching bracket when cursor on bracket
set undofile            " persist undo history
set undodir=$HOME/.vim/undo " keep undo files here
set undolevels=1000     " maximum number of changes that can be undone
set undoreload=10000    " save whole buffer to undo on reload (:e)
set dictionary="/usr/dict/words" "dictionary for `set spell`
set ruler               " show line/col of cursor
set nowrap              " disable softwrap
set tags=./tags;/       " tags file
set tags+=~/tags        " other places for tags
set splitbelow          " open horizontal splits below
set splitright          " open vertical splits to right
set nottyfast

" Modal cursor shapes
let &t_SI = "\<Esc>[6 q" "start insert mode (bar)
let &t_SR = "\<Esc>[4 q" "start replace mode (underline)
let &t_EI = "\<Esc>[2 q" "end insert or replace mode (block)

" Code Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=100

" Change listchars to something sensible
" set list listchars=tab:»·,trail:·
set list listchars=tab:»\ ,trail:·,nbsp:.

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Custom status line. Matches `ruler` and adds fugitive#statusline()
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Load man page plugin
runtime ftplugin/man.vim

" Function for getting the syntax element under the cursor
function PrintSyntaxUnderCursor()
    echo synIDattr(synID(line("."),col("."),0),"name")
endfunction


function PrintHighlightingUnderCursor()
  echo execute 'hi' synIDattr(synID(line("."), col("."), 1), "name")
endfunction

" ------------------------------------------------------------------------------
" GuiVim
" ------------------------------------------------------------------------------

if has("gui_running")
  set guioptions=
  if has('mac')
    nnoremap <silent> <F11> :set fu!<CR>
  else
    map <silent> <F11>
    \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
  endif
endif

" ------------------------------------------------------------------------------
" Restore cursor to previous line when entering buffer
" ------------------------------------------------------------------------------
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


" ------------------------------------------------------------------------------
" Filetype specific settings
" ------------------------------------------------------------------------------

au FileType gitcommit set tw=72 cc=73 spell
autocmd BufNewFile,BufReadPost .bash_aliases* set filetype=sh
autocmd BufNewFile,BufReadPost *.yml setl sw=2 ts=2
autocmd BufNewFile,BufReadPost *.js setl sw=2 ts=2
autocmd BufNewFile,BufReadPost *.coffee setl sw=2 ts=2
autocmd BufNewFile,BufReadPost *.hbs setl sw=2 ts=2
autocmd BufNewFile,BufReadPost *.html setl sw=2 ts=2
autocmd BufNewFile,BufReadPost *.rb setl sw=2 ts=2 nocursorline
autocmd BufNewFile,BufReadPost *.rs setl sw=4 ts=4 tw=100 cc=101
autocmd BufNewFile,BufReadPost *.rs.in setl sw=4 ts=4 tw=100 cc=101
autocmd BufNewFile,BufReadPost *.py setl sw=2 ts=2 tw=79 cc=80 nocindent
autocmd BufNewFile,BufReadPost *.rs hi link rustCommentLineDoc Comment

" Coffeescript folding -- why is this necessary?
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

let g:markdown_fenced_languages = [
    \     'html', 'vim', 'ruby', 'python', 'bash=sh', 'rust'
    \ ]

" ------------------------------------------------------------------------------
" misc keybindings
" ------------------------------------------------------------------------------

" escape is just so far away
inoremap jj <Esc>

" Quick window movement
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" {Visual}gq that switches to 80 columns and back to 100. This is primarily
" useful while programming in the Rust Programming Language.
vmap <Leader>c :<C-u>set tw=80<CR>gvgq:set tw=100<CR>

" Clear search highlights
nnoremap <silent> <Space><Space> :let @/ = ""<CR>

" Run cargo test and open output in new buffer
command! Ctest call s:RunCargoTest()
function! s:RunCargoTest()
    let winnr = bufwinnr('^_cargo_test')
    let curnr = bufwinnr('%')

    if ( winnr >= 0 )
        execute winnr . 'wincmd w'
    else
        vert new _cargo_test
        set ft=cargo
        setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
    endif

    execute 'normal ggdG'
    0read! cargo test --color=never
    call cursor(1, 1)
    execute curnr . 'wincmd w'
endfunction
nnoremap <silent> <F8> :silent :Ctest<CR>

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@@@@@@@@@ PLUGIN CONFIGURATION @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


" ------------------------------------------------------------------------------
" CtrlP Configuration
" ------------------------------------------------------------------------------

" CtrlP search uses the silver searcher instead of grep
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_working_path_mode='c'


" ------------------------------------------------------------------------------
" syntastic
" ------------------------------------------------------------------------------

" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_enable_signs = 1
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
" let g:syntastic_java_javac_config_file_enabled = 1
" 
" " Syntastic python settings
" let g:syntastic_python_checkers = [ 'flake8', 'python' ]
" let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'
" 
" let g:syntastic_ruby_checkers = [ 'mri', 'rubocop' ]
" 
" " syntastic error window toggle
" function! ToggleErrors()
"     let old_last_winnr = winnr('$')
"     lclose
"     if old_last_winnr == winnr('$')
"     " Nothing was closed, open syntastic error location
"         Errors
"     endif
" endfunction
" 
" " bring up syntastic error list
" nnoremap <silent> ; :<C-e>call ToggleErrors()<CR>
" 
" " Make sure rust.vim doesn't enable syntastic; we use ycm with background
" " checking.
" let g:syntastic_rust_checkers = []
" let g:syntastic_extra_filetypes = []


" ------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------
let g:ycm_always_populate_location_list = 1
let g:ycm_warning_symbol = '->'
let g:ycm_error_symbol = '=>'
let g:ycm_server_log_level = 'debug'

" Global extra conf is the .ycm_extra_conf.py in the dotfiles folder
let g:ycm_global_ycm_extra_conf = $HOME . '/.dotfiles/.ycm_extra_conf.py'

nnoremap <F5> :YcmRestartServer<CR>
nnoremap <F6> :YcmToggleLogs<CR>

nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>[ <Plug>(YCMFindSymbolInWorkspace)

" ------------------------------------------------------------------------------
" ultisnips
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<right>"
let g:UltiSnipsJumpForwardTrigger = "<right>"
let g:UltiSnipsJumpBackwardTrigger = "<left>"

" UltiSnips will search each 'runtimepath' directory for the subdirectory names
" defined in g:UltiSnipsSnippetDirectories in the order they are defined.
let g:UltiSnipsSnippetDirectories = ["snips"]

" ------------------------------------------------------------------------------
" vim-javascript
" ------------------------------------------------------------------------------

" prevent hightlight of jsdoc comments
let javascript_ignore_javaScriptdoc=1


" ------------------------------------------------------------------------------
" vim-markdown
" ------------------------------------------------------------------------------

let g:vim_markdown_folding_disabled=1


" ------------------------------------------------------------------------------
" vim-json
" ------------------------------------------------------------------------------

" Anything that uses vim conceal is banished
let g:vim_json_syntax_conceal = 0

" ------------------------------------------------------------------------------
" gundo
" ------------------------------------------------------------------------------
let g:gundo_prefer_python3 = 1
nnoremap <F7> :GundoToggle<CR>

" ------------------------------------------------------------------------------
" Command-T
" ------------------------------------------------------------------------------

let g:CommandTAcceptSelectionSplitMap = '<C-x>'
let g:CommandTCancelMap = '<Esc>'

let g:CommandTFileScanner = 'git'

nnoremap <C-p> :CommandT<CR>

" Focus! These bindings are used by i3-vim-focus
map gwl :call Focus('right','l')<CR>
map gwh :call Focus('left','h')<CR>
map gwk :call Focus('up','k')<CR>
map gwj :call Focus('down','j')<CR>

cnoremap <C-j> <Up>
cnoremap <C-k> <Down>

" ------------------------------------------------------------------------------
" ListToggle
" ------------------------------------------------------------------------------

let g:lt_location_list_toggle_map = ';'
let g:lt_height = 10
let g:rustfmt_autosave = 1
