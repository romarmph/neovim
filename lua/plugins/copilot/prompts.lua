local select = require('CopilotChat.select')
return {
  Explain = {
    prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
  },
  Review = {
    prompt = '/COPILOT_REVIEW Review the selected code.',
    callback = function(response, source)
      local ns = vim.api.nvim_create_namespace('copilot_review')
      local diagnostics = {}
      for line in response:gmatch('[^\r\n]+') do
        if line:find('^line=') then
          local start_line = nil
          local end_line = nil
          local message = nil
          local single_match, message_match = line:match('^line=(%d+): (.*)$')
          if not single_match then
            local start_match, end_match, m_message_match = line:match('^line=(%d+)-(%d+): (.*)$')
            if start_match and end_match then
              start_line = tonumber(start_match)
              end_line = tonumber(end_match)
              message = m_message_match
            end
          else
            start_line = tonumber(single_match)
            end_line = start_line
            message = message_match
          end

          if start_line and end_line then
            table.insert(diagnostics, {
              lnum = start_line - 1,
              end_lnum = end_line - 1,
              col = 0,
              message = message,
              severity = vim.diagnostic.severity.WARN,
              source = 'Copilot Review',
            })
          end
        end
      end
      vim.diagnostic.set(ns, source.bufnr, diagnostics)
    end,
  },
  Fix = {
    prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
  },
  Optimize = {
    prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
  },
  Docs = {
    prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
  },
  Tests = {
    prompt = '/COPILOT_GENERATE Please generate tests for my code.',
  },
  FixDiagnostic = {
    prompt = 'Please assist with the following diagnostic issue in file:',
    selection = select.diagnostics,
  },
  Commit = {
    prompt =
    'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
    selection = select.gitdiff,
  },
  CommitStaged = {
    prompt =
    'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
    selection = function(source)
      return select.gitdiff(source, true)
    end,
  },
}
