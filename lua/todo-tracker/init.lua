local config = require("todo-tracker.config")
local ui = require("todo-tracker.ui")
local M = {}

function M.setup(opts)
	config.setup(opts)

	vim.api.nvim_create_user_command("TodoTrackerAdd", ui.add_comment, {})

	vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
		pattern = "*",
		callback = function()
			config.apply_highlights()
		end,
	})
end

return M
