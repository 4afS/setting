let configs = split(glob("./configs/plugin-configs/*.vim"), "\n")
for config in configs
  echo config
endfor
