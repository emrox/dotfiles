" http://amix.dk/vim/vimrc.html

set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

syntax enable php

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=4

set wildmenu "Turn on WiLd menu

set ruler "Always show current position
set number " line numbers
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

set ai "Auto indent
set si "Smart indet

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/sandbox/'
    setlocal ts=4 sw=4 noexpandtab " tab = 1 tab (eq 4 spaces)
    "autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
  else
    setlocal ts=2 sw=2 expandtab " tab = 2 spaces
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

" 'Intelligent' Home Key
noremap  <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0'  : '^')
"noremap  <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$'  : 'g_')
"vnoremap <expr> <End>  (col('.') == match(getline('.'),    '\s*$')   ? '$h' : 'g_')
imap <Home> <C-o><Home>
"imap <End>  <C-o><End>

" Key mapping
map \ff :FufFile<CR>
map \gf :FufCoverageFile<CR>
map \ag :Ack 
map \nt :NERDTreeToggle<CR>
map <F8> :setlocal indentexpr=

