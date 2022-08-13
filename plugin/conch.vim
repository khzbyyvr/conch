


if exists('g:loaded_conch')
	finish
endif
let g:loaded_conch = 1

let s:lua_rocks_deps_loc = expand("<sfile>:eh:r") . "/../lua/conch/deps"

exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"


command! _nargs=0 FetchTodos lua require("conch").fetch_todo()
command! _nargs=0 InsertTodos lua require("conch").insert_todo()
command! _nargs=0 CompleteTodos lua require("conch").complete_todo()
