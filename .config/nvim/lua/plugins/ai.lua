return {
  'github/copilot.vim',
  {
    'zbirenbaum/copilot.lua',
    optional = true,
    opts = {
      filetypes = { ['*'] = true },
    },
  },
  {
    'olimorris/codecompanion.nvim',
    enabled = false,
    cmd = { 'CodeCompanion' },
    opts = {
      strategies = {
        chat = {
          adapter = 'openai',
        },
        inline = {
          adapter = 'openai',
        },
      },
    },
  },
  {
    'milanglacier/minuet-ai.nvim',
    enabled = false,
    event = 'BufReadPre',
    opts = {
      provider = 'codestral',
      notify = 'debug',
      n_completions = 1,
      add_single_line_entry = false,
      virtualtext = {
        auto_trigger_ft = { 'lua' },
        keymap = {
          -- accept whole completion
          accept = '<Tab>',
          -- accept one line
          accept_line = '<A-a>',
          -- accept n lines (prompts for number)
          accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
      provider_options = {
        codestral = {
          optional = {
            max_tokens = 256,
            stop = { '\n\n' },
          },
        },
        gemini = {
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
            },
            safetySettings = {
              {
                -- HARM_CATEGORY_HATE_SPEECH,
                -- HARM_CATEGORY_HARASSMENT
                -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                -- BLOCK_NONE
                threshold = 'BLOCK_ONLY_HIGH',
              },
            },
          },
        },
      },
    },
  },
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>a', nil, desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
      {
        '<leader>as',
        '<cmd>ClaudeCodeTreeAdd<cr>',
        desc = 'Add file',
        ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles' },
      },
      -- Diff management
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  },
}
