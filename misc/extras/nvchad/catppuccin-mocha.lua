local M = {}

M.base_30 = {
  white = "#cdd6f4", -- text
  darker_black = "#11111b", -- crust
  black = "#1e1e2e", -- base
  black2 = "#181825", -- mantle
  one_bg = "#313244", -- surface0
  one_bg2 = "#45475a", -- surface1
  one_bg3 = "#585b70", -- surface2
  grey = "#6c7086", -- overlay0
  grey_fg = "#7f849c", -- overlay1
  grey_fg2 = "#9399b2", -- overlay2
  light_grey = "#a6adc8", -- subtext0
  red = "#f38ba8",
  baby_pink = "#eebebe", -- flamingo
  pink = "#f4b8e4", -- pink
  line = "#45475a", -- surface1 
  green = "#a6e3a1", -- green
  vibrant_green = "#94e2d5", -- teal
  nord_blue = "#85c1dc", -- sapphire
  blue = "#89b4fa", -- blue
  yellow = "#f9e2af", -- yellow
  sun = "#fab387", -- peach
  purple = "#cba6f7", -- mauve
  dark_purple = "#eba0ac", -- maroon
  teal = "#94e2d5", -- teal
  orange = "#fab387", -- peach
  cyan = "#89dceb", -- sky
  statusline_bg = "#181825", -- mantle
  lightbg = "#313244", -- surface0
  pmenu_bg = "#a6e3a1", -- green
  folder_bg = "#89b4fa", -- blue
  lavender = "#b4befe", -- lavender
}

M.base_16 = {
  base00 = "#1e1e2e", -- base
  base01 = "#181825", -- mantle
  base02 = "#11111b", -- crust
  base03 = "#313244", -- surface0
  base04 = "#45475a", -- surface1
  base05 = "#a6adc8", -- subtext0
  base06 = "#bac2de", -- subtext1
  base07 = "#cdd6f4", -- text
  base08 = "#f38ba8", -- red
  base09 = "#fab387", -- peach
  base0A = "#f9e2af", -- yellow
  base0B = "#a6e3a1", -- green
  base0C = "#89dceb", -- sky
  base0D = "#89b4fa", -- blue
  base0E = "#cba6f7", -- mauve
  base0F = "#f38ba8", -- red
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin-mocha")

return M
