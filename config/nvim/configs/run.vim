autocmd BufRead,BufNewFile *.hs nnoremap <Space>q :write<CR>:AsyncRun stack run<CR>
autocmd BufRead,BufNewFile *.py nnoremap <Space>q :write<CR>:AsyncRun python3 "%"<CR>
autocmd BufRead,BufNewFile *.rs nnoremap <Space>q :write<CR>:AsyncRun cargo run<CR>
