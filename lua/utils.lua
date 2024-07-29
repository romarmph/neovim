local M = {}
local split = function(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local get_root_dir = function()
  local cwd = vim.fn.getcwd()
  local parts = split(cwd, "/")
  return parts[#parts]
end

M.split = split
M.get_root_dir = get_root_dir

return M
