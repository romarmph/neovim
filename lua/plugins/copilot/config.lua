local chat = require("CopilotChat")
local prompts = require('CopilotChat.prompts')
local select = require('CopilotChat.select')
chat.setup {
  debug = false,
  proxy = nil,
  allow_insecure = false,

  system_prompt = prompts.COPILOT_INSTRUCTIONS,
  model = 'gpt-4',
  temperature = 0.1,

  question_header = ' User ', -- Header to use for user questions
  answer_header = ' Copilot ', -- Header to use for AI answers
  error_header = ' Error ', -- Header to use for errors
  separator = '───', -- Separator to use in chat

  show_folds = false, -- Shows folds for sections in chat
  show_help = false, -- Shows help message as virtual lines when waiting for user input
  auto_follow_cursor = true, -- Auto-follow cursor in chat
  auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
  clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
  highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

  context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
  history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
  callback = nil, -- Callback to use when ask response is received

  -- default selection (visual or line)
  selection = function(source)
    return select.visual(source) or select.line(source)
  end,

  -- default prompts
  prompts = require('plugins.copilot.prompts'),

  window = {
    layout = 'float',             -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.5,                  -- fractional width of parent, or absolute width in columns when > 1
    height = 0.7,                 -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'editor',          -- 'editor', 'win', 'cursor', 'mouse'
    border = 'rounded',           -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = nil,                    -- row position of the window, default is centered
    col = nil,                    -- column position of the window, default is centered
    title = 'Copilot Chat',       -- title of chat window
    footer = nil,                 -- footer of chat window
    zindex = 1,                   -- determines if window is on top or below other floating windows
  },

  -- default mappings
  mappings = {
    complete = {
      detail = 'Use @<Tab> or /<Tab> for options.',
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<C-c>'
    },
    reset = {
      normal = '<C-l>',
      insert = '<C-l>'
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-s>'
    },
    accept_diff = {
      normal = '<C-y>',
      insert = '<C-y>'
    },
    yank_diff = {
      normal = 'gy',
    },
    show_diff = {
      normal = 'gd'
    },
    show_system_prompt = {
      normal = 'gp'
    },
    show_user_selection = {
      normal = 'gs'
    },
  },
}

