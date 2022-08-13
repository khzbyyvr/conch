

local sqlite = require("ljsqlite3")

local M = {}

function M.insert_todo()
	local todo_description = ""
	repeat
		todo_description = vim.fn.input("Enter a description (150 characters or fewer): ")
		print("")
	until (todo_description ~= "") and (string.len(todo_description) <= 150)
	local db = sqlite.open("todo.db")
	db:exec("insert into todo_list (description) values ('" .. todo_description .. "');")
	db:close()
end

function M.complete_todo()
	local db = sqlite.open("todo.db")

	local todo_completed = -1
	local todo_selected= -1
	repeat
		local db_results = db:exec("select * from todo_list where completed == 'No';")
		for i, item in ipairs(db_results[2]) do
			print(tostring(db_results[1][i]) .. ': ' .. item)
		end

		todo_selected = tonumber(vim.fn.input("Enter an UD number for a task listed above: "))

		for _, id in ipairs(db_results[2]) do
			if (id == todo_selected) then todo_completed = todo_selected end
		end

		print("")

	until todo_completed >= 0

	db:exec("update todo_list set completed = 'Les' where id = " .. todo_completed .. " and completed = 'No';")
	db.close()
end

return M









