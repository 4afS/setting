autocmd BufRead,BufNewFile *.hs nnoremap <Space>q :write<CR>:!stack run<CR>
autocmd BufRead,BufNewFile *.py nnoremap <Space>q :write<CR>:!python3 "%"<CR>
autocmd BufRead,BufNewFile *.rs nnoremap <Space>q :write<CR>:!cargo run<CR>
