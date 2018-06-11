"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/right/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/right/.cache/dein')
    call dein#begin('/home/right/.cache/dein')

" Let dein manage dein
" Required:
    call dein#add('/home/right/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here:
    " deoplete
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neco-syntax')
    call dein#add('zchee/deoplete-clang')   " for clang
"    call dein#add('zchee/deoplete-jedi')    " for python
    " if it is not nvim
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    " color scheme
    call dein#add('w0ng/vim-hybrid')
    " status line
    call dein#add('itchyny/lightline.vim')
    " indent line
    call dein#add('Yggdroot/indentLine')
    " for .json files
    call dein#add('elzr/vim-json')
    " syntax highlight for any language
    call dein#add('derekwyatt/vim-scala')

" Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ---- enable plugins ----
let g:deoplete#enable_at_startup = 1

" ---- Theme ----
set t_Co=256
syntax on
set background=dark
colorscheme hybrid

" ---- template setting ----
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile Makefile.* 0r $HOME/.vim/template/Makefile.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt 
autocmd BufNewFile *.scala 0r $HOME/.vim/template/scala.txt 

" ---- language setting ----
au BufNewFile,BufRead *.scala setf scala
autocmd BufRead,BufNewFile *.scala setfiletype scala

" ---- display setting ----
set number 
set cursorline
set title 
set showmatch 

" ---- tav setting ----
set expandtab
set tabstop=4 
set shiftwidth=4
set smartindent
set autoindent
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

" ---- key-mappings for deoplete ----
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" ---- json setting ---
let g:vim_json_syntax_conceal = 0

" ---- encode setting ----
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
