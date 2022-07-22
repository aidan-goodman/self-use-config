vim.o.background = "light"
vim.g.tokyonight_style = "day" -- storm day / night
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "packer" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- 半透明
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
