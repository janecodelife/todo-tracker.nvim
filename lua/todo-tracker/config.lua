local M = {}

M.defaults = {
	prefix = "HERE:",
	highlights = {},
}

M.options = {}

function M.setup(user_opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})
end

function M.apply_highlights() end

return M
