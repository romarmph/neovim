-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
-- stylua: ignore
local colors = {
  -- bg       = '#10131a',
  bg       = 'NONE',
  fg       = '#737c8c',
  yellow   = '#e0af68',
  cyan     = '#20a3c7',
  darkblue = '#0b3863',
  green    = '#45deaf',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#2b96fb',
  red      = '#ec5f67',
  segmentBg = '#090a1a',
}

local mode_color = {
  n = colors.blue,
  i = colors.green,
  v = colors.cyan,
  [''] = colors.cyan,
  V = colors.cyan,
  c = colors.magenta,
  no = colors.blue,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow,
  R = colors.violet,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    globalstatus = true,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  -- mode component
  function()
    return string.upper(vim.fn.mode())
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
  end,
  padding = { left = 2, right = 2 },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg, bg = colors.bg },
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.yellow },
    color_warn = { fg = colors.fg },
    color_info = { fg = colors.fg },
  },
  color = { fg = colors.fg, bg = colors.bg },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_right {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_get_option_value('filetype', {})
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  color = { fg = colors.fg, bg = colors.bg },
}

ins_right { 'location', color = { fg = colors.fg, bg = colors.bg } }

ins_right { 'progress', color = { fg = colors.fg, bg = colors.bg } }

ins_right {
  'diff',
  symbols = { added = ' ', modified = '󰏬 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.blue },
    removed = { fg = colors.red },
  },
  color = { fg = colors.fg, bg = colors.bg },
}

return config;
