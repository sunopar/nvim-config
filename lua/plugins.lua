local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 你的插件列表...
		-- tokyonight
		use("folke/tokyonight.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
		})
		-- 顶部标签页
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

		-- 底部信息显示
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope with frecency
		use({
			"nvim-telescope/telescope-frecency.nvim",
			config = function()
				require("telescope").load_extension("frecency")
			end,
			requires = { "tami5/sqlite.lua" },
		})
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		--------------------- LSP --------------------
		use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- ui
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- 代码格式化
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		use({
			"creativenull/efmls-configs-nvim",
			requires = { "neovim/nvim-lspconfig" },
		})
		-- JSON 增强
		use("b0o/schemastore.nvim")
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		-- 代码自动注释
		use("numToStr/Comment.nvim")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		-- easymotion 替代方案
		use({
			"phaazon/hop.nvim",
			branch = "v1", -- optional but strongly recommended
		})
		use({
			"lewis6991/gitsigns.nvim",
		})
		-- 展示有哪些keybindings
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
		-- 类似vscode展示
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		-- 底部tabbar展示cursor 代码outline
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require("nvim-gps").setup()
			end,
		})
		-- show symbols outline
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup()
			end,
		})
		-- terminal 终端
		use({
			"akinsho/toggleterm.nvim",
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({
					border = "single",
				})
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
