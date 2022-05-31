-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.comment")
require("plugin-config.hop")
require("plugin-config.gitsigns")
require("plugin-config.aerial")

-- 内置LSP
require("lsp.setup") -- 管理LSP安装卸载，以及语言配置
require("lsp.cmp") -- 自动补全
require("lsp.ui")
require("lsp.null-ls") -- 格式化
