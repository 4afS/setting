autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)

nnoremap <Space>q :AsyncRun<Space>

" exer 
autocmd BufRead,BufNewFile * nnoremap <Space>b :write<CR>:AsyncRun exer -build<CR>
autocmd BufRead,BufNewFile * nnoremap <Space>r :write<CR>:AsyncRun exer -run<CR>
