local status, efmls = pcall(require, "efmls-configs")
if not status then
	vim.notify("没有找到 efmls")
	return
end

local vint = require("efmls-configs.linters.vint")
local eslint = require("efmls-configs.linters.eslint")
local shellcheck = require("efmls-configs.linters.shellcheck")

local black = require("efmls-configs.formatters.black")
local luafmt = require("efmls-configs.formatters.stylua")
local clangfmt = {
	formatCommand = "clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4}'",
	formatStdin = true,
}
local prettier = require("efmls-configs.formatters.prettier")
local shfmt = require("efmls-configs.formatters.shfmt")

efmls.init({
	-- Your custom attach function
	-- on_attach = on_attach,

	-- Enable formatting provided by efm langserver
	init_options = {
		documentFormatting = true,
		codeAction = true,
	},
})

efmls.setup({
	vim = { formatter = vint },
	lua = { formatter = luafmt },
	python = { formatter = black },
	vue = { formatter = prettier },
	typescript = { formatter = prettier, linter = eslint },
	javascript = { formatter = prettier, linter = eslint },
	typescriptreact = { formatter = prettier, linter = eslint },
	javascriptreact = { formatter = prettier, linter = eslint },
	yaml = { formatter = prettier },
	html = { formatter = prettier },
	css = { formatter = prettier },
	scss = { formatter = prettier },
	sh = { formatter = shfmt, linter = shellcheck },
	markdown = { formatter = prettier },
	-- rust = {formatter = rustfmt},
})
