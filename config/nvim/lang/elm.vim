call coc#config('languageserver.elmLS', {
\  "command": "elm-language-server",
\  "args": ["--stdio"],
\  "filetypes": ["elm"],
\  "rootPatterns": ["elm.json"],
\  "initializationOptions": {
\    "elmPath": "elm",
\    "elmFormatPath": "elm-format",
\    "elmTestPath": "elm-test",
\    "diagnosticsOnSaveOnly": 0,
\  },
\})

" ---- elm-vim ----
let g:elm_format_autosave = 0
let g:elm_setup_keybinding = 0
let g:elm_jump_to_error = 0

" ---- tab ----
set tabstop=4
set shiftwidth=4
set softtabstop=4
