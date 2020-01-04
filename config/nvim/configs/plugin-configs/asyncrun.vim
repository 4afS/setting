autocmd BufRead,BufNewFile *.hs nnoremap <Space>b :write<CR>:AsyncRun stack build<CR>
autocmd BufRead,BufNewFile *.rs nnoremap <Space>b :write<CR>:AsyncRun cargo build<CR>
autocmd BufRead,BufNewFile *.ts nnoremap <Space>b :write<CR>:AsyncRun ng run<CR>

autocmd BufRead,BufNewFile *.py nnoremap <Space>r :write<CR>:AsyncRun python3 "%"<CR>

nnoremap <Space>q :AsyncRun<Space>

autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)
