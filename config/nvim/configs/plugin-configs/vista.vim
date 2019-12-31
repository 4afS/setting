let g:vista_icon_indent = ["▸ ", "▸ "]

let g:vista_default_executive = 'coc'

let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 0

nnoremap <C-l>v :Vista!!<CR>
