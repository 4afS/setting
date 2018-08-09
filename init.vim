" dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here:
    " deoplete related
    call dein#add('Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'})
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/unite.vim')
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
    call dein#add('neovimhaskell/haskell-vim')
    " run program on vim
    call dein#add('thinca/vim-quickrun')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    " complete (), {}, etc
    call dein#add('tpope/vim-surround')
    " Haskell plugins
    call dein#add('kana/vim-filetype-haskell')
    call dein#add('ujihisa/neco-ghc')
    " highlight replace 
    call dein#add('osyo-manga/vim-over')
    " show file free
    call dein#add('scrooloose/nerdtree')
    " to comment
    call dein#add('tomtom/tcomment_vim')
    " Add UNIX shell commands
    call dein#add('tpope/vim-eunuch')
    " Asynchronous Lint Engine
    call dein#add('w0rp/ale')


" Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
syntax enable
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" file path
let $PATH = $PATH . ':' . expand('~/.local/bin')

" ---- enable plugins ----
let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 1

" ---- Haskell setting ----
" syntax
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" indent
let g:haskell_indent_let = 4
let g:haskell_indent_if = 3
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_guard = 2
let g:haskell_indent_in = 1

" ---- Theme ----
set t_Co=256
syntax on
set background=dark
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid 
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" ---- template setting ----
let g:sonictemplate_vim_template_dir = ['~/.vim/template']

" ---- display setting ----
set number 
set title 
set showmatch 
set cursorline 
hi clear CursorLine
set guioptions-=m
set inccommand=split

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
nnoremap <C-k> :QuickRun<CR><C-w>j
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Space>o :TComment<CR>
vnoremap <Space>o :TComment<CR>

nnoremap <Space>s :vsplit<CR>
nnoremap <Space>c :close<CR>
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>h <C-w>h

let g:tcomment_maps = 0

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" ---- quickrun setting ----
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\       "outputter/buffer/split" : ":botright 10sp",
\       "utputter/error/success" : "buffer",
\       "outputter/error/error" : "buffer"
\   },
\
\   "python" : {
\       "command" : "python3",
\       "exec" : "%c %s"
\   },
\   
\   "haskell" : {
\       "command" : "stack",
\       "cmdopt" : "runghc",
\       "exec" : "%c %o %s"    
\   }
\}


:
" ---- json setting ---
let g:vim_json_syntax_conceal = 0

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" ---- encode setting ----
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
