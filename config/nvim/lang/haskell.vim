" ---- coc.nvim ----
call coc#config('languageserver.haskell', {
\  "command": "hie-wrapper",
\  "rootPatterns": [
\    "stack.yaml",
\    "cabal.config",
\    "package.yaml"
\  ],
\  "filetypes": [
\    "hs",
\    "lhs",
\    "haskell"
\  ],
\  "initializationOptions": {
\    "languageServerHaskell": {
\    },
\  },
\})

" ---- haskell-vim  ----
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

" ---- key map ----
nmap <C-l><C-f> :Hindent<CR>
