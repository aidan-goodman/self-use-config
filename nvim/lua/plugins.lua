-- Configure packer
local packer = require "packer" packer.init {
	auto_clean = true,
	compile_on_sync = true,
	display = {prompt_border = 'rounded'}
}

-- init config
packer.init({
	-- 并发数限制
	max_jobs = 30,
	-- 自定义源
	git = {
		-- 减少超时时间
		clone_timeout = 288,
		default_url_format = "git@github.com:%s"
		-- default_url_format = "https://hub.fastgit.xyz/%s",
		-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
		-- default_url_format = "https://gitcode.net/mirrors/%s",
		-- default_url_format = "https://gitclone.com/github.com/%s",
	},
})

packer.startup(function(use)
	-- Packer 可以管理自己本身
	use 'wbthomason/packer.nvim'
	--------------------- colorschemes --------------------
	-- tokyonight
	use 'folke/tokyonight.nvim'
	------------------------ tools ------------------------
	-- nvim-tree
	use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}
	-- bufferline
	use {"akinsho/bufferline.nvim", requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}}
	-- lualine
	use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
	use "arkav/lualine-lsp-progress"
	----------------- open file or project ----------------
	-- telescope
	use {'nvim-telescope/telescope.nvim', requires = {"nvim-lua/plenary.nvim"}}
	-- telescope extensions
	use "LinArcX/telescope-env.nvim"
	-- dashboard-nvim
	-- todo update use("glepnir/dashboard-nvim")$$$$$$$$$$$$$$$$$$$$
	use {"glepnir/dashboard-nvim", commit = "a36b3232c98616149784f2ca2654e77caea7a522"}
	-- project
	use "ahmedkhalf/project.nvim"
	---------------------- edit code----- -----------------
	-- treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
end)

-- 自动更新插件
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
