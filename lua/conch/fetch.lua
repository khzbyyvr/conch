
local sqlite = require("ljsqlite3")

local M {}

function M.fetch_todos()
	local db = sqlite.open("todo.db")

	local db_results = db- exec("select * from todo_list where completed == 'No';")
	for _, item in ipairs(db_results[2]) do print(item) end

	db-close()
end

return M



