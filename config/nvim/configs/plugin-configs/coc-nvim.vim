" highlight
hi CocErrorSign guifg=#d1666a guibg=#353b45
hi CocInfoSign guifg=#63c95f guibg=#353b45
hi CocWarningSign guifg=#d1cd66 guibg=#353b45

" add extentions
call coc#add_extension(
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \)

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

nmap <silent> <C-l>d <Plug>(coc-definition)
nmap <silent> <C-l>r <Plug>(coc-references)

nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <C-l>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <C-l>a  <Plug>(coc-codeaction-selected)
nmap <C-l>a  <Plug>(coc-codeaction-selected)

nmap <C-l>ca  <Plug>(coc-codeaction)
nmap <C-l>f  <Plug>(coc-fix-current)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

nmap <C-l><C-f> :call CocAction('format')<CR>

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

nmap <C-l>i   :call     CocAction('runCommand', 'editor.action.organizeImport')<CR>

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
