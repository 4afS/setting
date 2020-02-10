nnoremap <silent> <C-l><C-f> :Neoformat<CR>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
