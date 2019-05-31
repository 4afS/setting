" Plug
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Required:
call plug#begin('~/.vim/plugged')
  " for Vim
  if !has('nvim')
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " Plug help
  Plug 'junegunn/vim-plug'
  " deoplete
  Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/unite.vim'
  " color scheme
  Plug 'kristijanhusak/vim-hybrid-material'
  " status line
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'
  " indent line
  Plug 'Yggdroot/indentLine'
  " for .json files
  " syntax highlight
  Plug 'derekwyatt/vim-scala', {'for': ['kotlin']}
  Plug 'udalov/kotlin-vim', {'for': ['kotlin']}
  Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
  Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}
  Plug 'kana/vim-filetype-haskell', {'for': ['haskell']}
  Plug 'elzr/vim-json', {'for': ['json']}
  " quickrun
  Plug 'thinca/vim-quickrun'
  Plug 'Shougo/vimproc.vim', {'build' : 'make'}
  " complete (), {}, etc
  Plug 'tpope/vim-surround'
  " highlight words
  Plug 'osyo-manga/vim-over'
  " directory tree
  Plug 'scrooloose/nerdtree'
  " comment out
  Plug 'tomtom/tcomment_vim'
  " shell commands
  Plug 'tpope/vim-eunuch'
  " complement paretheses
  Plug 'cohama/lexima.vim'
  " language server
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ }
  Plug 'junegunn/fzf'

call plug#end()

let $PATH = $PATH . ':' . expand('~/.local/bin')

" ---- enable plugins ----
let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 1

" ---- Haskell  ----
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

" HIE
set hidden

let g:LanguageClient_rootMakers = {
  \ 'haskell': ['stack.yaml']
  \ } 
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie-wrapper'],
  \ 'c': ['clangd'],
  \ 'python':['pyls']
  \ }

" LanguageClientの機能のショートカットを登録
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <silent> <Alt>r :call LanguageClient_contextMenu()<CR>
    map <silent> <Leader>lt :call LanguageClient#textDocument_hover()<CR>
    map <silent> <Leader>lg :call LanguageClient#textDocument_definition()<CR>
    map <silent> <Leader>lr :call LanguageClient#textDocument_rename()<CR>
    map <silent> <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
    map <silent> <Leader>lb :call LanguageClient#textDocument_references()<CR>
    map <silent> <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
    map <silent> <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
  endif
endfunction

augroup LanguageClientKeyconfig
  autocmd!
  autocmd Filetype * call LC_maps()
augroup END

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap
" ---- filetype ----
autocmd BufRead, BufRead, BufNewFile *.ts set filetype=typescript

" ---- ALE ----
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_statusline_format = ['E%d', 'W%d', 'ok']

" ---- Theme ----
set t_Co=256
syntax on
set background=dark
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid_material

if (has("termguicolors"))
  set termguicolors
endif

" ---- template  ----
let g:sonictemplate_vim_template_dir = ['~/.vim/template']
autocmd BufNewFile *.c 0r $HOME/Program/C2/template.c

" ---- display  ----
set number 
set title 
set nocursorline 
set guioptions-=m
set inccommand=split
let loaded_matchparen=1

" ---- tab  ----
set expandtab
set tabstop=2 
set shiftwidth=2
set smartindent
set autoindent
set softtabstop=2

" ---- input  ----
set backspace=indent,eol,start

" ---- statusline  ----
set laststatus=2
set noshowmode

" ---- search  ----
set ignorecase 
set smartcase 
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ---- command  ----
set wildmenu
set history=5000

" ---- autoindent  ----
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
nnoremap ; :

nnoremap <C-k> :QuickRun<CR><C-w>j

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <Space>o :TComment<CR>
vnoremap <Space>o :TComment<CR>

" ESC in terminal
tnoremap <ESC> <C-\><C-N>

" split
nnoremap <Space>s :vsplit<CR>
nnoremap <Space>c :close<CR>
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>h <C-w>h

" tab
nnoremap <Space>t :tabnew<CR>
nnoremap <C-h> gT
nnoremap <C-l> gt

let g:tcomment_maps = 0

" ---- terminal ----
set shell=bash

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" ---- quickrun  ----
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

" ---- json  ---
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

" ---- Search with Hoogle from command :Hoogle ... ----
command! -nargs=? Hoogle call s:SearchWithHoogle(<f-args>)
function! s:SearchWithHoogle(...)
    if a:0 > 0
        let keywords = "/?hoogle=" . a:1
    else
        let keywords = ""
    endif
    execute "terminal links2 https://www.haskell.org/hoogle" . keywords
endfunction

" ---- encode  ----
set encoding=utf-8
