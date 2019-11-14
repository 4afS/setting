" ---- key-mapping ----
nnoremap ; :
nnoremap j gj
nnoremap k gk

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <Space>o :TComment<CR>
vnoremap <Space>o :TComment<CR>

" ESC in terminal
tnoremap <ESC> <C-\><C-N>

" split
nnoremap <Space>s :vsplit<CR>
nnoremap <Space>c :close<CR>
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>h <C-w>h
nnoremap <Space>J <C-w>J
nnoremap <Space>K <C-w>K
nnoremap <Space>L <C-w>L
nnoremap <Space>H <C-w>H
nnoremap tj <C-w><
nnoremap tk <C-w>>

" tab
nnoremap <Space>t :tabnew<CR>
nnoremap th gT
nnoremap tl gt

let g:tcomment_maps = 0

" Hoogle
nnoremap <silent> <C-l>w :HoogleWord<CR>

" anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)

" fzf
nnoremap <C-f>f :Files<CR>
nnoremap <C-f>c :Commands<CR>
nnoremap <C-f>l :Locate<Space>

