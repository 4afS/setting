set laststatus=2
set noshowmode
set cmdheight=2

let g:airline_powerline_fonts = 1

" extentions
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#vista#enabled = 0

let g:airline_section_y = airline#section#create(['filetype'])

function! LineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '
endfunction
call airline#parts#define('linenr', {'function': 'LineNumber'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', '%2v'])

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" coc
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '#'
let airline#extensions#coc#warning_symbol = '!'

" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <silent> bn :enew<CR>
nnoremap <silent> bh :bp<CR>
nnoremap <silent> bl :bn<CR>
nnoremap <silent> bc :bd<CR>
nnoremap <silent> bC :bd!<CR>

" asyncrun
function! AirlineThemePatch(palette)
  let a:palette.accents.running = [ '', '', '', '', '' ]
  let a:palette.accents.success = [ '#D6FFAF', '' , 'green', '', '' ]
  let a:palette.accents.failure = [ '#ff6060', '' , 'red', '', '' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

let g:async_status_old = ''

function! Get_asyncrun_running()
  let async_status = g:asyncrun_status
  if async_status != g:async_status_old
    if async_status == 'running'
      call airline#parts#define_accent('asyncrun_status', 'running')
    elseif async_status == 'success'
      call airline#parts#define_accent('asyncrun_status', 'success')
    elseif async_status == 'failure'
      call airline#parts#define_accent('asyncrun_status', 'failure')
    endif
    let g:airline_section_x = airline#section#create(['asyncrun_status'])
    AirlineRefresh
    let g:async_status_old = async_status
  endif
  return async_status
endfunction

call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status'])

