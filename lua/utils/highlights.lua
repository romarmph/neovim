local M = {}
local set_highlight = function(group, highlight)
  vim.api.nvim_set_hl(0, group, highlight)
end

local set_multiple_highlights = function(group, highlights)
  for _, name in ipairs(group) do
    set_highlight(name, highlights)
  end
end

M.set_highlight = set_highlight
M.set_multiple_highlights = set_multiple_highlights

return M
