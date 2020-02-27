" ---- display ----
set number 
set title 
set cursorline
hi clear CursorLine
set guioptions-=m
set inccommand=split
let g:loaded_matchparen=1

" ---- tab  ----
set expandtab
set tabstop=2 
set shiftwidth=2
set smartindent
set autoindent
set softtabstop=2

" ---- input  ----
set backspace=indent,eol,start

" ---- search  ----
set ignorecase 
set smartcase 
set hlsearch
set gdefault
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ---- sound ----
set visualbell t_vb=
set noerrorbells

" ---- command  ----
set wildmenu
set history=5000

" ---- terminal ----
set shell=zsh

" ---- completion ----
set completeopt=noinsert,menuone,noselect  

" ---- buffer ----
set hidden

" ---- encoding ---
set encoding=utf-8
set fileencoding=utf-8

" ---- undo ----
set undofile
set undodir=~/.undodir
