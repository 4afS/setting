"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tia/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/tia/.cache/dein')
    call dein#begin('/home/tia/.cache/dein')

" Let dein manage dein
" Required:
    call dein#add('/home/tia/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here:
    " deoplete related
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neco-syntax')
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
    " run program on vim
    call dein#add('thinca/vim-quickrun')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    " complete (), {}, etc
    call dein#add('cohama/lexima.vim')

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
set t_ut=
set background=dark
colorscheme hybrid

" ---- template setting ----
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile Makefile.* 0r $HOME/.vim/template/Makefile.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt 

" ---- language setting ----
au BufNewFile,BufRead *.scala setf scala
autocmd BufRead,BufNewFile *.scala setfiletype scala

" ---- display setting ----
set number 
"set cursorline
set title 
set showmatch 
set guioptions-=m

" ---- tab setting ----
set expandtab
set tabstop=4 
set shiftwidth=4
set smartindent
set autoindent
set softtabstop=4

" ---- input setting ----
set backspace=indent,eol,start

" ---- statusline setting ----
set laststatus=2
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
"   Ctrl+k : Jump target
"   Tab    : Select snippet AND Jump target
"   Ctrl+n : Move cursol
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

" ---- key-mappings ----
nnoremap <C-k> :write<CR>:QuickRun<CR>

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" ---- quickrun setting ----
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\       "outputter/buffer/split" : ":botright 8sp",
\       "utputter/error/success" : "buffer",
\       "outputter/error/error" : "buffer",
\   }
\}


" ---- json setting ---
let g:vim_json_syntax_conceal = 0

" ---- encode setting ----
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
