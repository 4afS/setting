" automatic installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug
call plug#begin('~/.vim/plugged')
  " for Vim
  if !has('nvim')
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " completion
    if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  if &filetype != 'haskell'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
  endif
  " color scheme
  Plug 'w0ng/vim-hybrid'
  " status line
  Plug 'itchyny/lightline.vim'
  " indent line
  Plug 'Yggdroot/indentLine'
  " syntax highlight
  Plug 'derekwyatt/vim-scala', {'for': ['scala']}
  Plug 'udalov/kotlin-vim', {'for': ['kotlin']}
  Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
  Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}
  Plug 'kana/vim-filetype-haskell', {'for': ['haskell']}
  Plug 'elzr/vim-json', {'for': ['json']}
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
  " paretheses
  Plug 'cohama/lexima.vim'
  Plug 'itchyny/vim-parenmatch'
  " language server
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh ',
    \ }
  Plug 'junegunn/fzf'
  " spelling
  Plug 'kamykn/spelunker.vim'

call plug#end()

let $PATH = $PATH . ':' . expand('~/.local/bin')

" ---- enable plugins ----
let g:deoplete#enable_at_startup = 1

" ---- Theme ----
set t_Co=256
syntax on
set background=dark
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid

if (has("termguicolors"))
  set termguicolors
endif

" ---- template ----
let g:sonictemplate_vim_template_dir = ['~/.vim/template']
autocmd BufNewFile *.c 0r $HOME/Program/C2/template.c
set completeopt=noinsert,menuone,noselect  

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

" ---- statusline  ----
set laststatus=2
set noshowmode
set cmdheight=3

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

" ---- key-mapping ----
nnoremap ; :

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

" LanguageClient
nnoremap <silent> <C-l> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <C-l>c :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <C-l>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-l>f :call LanguageClient#textDocument_formatting()<CR>

" Hoogle
nnoremap <silent> <C-l>t :HoogleWord<CR>

" ---- terminal ----
set shell=bash

" ---- like quickrun ----
autocmd BufRead,BufNewFile *.hs nnoremap <Space>q :!stack run<CR>
autocmd BufRead,BufNewFile *.py nnoremap <Space>q :!python3 "%"<CR>
autocmd BufRead,BufNewFile *.rs nnoremap <Space>q :!cargo run<CR>

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

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

" ---- HIE ----
set hidden

let g:LanguageClient_rootMakers = {
  \ 'haskell': ['stack.yaml'],
  \ } 
let g:LanguageClient_serverCommands = {
  \ 'haskell': ['hie-wrapper'],
  \ 'c': ['clangd'],
  \ 'Python':['pyls'],
  \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
  \ }

" ---- LanguageClient ----
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

" ---- filetype ----
autocmd BufRead, BufRead, BufNewFile *.ts set filetype=typescript

" ---- ALE ----
let g:ale_echo_msg_format = '[%linter%] %s'

" ---- Spelling ----
highlight SpelunkerSpellBad cterm=underline

" ---- deoplete ----
" use <tab> key for completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

imap <CR> <Plug>(neosnippet_expand_or_jump)
smap <CR> <Plug>(neosnippet_expand_or_jump)

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

" ---- Hoogle ----
command! -nargs=* H call s:HoogleCommand(<f-args>)
function! s:HoogleCommand(...)
  let cmd = ["!hoogle --count=15 -q "]
  if a:0 <= 0
    echo cmd = "No args"
  elseif a:0 == 1
    let cmd = cmd[0] . a:1
  else
    let cmd = [(cmd[0] . " \"" . a:1)]
    call extend(cmd, a:000[1:])
    let cmd =  join(cmd) . "\""
  endif
  execute cmd
endfunction

command! -nargs=0 HoogleWord call s:HoogleWord()
function! s:HoogleWord()
  let search_word = expand("<cword>")
  if strlen(search_word) >= 1
    execute "!hoogle --count=1 -q " . search_word
  endif
endfunction

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
