-- lua/todo-tracker/ui.lua
local config = require("todo-tracker.config")
local M = {}

function M.add_comment()
	local choices = { "TODO", "FIXME", "NOTE" }

	vim.ui.select(choices, {
		prompt = "Select Tag Type:",
	}, function(choice)
		if not choice then
			return
		end

		vim.ui.input({ prompt = "Enter your " .. choice .. " message: " }, function(input_text)
			if not input_text or input_text == "" then
				return
			end

			local prefix = config.options.prefix or "HERE:"
			local formatted_tag = string.format("%s%s: %s", prefix, choice, input_text)
			local comment_string = vim.bo.commentstring

			local final_text
			if comment_string and comment_string ~= "" then
				if comment_string:find("%%s") then
					final_text = string.format(comment_string, formatted_tag)
				else
					final_text = comment_string .. " " .. formatted_tag
				end
			else
				final_text = formatted_tag
			end

			local cursor_info = vim.api.nvim_win_get_cursor(0)
			local current_row = cursor_info[1]

			vim.api.nvim_buf_set_lines(0, current_row - 1, current_row, false, { final_text })
		end)
	end)
end

return M
