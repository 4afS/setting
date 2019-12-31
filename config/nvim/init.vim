runtime configs/plug.vim
runtime configs/plug-config.vim

runtime configs/initial.vim
runtime configs/theme.vim
runtime configs/filetype.vim
runtime configs/keymap.vim

let configs = split(glob("$XDG_CONFIG_HOME/nvim/configs/plugin-configs/*.vim"), "\n")
for config in configs
  exe 'source' config
endfor

au Filetype haskell runtime lang/haskell.vim
au Filetype scala runtime lang/scala.vim
au Filetype rust runtime lang/rust.vim
au Filetype elm runtime lang/elm.vim
au Filetype c,cpp runtime lang/c.vim
