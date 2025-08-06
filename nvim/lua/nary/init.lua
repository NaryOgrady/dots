require("nary.remap")
require("nary.set")
require("nary.lazy")

-- Initialize status line
require("lualine").setup({})

local ns_id = vim.api.nvim_create_namespace("vline")

local function add_virtual_lines(num_lines)
	local virt_lines = {}

	-- clear virtual lines
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
	-- Generate virtual lines dynamically
	for i = 1, num_lines do
		table.insert(virt_lines, { { " ", "Comment" } })
	end

	-- Set the virtual lines at the top of the buffer
	vim.api.nvim_buf_set_extmark(0, ns_id, 0, 0, {
		virt_lines = virt_lines,
		virt_lines_above = true,
	})
end

-- Auto command to add virtual lines when a file is opened
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		add_virtual_lines(30)
	end,
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	callback = function()
		add_virtual_lines(30)
	end,
})

-- vim.api.nvim_create_autocmd("BufUnload", {
-- 	callback = function()
-- 		vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
-- 	end,
-- })

-- init godot server when needed
local gdproject = io.open(vim.fn.getcwd() .. "/project.godot", "r")
if gdproject then
	io.close(gdproject)
	vim.fn.serverstop("./godothost")
	vim.fn.serverstart("./godothost")
end

-- Auto-fix Jedi after Mason installs/updates it
local mason_registry = require("mason-registry")

local function fix_jedi()
	local jedi = mason_registry.get_package("jedi-language-server")
	if jedi:is_installed() then
		local venv_path = jedi:get_install_path() .. "/venv/bin/pip"
		vim.fn.jobstart({ venv_path, "install", "--upgrade", "jedi", "pygls" }, {
			stdout_buffered = true,
			on_stdout = function(_, data)
				if data then
					print(table.concat(data, "\n"))
				end
			end,
			on_stderr = function(_, data)
				if data then
					print("Error: " .. table.concat(data, "\n"))
				end
			end,
		})
	end
end

-- Run after Mason finishes installing stuff
mason_registry.refresh(fix_jedi)
