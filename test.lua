local pickers = {
  'find_files',
  'oldfiles',
  'diagnostics',
  'live_grep',
  'buffers',
}
local mappings = {}

for _, picker in ipairs(pickers) do
  mappings[picker] = {
    i = {
      ['<c-k>'] = _,
      ['<c-j>'] = _,
      ['<c-s>'] = _,
      ['<c-v>'] = _,
    },
  }
end

for picker, keymap in pairs(mappings) do
    print("Picker:", picker)
    for mode, keys in pairs(keymap) do
        print("Mode:", mode)
        for key, value in pairs(keys) do
            print(key, value)
        end
    end
end

