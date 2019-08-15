set laststatus=2
set noshowmode
set cmdheight=3
let g:lightline = {
\   'colorscheme': 'one',
\   'active': {
\     'left': [
\       ['mode', 'paste'], 
\       ['readonly', 'gitgutter', 'anzu', 'absolutepath', 'modified']
\     ],
\     'right': [
\       ['lineinfo'],
\       ['percent'],
\       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\       ['fileencoding', 'filetype']
\     ]
\   },
\   'component_function': {
\     'gitgutter': 'MyGitGutter',
\     'anzu': 'anzu#search_status'
\   }
\ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#lsc#checking',
      \  'linter_warnings': 'lightline#lsc#warnings',
      \  'linter_errors': 'lightline#lsc#errors',
      \  'linter_ok': 'lightline#lsc#ok',
      \ }

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
    return ''
  endif
  let symbols = [
        \ '+ ',
        \ '~ ',
        \ '- '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction
