set laststatus=2
set noshowmode
set cmdheight=2

let g:airline_powerline_fonts = 1

let g:airline#extensions#keymap#enabled = 0

let g:airline_section_y = ''

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '#'
let airline#extensions#coc#warning_symbol = '!'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber'})
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

