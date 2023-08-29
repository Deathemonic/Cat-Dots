local M = {}

M.base_30 = {
  white = "#cad3f5", -- text
  darker_black = "#181926", -- crust
  black = "#24273a", -- base
  black2 = "#1e2030", -- mantle
  one_bg = "#363a4f", -- surface0
  one_bg2 = "#494d64", -- surface1
  one_bg3 = "#5b6078", -- surface2
  grey = "#6e738d", -- overlay0
  grey_fg = "#8087a2", -- overlay1
  grey_fg2 = "#939ab7", -- overlay2
  light_grey = "#a5adcb", -- subtext0
  red = "#ed8796", -- red
  baby_pink = "#f0c6c6", -- flamingo
  pink = "#f5bde6", -- pink
  line = "#494d64", -- surface1 
  green = "#a6da95", -- green
  vibrant_green = "#8bd5ca", -- teal
  nord_blue = "#7dc4e4", -- sapphire
  blue = "#8aadf4", -- blue
  yellow = "#eed49f", -- yellow
  sun = "#f5a97f", -- peach
  purple = "#c6a0f6", -- mauve
  dark_purple = "#ee99a0", -- maroon
  teal = "#8bd5ca", -- teal
  orange = "#f5a97f", -- peach
  cyan = "#91d7e3", -- sky
  statusline_bg = "#1e2030", -- mantle
  lightbg = "#363a4f", -- surface0
  pmenu_bg = "#a6da95", -- green
  folder_bg = "#8aadf4", -- blue
  lavender = "#b7bdf8", -- lavender
}

M.base_16 = {
  base00 = "#24273a", -- base
  base01 = "#1e2030", -- mantle
  base02 = "#181926", -- crust
  base03 = "#363a4f", -- surface0
  base04 = "#494d64", -- surface1
  base05 = "#a5adcb", -- subtext0
  base06 = "#b8c0e0", -- subtext1
  base07 = "#cad3f5", -- text
  base08 = "#ed8796", -- red
  base09 = "#f5a97f", -- peach
  base0A = "#eed49f", -- yellow
  base0B = "#a6da95", -- green
  base0C = "#91d7e3", -- sky
  base0D = "#8aadf4", -- blue
  base0E = "#c6a0f6", -- mauve
  base0F = "#ed8796", -- red
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin-macchiato")

return M
