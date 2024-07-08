return {
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      draw = {
        delay = 100,
        priority = 2,
      },
      symbol = "╎",
      options = { try_as_border = true },
    },
    config = function()
      local indenscope = require('mini.indentscope')

      indenscope.setup({
        draw = {
          animation = indenscope.gen_animation.cubic({
            easing = "in-out",
            duration = 100,
            unit = 'total'
          }),
        }
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
          "Trouble",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  }
}

