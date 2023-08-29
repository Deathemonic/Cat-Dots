local M = {}

M.base_30 = {
  white = "#c6d0f5", -- text
  darker_black = "#232634", -- crust
  black = "#303446", -- base
  black2 = "#292c3c", -- mantle
  one_bg = "#414559", -- surface0
  one_bg2 = "#51576d", -- surface1
  one_bg3 = "#626880", -- surface2
  grey = "#737994", -- overlay0
  grey_fg = "#838ba7", -- overlay1
  grey_fg2 = "#949cbb", -- overlay2
  light_grey = "#a5adce", -- subtext0
  red = "#e78284",
  baby_pink = "#eebebe", -- flamingo
  pink = "#f4b8e4", -- pink
  line = "#51576d", -- surface1 
  green = "#a6d189", -- green
  vibrant_green = "#81c8be", -- teal
  nord_blue = "#85c1dc", -- sapphire
  blue = "#8caaee", -- blue
  yellow = "#e5c890", -- yellow
  sun = "#ef9f76", -- peach
  purple = "#ca9ee6", -- mauve
  dark_purple = "#ea999c", -- maroon
  teal = "#81c8be", -- teal
  orange = "#ef9f76", -- peach
  cyan = "#99d1db", -- sky
  statusline_bg = "#292c3c", -- mantle
  lightbg = "#414559", -- surface0
  pmenu_bg = "#a6d189", -- green
  folder_bg = "#8caaee", -- blue
  lavender = "#babbf1", -- lavender
}

M.base_16 = {
  base00 = "#303446", -- base
  base01 = "#292c3c", -- mantle
  base02 = "#232634", -- crust
  base03 = "#414559", -- surface0
  base04 = "#51576d", -- surface1
  base05 = "#a5adce", -- subtext0
  base06 = "#b5bfe2", -- subtext1
  base07 = "#c6d0f5", -- text
  base08 = "#e78284", -- red
  base09 = "#ef9f76", -- peach
  base0A = "#e5c890", -- yellow
  base0B = "#a6d189", -- green
  base0C = "#99d1db", -- sky
  base0D = "#8caaee", -- blue
  base0E = "#ca9ee6", -- mauve
  base0F = "#e78284", -- red
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin-frappe")

return M
