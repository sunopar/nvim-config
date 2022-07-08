local gps = require("nvim-gps")
-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

local gps = require("nvim-gps")

local function gps_content()
	if gps.is_available() then
		return gps.get_location()
	else
		return ""
	end
end
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end
lualine.setup({
	options = {
		theme = "tokyonight",
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
    lualine_b = { {'diff', source = diff_source}, },
		lualine_c = {
			{ gps_content, cond = gps.is_available },
			{
				"lsp_progress",
				display_components = { "lsp_client_name", { "title", "percentage" } },
				spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
			},
		},
		-- lualine_c = {
		-- 	"filename",
		-- 	{
		-- 		"lsp_progress",
		-- 		spinner_symbols = { " ", " ", " ", " ", " ", " " },
		-- 	},
		-- },
		lualine_x = { "diagnostics" },
		lualine_y = {
			{ "filetype", colored = true, icon_only = true },
			-- {
			-- 	"fileformat",
			-- 	symbols = {
			-- 		unix = "", -- e712
			-- 		dos = "", -- e70f
			-- 		mac = "", -- e711
			-- 	},
			-- 	-- symbols = {
			-- 	--   unix = "LF",
			-- 	--   dos = "CRLF",
			-- 	--   mac = "CR",
			-- 	-- },
			-- },
			-- "encoding",
		},
	},
})
