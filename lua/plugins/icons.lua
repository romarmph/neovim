return {
  'DaikyXendo/nvim-material-icon',
  config = function()
    local material_icon_ok, material_icon = pcall(require, 'nvim-material-icon')
    if not material_icon_ok then
      return
    end

    material_icon.setup()
  end,
}
