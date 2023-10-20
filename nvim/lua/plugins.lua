-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("正在安装Pakcer.nvim，请稍后...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		-- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("没有安装 packer.nvim")
	return
end

packer.startup({
	function(use)
		-- Packer 可以升级自己
		use({
			"wbthomason/packer.nvim",
			commit = "4dedd3b"
		})
		--------------------- colorschemes --------------------
		-- tokyonight
		use({
			"folke/tokyonight.nvim",
			commit = "8223c97"
		})
		------------------------ tools ------------------------
		-- nvim-tree
		use({
			"kyazdani42/nvim-tree.lua",
			commit = "949913f",
			requires = {
				"kyazdani42/nvim-web-devicons",
				commit = "b34362b"
			}
		})
		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			commit = "f4af7e5",
			requires = {
				"moll/vim-bbye",
				commit = "903f5eb"
			}
		})
		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			commit = "a4e4517"
		})
		use({
			"arkav/lualine-lsp-progress",
			commit = "56842d0"
		})
		-- floa term
		use({
			"voldikss/vim-floaterm",
			commit = "bcaeabf"
		})
		----------------- open file or project ----------------
		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			commit = "776b509",
			requires = {
				"nvim-lua/plenary.nvim",
				commit = "6aeb98d"
			},
		})
		-- telescope extensions
		use({
			"LinArcX/telescope-env.nvim",
			commit = "5c04e1d"
		})
		use({
			"nvim-telescope/telescope-ui-select.nvim",
			commit = "62ea5e5"
		})
		-- dashboard-nvim
		use({
			"glepnir/dashboard-nvim",
			commit = "88a6077"
		})
		-- project
		use({
			"ahmedkhalf/project.nvim",
			commit = "612443b"
		})
		---------------------- edit code----- -----------------
		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "69388e8"
		})
		use({
			"p00f/nvim-ts-rainbow",
			commit = "190f8c8"
		})
		if paccker_bootstrap then
			packer.sync()
		end
	end,
	config = {
		-- 锁定插件版本在snapshots目录
		-- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
		-- 这里锁定插件版本在v1，不会继续更新插件
		-- snapshot = "v-1",

		-- 最大并发数
		max_jobs = 16,
		-- display = {
		-- 使用浮动窗口显示
		--   open_fn = function()
		--     return require("packer.util").float({ border = "single" })
		--   end,
		-- },
	},
})
