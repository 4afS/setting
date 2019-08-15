call coc#config('languageserver.metals', {
      \ "command": "metals-vim",
      \ "rootPatterns": ["build.sbt"],
      \ "filetypes": ["scala", "sbt"],
      \})
