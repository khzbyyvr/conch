

local fetch = require("example-plugin.fetch")
local update = require("example-plugin.update")



local M = {}

M.fetch_todos = fetch.fetch_todos
M.insert_todos = update.insert_todos
M.complete_todos = update.complete_todos

return M
