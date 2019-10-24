call coc#config('languageserver.purescript', {
      \     "command": "purescript-language-server",
      \     "args": ["--stdio"],
      \     "filetypes": ["purescript"],
      \"rootPatterns": ["bower.json", "psc-package.json", "spago.dhall"]
      \   }
      \}
