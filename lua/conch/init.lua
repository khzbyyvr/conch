-- Imports the plugin's additional Lua modules.
local fetch = require("conch.fetch")
local update = require("conch.update")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.
local M = {}

-- Routes calls made to this module to functions in the
-- plugin's other modules.
M.fetch_todos = fetch.fetch_todos
M.create_todo = update.create_todo
M.insert_todo = update.insert_todo
M.complete_todo = update.complete_todo

return M
