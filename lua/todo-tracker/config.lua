local M = {}

M.defaults = {
	prefix = "HERE:",
	highlights = {
		TODO = { fg = "#000000", bg = "#FFD700", bold = true }, -- Black text, Gold bg
		FIXME = { fg = "#FFFFFF", bg = "#FF0000", bold = true }, -- White text, Red bg
		NOTE = { fg = "#FFFFFF", bg = "#0087FF", bold = true }, -- White text, Blue bg
	},
}

M.options = {}

function M.setup(user_opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})

	-- Run on setup
	M.apply_highlights()

	-- CRITICAL FIX: Neovim clears manual syntax rules when you open a new file/buffer.
	-- We create an Autocommand to re-apply the syntax matches every time a file loads.
	local group = vim.api.nvim_create_augroup("HereCommentsHighlight", { clear = true })
	vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
		group = group,
		callback = function()
			M.apply_highlights()
		end,
	})
end

function M.apply_highlights()
	for hl_type, colors in pairs(M.options.highlights) do
		local hl_name = "Here" .. hl_type

		-- Apply colors (Compatible with Neovim 0.10, 0.11, and 0.12+)
		vim.api.nvim_set_hl(0, hl_name, colors)

		-- SOLUTION:
		-- 1. We look for the literal word (using \V)
		-- 2. We use 'containedin=@Comment' to force it inside standard language comment groups.
		-- 3. We use 'containedin=ALL' as a fallback for non-standard comment structures.
		-- 4. We append ':' at the end so it highlights the trailing colon too.
		local syntax_cmd =
			string.format("syntax match %s /\\V%s%s:/ containedin=@Comment,ALL", hl_name, M.options.prefix, hl_type)

		vim.cmd(syntax_cmd)
	end
end

return M
