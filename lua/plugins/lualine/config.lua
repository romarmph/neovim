-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local colors = require("plugins.theme.colors").colors
colors.bg = 'NONE'

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
      normal = { c = { fg = colors.fg, bg = 'NONE' } },
      inactive = { c = { fg = colors.fg, bg = 'NONE' } },
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return require("plugins.lualine.mode").get_mode()
  end,
  color = function()
    local color = require("plugins.lualine.mode").color[vim.fn.mode()]
    if color == nil then
      return { fg = colors.fg, bg = colors.bg }
    end
    return { fg = color, bg = colors.bg }
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
    return clients[#clients - 1].name
  end,
  color = { fg = colors.fg, bg = colors.bg },
}

ins_right { 'location', color = { fg = colors.fg, bg = colors.bg } }

ins_right { 'progress', color = { fg = colors.fg, bg = colors.bg } }

ins_right {
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.blue },
    removed = { fg = colors.red },
  },
  color = { fg = colors.fg, bg = colors.bg },
}


return config;
