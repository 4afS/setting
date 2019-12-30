set t_Co=256
syntax on
set background=dark
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid

if (has("termguicolors"))
  set termguicolors
endif
