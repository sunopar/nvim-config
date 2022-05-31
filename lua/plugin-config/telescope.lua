local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- 窗口内快捷键
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		-- 内置 pickers 配置
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			theme = "ivy",
		},
	},
	extensions = {
		-- 扩展插件配置
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
			disable_devicons = false,
			default_workespace = ":CWD:",
			-- workspaces = {
			--   ["conf"]    = "/home/my_username/.config",
			--   ["data"]    = "/home/my_username/.local/share",
			--   ["project"] = "/home/my_username/projects",
			--   ["wiki"]    = "/home/my_username/wiki"
			-- }
		},
	},
})
