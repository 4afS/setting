" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'elzr/vim-json'
" Note: You don't set neobundle setting in .gvimrc!


call neobundle#end()

"Theme
set t_Co=256
syntax on
set background=dark
colorscheme hybrid

" ---- template setting ----
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile Makefile.* 0r $HOME/.vim/template/Makefile.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt 

" ---- display setting ----
set number 
set cursorline
set title 
set showmatch 
set expandtab
set tabstop=4 
set smartindent
set autoindent
set shiftwidth=4
set softtabstop=4

" ---- input setting ----
set backspace=indent,eol,start
set clipboard+=autoselect

" ---- statusline setting ----
set laststatus=2
set showmode
set noshowmode

" ---- search setting ----
set ignorecase 
set smartcase 
set hlsearch

" ---- command setting ----
set wildmenu
set history=5000

" ---- autoindent setting ----
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ---- neocomplete・neosnippet setting ----
if neobundle#is_installed('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#min_keyword_length = 3
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#auto_completion_start_length = 1
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

" ---- json setting ---
let g:vim_json_syntax_conceal = 0

" ---- encode setting ----
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
